## Pragmas & Modules
use strict;
use warnings;
use Getopt::Long qw(GetOptions);

## README print message if @ARGV empty
my $usage =<< "OPTIONS";
NAME        $0
SYNOPSIS    This script leverages Minimap2 to map illumina data (in FASTQ format) against 
            reference genome files (in FASTA format). Users of this program can pass their 
            own reference files and also set the number of CPU threads to use for the task.
EXAMPLE     $0 -t 3 -f *.fasta -r1 mixed.150.R1.fastq.gz -r2 mixed.150.R2.fastq.gz
OPTIONS:
            -t    Number of CPU threads
            -f    FASTA file(s) to map against
            -r1   First FASTQ dataset file
	    -r2   Second FASTQ dataet file
OPTIONS

## HOWTO message if @ARGV is empty
die "\n$usage\n" if (scalar(@ARGV) == 0);

## Parse @ARGV using GetOptions();
my $R1;    # One Illumina FASTQ file goes here
my $R2;    # And the other FASTQ file goes here
my @fasta; # All FASTA files go in this array
my $cores; # Core amount
GetOptions(
    'r1=s' => \$R1,
    'r2=s' => \$R2,
    'f=s@{1,}' => \@fasta,
    't=i' => \$cores
);


## Iterating through all FASTA files one-by-one
my $file;
my $file_prefix = 1;
while (my $fasta = shift @fasta)
{
    $file = "output$file_prefix.sam";
    `minimap2 -ax sr -t $cores $fasta $R1 $R2 -o $file`; # Runs MiniMap2
    $file_prefix++;
}


