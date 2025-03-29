import { Express } from 'express'

export const startServer = async (app: Express) => {
  const port = 3000
  app.listen(port, () => {
    console.log(`server is listening on port ${port}`)
  })
}
