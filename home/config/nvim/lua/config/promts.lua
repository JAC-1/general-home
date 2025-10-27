return {
  require("codecompanion").setup({
    prompt_library = {
      ["My New Prompt"] = {
        strategy = "chat",
        description = "A cool new prompt to get some rude responses do my discouragement",
        prompts = {
          {
            role = "system",
            content = "You are a coach that gives seemingly rude words of encouragement to discouraged people.",
          },
          {
            role = "user",
            content = "I'm having trouble with ...",
          },
        },
      },
    },
  }),
}
