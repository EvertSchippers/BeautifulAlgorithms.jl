@testset "Monte Carlo Tree Search" begin
    import Random: seed!
    seed!(0)

    𝒮 = [1:100;]
    𝒜 = [+1, -1]
    T = (s,a,s′)->s + a == s′ ? 0.7 : 0
    R = (s,a)->s == 50 ? 1 : 0
    G = (s, a)-> begin
        s′ = rand([s, s+a, s-a])
        r = R(s, a)
        return (s′, r)
    end
    P = MDPᵣ(0.95, 𝒮, 𝒜, T, R, G)

    mcts = MonteCarloTreeSearch(P, Dict(), Dict(), 50, 1000, 1, s->rand(map(a->s+a, 𝒜)))

    @test mcts(1) == 1
    @test mcts(55) == 2
    @test mcts(100) == 1
end
