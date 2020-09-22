using LinearAlgebra

dist_manhattan(𝐯, 𝐯′) = norm(𝐯 - 𝐯′, 1)
dist_euclidean(𝐯, 𝐯′) = norm(𝐯 - 𝐯′, 2)
dist_supremum(𝐯, 𝐯′)  = norm(𝐯 - 𝐯′, Inf)

function nearest_neighbor(x′, φ, 𝒟, dist)
    𝒟[argmin([dist(φ(x), φ(x′)) for (x,y) in 𝒟])][end]
end