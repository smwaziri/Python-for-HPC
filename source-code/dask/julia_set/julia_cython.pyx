'''Module containing function for computing Julia sets'''


def julia_set(domain, iterations):
    _julia_set(memoryview(domain), memoryview(iterations), 2.0, 255)
    return iterations


cdef _julia_set(double complex[:] domain, int[:] iterations,
                double max_norm, int max_iters):
    '''Compute the Julia set on a complex domain.

    Positional arguments:
    domain -- complex domain to compute a 1-D array
    iterations -- number of iterations as a 1-D array
    max_norm -- maximum complex norm to iterate to.
    max_iters -- maximum number of iterations
    '''
    cdef int i
    cdef complex z
    for i in range(len(domain)):
        z = domain[i]
        while (iterations[i] <= max_iters and
               z.real*z.real + z.imag*z.imag <= max_norm*max_norm):
            z = z**2 - 0.622772 + 0.42193j
            iterations[i] += 1
