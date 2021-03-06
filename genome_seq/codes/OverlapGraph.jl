function Preffix(kmer)
    return kmer[1:length(kmer)-1]
end
function Suffix(kmer)
    return kmer[2:length(kmer)]
end
function OverlapGraph(kmers)
    graph=[]
    for elem in kmers
        relation=[elem]
        node_to=[]
        for elem2 in kmers
            if elem!=elem2 && Suffix(elem)==Preffix(elem2)
                push!(node_to,elem2)
            end
        end
        conections=join(node_to,",")
        push!(relation,conections)
        if length(node_to)!=0
            push!(graph,join(relation," -> "))
        end
    end
    return join(graph,"\n")
end
#=
patterns=["ATGCG",
"GCATG",
"CATGC",
"AGGCA",
"GGCAT",
"GGCAC"]
println(OverlapGraph(patterns))
=#
repo=pwd()
graph=open(repo*"/genome_seq/inputs/overlap.txt","r") do reader
    kmers=readlines(reader)
    OverlapGraph(kmers)
end

open(repo*"/genome_seq/outputs/overlap_solve.txt","w") do writter
    write(writter,graph)
end