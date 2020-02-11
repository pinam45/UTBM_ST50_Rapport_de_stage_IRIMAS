# Default file
@default_files = ("main");

# Generate PDF
$pdf_mode = 4; # lualatex
$print_type = 'pdf';
$postscript_mode = 0;
$dvi_mode = 0;

# Bibliography
$bibtex_use = 2;
$clean_ext .= ' %R.run.xml'; # biber
$clean_ext .= ' %R-blx.bib'; # biblatex

# Glossary
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');
sub makeglossaries {
    if ($silent) {
        if ($^O =~ /MSWin32/) {
           system "makeglossaries", "-q", $_[0];
        } else {
           system("makeglossaries -q \"$_[0]\"");
        }
    } else{
    	if ($^O =~ /MSWin32/) {
    	   system "makeglossaries", $_[0];
    	} else {
    	   system("makeglossaries \"$_[0]\"");
    	}
    }
}
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy';

# Add --shell-escape
# for latex, pdflatex, lualatex, xelatex
#set_tex_cmds('--shell-escape %O %S');

# Output directories
# $aux_dir must be equal to $out_dir for TeXLive
#$tmpdir  = 'out';
#$aux_dir = 'out';
#$out_dir = 'out';
