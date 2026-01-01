
// Generate notes using Gemini API

// import { GoogleGenerativeAI } from '@google/generative-ai';
// import dotenv from 'dotenv';
// dotenv.config();

// const genAI = new GoogleGenerativeAI(process.env.OPENAI_API_KEY);

// console.log("API Key exists?", !!process.env.OPENAI_API_KEY);

// // Helper function: retries if 429 (rate limited)
// async function safeGenerateContent(model, prompt) {
//   while (true) {
//     try {
//       const result = await model.generateContent(prompt);
//       return result;
//     } catch (err) {
//       if (err.status === 429) {
//         const delay = 15000; // wait 15 seconds
//         console.warn(`Rate limited (429). Retrying after ${delay / 1000}s...`);
//         await new Promise(res => setTimeout(res, delay));
//       } else {
//         throw err;
//       }
//     }
//   }
// }

// async function generateNotes(title, author) {
//   const prompt = `
// You are a helpful assistant that summarizes books accurately. Write 50 clear and insightful bullet-point notes for the book "${title}" by ${author}. Each note should:
// - Start with a bullet (•)
// - Be written in simple, friendly, personal language
// - Cover the story from start to finish, including major events, turning points, and conclusion
// - Focus on the correct main characters and their development
// - Highlight main themes, relationships, and challenges without inventing events
// - Be concise, informative, and easy to understand
// Avoid repeating the book description, avoid quotes, page references, or adding elements not in the actual story.
// `;

//   try {
//     // ✅ Use a supported non-Pro model
//     const model = genAI.getGenerativeModel({
//       model: "gemini-pro", // correct public model name
//       generationConfig: {
//         temperature: 0.2,
//         topP: 0.9,
//         topK: 40,
//         maxOutputTokens: 500,
//       },
//     });

//     let result;
//     try {
//       result = await safeGenerateContent(model, prompt);
//     } catch (err) {
//       console.error("Gemini API call failed:", err);
//       if (err.response) {
//         console.error("Gemini API error response:", err.response.data || err.response);
//       }
//       throw err;
//     }

//     const notesText = result?.response?.text?.();
//     console.log("Extracted text:", notesText);

//     if (!notesText?.trim()) {
//       console.error("Gemini returned empty or invalid notes.");
//       return ["No notes were generated. Try again later or check your prompt."];
//     }

//     return notesText
//       .split("\n")
//       .filter(line => line.trim().length > 0)
//       .map(line =>
//         line
//           .replace(/\*\*(.*?)\*\*/g, "$1") // remove bold asterisks
//           .replace(/\s+/g, " ")            // collapse multiple spaces/newlines
//           .trim()
//       );

//   } catch (error) {
//     console.error("Error calling Gemini API:", error);
//     if (error.response) {
//       console.error("Gemini API error response:", error.response.data || error.response);
//     }
//     return [];
//   }
// }

// export default generateNotes;





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
