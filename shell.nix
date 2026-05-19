{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "curriculum-latex";

  packages = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-basic

        # Document class
        europecv

        # Packages used in the .tex files
        geometry
        hyperref
        hyphenat
        graphics

        # Engine & tools
        latexmk
        ;
    })
  ];

  shellHook = ''
    echo "LaTeX shell ready."
    echo "Build with:"
    echo "  latexmk -pdf tex/curriculum-it.tex"
    echo "  latexmk -pdf tex/curriculum-en.tex"
  '';
}
