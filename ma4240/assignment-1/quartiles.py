def quartile2(arr: list) -> float:
    """returns the 2nd quartile for given sorted list"""
    n = arr.__len__()
    if n%2==0:
        return (arr[n//2]+arr[n//2-1])/2
    else:
        return arr[n//2]

def quartile1(arr:list) -> float:
    """returns the 1st quartile for given sorted list"""
    n = arr.__len__()
    return quartile2(arr[:n//2])

def quartile3(arr:list) -> float:
    """returns the 1st quartile for given sorted list"""
    n = arr.__len__()
    return quartile2(arr[n//2+1:])

    

pulse_rates = [49, 40, 59, 56, 55, 70, 49, 59, 55, 49, 58, 54, 55, 72, 51,
54, 56, 55, 65, 57, 61, 41, 52, 60, 49, 57, 46, 55, 63, 55]

q1 = quartile1(pulse_rates)
q2 = quartile2(pulse_rates)
q3 = quartile3(pulse_rates)