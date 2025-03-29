import { NextFunction, Request, Response } from 'express'

type AsyncHandler = (req: Request, res: Response, next: NextFunction) => Promise<any>;

export const asyncHandler = (fn: AsyncHandler) =>
  (req: Request, res: Response, next: NextFunction) => {
    Promise.resolve(fn(req, res, next)).catch(next);
  };

export const errorHandlingMiddleware = (err: any, req: Request, res: Response, _: NextFunction) => {
  console.error(err);
  res.status(500).send(err);
}
