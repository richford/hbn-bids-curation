from continuumio/miniconda3

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install make
RUN conda update -n base -c defaults conda

# Use the environment.yml to create the conda environment.
ADD environment.yml /tmp/environment.yml
WORKDIR /tmp
RUN conda env create

RUN mkdir /hbn-bids-curation
WORKDIR /hbn-bids-curation

# Set the ENTRYPOINT to use bash
RUN [ "/bin/bash", "-c", "echo 'conda activate hbn-bids-curation' >> /root/.bashrc" ]
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "source activate hbn-bids-curation && jupyter nbconvert --to notebook --execute notebooks/verify_hbn_bids_curation.ipynb" ]

