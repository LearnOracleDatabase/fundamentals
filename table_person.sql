-- Ver USUARIO CONECTADO
SELECT user FROM dual;

-- Listar los permisos de USUARIO SYS
SELECT * FROM SESSION_PRIVS;

-- Crear tabla PERSONA
CREATE TABLE PERSONA
(
       IDPER INT,
       DNIPER CHAR(8),
       NOMPER VARCHAR2(60),
       APEPER VARCHAR2(80),
       EMACLI VARCHAR2(80),
       CELCLI CHAR(9),
       TIPPER CHAR(1),
       ESTCLI CHAR(1) DEFAULT 'A',
       CONSTRAINT PER_PK PRIMARY KEY (IDPER)       
);

-- Crear secuencia INCREMENTO INC_PER
CREATE SEQUENCE INC_PER
       START WITH 200
       INCREMENT BY 1;
       
-- Crear disparador de auntoincrementable TRG_INC_PER
CREATE TRIGGER TRG_INC_PER
       BEFORE INSERT ON PERSONA
       FOR EACH ROW
       BEGIN
           SELECT INC_PER.NEXTVAL INTO :NEW.IDPER FROM DUAL;
       END;
       
-- Insertar registros PERSONA
INSERT ALL
       INTO PERSONA (DNIPER, NOMPER, APEPER, EMACLI, CELCLI, TIPPER)
       VALUES ('77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@empresa.com', '99845632', 'V')
       INTO PERSONA (DNIPER, NOMPER, APEPER, EMACLI, CELCLI, TIPPER)
       VALUES ('45781233', 'Alicia', 'García Campos', 'alicia.garcia@gmail.com', '929185236', 'C')
       INTO PERSONA (DNIPER, NOMPER, APEPER, EMACLI, CELCLI, TIPPER)
       VALUES ('15487922', 'Juana', 'Ávila Chumpitaz', 'juana.avila@gmail.com', '923568741', 'C')
       INTO PERSONA (DNIPER, NOMPER, APEPER, EMACLI, CELCLI, TIPPER)
       VALUES ('22116633', 'Ana', 'Enriquez Flores', 'ana.enriquez@empresa.com', '978848551', 'V')
       SELECT * FROM DUAL
COMMIT;  

-- Listar registros tabla PERSONA
SELECT * FROM PERSONA;

-- Crear tabla VENTA
CREATE TABLE VENTA
(
       IDVEN INT,
       FECVEN DATE DEFAULT CURRENT_DATE,
       IDVEND INT,
       IDCLI INT,
       TIPEN CHAR(1),
       CONSTRAINT VENT_PK PRIMARY KEY (IDVEN)
);

-- Crear secuencia INCREMENTO INC_VENT
CREATE SEQUENCE INC_VENT
       START WITH 1
       INCREMENT BY 1;

-- Crear disparador de auntoincrementable TRG_INC_VENT
CREATE TRIGGER TRG_INC_VENT
       BEFORE INSERT ON VENTA
       FOR EACH ROW
       BEGIN
           SELECT INC_VENT.NEXTVAL INTO :NEW.IDVEN FROM DUAL;
       END;

-- Insertar registro tabla VENTA
INSERT ALL
       INTO VENTA (IDVEND, IDCLI, TIPEN)
       VALUES (200, 201, 'P')
       INTO VENTA (IDVEND, IDCLI, TIPEN)
       VALUES (200, 202, 'D')
       INTO VENTA (IDVEND, IDCLI, TIPEN)
       VALUES (203, 201, 'D')
       INTO VENTA (IDVEND, IDCLI, TIPEN)
       VALUES (203, 202, 'D')
       SELECT * FROM DUAL
COMMIT;

-- Listar registros tabla VENTA
SELECT * FROM VENTA;
