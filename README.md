# CS224W: Machine Learning with Graphs

This repository contains my study materials and coursework for Stanford CS224W, including graph machine learning notebooks, LaTeX homework solutions, lecture slides, and reference material.

## Repository structure

```text
.
├── colabs/       # CS224W programming exercises (Colab 0–5)
├── homework/     # Homework prompts, LaTeX sources, and compiled submissions
├── slides/       # Lecture slides and exam preparation material
└── GRL_Book.pdf  # Graph Representation Learning reference book
```

The notebooks cover:

- NetworkX and PyTorch Geometric basics
- Graph statistics, centrality, and graph-to-tensor conversion
- PyG and Open Graph Benchmark datasets
- GraphSAGE and graph attention networks
- Message passing and heterogeneous graphs with DeepSNAP

## Environment

The notebook dependencies are pinned in [`colabs/requirements-cs224w.txt`](colabs/requirements-cs224w.txt). They target the original course environment:

- Python 3.8
- PyTorch 2.0.1 with CUDA 11.7
- PyTorch Geometric 2.3.1
- OGB 1.3.6
- DeepSNAP

Create a compatible environment and install the dependencies:

```bash
python3.8 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install torch==2.0.1 --index-url https://download.pytorch.org/whl/cu117
pip install -r colabs/requirements-cs224w.txt
```

The notebooks can also be opened directly in Google Colab. Dataset caches are intentionally excluded from Git because some processed files exceed GitHub's file-size limit; PyG and OGB will download or regenerate them when needed.

## Building homework PDFs

Homework 1 and 2 use a shared `main.tex` entry point in their respective directories:

```bash
cd homework/hw1
latexmk -pdf main.tex
```

Replace `hw1` with `hw2` for the second assignment. Homework 3 currently uses `homework/hw3_main.tex`.

## Notes

This is a personal learning archive. Course materials remain the property of their respective authors and are included here for educational use.
