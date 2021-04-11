FROM jupyter/scipy-notebook
WORKDIR ./

# Run relevant pip installs here
RUN pip install swifter
RUN pip install nltk

EXPOSE 8888