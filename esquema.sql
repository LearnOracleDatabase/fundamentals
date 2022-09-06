-- Ver USUARIO CONECTADO
SELECT user FROM dual;

-- Listar los permisos de USUARIO SYS
SELECT * FROM SESSION_PRIVS;

-- Crear tabla PRODUCTO
CREATE TABLE PRODUCTO
(
       CODPROD CHAR(6),
       NOMPRO VARCHAR2(50),
       PREPRO DECIMAL(8,2),
       STOCKPRO INT,
       CONSTRAINT PROD_PK PRIMARY KEY (CODPROD)
);

-- Listar registros TABLA
SELECT * FROM PRODUCTO;

-- Agregar campo a TABLA
ALTER TABLE PRODUCTO
      ADD ESTPRO CHAR(1);

-- Eliminar campo a TABLA
ALTER TABLE PRODUCTO
      DROP COLUMN ESTPRO;

-- Agregar campo a TABLA con valor por DEFAULT con comentario
ALTER TABLE PRODUCTO
      ADD ESTPRO CHAR(1) DEFAULT 'A';
      
-- Insertar registros (excepto campo que tiene valor predeterminado)
INSERT ALL
       INTO PRODUCTO (CODPROD, NOMPRO, PREPRO, STOCKPRO) VALUES ('P00001', 'Arroz', '4.50', 20)
       INTO PRODUCTO (CODPROD, NOMPRO, PREPRO, STOCKPRO) VALUES ('P00002', 'Azúcar', '3.50', 30)
       INTO PRODUCTO (CODPROD, NOMPRO, PREPRO, STOCKPRO) VALUES ('P00003', 'Fideos', '2.80', 40)
       SELECT * FROM DUAL
COMMIT;

-- Listar registros insertados
SELECT * FROM PRODUCTO;

-- Crear tabla CATEGORIA
CREATE TABLE CATEGORIA
(
       IDCAT INT,
       NOMCAT VARCHAR2(60),
       CONSTRAINT CAT_PK PRIMARY KEY (IDCAT)
);

-- Listar tabla CATEGORIA
SELECT * FROM CATEGORIA;

-- Crear secuencia INCREMENTO INC_CAT
CREATE SEQUENCE INC_CAT
START WITH 100
INCREMENT BY 1

-- Crear disparador de auntoincrementable TRG_INC_CAT
CREATE TRIGGER TRG_INC_CAT
  BEFORE INSERT ON CATEGORIA
  FOR EACH ROW
  BEGIN
    SELECT INC_CAT.NEXTVAL INTO :NEW.IDCAT FROM DUAL;
  END;

-- Insertar CATEGORIA
INSERT INTO CATEGORIA
       (NOMCAT)
       VALUES
       ('Abarrotes');
       COMMIT;

-- Listar registro CATEGORIA
SELECT * FROM CATEGORIA;

-- Insertar CATEGORIA
INSERT ALL
       INTO CATEGORIA (NOMCAT) VALUES ('Lácteos y huevo')
       INTO CATEGORIA (NOMCAT) VALUES ('Carnes y pollo')
       INTO CATEGORIA (NOMCAT) VALUES ('Higiene y limpieza')
       SELECT * FROM DUAL
COMMIT;

-- Listar registro CATEGORIA
SELECT * FROM CATEGORIA;

-- Listar registro PRODUCTO
SELECT * FROM PRODUCTO;

-- Agregar columna CATEGORIA en tabla PRODUCTO
ALTER TABLE PRODUCTO
      ADD IDCAT INT;
      
-- Modificar registros de PRODUCTO para agregar IDCAT
UPDATE PRODUCTO
       SET IDCAT = 100;

-- Relacionar PRODUCO - CATEGORIA (Una categoría puede tener uno o muchos productos)
ALTER TABLE PRODUCTO
      ADD CONSTRAINT IDCAT_FK FOREIGN KEY (IDCAT)
      REFERENCES CATEGORIA (IDCAT);
       
-- Verificar listado PRODUCTO
SELECT * FROM PRODUCTO;

-- Insertar PRODUCTO (probando la integridad referencial de la relación)
INSERT INTO PRODUCTO
       (CODPROD, NOMPRO, PREPRO, STOCKPRO, IDCAT)
       VALUES
       ('P00004', 'Detergente OPAL', '6.80', 60, 500);
COMMIT;
