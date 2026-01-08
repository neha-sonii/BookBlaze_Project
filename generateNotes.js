
import { GoogleGenerativeAI } from '@google/generative-ai';
import dotenv from 'dotenv';
dotenv.config();

// Ensure you are using the correct variable for your GEMINI key
// (You used OPENAI_API_KEY in your snippet, make sure that holds the Gemini key)
const genAI = new GoogleGenerativeAI(process.env.OPENAI_API_KEY);

async function generateNotes(title, author) {
  const prompt = `
  Write 50 clear and insightful bullet-point notes for the book "${title}" by ${author}.
  - Start every bullet with (•)
  - Cover the story from start to finish
  - No intro or outro text, just the bullets.
  - In easy and simple language.
  `;

  try {
    // 1. Use 'gemini-1.5-flash' (Free & Faster)
    const model = genAI.getGenerativeModel({
      model: "gemini-2.5-flash-lite", 
      generationConfig: {
        temperature: 0.7, // Slightly higher creativity for summaries
        maxOutputTokens: 8192, // ✅ CHANGED: 500 was too low for 50 notes
      },
    });

    const result = await model.generateContent(prompt);
    const response = await result.response;
    const notesText = response.text();

    if (!notesText) return [];

    // Clean up list
    return notesText
      .split("\n")
      .filter(line => line.includes("•")) // Only keep bullet lines
      .map(line => line.replace(/\*/g, "").trim()); // Remove bolding/extra chars

  } catch (error) {
    console.error("Error:", error);
    return [];
  }
}

export default generateNotes;
