class Karatsuba
  def multiply(a, b)
    return a * b if a < 10 || b < 10

    m  = [a.to_s.length, b.to_s.length].max
    m2 = (m / 2)

    high1 = a.to_s[0...-m2].to_i
    low1  = a.to_s.last(m2).to_i
    high2 = b.to_s[0...-m2].to_i
    low2  = b.to_s.last(m2).to_i

    z0 = multiply(low1, low2)

    lowhigh1 = low1 + high1
    lowhigh2 = low2 + high2
    z1 = multiply(lowhigh1, lowhigh2)

    z2 = multiply(high1, high2)

    comp1 = z2 * (10**(2 * m2))
    comp2 = (z1 - z2 - z0) * (10**m2)
    comp3 = z0

    return (comp1 + comp2 + comp3)
  end
end

a = 3141592653589793238462643383279502884197169399375105820974944592
b = 2718281828459045235360287471352662497757247093699959574966967627

Karatsuba.new.multiply(a, b)
