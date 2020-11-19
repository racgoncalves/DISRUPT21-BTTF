
-- Apaga as tabelas existentes
DROP TABLE t_bttf_comentario CASCADE CONSTRAINTS;
DROP TABLE t_bttf_login CASCADE CONSTRAINTS;
DROP TABLE t_bttf_personagem CASCADE CONSTRAINTS;

-- exclui as sequ�ncias
DROP SEQUENCE SQ_BTTF_LOGIN;
DROP SEQUENCE SQ_BTTF_PERSONAGEM;
DROP SEQUENCE SQ_BTTF_COMENTARIO;

-- cria as tabelas
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


-- cria sequ�ncia dos logins
CREATE SEQUENCE SQ_BTTF_LOGIN MAXVALUE 999999  NOCACHE;

-- cria sequ�ncia dos personagens
CREATE SEQUENCE SQ_BTTF_PERSONAGEM MAXVALUE 999999  NOCACHE;

-- cria sequ�ncia dos comentarios
CREATE SEQUENCE SQ_BTTF_COMENTARIO MAXVALUE 999999 NOCACHE;

-- insere login do administrador
INSERT INTO T_BTTF_LOGIN (CD_LOGIN,NM_APELIDO,NM_EMAIL,NM_SENHA) VALUES (SQ_BTTF_LOGIN.NEXTVAL,'ADMIN','admin@fiap.com.br','fiap123');

-- insere login dos usu�rios
INSERT INTO T_BTTF_LOGIN (CD_LOGIN,NM_APELIDO,NM_EMAIL,NM_SENHA) VALUES (SQ_BTTF_LOGIN.NEXTVAL,'J�','joao@fiap.com.br','joao123');
INSERT INTO T_BTTF_LOGIN (CD_LOGIN,NM_APELIDO,NM_EMAIL,NM_SENHA) VALUES (SQ_BTTF_LOGIN.NEXTVAL,'Mariazinha','maria@fiap.com.br','maria123');
INSERT INTO T_BTTF_LOGIN (CD_LOGIN,NM_APELIDO,NM_EMAIL,NM_SENHA) VALUES (SQ_BTTF_LOGIN.NEXTVAL,'Pedr�o','pedro@fiap.com.br','pedro123');

-- insere personagens
INSERT INTO T_BTTF_PERSONAGEM (CD_PERSONAGEM,NM_PERSONAGEM,NR_IDADE_PRESENTE,NR_IDADE_PASSADO,DS_PERSONAGEM,NM_ATOR,DT_NASCIMENTO) VALUES (SQ_BTTF_PERSONAGEM.NEXTVAL,'Marty McFly',17,0,'Martin Seamus McFly � um residente americano de Hill Valley, Calif�rnia. Ele � o segundo viajante do tempo no mundo (depois de Einstein), o primeiro a viajar ao passado e o primeiro humano a viajar no tempo. Ele tamb�m era um estudante do ensino m�dio na Hill Valley High School em 1985. Ele � o melhor amigo do Dr. Emmett Brown, que revelou sua primeira inven��o de trabalho para ele. Gosta muito de andar de skate e tocar guitarra. Pouco se sabe sobre a inf�ncia de Marty, exceto pelo fato de que ele ateou fogo no tapete da sala quando tinha oito anos.','Michael J. Fox',TO_DATE('09/06/1961','DD/MM/YYYY'));
INSERT INTO T_BTTF_PERSONAGEM (CD_PERSONAGEM,NM_PERSONAGEM,NR_IDADE_PRESENTE,NR_IDADE_PASSADO,DS_PERSONAGEM,NM_ATOR,DT_NASCIMENTO) VALUES (SQ_BTTF_PERSONAGEM.NEXTVAL,'Doc Brown',77,47,'O Dr. Emmett Lathrop Brown � um residente americano de Hill Valley, Calif�rnia. Ele foi o inventor da m�quina do tempo DeLorean. Ele � o terceiro viajante do tempo do mundo (depois de Einstein e Marty McFly), o segundo a viajar para a frente no tempo (depois de Einstein), o primeiro humano a viajar para a frente no tempo e o segundo humano a viajar no tempo (depois de Marty). Cientista de profiss�o, Doc era um estudante de todas as ci�ncias que passava grande parte do tempo inventando.','Christopher Lloyd',TO_DATE('22/10/1938','DD/MM/YYYY'));
INSERT INTO T_BTTF_PERSONAGEM (CD_PERSONAGEM,NM_PERSONAGEM,NR_IDADE_PRESENTE,NR_IDADE_PASSADO,DS_PERSONAGEM,NM_ATOR,DT_NASCIMENTO) VALUES (SQ_BTTF_PERSONAGEM.NEXTVAL,'George McFly',47,17,'George Douglas McFly � o pai de Dave, Linda e Marty McFly, e marido de Lorraine Baines McFly. Ele era de ascend�ncia irlandesa-americana, pois seus bisav�s paternos Seamus e Maggie McFly haviam emigrado da Irlanda antes de 1885.','Crispin Glover',TO_DATE('20/04/1964','DD/MM/YYYY'));
INSERT INTO T_BTTF_PERSONAGEM (CD_PERSONAGEM,NM_PERSONAGEM,NR_IDADE_PRESENTE,NR_IDADE_PASSADO,DS_PERSONAGEM,NM_ATOR,DT_NASCIMENTO) VALUES (SQ_BTTF_PERSONAGEM.NEXTVAL,'Lorraine Baines',47,17,'Lorraine Baines McFly � a m�e de Dave, Linda e Marty McFly e esposa de George McFly. Lorraine gostava da aten��o dos meninos quando estava na escola, e muitos deles eram atra�dos por ela, incluindo George McFly e Biff Tannen. Lorraine poderia defender a si mesma e as pessoas com quem ela se importava, mas apesar disso, ela gostava que seus homens fossem fortes e capazes de proteg�-la. Ela gostava de pensar nos velhos tempos, sempre contando a hist�ria de como conheceu e se apaixonou por George. Lorraine gostava de jogar t�nis com o marido e eles foram campe�es do clube de t�nis nos �ltimos seis anos em 1985. As melhores amigas de Lorraine na escola eram Betty e Babs, e ela frequentemente podia ser encontrada no Lous Cafe fofocando com elas.','Lea Thompson',TO_DATE('31/05/1961','DD/MM/YYYY'));
INSERT INTO T_BTTF_PERSONAGEM (CD_PERSONAGEM,NM_PERSONAGEM,NR_IDADE_PRESENTE,NR_IDADE_PASSADO,DS_PERSONAGEM,NM_ATOR,DT_NASCIMENTO) VALUES (SQ_BTTF_PERSONAGEM.NEXTVAL,'Biff Tannen',48,18,'Biff Howard Tannen nasceu em 1937, filho de Irving Thomas Tannen e Myra Benson em Hill Valley, Calif�rnia. Biff era bisneto de Buford Tannen. Ele n�o era muito inteligente e s� conseguiu terminar o ensino m�dio intimidando George McFly para fazer o dever de casa por ele. Biff costumava ter prazer em chamar George de inseto irland�s. Ele era temido pela maioria de seus colegas da escola. A �nica pessoa de quem temia era o Sr. Strickland. Em 1955, ele se cercou de uma gangue composta por Match, Skinhead e 3-D.','Tom Wilson',TO_DATE('15/04/1959','DD/MM/YYYY'));
INSERT INTO T_BTTF_PERSONAGEM (CD_PERSONAGEM,NM_PERSONAGEM,NR_IDADE_PRESENTE,NR_IDADE_PASSADO,DS_PERSONAGEM,NM_ATOR,DT_NASCIMENTO) VALUES (SQ_BTTF_PERSONAGEM.NEXTVAL,'Jennifer Parker',17,0,'Jennifer Jane Parker McFly era a namorada, e mais tarde a esposa, de Marty McFly. Jennifer foi a quarta viajante do tempo do mundo e a terceira humana. Ela era filha de Danny Parker Jr. e Betty Parker, e neta de Danny Parker e sua esposa Betty Lapinski. Jennifer e Marty pareciam ser s�rios o suficiente para que ele a apresentasse a seu melhor amigo, o inventor local Dr. Emmett Brown, a quem ela primeiro considerou exc�ntrico e estranho. Jennifer � principalmente uma pessoa positiva, sabendo o que dizer a Mart se ele precisasse de �nimo e imaginando que vida feliz ela poderia ter no futuro.','Claudia Wells',TO_DATE('05/07/1966','DD/MM/YYYY'));

-- insere comentarios
INSERT INTO T_BTTF_COMENTARIO (CD_COMENTARIO,CD_PERSONAGEM,CD_LOGIN,DS_COMENTARIO,DS_EMOCAO,TS_COMENTARIO) VALUES (SQ_BTTF_COMENTARIO.NEXTVAL,1,2,'Eu adoro ele','alegria',CURRENT_TIMESTAMP);
INSERT INTO T_BTTF_COMENTARIO (CD_COMENTARIO,CD_PERSONAGEM,CD_LOGIN,DS_COMENTARIO,DS_EMOCAO,TS_COMENTARIO) VALUES (SQ_BTTF_COMENTARIO.NEXTVAL,2,3,'Fiquei tenso no final, achei que tinham matado ele novamente','medo',CURRENT_TIMESTAMP);
INSERT INTO T_BTTF_COMENTARIO (CD_COMENTARIO,CD_PERSONAGEM,CD_LOGIN,DS_COMENTARIO,DS_EMOCAO,TS_COMENTARIO) VALUES (SQ_BTTF_COMENTARIO.NEXTVAL,3,4,'Esse cara � surpreendente','surpresa',CURRENT_TIMESTAMP);
INSERT INTO T_BTTF_COMENTARIO (CD_COMENTARIO,CD_PERSONAGEM,CD_LOGIN,DS_COMENTARIO,DS_EMOCAO,TS_COMENTARIO) VALUES (SQ_BTTF_COMENTARIO.NEXTVAL,4,4,'Muito engra�ada suas cenas','alegria',CURRENT_TIMESTAMP);
INSERT INTO T_BTTF_COMENTARIO (CD_COMENTARIO,CD_PERSONAGEM,CD_LOGIN,DS_COMENTARIO,DS_EMOCAO,TS_COMENTARIO) VALUES (SQ_BTTF_COMENTARIO.NEXTVAL,5,3,'Eu odeio esse personagem','raiva',CURRENT_TIMESTAMP);
INSERT INTO T_BTTF_COMENTARIO (CD_COMENTARIO,CD_PERSONAGEM,CD_LOGIN,DS_COMENTARIO,DS_EMOCAO,TS_COMENTARIO) VALUES (SQ_BTTF_COMENTARIO.NEXTVAL,6,2,'Me apaixonei por ela','alegria',CURRENT_TIMESTAMP);

-- commit das informa��es
COMMIT;