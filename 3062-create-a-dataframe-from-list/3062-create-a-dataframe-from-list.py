import pandas as pd

def createDataframe(list):
    id = [i[0] for i in list]
    age = [i[1] for i in list]
    output = pd.DataFrame({
        'student_id': id,
        'age' : age
    })
    return output