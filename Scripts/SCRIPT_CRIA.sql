-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2020-11-16 23:33:24 BRST
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE t_bttf_comentario (
    cd_comentario  NUMBER(5) NOT NULL,
    cd_personagem  NUMBER(5) NOT NULL,
    cd_login       NUMBER(5) NOT NULL,
    ds_comentario  VARCHAR2(1200) NOT NULL,
    ds_emocao      VARCHAR2(20) NOT NULL,
    ts_comentario  TIMESTAMP WITH LOCAL TIME ZONE NOT NULL
);

ALTER TABLE t_bttf_comentario ADD CONSTRAINT pk_bttf_comentario PRIMARY KEY ( cd_comentario );

CREATE TABLE t_bttf_login (
    cd_login    NUMBER(5) NOT NULL,
    nm_apelido  VARCHAR2(70) NOT NULL,
    nm_email    VARCHAR2(70) NOT NULL,
    nm_senha    VARCHAR2(70) NOT NULL
);

ALTER TABLE t_bttf_login ADD CONSTRAINT pk_bttf_login PRIMARY KEY ( cd_login );

ALTER TABLE t_bttf_login ADD CONSTRAINT un_bttf_login_apelido UNIQUE ( nm_apelido );

ALTER TABLE t_bttf_login ADD CONSTRAINT un_bttf_login_email UNIQUE ( nm_email );

CREATE TABLE t_bttf_personagem (
    cd_personagem      NUMBER(5) NOT NULL,
    nm_personagem      VARCHAR2(70) NOT NULL,
    nr_idade_presente  NUMBER(2) NOT NULL,
    nr_idade_passado   NUMBER(2),
    ds_personagem      VARCHAR2(1200) NOT NULL,
    nm_ator            VARCHAR2(70) NOT NULL,
    dt_nascimento      DATE NOT NULL
);

ALTER TABLE t_bttf_personagem ADD CONSTRAINT pk_bttf_personagem PRIMARY KEY ( cd_personagem );

ALTER TABLE t_bttf_comentario
    ADD CONSTRAINT fk_bttf_login_fk FOREIGN KEY ( cd_login )
        REFERENCES t_bttf_login ( cd_login )
            ON DELETE CASCADE;

ALTER TABLE t_bttf_comentario
    ADD CONSTRAINT fk_bttf_personagem FOREIGN KEY ( cd_personagem )
        REFERENCES t_bttf_personagem ( cd_personagem )
            ON DELETE CASCADE;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
