function StringSpelledByGenomePath(kmers)
    genome=""
    genome=genome*kmers[1]
    for kmer in kmers[2:length(kmers)]
        genome=genome*kmer[length(kmer)]
    end 
    return genome
end
#=
kmers=["ACCGA","CCGAA","CGAAG","GAAGC","AAGCT"]
println(StringSpelledByGenomePath(kmers))
=#
repo=pwd()
kmers=open(repo*"/genome_seq/inputs/pathgenome.txt","r") do reader
    readlines(reader)
end
open(repo*"/genome_seq/outputs/pathgenome_solve.txt","w") do writter
    write(writter,StringSpelledByGenomePath(kmers))
end