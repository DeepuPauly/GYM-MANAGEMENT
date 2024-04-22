

import pickle
def predict(row):
    filename = r'C:\Users\hp\Downloads\gymmanagement\gymmanagement\gym\linear_model.sav'

    model = pickle.load(open(filename, 'rb'))

    predicted_value = model.predict([row])
    return predicted_value[0]


def predict_diet(row):
    filename = r'C:\Users\hp\Downloads\gymmanagement\gymmanagement\gym\linear_model_diet.sav'

    model = pickle.load(open(filename, 'rb'))

    predicted_value = model.predict([row])
    return predicted_value[0]