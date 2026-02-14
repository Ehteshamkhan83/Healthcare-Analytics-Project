import pandas as pd
import numpy as np

df = pd.read_csv("data/raw_hospital_data.csv")

# print("Dataset loaded successfully")
# print("Shape of data:", df.shape)

# print("Column names:")
# print(df.columns)
#
# df.columns = df.columns.str.lower().str.strip().str.replace(" ", "_")
#
# print("Cleaned column names:")
# print(df.columns)
#
# print(df.info())
#
# print("Missing values in each column:")
# print(df.isnull().sum())


#
# print("Readmission value counts:")
# print(df['readmitted'].value_counts())
#
# df['readmitted_flag'] = df['readmitted'].apply(
#     lambda x: 1 if x == '<30' else 0
# )
#
# print(df[['readmitted', 'readmitted_flag']].head())
#
# def age_group(age):
#     if age in ['[0-10)', '[10-20)', '[20-30)', '[30-40)']:
#         return 'Young'
#     elif age in ['[40-50)', '[50-60)']:
#         return 'Middle'
#     else:
#         return 'Senior'
#
# df['age_group'] = df['age'].apply(age_group)
#
# print(df['age_group'].value_counts())
#
# df['stay_category'] = pd.cut(
#     df['time_in_hospital'],
#     bins=[0, 3, 7, 30],
#     labels=['Short', 'Medium', 'Long']
# )
#
# print(df['stay_category'].value_counts())

# df.fillna(df.median(numeric_only=True), inplace=True)
# print("Missing values after cleaning:")
# print(df.isnull().sum())
#
# print(df.head())


df.to_csv("data/clean_hospital_data.csv", index=False)
print("Clean hospital data saved successfully")

