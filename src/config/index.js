require('dotenv').config();

const config = {
  port: process.env.PORT || 3001,
  provider: process.env.LLM_PROVIDER || 'gemini',
  anthropic: {
    model: process.env.ANTHROPIC_MODEL || 'claude-3-haiku-20240307',
    apiKey: process.env.ANTHROPIC_API_KEY
  },
  openai: {
    model: process.env.OPENAI_MODEL || 'gpt-4-turbo-preview',
    apiKey: process.env.OPENAI_API_KEY
  },
  gemini: {
    model: process.env.GEMINI_MODEL || 'gemini-pro',
    apiKey: process.env.GEMINI_API_KEY
  }
};

module.exports = config;