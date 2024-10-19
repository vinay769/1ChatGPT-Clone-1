"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const generate_open_ai_response_controller_1 = require("../controllers/generate_open_ai_response_controller");
const openAiRouter = (0, express_1.Router)();
openAiRouter.post('/', generate_open_ai_response_controller_1.generateOpenAiResponseController);
exports.default = openAiRouter;
