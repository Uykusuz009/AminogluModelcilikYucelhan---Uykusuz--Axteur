local globalTimeScale = 1
local animators = {}

function animate(keyframes, reverse, callback, args)
    if not keyframes or type(callback) ~= "function" then
        outputDebugString("Invalid animation params")
        if not keyframes then
            iprint("no keyframes")
        end
        if type(callback) ~= "function" then
            iprint("Bad callback")
        end
        return
    end
    if #keyframes < 2 then
        outputDebugString("Not enough keyframes to animate")
        return
    end
    local anim = {}
    if not reverse then
        anim.time = 0
        anim.keyframeIndex = 1
        anim.direction = 1
    else
        anim.time = keyframes[#keyframes].time
        anim.keyframeIndex = #keyframes - 1
        anim.direction = -1
    end
    anim.keyframes = keyframes
    anim.callback = callback
    anim.args = args
    table.insert(animators, anim)
    return anim
end

function isAnimationReversed(animator)
    if animator and not animator.finished then
        return animator.direction == -1
    end
end

function setAnimationReversed(animator, reversed)
    if animator and not animator.finished then
        if reversed then
            animator.direction = -1
        else
            animator.direction = 1
        end
    end
end

function stopAnimation(animator)
    if animator and not animator.finished then
        animator.finished = true
    end
end

function isAnimation(animator)
    return animator and not animator.finished
end

function updateAnimators(deltaTime)
    -- dxDrawText("Animators: " .. tostring(#animators), 500, 500)
    for i = 1, #animators do
        local anim = animators[i]
        if anim then
            -- dxDrawText(anim.time, 500, 500 - i * 20)
            local currState = anim.keyframes[anim.keyframeIndex]
            local nextState = anim.keyframes[anim.keyframeIndex + 1]
            if not anim.finished and currState and nextState then
                local progress = math.max(0, math.min(1, (anim.time - currState.time) / (nextState.time - currState.time)))
                local params = {}
                for i, v in ipairs(currState.params) do
                    local mul = progress
                    if currState.easing then
                        mul = getEasingValue(progress, currState.easing)
                    end
                    params[i] = v + (nextState.params[i] - v) * mul
                end
                anim.callback(anim.args, unpack(params))
                anim.time = anim.time + deltaTime * anim.direction * globalTimeScale
                if progress >= 1 and anim.direction == 1 then
                    anim.keyframeIndex = anim.keyframeIndex + 1
                    if anim.keyframeIndex >= #anim.keyframes then
                        anim.finished = true
                        table.remove(animators, i)
                        i = i - 1
                    end
                elseif progress <= 0 and anim.direction == -1 then
                    anim.keyframeIndex = anim.keyframeIndex - 1
                    if anim.keyframeIndex < 1 then
                        anim.finished = true
                        table.remove(animators, i)
                        i = i - 1
                    end
                end
            else
                table.remove(animators, i)
                i = i - 1
            end
        end
    end
end
