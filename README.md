# Custom DNA/mRNA Sequence Mapper
The `run_minimap.pl` Perl script allows biologists to map illumina data (in `FASTQ` format) against reference genome files (in `FASTA` format) via the command-line.

The script leverages open-source sequence alignment program [Minimap2] and automates several `FASTA` file mappings that would otherwise have to be executed manually and iteratively.

Once the script finishes, the user can find each mapping outputted in a `SAM` (Sequence Alignment Map) file.

The runtime of `Minimap2` is heavily machine-dependent, so although automating the task does help, it is independently insufficient for improving runtime. Therefore, the script also prompts the user to enter in the amount of cores for `Minimap2` to leverage.

[Minimap2]: https://github.com/lh3/minimap2
