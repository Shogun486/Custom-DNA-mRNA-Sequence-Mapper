# What is Minimap2?
This open-source program maps DNA/mRNA sequences against a reference database (usually large). It's a general-purpose alignment program that is used in the field of bioinformatics and it's runtime is heavily machine-dependent.
# Custom DNA/mRNA Sequence Mapper
This script allows biologists to run open-source sequence alignment program Minimap2 via the command-line. The user must only pass in reference files and the amount of CPU threads they wish to use for the program to work. Mapping FASTQ data against FASTA is a computationally heavy process, thus leveraging programs such as Minimap2 in optimal ways (taking advantage of machine resources, i.e. cores) is essential for faster runtime. The Perl script has been detailed with comments to help the user run it properly.
