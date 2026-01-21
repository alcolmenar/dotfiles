return {
  "olimorris/codecompanion.nvim",
  -- cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    "ravitemer/codecompanion-history.nvim",
    -- "Davidyz/VectorCode",
  },
  opts = {
    display = {
      chat = {
        intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
        show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
        separator = "─", -- The separator between the different messages in the chat buffer
        show_context = true, -- Show context (from slash commands and variables) in the chat buffer?
        -- show_settings = true, -- Show LLM settings at the top of the chat buffer?
        show_token_count = true, -- Show the token count for each response?
        start_in_insert_mode = false, -- Open the chat buffer in insert mode?
      },
    },
    interactions = {
      chat = {
        adapter = "copilot",
        model = "gemini-2.5-pro",
      },
      inline = {
        adapter = "copilot",
        model = "gemini-2.5-pro",
      },
      cmd = {
        adapter = "copilot",
        model = "gemini-2.5-pro",
      },
    },
    adapters = {
      http = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "gemini-2.5-pro",
              },
            },
          })
        end,
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
      history = {
        enabled = true,
      },
      vectorcode = {
        enabled = true,
      },
      -- mcphub = {
      --   callback = "mcphub.extensions.codecompanion",
      --   opts = {
      --     -- MCP Tools
      --     make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
      --     show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
      --     add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
      --     show_result_in_chat = true, -- Show tool results directly in chat buffer
      --     format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
      --     -- MCP Resources
      --     make_vars = true, -- Convert MCP resources to #variables for prompts
      --     -- MCP Prompts
      --     make_slash_commands = true, -- Add MCP prompts as /slash commands
      --   },
      -- },
    },
  },
  -- opts = function(_, _)
  --   return {
  --     strategies = {
  --       chat = {
  --         adapter = "copilot",
  --         --         tools = {
  --         --           vectorcode = {
  --         --             description = "Run VectorCode to retrieve the project context.",
  --         --             callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
  --         --           },
  --         --         },
  --       },
  --       -- inline = {
  --       --   adapter = "myadapter",
  --       -- },
  --       cmd = {
  --         adapter = "copilot",
  --       },
  --       --     },
  --       --     opts = {
  --       --       log_level = "DEBUG",
  --       --     },
  --       --     adapters = {
  --       --       myadapter = function()
  --       --         return require("codecompanion.adapters").extend("ollama", {
  --       --           name = "myadapter", -- Give this adapter a different name to differentiate it from the default ollama adapter
  --       --           schema = {
  --       --             model = {
  --       --               -- default = "deepseek-r1:32b",
  --       --               default = "qwen2.5-coder:32b",
  --       --             },
  --       --             num_ctx = {
  --       --               default = 16384,
  --       --             },
  --       --             num_predict = {
  --       --               default = -1,
  --       --             },
  --       --           },
  --       --         })
  --       --       end,
  --     },
  --   }
  -- end,
}
