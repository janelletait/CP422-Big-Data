import sys
from datetime import datetime
from pyspark import SparkContext
from pyspark.sql import SparkSession, Row
from pyspark.sql.functions import *
from pyspark.mllib.regression import LinearRegressionWithSGD
from pyspark.ml.linalg import SparseVector
spark = SparkSession.builder.getOrCreate()
import os
from pyspark.mllib.regression import LabeledPoint
from pyspark.mllib.feature import StandardScaler
from numpy import array
from pyspark.mllib.linalg import Vectors
from pyspark.mllib.util import MLUtils




#interchange my AWS S3 url for the file path of your input file when testing
sc = SparkContext(appName = "Asssignment_3")
info = MLUtils.loadLibSVMFile(sc, "s3://janellebucket/input/train_scaled.txt")
#to get a sense of the data
print(info)

MLMOD = LinearRegressionWithSGD.train(info, iterations=100, intercept=True)
print("weights: %s, intercept: %s"%(MLMOD.weights, MLMOD.intercept))

p2 = [[1,0.343158], [2,0.762712], [3,-0.27243], [4,0.678756], [5,-0.0348259], [6,0.163445], [7,-0.00635324], [8,-0.295056], [9,-0.396509], [10,0.142857], [11,-0.256757], [12,-0.118812], [13,0.294964], [14,0.821429]]

p2vec = Vectors.dense(p2)

MLMOD.predict(p2vec)







