import { NextFunction, Request, Response } from 'express'
import { ZodSchema } from 'zod'

export const validateRequest = (schema: ZodSchema) =>
  (req: Request, res: Response, next: NextFunction) => {
    try {
      const parse = schema.safeParse(req.body)
      if (!parse.success) {
        res.status(400).json({
          message: 'Request schema validation failed',
          error: parse.error
        })
        return
      }
      req.body = parse.data
      next()
    } catch (error) {
      res.status(400).json({ error })
    }
  }
