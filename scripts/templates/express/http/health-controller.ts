import { Express, Request, Response } from 'express'
import { asyncHandler } from './error-handling-middleware.js'

export const healthController = (app: Express) => {
  app.get(
    '/api/health',
    asyncHandler(async (req: Request, res: Response) => {
      res.send("Brudi, mir geht's gut");
    })
  );
}
