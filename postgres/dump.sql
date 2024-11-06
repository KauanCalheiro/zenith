CREATE TABLE aula_plano (
    id bigint NOT NULL,
    ref_aula bigint NOT NULL,
    ref_plano bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE aulas (
    id bigint NOT NULL,
    nome character varying(45) NOT NULL,
    descricao text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE cidades (
    id bigint NOT NULL,
    ref_estado bigint NOT NULL,
    nome character varying(45),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE contratos (
    id bigint NOT NULL,
    ref_pessoa bigint NOT NULL,
    ref_plano bigint NOT NULL,
    ref_motivo_cancelamento bigint NOT NULL,
    ref_pessoa_indicacao bigint NOT NULL,
    ref_forma_pagamento bigint NOT NULL,
    dt_contratacao timestamp(0) without time zone NOT NULL,
    dt_final timestamp(0) without time zone,
    dt_suspensao timestamp(0) without time zone,
    meses_suspensao integer,
    caminho_contrato character varying(255),
    numero_parcelas_pagamento integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE estados (
    id bigint NOT NULL,
    nome character varying(45),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE exercicio_treino (
    id bigint NOT NULL,
    ref_exercicio bigint NOT NULL,
    ref_treino bigint NOT NULL,
    grupo text,
    num_series integer,
    num_repeticoes integer,
    carga integer,
    observacao text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE exercicios (
    id bigint NOT NULL,
    nome character varying(45) NOT NULL,
    video character varying(255),
    descricao text,
    grupo_muscular text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE formas_pagamento (
    id bigint NOT NULL,
    descricao text NOT NULL,
    metodo character varying(45) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE historicos (
    id bigint NOT NULL,
    descricao character varying(45) NOT NULL,
    indice_operacao integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE lancamentos (
    id bigint NOT NULL,
    valor double precision NOT NULL,
    descricao character varying(45) NOT NULL,
    ref_titulo bigint NOT NULL,
    ref_historico bigint NOT NULL,
    dt_emissao date NOT NULL,
    dt_contabil date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE modulos (
    id bigint NOT NULL,
    descricao text NOT NULL,
    path text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE motivos_cancelamento (
    id bigint NOT NULL,
    descricao character varying(45) NOT NULL,
    fl_gera_multa boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE ocorrencias_aula (
    id bigint NOT NULL,
    ref_aula bigint NOT NULL,
    vagas integer,
    dia_semana character varying(45),
    horario_inicial timestamp(0) without time zone,
    horario_final timestamp(0) without time zone,
    profissional character varying(45),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


CREATE TABLE perfil_modulo (
    id integer NOT NULL,
    ref_perfil integer NOT NULL,
    ref_modulo integer NOT NULL
);


CREATE TABLE perfis (
    id bigint NOT NULL,
    descricao text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE pessoa_modulo (
    id integer NOT NULL,
    ref_pessoa integer NOT NULL,
    ref_modulo integer NOT NULL
);


CREATE TABLE pessoa_perfil (
    id integer NOT NULL,
    ref_pessoa integer NOT NULL,
    ref_perfil integer NOT NULL
);


CREATE TABLE pessoas (
    id bigint NOT NULL,
    nome text NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    dt_nascimento date NOT NULL,
    cpf character varying(11) NOT NULL,
    endereco text NOT NULL,
    telefone character varying(11) NOT NULL,
    genero character varying(45),
    ref_cidade bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE planos (
    id bigint NOT NULL,
    titulo character varying(45) NOT NULL,
    descricao text NOT NULL,
    dt_inicio timestamp(0) without time zone NOT NULL,
    dt_fim timestamp(0) without time zone,
    numero_meses_contrato integer,
    valor_mensal double precision NOT NULL,
    modelo_contrato character varying(45) NOT NULL,
    diarias integer NOT NULL,
    ref_historico bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE registro_presencas (
    id bigint NOT NULL,
    dt_entrada character varying(45) NOT NULL,
    ref_pessoa bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


CREATE TABLE titulos (
    id bigint NOT NULL,
    valor double precision NOT NULL,
    dt_vencimento date NOT NULL,
    num_parcela integer NOT NULL,
    dt_emissao date NOT NULL,
    cod_boleto character varying(45) NOT NULL,
    cod_barras character varying(45) NOT NULL,
    dt_remessa date,
    dt_retorno date,
    ref_contrato bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE treino_pessoa (
    id bigint NOT NULL,
    ref_pessoa bigint NOT NULL,
    ref_treino bigint NOT NULL,
    dt_inicial date NOT NULL,
    dt_final date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE treinos (
    id bigint NOT NULL,
    descricao text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE turmas (
    id bigint NOT NULL,
    ref_pessoa bigint NOT NULL,
    ref_ocorrencia_aula bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

COPY cidades (id, ref_estado, nome, created_at, updated_at) FROM stdin;
1	1	Porto Alegre	\N	\N
\.

COPY estados (id, nome, created_at, updated_at) FROM stdin;
1	Rio Grande do Sul	\N	\N
\.

COPY exercicio_treino (id, ref_exercicio, ref_treino, grupo, num_series, num_repeticoes, carga, observacao, created_at, updated_at) FROM stdin;
1097	114	1	A	\N	\N	\N	10 a 15 minutos	\N	\N
1098	31	1	A	3	12	\N	\N	\N	\N
1099	83	1	A	3	12	\N	\N	\N	\N
1100	32	1	A	3	12	\N	\N	\N	\N
1101	43	1	A	3	12	\N	\N	\N	\N
1102	29	1	A	3	12	\N	\N	\N	\N
1103	4	1	A	3	12	\N	\N	\N	\N
1104	114	1	B	\N	\N	\N	10 a 15 minutos	\N	\N
1105	53	1	B	3	12	\N	\N	\N	\N
1106	54	1	B	3	12	\N	\N	\N	\N
1107	110	1	B	3	12	\N	\N	\N	\N
1108	86	1	B	3	12	\N	\N	\N	\N
1109	39	1	B	3	12	\N	\N	\N	\N
1110	11	1	B	3	12	\N	\N	\N	\N
1111	114	1	C	\N	\N	\N	10 a 15 minutos	\N	\N
1112	104	1	C	3	12	\N	\N	\N	\N
1113	20	1	C	3	12	\N	\N	\N	\N
1114	18	1	C	3	12	\N	\N	\N	\N
1115	106	1	C	3	12	\N	\N	\N	\N
1116	90	1	C	3	12	\N	\N	\N	\N
1117	37	1	C	3	12	\N	\N	\N	\N
\.


COPY exercicios (id, nome, video, descricao, grupo_muscular, created_at, updated_at) FROM stdin;
29	Leg Press	files/exercicios/29/legpress.gif	 Foca nos quadríceps e glúteos	Quadriceps	\N	\N
54	Cadeira Adutora	files/exercicios/54/pernas-aducao-de-pernas-na-maquina.gif	 Foca nos músculos da parte interna da coxa	Quadriceps	\N	\N
65	Rosca Martelo	files/exercicios/65/rosca_martelo.gif	 Trabalha os bíceps e antebraços	Biceps	\N	\N
1	Supino Reto	files/exercicios/1/supino-reto.gif	 Trabalha o peito	Peito	\N	\N
100	Tríceps Unilateral Cross	\N	\N	Triceps	\N	\N
102	Elevação Frontal Anilha	\N	\N	Ombro	\N	\N
2	Supino Inclinado	files/exercicios/2/1000096723.gif	 Foca no peitoral superior	Peito	\N	\N
106	Flexor em Pé	\N	\N	Posterior	\N	\N
16	Tríceps Testa Halter	files/exercicios/16/testa.gif	 Isola os tríceps	Triceps	\N	\N
118	Hiperextensão de Quadril	\N	\N	Gluteo	\N	\N
120	Elevação lateral/frontal	\N	\N	Ombro	\N	\N
4	Crucifixo	files/exercicios/4/crucifixo.gif	 Isola o peito	Peito	\N	\N
30	Avanço	files/exercicios/30/Avanco.gif	 Desafia os músculos das pernas	Quadriceps	\N	\N
96	Tríceps Paralela	files/exercicios/96/paralelas.gif	\N	Triceps	\N	\N
92	Rosca Martelo Cross	files/exercicios/92/martelo_cross.gif	\N	Biceps	\N	\N
5	Flexão de Braço	files/exercicios/5/flexao_braco.gif	 Fortalece o peitoral	Peito	\N	\N
86	Remada Baixa	files/exercicios/86/remada-sentado-com-cabos-e-triangulo-para-costas.gif	\N	Costas	\N	\N
17	Tríceps Francês	files/exercicios/17/frances.gif	 Trabalha os músculos posteriores do braço	Triceps	\N	\N
67	Extensão de Tríceps com Corda	files/exercicios/67/triceps-no-pulley-atras-ca-cabeca.gif	 Fortalece os tríceps	Triceps	\N	\N
14	Rosca 21	files/exercicios/14/scott.gif	 Desafia os bíceps com uma série específica	Biceps	\N	\N
24	Prancha	files/exercicios/24/prancha.jpeg	 Fortalece o abdômen	abdomem	\N	\N
31	Cadeira Extensora	files/exercicios/31/extensora.gif	 Fortalece os quadríceps	Quadriceps	\N	\N
11	Rosca Direta	files/exercicios/11/Rosca_direta.gif	 Trabalha os bíceps	Biceps	\N	\N
41	Fly Declinado	\N	 Foca no peitoral inferior	Peito	\N	\N
42	Fly Inclinado	\N	 Desafia o peitoral superior	Peito	\N	\N
27	Elevação de Pernas	files/exercicios/27/elevacao_pernas.gif	 Fortalece o abdômen inferior	abdomem	\N	\N
43	Tríceps  Corda	files/exercicios/43/tricpes_corda.gif	 Isola os tríceps	Triceps	\N	\N
28	Agachamento	files/exercicios/28/agachamento.gif	 Trabalha os quadríceps	Quadriceps	\N	\N
40	Crucifixo Crossover	files/exercicios/40/crucifixo-crossover-alto.gif	 Trabalha o peitoral	Peito	\N	\N
81	Afundo com Barra	files/exercicios/81/agachamento-afundo-com-barra.gif	 Alveja os músculos das pernas	Quadriceps	\N	\N
108	Glúteo 4 Apoios 	files/exercicios/108/quatro-apoios-com-elevacao-da-perna.gif	\N	Gluteo	\N	\N
64	Rosca Concentrada	files/exercicios/64/rosca-concentrada-unilateral-com-halter.gif	 Foca nos bíceps	Biceps	\N	\N
36	Agachamento Sumô	files/exercicios/36/sumo.gif	 Desafia os músculos internos das coxas e glúteos	Gluteo	\N	\N
12	Rosca Alternada	files/exercicios/12/rosca_alternada.gif	 Isola os bíceps	Biceps	\N	\N
51	Agachamento Frontal	files/exercicios/51/agachamento-frontal-com-barra.gif	 Alveja os quadríceps	Quadriceps	\N	\N
37	Afundo	files/exercicios/37/afundo-exercicio.gif	 Trabalha os glúteos e quadríceps	Gluteo	\N	\N
48	Flexão Diamond	\N	 Isola os tríceps	Triceps	\N	\N
82	Voador Dorsal	files/exercicios/82/ombros-voador-invertido-na-maquina.gif	\N	Costas	\N	\N
68	Extensão de Tríceps com Barra Reta	\N	 Trabalha os tríceps	Triceps	\N	\N
69	Extensão de Tríceps com Halteres	\N	 Foca nos tríceps	Triceps	\N	\N
88	Puxada Articulada	files/exercicios/88/pulley-frente-maquina-articulada.gif	\N	Costas	\N	\N
25	Crunch	\N	 Trabalha os músculos abdominais	abdomem	\N	\N
26	Abdominal Remador	\N	 Foca nos oblíquos	abdomem	\N	\N
52	Agachamento Búlgaro	files/exercicios/52/agachamento-bulgaro.gif	 Desafia os quadríceps e glúteos	Quadriceps	\N	\N
49	Prancha Lateral	\N	 Fortalece os oblíquos	abdomem	\N	\N
50	Bicicleta Abdominal	\N	 Trabalha o abdômen e oblíquos	abdomem	\N	\N
79	Agachamento Livre	files/exercicios/79/agachamento_livre.gif	 Trabalha os quadríceps e glúteos	Quadriceps	\N	\N
84	Supino Reto c/ Halter	files/exercicios/84/supino-reto-com-halteres.gif	\N	Peito	\N	\N
94	Tríceps Coice	files/exercicios/94/dumbbell-kickback.gif	\N	Triceps	\N	\N
13	Rosca Scott	files/exercicios/13/scott.gif	 Foca nos bíceps	Biceps	\N	\N
90	Supino Inclinado Articulado	files/exercicios/90/inclinado.gif	\N	Peito	\N	\N
104	Hack de Agachamento	files/exercicios/104/agachamento-no-rack.gif	\N	Quadriceps	\N	\N
98	Tríceps Testa Cross	files/exercicios/98/testa_cross.gif	\N	Triceps	\N	\N
110	Puxada Alta	files/exercicios/110/costas-puxada-aberta-com-barra-no-pulley.gif	\N	Costas	\N	\N
116	Elevação Pélvica	files/exercicios/116/Elevacao-Pelvica.gif	\N	Gluteo	\N	\N
80	Avanço com Barra	\N	 Desafia os quadríceps e glúteos	Quadriceps	\N	\N
112	Abdominal Infra	files/exercicios/112/Abdominal-infra-solo.gif	\N	abdomem	\N	\N
35	Glúteo Máquina	\N	 Foca nos glúteos	Gluteo	\N	\N
122	Glúteo Ostra	files/exercicios/122/clamshell-de-lado-deitado-no-chao.gif	\N	Gluteo	\N	\N
124	Passada lateral com elástico	files/exercicios/124/pernas-abducao-lateral-com-passada-e-elastico.gif	\N	Quadriceps	\N	\N
15	Tríceps Pulley	files/exercicios/15/triceps.gif	 Fortalece os tríceps	Triceps	\N	\N
114	Esteira	files/exercicios/114/esteira.gif	\N	Quadriceps	\N	\N
128	Arnold Press	files/exercicios/128/ombros-desenvolvimento-arnold-para-ombros.gif	\N	Ombro	\N	\N
3	Supino Declinado	files/exercicios/3/dumbbell-decline-bench-press.gif	 Alveja o peitoral inferior	Peito	\N	\N
53	Cadeira Abdutora	files/exercicios/53/1000096721.gif	 Trabalha os músculos da parte externa da coxa	Gluteo	\N	\N
45	Flexão Declinada	\N	 Fortalece o peitoral inferior	Peito	\N	\N
46	Flexão Inclinada	\N	 Desafia o peitoral superior	Peito	\N	\N
47	Flexão Militar	\N	 Trabalha o peitoral e tríceps	Peito	\N	\N
55	Flexão com Peso	\N	 Fortalece o peitoral	Peito	\N	\N
56	Flexão com Pernas Elevadas	\N	 Desafia o peitoral e deltoides	Peito	\N	\N
57	Flexão com Pernas Cruzadas	\N	 Isola o peitoral	Peito	\N	\N
61	Puxada com Barra V	\N	 Isola os músculos das costas	Costas	\N	\N
78	Gêmeos em Pé	\N	 Fortalece as panturrilhas	Panturrilha	\N	\N
89	Crucifixo Invertido	files/exercicios/89/ombros-crucifixo-invertido-com-halteres.gif	\N	Costas	\N	\N
73	Elevação Lateral com Polia Baixa	files/exercicios/73/elevacao_lateral_polia.gif	 Foca nos deltoides laterais	Ombro	\N	\N
101	Elevação Frontal Cross	files/exercicios/101/Elevacao-Frontal-com-Barra-na-Polia.gif	\N	Ombro	\N	\N
34	Mesa Flexora	files/exercicios/34/mesa_flexora.gif	 Fortalece os músculos isquiotibiais	Posterior	\N	\N
85	Supino Inclinado c/ Halter	files/exercicios/85/supino-inclinado-com-halteres.gif	\N	Peito	\N	\N
121	Mobilidade de Inferiores	\N	\N	Quadriceps	\N	\N
123	Mobilidade superiores	\N	\N	Ombro	\N	\N
19	Desenvolvimento com Halteres	files/exercicios/19/ombro.gif	 Fortalece os ombros	Ombro	\N	\N
6	Pulldown	files/exercicios/6/pulldown.gif	 Trabalha a parte superior das costas	Costas	\N	\N
59	Puxada Frontal	files/exercicios/59/costas-puxada-aberta-com-barra-no-pulley.gif	 Fortalece os músculos das costas e ombros	Costas	\N	\N
7	Remada Curvada	files/exercicios/7/remada_curvada.gif	 Alveja os músculos das costas	Costas	\N	\N
20	Elevação Frontal	files/exercicios/20/elevacao_frontal.gif	 Trabalha os deltoides anteriores	Ombro	\N	\N
8	Remada Unilateral	files/exercicios/8/cerrote.gif	 Fortalece as costas	Costas	\N	\N
38	Panturrilha no Smith	files/exercicios/38/Panturrilha-em-pe-no-smith.gif	 Fortalece as panturrilhas	Panturrilha	\N	\N
9	Remada Cavalinho	files/exercicios/9/cavalo_maquina.gif	 Foca nos músculos do meio das costas	Costas	\N	\N
21	Elevação Posterior	files/exercicios/21/elevacao_posterior.gif	 Isola os deltoides posteriores	Ombro	\N	\N
10	Pull-up	files/exercicios/10/Pull-up.gif	 Desafia os músculos das costas e do braço	Costas	\N	\N
70	Crucifixo Inverso	files/exercicios/70/Crucifixo-inverso-na-maquina-como-fazer-musculos.gif	 Alveja os deltoides posteriores	Ombro	\N	\N
18	Elevação Lateral	files/exercicios/18/elevacao_lateral.gif	 Foca nos deltoides laterais	Ombro	\N	\N
39	Elevação de Panturrilha	files/exercicios/39/Elevacao-de-panturrilha-em-pe.gif	 Isola as panturrilhas	Panturrilha	\N	\N
23	Encolhimento de Ombros	files/exercicios/23/encolhimento.gif	 Foca nos músculos do trapézio	Ombro	\N	\N
60	Puxada Alta com Triângulo	files/exercicios/60/costas-puxada-para-frente-no-pulley-com-triangulo.gif	 Desafia os músculos das costas e ombros	Costas	\N	\N
32	Cadeira Flexora	files/exercicios/32/flexora.gif	 Trabalha os músculos posteriores da coxa	Posterior	\N	\N
44	Pullover	files/exercicios/44/Dumbbell-Pullover.gif	 Foca no peitoral e costas	Peito	\N	\N
33	Stiff	files/exercicios/33/stiff.gif	 Alveja os músculos do posterior de coxa	Posterior	\N	\N
76	Flexão Plantar	files/exercicios/76/flexao_plantar.gif	 Trabalha as panturrilhas	Panturrilha	\N	\N
62	Puxada Aberta	files/exercicios/62/costas-puxada-aberta-com-barra-no-pulley-1.gif	 Trabalha a parte interna das costas	Costas	\N	\N
58	Remada Alta	files/exercicios/58/ombros-remada-alta-no-cabo.gif	 Trabalha os músculos das costas e ombros	Costas	\N	\N
71	Elevação Lateral com Halteres	files/exercicios/71/elevacao_lateral.gif	 Trabalha os deltoides laterais	Ombro	\N	\N
74	Encolhimento com Barra	files/exercicios/74/encolhimento.gif	 Desafia os músculos do trapézio	Ombro	\N	\N
63	Puxada Supinada	files/exercicios/63/supinada.gif	 Fortalece a parte externa das costas	Costas	\N	\N
72	Elevação Frontal com Halteres	files/exercicios/72/elevacao_frontal.gif	 Fortalece os deltoides anteriores	Ombro	\N	\N
93	Rosca Unilateral	files/exercicios/93/cable-overhead-curl.gif	\N	Biceps	\N	\N
77	Flexão Plantar Sentado	files/exercicios/77/flexao_plantar_sentado.gif	 Foca nas panturrilhas	Panturrilha	\N	\N
75	Encolhimento com Halteres	files/exercicios/75/encolhimento_alteres.gif	 Fortalece os músculos do trapézio	Ombro	\N	\N
87	Puxada Articulada	files/exercicios/87/pulley-frente-maquina-articulada.gif	\N	Costas	\N	\N
97	Tríceps Testa Barra	files/exercicios/97/rosca-triceps-testa-deitado-no-banco-com-barra-tradicional.gif	\N	Triceps	\N	\N
83	Voador	files/exercicios/83/voador-no-aparelho.gif	\N	Peito	\N	\N
91	Rosca Direta Cross	files/exercicios/91/rosca_cross.gif	\N	Biceps	\N	\N
105	Passada 	files/exercicios/105/passada.gif	\N	Quadriceps	\N	\N
95	Tríceps Banco	files/exercicios/95/triceps-mergulho-apoiado-em-dois-bancos.gif	\N	Triceps	\N	\N
99	Tríceps Francês Cross	files/exercicios/99/triceps-no-pulley-atras-ca-cabeca.gif	\N	Triceps	\N	\N
103	Desenvolvimento Máquina	files/exercicios/103/desenvolvimento_maq.gif	\N	Ombro	\N	\N
107	Glúteo Coice	files/exercicios/107/coice.gif	\N	Gluteo	\N	\N
109	Abdução c/ Caneleira	files/exercicios/109/abducao-do-quadril-pernas-deitado-no-solo-com-elevacao-da-perna-reta.gif	\N	Gluteo	\N	\N
111	Abdominal Reto	files/exercicios/111/abdominal.gif	\N	abdomem	\N	\N
113	Abdominal Obliquo	files/exercicios/113/abdominal-alternado-no-chao.gif	\N	abdomem	\N	\N
115	Bicicleta	files/exercicios/115/bike.gif	\N	Quadriceps	\N	\N
117	Subida Banco	files/exercicios/117/stepup-alto-no-banco-com-halteres.gif	\N	Quadriceps	\N	\N
119	REMADA SERROTE	files/exercicios/119/cerrote.gif	\N	Costas	\N	\N
125	mergulho	files/exercicios/125/paralelas_peito.gif	\N	Peito	\N	\N
127	rosca inclinada	files/exercicios/127/rosca-biceps-com-halteres-no-banco-inclinado.gif	\N	Biceps	\N	\N
22	Elevação de Ombros	files/exercicios/22/elevacao_lateral.gif	 Fortalece os deltoides	Ombro	\N	\N
\.

COPY pessoas (id, nome, email, email_verified_at, password, remember_token, dt_nascimento, cpf, endereco, telefone, genero, ref_cidade, created_at, updated_at) FROM stdin;
1	Kauan	kauan@gmail.com	\N	698dc19d489c4e4db73e28a713eab07b	\N	2004-01-01	12345678901	Rua 1	51999999999	M	1	\N	\N
\.

COPY treino_pessoa (id, ref_pessoa, ref_treino, dt_inicial, dt_final, created_at, updated_at) FROM stdin;
1	1	1	2024-10-13	2024-11-13	\N	\N
\.


COPY treinos (id, descricao, created_at, updated_at) FROM stdin;
1	Treino Generico	\N	\N
\.

ALTER TABLE ONLY aula_plano
    ADD CONSTRAINT aula_plano_pkey PRIMARY KEY (id);


ALTER TABLE ONLY aulas
    ADD CONSTRAINT aulas_pkey PRIMARY KEY (id);


ALTER TABLE ONLY cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id);


ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_pkey PRIMARY KEY (id);


ALTER TABLE ONLY estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


ALTER TABLE ONLY exercicio_treino
    ADD CONSTRAINT exercicio_treino_pkey PRIMARY KEY (id);


ALTER TABLE ONLY exercicios
    ADD CONSTRAINT exercicios_pkey PRIMARY KEY (id);

ALTER TABLE ONLY formas_pagamento
    ADD CONSTRAINT formas_pagamento_pkey PRIMARY KEY (id);


ALTER TABLE ONLY historicos
    ADD CONSTRAINT historicos_pkey PRIMARY KEY (id);

ALTER TABLE ONLY lancamentos
    ADD CONSTRAINT lancamentos_pkey PRIMARY KEY (id);

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (id);


ALTER TABLE ONLY motivos_cancelamento
    ADD CONSTRAINT motivos_cancelamento_pkey PRIMARY KEY (id);


ALTER TABLE ONLY ocorrencias_aula
    ADD CONSTRAINT ocorrencias_aula_pkey PRIMARY KEY (id);

ALTER TABLE ONLY perfil_modulo
    ADD CONSTRAINT perfil_modulo_pkey PRIMARY KEY (id);


ALTER TABLE ONLY perfis
    ADD CONSTRAINT perfis_pkey PRIMARY KEY (id);


ALTER TABLE ONLY pessoa_modulo
    ADD CONSTRAINT pessoa_modulo_pkey PRIMARY KEY (id);


ALTER TABLE ONLY pessoa_perfil
    ADD CONSTRAINT pessoa_perfil_pkey PRIMARY KEY (id);


ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_email_unique UNIQUE (email);


ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (id);


ALTER TABLE ONLY planos
    ADD CONSTRAINT planos_pkey PRIMARY KEY (id);


ALTER TABLE ONLY registro_presencas
    ADD CONSTRAINT registro_presencas_pkey PRIMARY KEY (id);


ALTER TABLE ONLY titulos
    ADD CONSTRAINT titulos_pkey PRIMARY KEY (id);


ALTER TABLE ONLY treino_pessoa
    ADD CONSTRAINT treino_pessoa_pkey PRIMARY KEY (id);


ALTER TABLE ONLY treinos
    ADD CONSTRAINT treinos_pkey PRIMARY KEY (id);


ALTER TABLE ONLY turmas
    ADD CONSTRAINT turmas_pkey PRIMARY KEY (id);


CREATE INDEX aula_plano_ref_aula_index ON aula_plano USING btree (ref_aula);


CREATE INDEX aula_plano_ref_plano_index ON aula_plano USING btree (ref_plano);


CREATE INDEX cidades_ref_estado_index ON cidades USING btree (ref_estado);


CREATE INDEX contratos_ref_forma_pagamento_index ON contratos USING btree (ref_forma_pagamento);


CREATE INDEX contratos_ref_motivo_cancelamento_index ON contratos USING btree (ref_motivo_cancelamento);


CREATE INDEX contratos_ref_pessoa_index ON contratos USING btree (ref_pessoa);


CREATE INDEX contratos_ref_pessoa_indicacao_index ON contratos USING btree (ref_pessoa_indicacao);


CREATE INDEX contratos_ref_plano_index ON contratos USING btree (ref_plano);


CREATE INDEX exercicio_treino_ref_exercicio_index ON exercicio_treino USING btree (ref_exercicio);


CREATE INDEX exercicio_treino_ref_treino_index ON exercicio_treino USING btree (ref_treino);


CREATE INDEX idx_perfil_modulo_modulo ON perfil_modulo USING btree (ref_modulo);


CREATE INDEX idx_perfil_modulo_perfil ON perfil_modulo USING btree (ref_perfil);


CREATE INDEX idx_pessoa_modulo_modulo ON pessoa_modulo USING btree (ref_modulo);


CREATE INDEX idx_pessoa_modulo_pessoa ON pessoa_modulo USING btree (ref_pessoa);


CREATE INDEX idx_pessoa_perfil_perfil ON pessoa_perfil USING btree (ref_perfil);


CREATE INDEX idx_pessoa_perfil_pessoa ON pessoa_perfil USING btree (ref_pessoa);


CREATE INDEX lancamentos_ref_historico_index ON lancamentos USING btree (ref_historico);


CREATE INDEX lancamentos_ref_titulo_index ON lancamentos USING btree (ref_titulo);


CREATE INDEX ocorrencias_aula_ref_aula_index ON ocorrencias_aula USING btree (ref_aula);


CREATE INDEX planos_ref_historico_index ON planos USING btree (ref_historico);


CREATE INDEX registro_presencas_ref_pessoa_index ON registro_presencas USING btree (ref_pessoa);


CREATE INDEX titulos_ref_contrato_index ON titulos USING btree (ref_contrato);


CREATE INDEX treino_pessoa_ref_pessoa_index ON treino_pessoa USING btree (ref_pessoa);


CREATE INDEX treino_pessoa_ref_treino_index ON treino_pessoa USING btree (ref_treino);


CREATE INDEX turmas_ref_ocorrencia_aula_index ON turmas USING btree (ref_ocorrencia_aula);


CREATE INDEX turmas_ref_pessoa_index ON turmas USING btree (ref_pessoa);


ALTER TABLE ONLY aula_plano
    ADD CONSTRAINT aula_plano_ref_aula_foreign FOREIGN KEY (ref_aula) REFERENCES aulas(id) ON DELETE CASCADE;


ALTER TABLE ONLY aula_plano
    ADD CONSTRAINT aula_plano_ref_plano_foreign FOREIGN KEY (ref_plano) REFERENCES planos(id) ON DELETE CASCADE;


ALTER TABLE ONLY cidades
    ADD CONSTRAINT cidades_ref_estado_foreign FOREIGN KEY (ref_estado) REFERENCES estados(id);


ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_ref_forma_pagamento_foreign FOREIGN KEY (ref_forma_pagamento) REFERENCES formas_pagamento(id);


ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_ref_motivo_cancelamento_foreign FOREIGN KEY (ref_motivo_cancelamento) REFERENCES motivos_cancelamento(id);


ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_ref_pessoa_foreign FOREIGN KEY (ref_pessoa) REFERENCES pessoas(id);


ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_ref_pessoa_indicacao_foreign FOREIGN KEY (ref_pessoa_indicacao) REFERENCES pessoas(id);


ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_ref_plano_foreign FOREIGN KEY (ref_plano) REFERENCES planos(id);


ALTER TABLE ONLY exercicio_treino
    ADD CONSTRAINT exercicio_treino_ref_exercicio_foreign FOREIGN KEY (ref_exercicio) REFERENCES exercicios(id) ON DELETE CASCADE;


ALTER TABLE ONLY exercicio_treino
    ADD CONSTRAINT exercicio_treino_ref_treino_foreign FOREIGN KEY (ref_treino) REFERENCES treinos(id) ON DELETE CASCADE;


ALTER TABLE ONLY lancamentos
    ADD CONSTRAINT lancamentos_ref_historico_foreign FOREIGN KEY (ref_historico) REFERENCES historicos(id);


ALTER TABLE ONLY lancamentos
    ADD CONSTRAINT lancamentos_ref_titulo_foreign FOREIGN KEY (ref_titulo) REFERENCES titulos(id);


ALTER TABLE ONLY ocorrencias_aula
    ADD CONSTRAINT ocorrencias_aula_ref_aula_foreign FOREIGN KEY (ref_aula) REFERENCES aulas(id);


ALTER TABLE ONLY perfil_modulo
    ADD CONSTRAINT perfil_modulo_ref_modulo_foreign FOREIGN KEY (ref_modulo) REFERENCES modulos(id) ON DELETE CASCADE;


ALTER TABLE ONLY perfil_modulo
    ADD CONSTRAINT perfil_modulo_ref_perfil_foreign FOREIGN KEY (ref_perfil) REFERENCES perfis(id) ON DELETE CASCADE;


ALTER TABLE ONLY pessoa_modulo
    ADD CONSTRAINT pessoa_modulo_ref_modulo_foreign FOREIGN KEY (ref_modulo) REFERENCES modulos(id) ON DELETE CASCADE;


ALTER TABLE ONLY pessoa_modulo
    ADD CONSTRAINT pessoa_modulo_ref_pessoa_foreign FOREIGN KEY (ref_pessoa) REFERENCES pessoas(id) ON DELETE CASCADE;


ALTER TABLE ONLY pessoa_perfil
    ADD CONSTRAINT pessoa_perfil_ref_perfil_foreign FOREIGN KEY (ref_perfil) REFERENCES perfis(id) ON DELETE CASCADE;


ALTER TABLE ONLY pessoa_perfil
    ADD CONSTRAINT pessoa_perfil_ref_pessoa_foreign FOREIGN KEY (ref_pessoa) REFERENCES pessoas(id) ON DELETE CASCADE;


ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_ref_cidade_foreign FOREIGN KEY (ref_cidade) REFERENCES cidades(id) ON DELETE CASCADE;


ALTER TABLE ONLY planos
    ADD CONSTRAINT planos_ref_historico_foreign FOREIGN KEY (ref_historico) REFERENCES historicos(id) ON DELETE CASCADE;


ALTER TABLE ONLY registro_presencas
    ADD CONSTRAINT registro_presencas_ref_pessoa_foreign FOREIGN KEY (ref_pessoa) REFERENCES pessoas(id);


ALTER TABLE ONLY titulos
    ADD CONSTRAINT titulos_ref_contrato_foreign FOREIGN KEY (ref_contrato) REFERENCES contratos(id) ON DELETE CASCADE;


ALTER TABLE ONLY treino_pessoa
    ADD CONSTRAINT treino_pessoa_ref_pessoa_foreign FOREIGN KEY (ref_pessoa) REFERENCES pessoas(id);


ALTER TABLE ONLY treino_pessoa
    ADD CONSTRAINT treino_pessoa_ref_treino_foreign FOREIGN KEY (ref_treino) REFERENCES treinos(id);


ALTER TABLE ONLY turmas
    ADD CONSTRAINT turmas_ref_ocorrencia_aula_foreign FOREIGN KEY (ref_ocorrencia_aula) REFERENCES ocorrencias_aula(id);


ALTER TABLE ONLY turmas
    ADD CONSTRAINT turmas_ref_pessoa_foreign FOREIGN KEY (ref_pessoa) REFERENCES pessoas(id);
