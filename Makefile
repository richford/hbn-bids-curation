.PHONY: help
.DEFAULT_GOAL := help

current_dir = $(shell pwd)

build: ## Build a docker image with all of the required software.
	docker build -t hbn-bids-curation ./docker/lab
	docker build -t hbn-bids-curation-nbconvert ./docker/execute

lab: ## Run JupyterLab from the docker image. Follow instructions in stdout to access the JupyterLab URL.
	docker run -it --rm -p 8899:8899 -v $(current_dir):/hbn-bids-curation hbn-bids-curation

shell: ## Obtain an interactive shell in the hbn-bids-curation docker image.
	docker run -it --rm -v $(current_dir):/hbn-bids-curation hbn-bids-curation /bin/bash -c "conda activate hbn-bids-curation;"

run: ## Execute the entire jupyter notebook, producing output files, without opening jupyter lab
	docker run -it --rm -v $(current_dir):/hbn-bids-curation hbn-bids-curation-nbconvert

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
