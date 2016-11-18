# zoteror
RStudio Plugin to interact with Zotero

## Prerequisites
1. You need Zotero 4 Desktop applicaiton (not Zotero 5, which is not supported at the moment!)
2. You need to install the [Zotero Better Bibtex plugin](https://github.com/retorquere/zotero-better-bibtex)

## Install
1. Install the zoteror package with devtools::install_github("benoitdepaire/zoteror")

## Use
Once you have installed the zoteror package, you will find two new functions in the Addins menu of RStudio:
  1. Add citation
  2. Create Bibtex
  
### Add Citation
This function will call the lookup-box of Zotero, which you can use to select the required citations. It will add the appropriate references in your markdown document. I suggest you create a 'Keyboard Shortcut' for this function as you want to call it frequently and easy while typing your document.

### Create Bibtex
This function will create a bibtex file with the required references, based on the citations in your markdown document. It will create the bibtex file in the same directory as the markdown document. Please note that you still have to manually update the YAML preamble.
