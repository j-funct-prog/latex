This package provides a LaTeX document class and some documentation for papers published in the Journal of Functional Programming on the Episciences platform.

Apart from this README, the contents of the package are:

  jfp-epi.cls: the LaTeX document class
  ACM-Reference-Format.bst: a copy of the ACM bibliography style
  jfp-cup2epi.sty: a small adapter from the old CUP document class
  jfp-epi-guide.pdf: documentation for the new document class
  jfptemplate.tex: a minimal template for a JFP paper using the new style
  jfptemplate.pdf: a compiled version of the above

To use the document class, install the CLS and STY files where LaTeX can find them (or keep them in the same directory as your paper). 

If you have a recent TeXlive installation, you probably already have the acmart package from ACM, in which case you can discard the BST file. But if not, you should similarly place that where BibTeX can find it.

Read the documentation, jfp-epi-guide.pdf: it's only 3 pages. That's because this class file is a thin skin over ACM's acmart.cls, so almost all of that documentation carries over. This document also includes instructions for how to adapt an existing paper written with acmart.cls or with CUP's old jfp.cls to work with the new document class.

Finally, jfptemplate.tex is a minimal template for starting a JFP paper from scratch, and jfptemplate.pdf is what it should look like when compiled.
