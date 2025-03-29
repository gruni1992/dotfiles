import express, { Express } from 'express'
import { errorHandlingMiddleware } from './http/error-handling-middleware.js'
import { healthController } from './http/health-controller.js'
import { startServer } from './http/startServer.js'

const main = async () => {
  const app = express()
  app.use(express.json());
  setupControllers(app)
  app.use(errorHandlingMiddleware);
  await startServer(app)
}

const setupControllers = (app: Express) => {
  healthController(app)
}

main()
