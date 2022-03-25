def minSteps( initial : int, final : int) -> int:
    steps = 0
    while final != initial:
        if final % 2:
            final -= 1
        else:
            if final//2 >= initial:
                final //= 2
            else:
                final -= 1
        steps +=1
    return steps

print(minSteps(1,100))

# consider the steps in opposite direction, that is 
# we will either divide x by 2, or subtract 1 from it.
# our final goal is to make 1

            