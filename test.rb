a = (1..1000).to_a.sample
b = a


def verification(a, b)
  if a == b
    true
  else
    false
  end
end

puts verification(a, b)

