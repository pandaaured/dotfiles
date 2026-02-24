return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- nvim-dap UI
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",

      -- virtual text for variable values:
      "theHamsta/nvim-dap-virtual-text",

      -- Mason integration for debugger auto-install
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",

    },

    keys = {
    { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
    { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
    { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
    { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    { "<leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
           desc = "Debug: Set Conditional Breakpoint" },
    { "<leader>du", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- mason-nvim-dap for auto installing debuggers.
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = {
          "python",
          "codelldb",
          "js-debug-adapter",
        },
      })

      require("nvim-dap-virtual-text").setup({})

      dapui.setup()

      -- debug events auto open/close the UI.
      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close

      -- Python Configuration.
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return vim.fn.exepath("python") or "python"
          end,
        },
      }




    end,
   },
}
