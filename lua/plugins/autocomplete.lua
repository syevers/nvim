return {
  -- Snippets temporarily disabled.
  -- To re-enable them, remove these two override specs and uncomment the
  -- vim.snippet jump branches in the Tab/S-Tab mappings below.
  { "garymjr/nvim-snippets", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },

  {
    "hrsh7th/nvim-cmp",

    enabled = true,
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api
              .nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match("%s")
            == nil
      end

      local cmp = require("cmp")
      local compare = cmp.config.compare

      -- Give the completion and documentation popups their own highlight groups
      -- so they stay readable regardless of the active colorscheme.
      vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#1f2335" })
      vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#24283b" })
      vim.api.nvim_set_hl(0, "CmpPmenuBorder", {
        fg = "#3b4261",
        bg = "#1f2335",
      })
      vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#7aa2f7", bg = "#24283b" })

      -- Use bordered floating windows for both completion results and docs.
      opts.window = vim.tbl_deep_extend("force", opts.window or {}, {
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder,Search:None",
        }),
      })

      -- Keep docs out of the way while typing. Toggle them manually with <C-k>.
      opts.view = vim.tbl_deep_extend("force", opts.view or {}, {
        docs = {
          auto_open = false,
        },
      })

      -- Snippet completions are disabled above, so remove the matching cmp
      -- source too. This keeps the menu from showing snippet-only entries.
      opts.sources = vim.tbl_filter(function(source)
        return source.name ~= "snippets"
      end, opts.sources or {})

      -- Small helpers used by the custom sorting functions below.
      local function label(entry)
        return entry.completion_item.label or entry.word or ""
      end

      local function source_name(entry)
        return entry.source and entry.source.name or ""
      end

      local function current_input(entry)
        local before = entry.context.cursor_before_line or ""
        return before:sub(entry.offset):lower()
      end

      -- Rank exact prefix matches first. For example, typing "pri" should put
      -- "print" above entries that merely contain or fuzzy-match those letters.
      local function prefer_prefix(entry1, entry2)
        local input = current_input(entry1)
        if input == "" then
          return nil
        end

        local match1 = label(entry1):lower():sub(1, #input) == input
        local match2 = label(entry2):lower():sub(1, #input) == input
        if match1 ~= match2 then
          return match1
        end
      end

      -- Prefer words from the current buffer when all stronger checks tie.
      local function prefer_buffer(entry1, entry2)
        local buffer1 = source_name(entry1) == "buffer"
        local buffer2 = source_name(entry2) == "buffer"
        if buffer1 ~= buffer2 then
          return buffer1
        end
      end

      -- Keep cmp's normal sorters, but run the local preferences first.
      opts.sorting = vim.tbl_deep_extend("force", opts.sorting or {}, {
        comparators = {
          prefer_prefix,
          prefer_buffer,
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.locality,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      })

      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<C-k>"] = cmp.mapping(function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end, { "i", "s" }),
        ["<PageDown>"] = cmp.mapping.scroll_docs(4),
        ["<PageUp>"] = cmp.mapping.scroll_docs(-4),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- Confirm the selected item, or the first item if nothing is selected.
            cmp.confirm({ select = true })
          -- elseif vim.snippet.active({ direction = 1 }) then
          --   vim.schedule(function()
          --     vim.snippet.jump(1)
          --   end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          -- elseif vim.snippet.active({ direction = -1 }) then
          --   vim.schedule(function()
          --     vim.snippet.jump(-1)
          --   end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
