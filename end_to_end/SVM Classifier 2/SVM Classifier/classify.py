from sklearn import svm
import pickle
import numpy as np
from sklearn.model_selection import train_test_split
from nltk.classify.scikitlearn import SklearnClassifier
from sklearn.metrics import precision_recall_fscore_support
from sklearn.svm import SVC,LinearSVC,NuSVC
from nltk.classify import ClassifierI

def splitdata(path):
    f = open(path,"r+")
    featuresets=[]
    X =[]
    Y = []
    for line in f:
    	vect = []
        if (line.strip() == ","):
            continue
        else:
            s=line.strip().split(",")
            
            y1 = s[-1].strip()
            
            Y.append(int(y1))
            
            for i in range(0,23):
                vect.append(float(s[i].strip()))
            X.append(vect)
    
    print "Splitting data random"
    X = np.asarray(X)
    y = np.asarray(Y)
    return X,y

splitdata(path)

with open("svc.pickle") as f4:
	clf = pickle.load(f4)

y_pred = clf.predict(X)
print clf.score(X,y)
f3 = open("single_prediction.txt","w+")
for i in range(0,y.shape[0]):
	y1 = X[i].tolist()
	#print y1
	y1 = ','.join(str(v) for v in y1)

	f3.write(y1)
	f3.write(",")
	
	y2 = y_pred[i].tolist()
	#y2 = ''.join(str(v) for v in y2)
	f3.write(str(y2))
	f3.write("\n")
	

result1 = precision_recall_fscore_support(y, y_pred, average='binary')
print result1
result2 = precision_recall_fscore_support(y, y_pred, average='micro')
print result2
result3 = precision_recall_fscore_support(y, y_pred, average='weighted')
print result3


y_pred = clf.predict([[2.0,0.0,7.0,1.0,1.0,6.0,7.0,1.0,2.0,82.0,0.0,82.0,0.0,84.0,4.0,84.0,5.0,2.0,0.0,1.0,0.333333333333,-0.405465108108,0.666666666667]])
print y_pred