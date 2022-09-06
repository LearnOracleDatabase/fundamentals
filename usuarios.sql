-- Versi�n de base de datos instalada
SELECT * FROM V$VERSION;

-- Listar base de datos
SELECT * FROM V$DATABASE;

-- Ver instancia de base de datos
SELECT * FROM V$INSTANCE;

-- Ver listado de TABLESPACES
SELECT * FROM DBA_TABLESPACES;

-- Crear tablespace tbsDemo
CREATE TABLESPACE TBSDEMO
DATAFILE 'tbsdemo.dbf'
SIZE 200M;

-- Listar USUARIOS
SELECT * FROM DBA_USERS;

-- Listar USUARIOS de TABLESPACE USERS
SELECT  
    DEFAULT_TABLESPACE,
    USERNAME,
    ACCOUNT_STATUS,
    EXPIRY_DATE,
    AUTHENTICATION_TYPE
FROM DBA_USERS
WHERE DEFAULT_TABLESPACE = 'USERS';

-- Listar USUARIOS de TABLESPACE TBSDEMO
SELECT  
    DEFAULT_TABLESPACE,
    USERNAME,
    ACCOUNT_STATUS,
    EXPIRY_DATE,
    AUTHENTICATION_TYPE
FROM DBA_USERS
WHERE DEFAULT_TABLESPACE = 'TBSDEMO';

-- Crear usuario en TABLESPACE TBSDEMO
CREATE USER MiniMarket
IDENTIFIED BY Orcl1234
DEFAULT TABLESPACE TBSDEMO
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TBSDEMO;

-- Habilitar privilegios
GRANT CREATE SESSION TO MiniMarket;
GRANT CREATE TABLE TO MiniMarket;
GRANT CREATE VIEW TO MiniMarket;
GRANT CREATE PROCEDURE TO MiniMarket;
GRANT CREATE TRIGGER TO MiniMarket;
GRANT CREATE SEQUENCE TO MiniMarket;
GRANT CREATE JOB TO MiniMarket;
GRANT UNLIMITED TABLESPACE TO MiniMarket;

-- Listar los permisos de USUARIO SYS
SELECT * FROM SESSION_PRIVS;

-- Permitir ejecuci�n de script
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;