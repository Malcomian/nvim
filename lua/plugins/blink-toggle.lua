-- lua/plugins/blink-toggle.lua
return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    local state_file = vim.fn.stdpath("data") .. "/blink_cmp_auto_show"

    local function read_state()
      local f = io.open(state_file, "r")
      if not f then
        return true -- default: auto-show enabled
      end
      local content = f:read("*a")
      f:close()
      return vim.trim(content) ~= "false"
    end

    local function write_state(enabled)
      local f = io.open(state_file, "w")
      if f then
        f:write(tostring(enabled))
        f:close()
      end
    end

    _G.__blink_cmp_auto_show = read_state()

    opts.completion = opts.completion or {}

    opts.completion.menu = opts.completion.menu or {}
    opts.completion.menu.auto_show = function()
      return _G.__blink_cmp_auto_show
    end

    opts.completion.ghost_text = opts.completion.ghost_text or {}
    opts.completion.ghost_text.enabled = function()
      return _G.__blink_cmp_auto_show
    end

    -- make sure manual trigger exists even if you're not on the default keymap preset
    opts.keymap = opts.keymap or {}
    if not opts.keymap["<C-space>"] then
      opts.keymap["<C-space>"] = { "show", "show_documentation", "hide_documentation" }
    end

    Snacks.toggle({
      name = "Autocomplete Auto-Show",
      get = function()
        return _G.__blink_cmp_auto_show
      end,
      set = function(state)
        _G.__blink_cmp_auto_show = state
        write_state(state)
        require("blink.cmp").hide()
      end,
    }):map("<leader>ux")

    return opts
  end,
}
