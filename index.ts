import { createClient } from "@libsql/client";

export const turso = createClient({
  url: process.env.TURSO_CONNECTION_URL!,
  authToken: process.env.TURSO_AUTH_TOKEN,
});

const datos = await turso.execute("SELECT * FROM autores LIMIT 1;");
const path = "./SQL_commands.sql";
const file = Bun.file(path);

const text = await file.text();

await turso.executeMultiple(text);

/* const sentencias = text.split(';')

sentencias.forEach((sentencia: string) => {
	sentencia = sentencia.trim();	//console.log(sentencia);
})

console.log(JSON.stringify(datos, null, 2)); */
