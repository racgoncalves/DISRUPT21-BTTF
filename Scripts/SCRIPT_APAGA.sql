
-- Apaga as tabelas existentes
DROP TABLE t_bttf_comentario CASCADE CONSTRAINTS;
DROP TABLE t_bttf_login CASCADE CONSTRAINTS;
DROP TABLE t_bttf_personagem CASCADE CONSTRAINTS;

-- exclui as sequências
DROP SEQUENCE SQ_BTTF_LOGIN;
DROP SEQUENCE SQ_BTTF_PERSONAGEM;
DROP SEQUENCE SQ_BTTF_COMENTARIO;