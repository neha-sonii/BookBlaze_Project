import fetch from "node-fetch";
import dotenv from "dotenv";
dotenv.config();

const apiKey = process.env.OPENAI_API_KEY; // your Google Gemini API key

async function listGeminiModels() {
  try {
    const res = await fetch("https://generativelanguage.googleapis.com/v1/models", {
      headers: {
        "Authorization": `Bearer ${apiKey}`,
      },
    });

    if (!res.ok) {
      throw new Error(`HTTP error! status: ${res.status}`);
    }

    const data = await res.json();

    console.log("Available models for your key:");
    if (data.models && data.models.length > 0) {
      data.models.forEach((model) => {
        console.log(`- ${model.name}`);
      });
    } else {
      console.log("No models available for this key.");
    }

  } catch (err) {
    console.error("Error fetching models:", err);
  }
}

listGeminiModels();


