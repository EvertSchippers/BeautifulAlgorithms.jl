using Random

@testset "K-means clustering" begin
    Random.seed!(0)
    function test_k_means_clustering()
        𝒟 = [([5.0, 9.0], 6),
             ([5.0, 5.0], 7),
             ([7.0, 5.0], 8),
             ([9.0, 9.0], 10)]
        φ = x->x

        @test sort(k_means_clustering(φ, 𝒟, dist_euclidean, 2)) == [[6, 5], [7, 9]]
        @test round.(sort(k_means_clustering(x->x, [0.0, 2.0, 10.0, 12.0], dist_euclidean, 2))) == [1, 11]
    end

    test_k_means_clustering()
end
