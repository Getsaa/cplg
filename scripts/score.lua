function initScore(score)
    -- Make sure the score is a number
    score = tonumber(score)
    -- If the score is nil, set it to 0
    if score == nil then
        score = 0
    end
    -- Return the score
    return score
end

