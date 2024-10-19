import express, { Express } from 'express'
import http from 'http'
import cors from 'cors'
import dotenv from 'dotenv'
import bodyParser from 'body-parser'
import router from './routes/routes'



const app: Express = express();
const server = http.createServer(app);

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.set('PORT', 3000);
app.set("BASE_URL", "localhost");
dotenv.config();

app.use("/api/v1", router);

try {
    const port = app.get("PORT");
    server.listen(port, () => {
        console.log("server is ready");
    });
} catch (e) {
    console.log(e);
}

export default server;