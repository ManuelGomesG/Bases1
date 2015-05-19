CREATE TABLE MARCA (
	NOMBRE		VARCHAR(30)		CONSTRAINT PK_MARCA PRIMARY KEY
);

CREATE TABLE MODELO (
NOMBRE_MODELO	VARCHAR(30),
NOMBRE_MARCA	VARCHAR(30)		CONSTRAINT FK_MARCA REFERENCES MARCA,
CONSTRAINT PK_MODELO PRIMARY KEY (NOMBRE_MODELO,NOMBRE_MARCA)
);


CREATE TABLE PRODUCTO (
CODIGO				INT		CONSTRAINT PK_PRODUCTO PRIMARY KEY,
NOMBRE_PRODUCTO		VARCHAR(30),
DESCRIPCION			TEXT,
NOMBRE_MARCA		VARCHAR(30),
NOMBRE_MODELO		VARCHAR(30),
CONSTRAINT FK_MODELO FOREIGN KEY (NOMBRE_MARCA,NOMBRE_MODELO) REFERENCES MODELO
);

CREATE TABLE LISTA_PRECIOS(
CODIGO_P			INT			CONSTRAINT FK_LISTA_PRECIOS REFERENCES PRODUCTO,
AÑO_ELAB			INT,
PRECIO 				INT,
CONSTRAINT PK_LISTA_PRECIOS PRIMARY KEY (CODIGO_P,AÑO_ELAB),

);

CREATE TABLE PROVEEDORA(
RIF					VARCHAR(20) CONSTRAINT PK_PROVEEDORA PRIMARY KEY
NOMBRE 				VARCHAR(30),
DIRECCION 			TEXT
);

CREATE TABLE TELEFONO_PRO(
RIF_P 				VARCHAR(20) CONSTRAINT FK_TELEFONO_PRO REFERENCES PROVEEDORA,
TELEFONO 			VARCHAR(12),
CONSTRAINT PK_TELEFONO_PRO PRIMARY KEY (RIF_P,TELEFONO)
);

CREATE TABLE ORDEN(
NUMERO				INT 		CONSTRAINT PK_ORDEN PRIMARY KEY,
FECHA				DATE,
MONTO				INT,
RIF_P				VARCHAR(20)
);

CREATE TABLE SE_PIDE(
CODIGO_P			INT 		CONSTRAINT FK_SE_PIDE_PRODUCTO REFERENCES PRODUCTO,
NUM_ORDEN			INT			CONSTRAINT FK_SE_PIDE_ORDEN REFERENCES ORDEN,
CANTIDAD			INT,
CONSTRAINT PK_SE_PIDE PRIMARY KEY (CODIGO_P,NUM_ORDEN),
);

CREATE TABLE LOTE(
SERIAL_F 			INT  		CONSTRAINT PK_LOTE PRIMARY KEY,
NUM_ORDEN			INT			CONSTRAINT FK_LOTE_ORDEN REFERENCES ORDEN,
RIF_P				VARCHAR(20)	CONSTRAINT FK_LOTE_PROVEEDORA REFERENCES PROVEEDORA,
FECHA 				DATE,
MONTO				INT,
);

CREATE TABLE SE_PAGA(
SERIAL_F 			INT 		CONSTRAINT PK_SE_PAGA PRIMARY KEY,
FECHA 				DATE,
MONTO 				INT,
NUM_TRANSACCION		INT,
NUM_CUENTA			INT,
CONSTRAINT Fk_SE_PAGA FOREIGN KEY SERIAL_F REFERENCES LOTE
);


CREATE TABLE ARTICULO_N(
NUM_INV 			INT			CONSTRAINT PK_ARTICULO_N PRIMARY KEY,
ULT_COSTO			INT,
MINIMO				INT,
CATEGORIA			TEXT,
FECHA_ELAB			DATE,
PRECIO_VENTA		INT,
COD_PRODUCTO		INT 		CONSTRAINT FK_ARTICULO_N REFERENCES PRODUCTO
);

CREATE TABLE ARTICULO_U(
NUM_INV				INT
)