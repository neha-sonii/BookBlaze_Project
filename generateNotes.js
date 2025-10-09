// // Generate notes using chatgpt

// import { GoogleGenerativeAI } from '@google/generative-ai';
// import dotenv from 'dotenv';
// dotenv.config();

// const openai = new GoogleGenerativeAI(process.env.OPENAI_API_KEY)

// console.log("API Key exists?", !!process.env.OPENAI_API_KEY);


// async function generateNotes(title, author) {
//     const prompt = `
// You are a helpful assistant that summarizes books accurately. Write 50 clear and insightful bullet-point notes for the book "${title}" by ${author}. Each note should:
// - Start with a bullet (•)
// - Be written in simple, friendly, personal language
// - Cover the story from start to finish, including major events, turning points, and conclusion
// - Focus on the correct main characters and their development
// - Highlight main themes, relationships, and challenges without inventing events
// - Be concise, informative, and easy to understand
// Avoid repeating the book description, avoid quotes, page references, or adding elements not in the actual story. The notes should provide an accurate, story-driven overview of the book as if you had read it yourself.
// `;




//     try {
//         const model = openai.getGenerativeModel({
//             model: "gemini-1.5-flash",
//             temperature: 0.2, // Lower temperature for focused responses
//             topP: 0.9,       // Moderate topP for balanced creativity
//             topK: 40,        // Restrict token choices for coherence
//             maxOutputTokens: 500 // Adjust based on desired response length
//         });
//         const result = await model.generateContent(prompt);
//         console.log("RW GEMINI RESPOnse ", result.response);

//         const notesText = result.response.text();
//         console.log('extracted text: ', notesText);


//         if (!notesText || notesText.trim().length === 0) {
//             return ["No notes were generated . try again later or check your prompt."]
//         } else {
//             return notesText
//                 .split('\n')
//                 .filter(line => line.trim().length > 0)
//                 .map(line =>
//                     line
//                         // .replace(/^[-•]\s*/, '')        // remove bullet symbols
//                         .replace(/\*\*(.*?)\*\*/g, '$1') // remove bold asterisks
//                         .replace(/\s+/g, ' ')            // collapse multiple spaces/newlines
//                         .trim()
//                 );
//         }

//     } catch (error) {
//         console.error("Error calling OpenAI API:", error);
//         return [];

//     }
// }

// export default generateNotes;






// Generate notes using Gemini API

import { GoogleGenerativeAI } from '@google/generative-ai';
import dotenv from 'dotenv';
dotenv.config();

const genAI = new GoogleGenerativeAI(process.env.OPENAI_API_KEY);

console.log("API Key exists?", !!process.env.OPENAI_API_KEY);

// Helper function: retries if 429 (rate limited)
async function safeGenerateContent(model, prompt) {
  while (true) {
    try {
      const result = await model.generateContent(prompt);
      return result;
    } catch (err) {
      if (err.status === 429) {
        const delay = 15000; // wait 15 seconds
        console.warn(`Rate limited (429). Retrying after ${delay / 1000}s...`);
        await new Promise(res => setTimeout(res, delay));
      } else {
        throw err;
      }
    }
  }
}

async function generateNotes(title, author) {
  const prompt = `
You are a helpful assistant that summarizes books accurately. Write 50 clear and insightful bullet-point notes for the book "${title}" by ${author}. Each note should:
- Start with a bullet (•)
- Be written in simple, friendly, personal language
- Cover the story from start to finish, including major events, turning points, and conclusion
- Focus on the correct main characters and their development
- Highlight main themes, relationships, and challenges without inventing events
- Be concise, informative, and easy to understand
Avoid repeating the book description, avoid quotes, page references, or adding elements not in the actual story.
`;

  try {
    // ✅ Use a supported non-Pro model
    const model = genAI.getGenerativeModel({
      model: "gemini-2.0-flash", // updated model name
      generationConfig: {
        temperature: 0.2,
        topP: 0.9,
        topK: 40,
        maxOutputTokens: 500,
      },
    });

    const result = await safeGenerateContent(model, prompt);

    const notesText = result.response.text();
    console.log("Extracted text:", notesText);

    if (!notesText?.trim()) {
      return ["No notes were generated. Try again later or check your prompt."];
    }

    return notesText
      .split("\n")
      .filter(line => line.trim().length > 0)
      .map(line =>
        line
          .replace(/\*\*(.*?)\*\*/g, "$1") // remove bold asterisks
          .replace(/\s+/g, " ")            // collapse multiple spaces/newlines
          .trim()
      );

  } catch (error) {
    console.error("Error calling Gemini API:", error);
    return [];
  }
}

export default generateNotes;
