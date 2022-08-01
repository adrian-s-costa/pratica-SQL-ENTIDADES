CREATE DATABASE modelagem;

CREATE TABLE users(
	id SERIAL NOT NULL PRIMARY KEY,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE products (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	price INTEGER NOT NULL,
	photos JSON,
	main_photo TEXT,
	category TEXT NOT NULL,
	size CHAR NOT NULL,
	amount INTEGER NOT NULL
);

CREATE TYPE "stateType" AS ENUM ('created', 'paid', 'delivered', 'cancelled');

CREATE TABLE buy(
	id SERIAL NOT NULL PRIMARY KEY,
	id_user INTEGER NOT NULL REFERENCES users(id),
	id_prodct INTEGER NOT NULL REFERENCES products(id),
	amount INTEGER NOT NULL,
	type_state "stateType" NOT NULL,
	date_buy DATE NOT NULL DEFAULT NOW(),
	delivery_address TEXT NOT NULL,
);

CREATE TABLE buys (
	id SERIAL NOT NULL PRIMARY KEY,
	id_user INTEGER NOT NULL REFERENCES users(id),
	id_buys JSON NOT NULL REFERENCES products(id),
);
