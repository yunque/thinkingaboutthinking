''' Command Line Arguments '''
import argparse

parser = argparse.ArgumentParser(description='CLI')
parser.add_argument('--input', '-i', type=str, required=True)
args = parser.parse_args()
print("Input:", args.input)


''' Read a gzipped csv file '''
import gzip
import csv

with gzip.open('file.csv.gz', 'rb') as fp:
  reader = csv.reader(fp)
  for row in reader:
    print(row)


''' Vector multiplication (dot product) '''
import numpy as np

w = np.array([2,2,2,2])
x = np.array([1,2,3,4])
y = np.dot(w,x)


''' Generator MxN random numbers '''
import numpy as np

np.random.random((M,N))


''' Time a function '''
import time

tic = time.time()
# A function!
toc = time.time()
print(toc - tic)


''' Remove list from list '''
new_list = [i for i in old_list if i not in list_of_items_to_remove]


''' Read csv header only '''
import csv

with open(fpath, 'r') as fp:
    reader = csv.DictReader(fp)
    fieldnames = reader.fieldnames


''' Unpack a dictionary '''
# 2.x
d = {}
for k,v in d.iteritems():
	print(k,v)
# 3.x
d = {}
for k,v in d.items():
    print(k,v)


''' List files in directory '''
import os
print os.listdir(<directory_path>)


''' Initialize empty dictionary '''
keys = ['k1', 'k2', 'k3']
d = dict.fromkeys(keys)
# Initialize values to empty lists
d = dict.fromkeys(keys, [])


''' Extract column values/index from a DataFrame '''
df["col"].values
df["col"].index


''' Concatenate two DataFrames/Series along the same index '''
df_both = pd.concat([df_one, df_two], axis=1)


''' Sum all values in a df column that have value x '''
sum_cols_equal_to_x = df[df['col'] == x].sum()['col']


''' Slice a df with a Series to extract a the rows which match a list of values '''
series = pd.Series([list, of, items, to, view]
df[df['col'].isin(series)]


''' Unique elements'''
# array
np.unique(array)
# list
set(lst)
# DataFrame column
df['col'].unique()
# DataFrame (distinct rows)
df.drop_duplicates()
# DataFrames (distinct entries in a specific column)
df.drop_duplicates(subset='col', keep='first')


# List conda environments
conda info --envs

# Rotate axis labels
plt.xticks(rotation=45)
# Align rotated labels relative to ticks, cf. https://stackoverflow.com/a/14854007/5098023
plt.xticks(rotation=45, ha='right')
# Set axis limits
ax = plt.gca()
ax.set_xlim([0,1])

# Define colormap with range of colors
cmap_range = N
x = np.linspace(0.0, 1.0, cmap_range)
cmap = plt.get_cmap('viridis')(x)

