function Composition(k, dna_string)
    comp=[]
    for i in 1:length(dna_string)-k+1
        kmer=dna_string[i:i+k-1]
        push!(comp,kmer)
    end
    return comp
end


repo=pwd()
comp_in = open(repo*"/genome_seq/inputs/composition.txt","r") do reader
    readlines(reader)
    
end

open(repo*"/genome_seq/outputs/composition_solve.txt","w") do writer
    str_out=join(Composition(parse(Int64,comp_in[1]),comp_in[2]),"\n")
    write(writer,str_out)
end