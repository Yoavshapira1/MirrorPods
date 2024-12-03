import pandas as pd
import sys
import os
from openpyxl import load_workbook


# Locate this file in the root directory where all .csv files are

if __name__ == "__main__":

    # define the root directory to start the traversal from
    root_dir = r'C:\Users\yoavsha\Desktop\LSL\Tapper\Circles_Eights_Lines'

    # define the file extension to filter files
    file_ext = '.csv'

    num_csv_files = 0
    # count files to edit
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.csv'):
                num_csv_files += 1

    i = 0
    # traverse the root directory and its children directories
    for subdir, dirs, files in os.walk(root_dir):
        for file in files:
            i += 1
            # check if the file has the desired file extension
            if file.endswith(file_ext):
                # create the input and output file paths
                input_file = os.path.join(subdir, file)
                output_file = os.path.join(subdir, os.path.splitext(file)[0] + '.xlsx').replace('~', '')

                # read the input CSV file into a pandas dataframe
                df = pd.read_csv(input_file)

                # write the dataframe to an Excel file
                df.to_excel(output_file, index=False)

                os.remove(input_file)


