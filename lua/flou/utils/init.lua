function levenshtein_distance(s, t)
    local m, n = #s, #t
    local d = {}
    for i = 0, m do
        d[i] = {}
        for j = 0, n do
            d[i][j] = 0
        end
    end

    for i = 1, m do
        d[i][0] = i
    end

    for j = 1, n do
        d[0][j] = j
    end

    for j = 1, n do
        for i = 1, m do
            local sub_cost = s:sub(i, i) == t:sub(j, j) and 0 or 1
            d[i][j] = math.min(
                d[i - 1][j] + 1, -- deletion
                d[i][j - 1] + 1, -- insertion
                d[i - 1][j - 1] + sub_cost -- substitution
            )
        end
    end
    return d[m][n]
end

return {
    levenshtein_distance = levenshtein_distance,
}
