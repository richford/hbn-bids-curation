# Verifying BIDS Curation of the Healthy Brain Network

This repository contains jupyter notebooks that summarize the BIDS
curation of the Healthy Brain Network (HBN) neuroimaging data.

## How do I reproduce this

### Docker-based installation and execution

We provide a Makefile to ease reproducibility. If you want to understand the Makefile options, simply type
```bash
make
```
to see the available options with descriptions.

We recommend that you use the supplied docker image to reproduce the results of this paper.
To build the docker image, type
```bash
make build
```

After that, you can run the jupyter notebooks in the `notebooks` directory by typing
```bash
make lab
```
and then navigating to the URL supplied in the output of that command. When you're done,
type <kbd>Ctrl</kbd>+<kbd>C</kbd> (twice to confirm) to return to your host machine shell.

If you want to obtain an interactive shell in the Docker image, type
```bash
make shell
```
When you're done, type `exit` to return to your host machine shell.

If you want to execute the entire jupyter notebook without opening jupyter lab, type
```bash
make run
```

### Docker-less installation and execution

If you don't want to use Docker, you must have Python and conda
installed. If you don't already have Python installed, we recommend the
free [Anaconda Python](https://www.anaconda.com/download/).

You will then need to install dependencies using
```bash
conda env create
conda activate hbn-bids-curation
```

You can then run the jupyter notebooks using
```bash
jupyter lab
```
