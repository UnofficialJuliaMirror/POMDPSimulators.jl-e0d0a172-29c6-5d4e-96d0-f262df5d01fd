mdp = GridWorld()

hist = sim(mdp, max_steps=100) do state
    @assert isa(state, GridWorldState)    
    acts = actions(mdp)
    return rand(acts)
end
@test length(hist) == 100

pomdp = BabyPOMDP()

hist = sim(pomdp, max_steps=100) do obs
    @assert isa(obs, Bool)
    acts = actions(pomdp)
    return rand(acts)
end
@test length(hist) == 100

hist = sim(pomdp, false, max_steps=100) do obs
    @assert isa(obs, Bool)
    acts = actions(pomdp)
    return rand(acts)
end
@test length(hist) == 100

hist = sim(pomdp, initialstate=true, max_steps=100) do obs
    @assert isa(obs, Bool)
    acts = actions(pomdp)
    return rand(acts)
end
@test length(hist) == 100