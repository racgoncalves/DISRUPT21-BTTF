import nltk
from copy import deepcopy
import acervoFrases
import sys

baseTreinamento = acervoFrases.getBase()

def aplicarStemmer(texto):
    stemmer = nltk.stem.RSLPStemmer()
    frasesStemming = []
    for (palavras, emocao) in texto:
        comStemming = [str(stemmer.stem(p)) for p in palavras.split() if p not in stopwordsNLTK]
        frasesStemming.append((comStemming, emocao))
    return frasesStemming

def buscaPalavras(frases):
    todasPalavras = []
    for (palavras, emocao) in frases:
        todasPalavras.extend(palavras)
    return todasPalavras

def buscaFrequencia(palavras):
    palavras = nltk.FreqDist(palavras)
    return palavras

def buscaPalavrasUnicas(frequencia):
    freq = frequencia.keys()
    return freq

def extratorPalavras(documento):
    doc = set(documento)
    caracteristicas = {}
    for palavras in palavrasUnicasTreinamento:
        caracteristicas['%s' % palavras] = (palavras in doc)
    return caracteristicas

stopwordsNLTK = nltk.corpus.stopwords.words('portuguese')
frasesStemmingTreinamento = aplicarStemmer(baseTreinamento)
palavrasTreinamento = buscaPalavras(frasesStemmingTreinamento)
frequenciaTreinamento = buscaFrequencia(palavrasTreinamento)
palavrasUnicasTreinamento = buscaPalavrasUnicas(frequenciaTreinamento)
baseCompletaTreinamento = nltk.classify.apply_features(extratorPalavras, frasesStemmingTreinamento)

# Constrói a tabela de probabilidade
classificador = nltk.NaiveBayesClassifier.train(baseCompletaTreinamento)

# Testes (não precisa remover stopwords)
teste = [sys.argv[1]]
testeStemming = []
conjuntoTesteStemming = []
conjuntoNovoRegistro = []
conjuntoDistribuicao = []
stemmer = nltk.stem.RSLPStemmer()
for (frases) in teste:
    for (palavrasTreinamento) in frases.split():
        comStem = [p for p in palavrasTreinamento.split()]
        testeStemming.append(str(stemmer.stem(comStem[0])))
    # copia = deepcopy(testeStemming)
    conjuntoTesteStemming.append(deepcopy(testeStemming))
    testeStemming.clear()

for (registro) in conjuntoTesteStemming:
    novoRegistro = extratorPalavras(registro)
    distribuicao = classificador.prob_classify(novoRegistro)
    conjuntoNovoRegistro.append(novoRegistro)
    conjuntoDistribuicao.append(distribuicao)

# Imprime o resultado
for (registro) in conjuntoNovoRegistro:
    classificacao = classificador.classify(registro)
    # print("Classe:", classificacao)
    print(classificacao)

# Imprime a probabilidade do resultado
# for distribuicao in conjuntoDistribuicao:
#     for classe in distribuicao.samples():
#         print("%s: %f" % (classe, distribuicao.prob(classe)))
