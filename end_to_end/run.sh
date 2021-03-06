#!/bin/bash

cd "/home/raj/end_to_end/ClampCmd_1.4.0"

####Runs CLAMP NER Pipeline
./run_ner_pipeline.sh "/home/raj/end_to_end/input" "/home/raj/end_to_end/clamp_out"

cd "/home/raj/end_to_end/input"

#Generates person and pronoun concepts
python rule_based.py "/home/raj/end_to_end/input" "/home/raj/end_to_end/clamp_out"  "/home/raj/Downloads/python-sutime-master/jars"

cd "/home/raj/end_to_end"


cur_dir=$(pwd)
# Input is the directory of the concepts file
# Output is the input to be fed to the neural network

#Writes line numbers to get data in i2b2 format
python ${cur_dir%/}/gen_line_num1.py "${cur_dir%/}/input" "${cur_dir%/}/clamp_out" #Input.txt file path 

python ${cur_dir%/}/gen_line_num2.py "${cur_dir%/}/input/concepts" "${cur_dir%/}/input/final_concepts"

#Genarates mention Pairs
python Generate_Mention_Pairs.py


#Generates features
python glove_single.py  "/home/raj/end_to_end/output/mention_pairs" "/home/raj/end_to_end/feature_output"

cd "/home/raj/end_to_end/SVM Classifier 2/SVM Classifier/classify_single"

#python classify.py "/home/raj/end_to_end/feature_output/featuremention_pairs_clinical-1.txt"

#SVM classifier prediction
python classify.py "/home/raj/end_to_end/feature_output/featuremention_pairs_$1"


#Writing output and eliminating duplicates
python classify_out.py

python unique.py

sudo cp "/home/raj/end_to_end/SVM Classifier 2/SVM Classifier/classify_single/output2.txt" "/home/raj/end_to_end/output/coreferent_pairs/"

cd "/home/raj/end_to_end/output/coreferent_pairs/"

sudo chmod 777 "output2.txt"

cd "/home/raj/end_to_end/output/mention_pairs"

#Generating chains

python extra.py "/home/raj/end_to_end/output/mention_pairs/mention_pairs_$1"

cd "/home/raj/end_to_end/"

python Generate_Chains.py


