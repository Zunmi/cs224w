def lines:
  split("\n")
  | if .[-1] == "" then .[0:-1] else . end
  | map(. + "\n")
  | if length > 0 then .[-1] |= rtrimstr("\n") else . end;

def setup_check:
  [
    "# Dependencies are preinstalled in the CS224W (cs224n-a3) kernel.\n",
    "import torch\n",
    "import torch_geometric\n",
    "import torch_scatter\n",
    "import torch_sparse\n",
    "\n",
    "print(f\"PyTorch {torch.__version__} (CUDA {torch.version.cuda})\")\n",
    "print(f\"PyG {torch_geometric.__version__}, \"\n",
    "      f\"torch-scatter {torch_scatter.__version__}, \"\n",
    "      f\"torch-sparse {torch_sparse.__version__}\")"
  ];

.metadata.kernelspec = {
  "display_name": "CS224W (cs224n-a3)",
  "language": "python",
  "name": "cs224w"
}
| if $notebook == "colab-0.ipynb" then
    .cells[24].source = setup_check
  elif $notebook == "colab-2.ipynb" then
    .cells[6].source = setup_check
  elif ($notebook == "colab-3.ipynb" or $notebook == "colab-4.ipynb") then
    .cells[4].source = setup_check
  elif $notebook == "colab-5.ipynb" then
    .cells[4].source = (
      setup_check
      + [
          "\n",
          "import deepsnap\n",
          "print(f\"DeepSNAP {deepsnap.__version__}\")"
        ]
    )
    | .cells[33].source = (
        "# Use the bundled ACM data locally; Google Colab authentication is not required.\n"
        + "from pathlib import Path\n"
        + "\n"
        + "acm_candidates = [Path(\"acm.pkl\"), Path(\"cs224w/colabs/acm.pkl\")]\n"
        + "acm_path = next((path for path in acm_candidates if path.is_file()), None)\n"
        + "if acm_path is None:\n"
        + "  raise FileNotFoundError(\"acm.pkl was not found in the notebook or workspace directory\")\n"
        + "print(f\"Using ACM data from {acm_path.resolve()}\")"
      | lines
    )
    | .cells[34].source = [
        "# The ACM data is already available at acm_path."
      ]
    | .cells[47].source |= map(
        if contains("data = torch.load(\"acm.pkl\")")
        then sub("data = torch.load\\(\"acm.pkl\"\\)"; "data = torch.load(acm_path, map_location=\"cpu\")")
        else .
        end
      )
  else
    .
  end
