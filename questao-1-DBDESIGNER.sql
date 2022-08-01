CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtos" (
	"id" serial NOT NULL UNIQUE,
	"nome" TEXT NOT NULL,
	"preco" int NOT NULL,
	"fotos" json NOT NULL,
	"foto_principal" TEXT NOT NULL,
	"categoria" TEXT NOT NULL,
	"tamanho" char NOT NULL,
	"quantidade" int NOT NULL,
	CONSTRAINT "produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.compra" (
	"id" serial NOT NULL UNIQUE,
	"id_user" int NOT NULL,
	"id_produto" int NOT NULL,
	"quantidade" TIME NOT NULL,
	"estado_compra" TEXT NOT NULL,
	"data_compra" DATE NOT NULL,
	"endereco_entrega" TEXT NOT NULL,
	CONSTRAINT "compra_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.compras_agrupadas" (
	"id" serial NOT NULL,
	"id_compras" json NOT NULL,
	"id_user" serial NOT NULL,
	CONSTRAINT "compras_agrupadas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "compra" ADD CONSTRAINT "compra_fk0" FOREIGN KEY ("id_user") REFERENCES "users"("id");
ALTER TABLE "compra" ADD CONSTRAINT "compra_fk1" FOREIGN KEY ("id_produto") REFERENCES "produtos"("id");

ALTER TABLE "compras_agrupadas" ADD CONSTRAINT "compras_agrupadas_fk0" FOREIGN KEY ("id_compras") REFERENCES "compra"("id");
ALTER TABLE "compras_agrupadas" ADD CONSTRAINT "compras_agrupadas_fk1" FOREIGN KEY ("id_user") REFERENCES "users"("id");

