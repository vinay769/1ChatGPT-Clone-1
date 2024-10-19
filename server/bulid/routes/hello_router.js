"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const helloRouter = (0, express_1.Router)();
// helloRouter.get("/",(req:Request, res:Response) => 
//     res.json({ data : "Server is Live "}));
helloRouter.get("/", (req, res) => {
    res.json({ 'data': "Server Is Live Lets Go" });
});
exports.default = helloRouter;
