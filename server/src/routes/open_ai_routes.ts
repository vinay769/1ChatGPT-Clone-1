import { Router, Request, Response } from "express";
import { generateOpenAiResponseController } from "../controllers/generate_open_ai_response_controller";

const openAiRouter = Router();

openAiRouter.post('/', generateOpenAiResponseController as any);

export default openAiRouter; 