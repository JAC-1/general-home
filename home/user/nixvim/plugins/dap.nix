{pkgs, ...}: {
  programs.nixvim.plugins = {
    # DAP for debugging
    dap = {
      enable = true;
      extensions = {
        dap-ui = {
          enable = true;
          floating.mappings = {
            close = ["<ESC>" "q"];
          };
        };
        dap-virtual-text = {
          enable = true;
        };
      };
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "◆";
          texthl = "DapBreakpoint";
        };
        dapBreakpointRejected = {
          text = "";
          texthl = "DapBreakpoint";
        };
        dapLogPoint = {
          text = "";
          texthl = "DapLogPoint";
        };
        dapStopped = {
          text = "";
          texthl = "DapStopped";
        };
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>DapToggleBreakpoint<cr>";
      options.desc = "Toggle breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = "<cmd>DapContinue<cr>";
      options.desc = "Continue";
    }
    {
      mode = "n";
      key = "<leader>di";
      action = "<cmd>DapStepInto<cr>";
      options.desc = "Step into";
    }
    {
      mode = "n";
      key = "<leader>do";
      action = "<cmd>DapStepOver<cr>";
      options.desc = "Step over";
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = "<cmd>DapStepOut<cr>";
      options.desc = "Step out";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = "<cmd>DapTerminate<cr>";
      options.desc = "Terminate";
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>lua require('dapui').toggle()<cr>";
      options.desc = "Toggle DAP UI";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = "<cmd>DapToggleRepl<cr>";
      options.desc = "Toggle REPL";
    }
  ];

  programs.nixvim.extraConfigLua = ''
    local dap = require('dap')
    local dapui = require('dapui')

    -- Auto open/close DAP UI
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end
  '';
}
