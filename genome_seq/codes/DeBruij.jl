function Composition(k, dna_string)
    comp=[]
    for i in 1:length(dna_string)-k+1
        kmer=dna_string[i:i+k-1]
        push!(comp,kmer)
    end
    return comp
end

function Debruijn(k,dna_string)
    comp_dna=Composition(k-1,dna_string)
    dic_rel=Dict(name=>[] for name in comp_dna)
    i=1
    for key in comp_dna
        if i<length(comp_dna)
            push!(dic_rel[key],comp_dna[i+1])
            i+=1
        end
    end
    graph=[]
    for rel in dic_rel
        key=rel[1]
        #println(key)
        go_node=join(dic_rel[key],",")
        if go_node!=""
        #println(go_node)
            push!(graph,join([key,go_node]," -> "))
        end
    end
    return join(graph,"\n")
end

debru=open(pwd()*"/genome_seq/inputs/debrui.txt","r") do reader
    inputs=readlines(reader)
    k=parse(Int64,inputs[1])
    dna_string=inputs[2]
    Debruijn(k,dna_string)
end
open(pwd()*"/genome_seq/outputs/debrui_solve.txt","w") do writter
    write(writter,debru)
end
    

