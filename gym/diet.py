import csv
i=0

f1=['Female','Male']
f2=['A','B','C']

x=[]
y=[]
i=0

with open('diet.csv','r',encoding='utf-8')as file:
    filecontent=csv.reader(file)

    for row in filecontent:
        try:
            i=i+1
            if i!=1:
                datarow=[]
                datarow.append(f1.index(row[1]))
                datarow.append(int(row[2]))
                datarow.append(float(row[3]))
                datarow.append(float(row[5]))
                datarow.append(float(row[6]))

                x.append(datarow)
                y.append(f2.index(row[4]))
        except:
           pass
# from sklearn.tree import DecisionTreeClassifier
print(x,y)
from sklearn.model_selection import train_test_split
import pickle
# from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier
X_train, X_test, t_train, t_test = train_test_split(
	x, y, test_size=0.3, shuffle=True, random_state=1)

# model = DecisionTreeClassifier(criterion = "gini",
#             random_state = 100,max_depth=10, min_samples_leaf=10)
# model = model.fit(X_train, t_train)

# model = SVC(C= .1, kernel='linear', gamma= 1)
# model.fit(X_train, t_train)
model= RandomForestClassifier(n_estimators = 1000)
model.fit(X_train, t_train)
#
filename = 'linear_model_diet.sav'
# pickle.dump(model, open(filename, 'wb'))

# load the model
model = pickle.load(open(filename, 'rb'))

# from sklearn.neighbors import KNeighborsClassifier
#
# model = KNeighborsClassifier(n_neighbors=3)
#
# model.fit(X_train, t_train)

predicted_value = model.predict(X_test)
print(predicted_value)

match = 0
UnMatch = 0

for i in range(len(predicted_value)):
	if predicted_value[i] == t_test[i]:
		match += 1
	else:
		UnMatch += 1

accuracy = match/len(predicted_value)
print("Accuracy is: ", accuracy)
