import {z} from 'zod'
import * as dotenv from 'dotenv'

dotenv.config();

const envSchema = z.object({
})

export const env = envSchema.parse(process.env)


