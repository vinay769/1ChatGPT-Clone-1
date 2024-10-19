import { Router, Request, Response } from "express";

const helloRouter = Router();

// helloRouter.get("/",(req:Request, res:Response) => 
//     res.json({ data : "Server is Live "}));

helloRouter.get("/", (req: Request, res: Response) => {
    res.json({ 'data': "Server Is Live Lets Go" });
});

export default helloRouter;