return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },

    keys = {
      { "<F5>",       function() require("dap").continue() end,                                                           desc = "Debug: Start/Continue" },
      { "<F10>",      function() require("dap").step_over() end,                                                          desc = "Debug: Step Over" },
      { "<F11>",      function() require("dap").step_into() end,                                                          desc = "Debug: Step Into" },
      { "<F12>",      function() require("dap").step_out() end,                                                           desc = "Debug: Step Out" },
      { "<leader>b",  function() require("dap").toggle_breakpoint() end,                                                  desc = "Debug: Toggle Breakpoint" },
      { "<leader>B",  function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,               desc = "Debug: Set Conditional Breakpoint" },
      { "<leader>du", function() require("dapui").toggle() end,                                                           desc = "Debug: Toggle UI" },
      -- [1] Added: restart and terminate shortcuts
      { "<F4>",       function() require("dap").terminate() end,                                                          desc = "Debug: Terminate" },
      { "<F9>",       function() require("dap").restart() end,                                                            desc = "Debug: Restart" },
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = {
          "python",
          "codelldb",
          "js-debug-adapter",
        },
      })

      require("nvim-dap-virtual-text").setup({
        commented = true, -- [2] shows virtual text as a comment, less intrusive
      })

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close

      -- [3] Signs for breakpoints (optional but nice)
      vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DapStopped", linehl = "DapStopped", numhl = "" })

      -- Python
      -- [4] prefer a venv interpreter if one exists, fall back to system python
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
            local venv = vim.fn.getcwd() .. "/.venv/bin/python"
            if vim.fn.executable(venv) == 1 then return venv end
            return vim.fn.exepath("python") or "python"
          end,
        },
        -- [5] Added: attach to a running debugpy process
        {
          type = "python",
          request = "attach",
          name = "Attach (debugpy)",
          connect = { host = "127.0.0.1", port = 5678 },
        },
      }

      -- codelldb
      -- [6] guard against codelldb not being installed yet
      local codelldb_path = vim.fn.exepath("codelldb")
      if codelldb_path == "" then
        vim.notify("codelldb not found — run :MasonInstall codelldb", vim.log.levels.WARN)
      end

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
        -- [7] Added: attach to a running process by PID
        {
          name = "Attach to process",
          type = "codelldb",
          request = "attach",
          pid = function() return require("dap.utils").pick_process() end,
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.c = dap.configurations.cpp
      -- [8] Added: Rust (codelldb works great for it)
      dap.configurations.rust = dap.configurations.cpp

    end,
  },
}
