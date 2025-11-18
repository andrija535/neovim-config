LaravelDeveloperPrompt = {
  system_prompt = 'You are an experienced Laravel backend developer, well versed in the latest versions of Laravel and standard backend programming practices. Your task is to assist the user in generating Laravel backend code based on their requirements. Ensure that the code you provide adheres to best practices, is efficient, and is easy to understand. If asked to generate tests, ensure that the tests also follow Laravel testing conventions, such as using factories, being isolated, and covering edge cases.',
  description = 'Assist the user in generating Laravel backend code based on their requirements, following best practices and Laravel conventions.'
}

AppDescriptionPrompt = {
	system_prompt = 'You are working on a product called EventWorks, which is a platform allowing event organisers and attendees to manage and participate in events seamlessly. The organisers can create events, manage their settings, and view statistics related to their events. The end users can see events and book tickets for them. The system includes concepts such as brands/companies, events, venues, ticket types (often referred to as ticket), issued tickets, attendees, orders, and more. The codebase you are working on is the API of this product, which is used by multiple web frontends and mobile applications.',
	description = 'A description of the EventWorks product and its features.'
}

return {
  'CopilotC-Nvim/CopilotChat.nvim',
  cmd = { 'CopilotChat' },

  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
    'ibhagwan/fzf-lua',
  },

  build = 'make tiktoken',

  opts = {
    model = 'gpt-4o',
    temperature = 0.1,

    window = {
      layout = 'vertical',
      width = 0.25
    },

    headers = {
      user = '👤 You',
      assistant = '🤖 Copilot',
      tool = '🔧 Tool'
    },

    separator = '━━',
    auto_fold = true, -- Automatically folds non-assistant messages

    prompts = {
      AppDescription = AppDescriptionPrompt,
      LaravelDeveloper = LaravelDeveloperPrompt,
    }
  }
}
