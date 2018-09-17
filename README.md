# Coreference-resolution

This project proposes to the extraction of event-based knowledge from the text provided and categorize the type of the event, extract key phrases and their relations from the scientific publications and Clinical documents. The task tackled here is mention-level identification and classification of
key phrases as well as extracting semantic relations between keywords. 

Example; ”This 63-year-old man had `[malignant fibrous histiocytoma of duodenum]`, discovered in 02/95. Other than `[a mass in the duodenum]`, the patient was also diagnosed with anemia. A `[leiomyosarcoma]` was resected after embolization of the splenic artery. However, `[it]` could not be completely excised; moreover `[the tumor]` metastasized to the liver as was discovered on a follow-up scan in 06/95.”

The words in between `[]` refer to the same entity.

Extracting keyphrases and relations between them is of great interest to scientific publishers as it helps to recommend articles to readers, highlight missing citations to authors, identify potential reviewers for submissions, and analyze research trends over time. 


### Getting Started

- go the /end_to_end folder

- Place the input file in the /input folder

### Run the following command on terminal

- ./run.sh <name of the file you want to run from input folder>

- The output will be generated in the /output folder

- You can check output for mention pairs, coreferent pairs, chains

### Evaluation on output

- go the /end_to_end folder

-run the following command on terminal:

- python evaluation.py <path to the chains file generated by system> <path to the gold mentions chain file>


### PreRequisites:

1. CLAMP command line tool
2. Stanford CoreNLP toolkit
3. Stanford ner toolkit

### Python Packages:
1. genderize
2. inflect
