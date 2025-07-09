# klsc-book-build

Scripts and resources to build a PDF version of the book *Komposition og lydproduktion med SuperCollider* by Anders Eskildsen. The scripts read the book contents from an mkdocs source repo and convert them first to LaTeX and then to PDF.

This is a personal project that is not intended for widespread use. The parsing script that wraps the main conversion engine, `md2tex`, has a lot of quirks which are designed to work for this particular book, like turning audio examples from the website into links to the proper section on the website.

## Set up our tools

Here are some notes on setting up a build environment with the necessary tooling to compile the PDF.

### Get submodules

We need to fetch two submodules (after git cloning this repo and cd'ing into the project directory):

- [*md2tex* fork by Anders Eskildsen](https://github.com/aeskildsen/md2tex), which does the heavy lifting when converting form Markdown to LaTeX
- the [repo containing the book contents](https://aeskildsen.gitlab.com/komposition-og-lydproduktion-med-supercollider)

```bash
git submodule init
git submodule update
```

### Python dependencies

The conversion from Markdown to LaTeX requires Python 3 and a few libraries.

```bash title="Install python dependencies"
python -m venv .venv
source .venv/bin/active # choose proper script here depending on your shell
pip install -r requirements.txt
```

### mermaid-cli

To convert [Mermaid diagrams](https://mermaid.js.org/) to `.png` files which can be incorporated into a PDF by LaTeX, the conversion script relies upon [mermaid-cli](https://github.com/mermaid-js/mermaid-cli). Installing mermaid-cli on  headless Linux can be a bit cumbersome, might be documented here in the future.

### TeX Live

To convert the generated `.tex` files to PDF, we use *TeX Live*. For installation instructions, see [the TUG website](https://tug.org/texlive/).
