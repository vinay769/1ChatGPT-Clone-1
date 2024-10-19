import { json } from "body-parser";
import { Request, Response } from "express"
import OpenAI from "openai";



export const generateOpenAiResponseController = async (req: Request, res: Response) => {

    try {

        const reqBody = req.body;

        const messages = reqBody['messages']

        const openai = new OpenAI({
            apiKey: process.env.OPENAI_API_KEY,
        });

        const stream = await openai.chat.completions.create({
            model: "gpt-3.5-turbo",
            messages: messages,
            temperature: 1,
            max_tokens: 10,
            top_p: 1,
            frequency_penalty: 0,
            presence_penalty: 0,
            stream: true,
            response_format: {
                "type": "text"
            },
        });

        res.set({ "Content-Type": "text/event-stream" });

        for await (const chunk of stream) {
            const data = chunk.choices[0].delta.content || "";
            const formatedData = `data: ${JSON.stringify({ data })}\n\n`;
            res.write(formatedData);
            // process.stdout.write(chunk.choices[0]?.delta?.content || "");
        }

        // return res.json({ 'data': response });

    } catch (error) {

        console.log(error);
        return res.status(500).json({ "data": error });

    }

};