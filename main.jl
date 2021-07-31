# hello world
println("hello world")

# how to make functions in julia.
function cool_maths(n)
    # 'pi' or it's symbol can be used.
    return n * 2 / pi * 5 + 99
end

function printnice(x)
    println("$(summary(x)): $x")
end

# single line function
is_odd(n) = n % 2 != 0

# defining argument's types in function definitions

function gibby(x::Float64, y::Int64)
    # if return keyword is omitted, last values are used
    x = x * 2
    y = y * 10
    x + y
end

println(cool_maths(30))
println(is_odd(35))
println(gibby(49.321, 32))



# Strings
my_name = "Ibn al-Qalam al-Ash'arial-Mujahid al-Muhadith"
println(my_name)
print("hello")
print(" kono dio da!\n")
# chars
first_letter = 'A'
println("char value of ",first_letter," ==> ", Int(first_letter))
println(uppercase(my_name))
println(lowercase(my_name))
println(my_name[2])
println(my_name[begin], " ", my_name[end])
# string interpolatin
println("Hello $my_name")
# complex expressions
println("number is $(gibby(30.5, 200) + 209)")
# julia uses "*" instead of "+" for concatenation.
println("hello " * "my name is " * "ibn al-Qalam")

## String conversion
e1 = "34.52"
e = parse(Float64, e1)
println(e)
e2 = "false"
ee = parse(Bool, e2)
println(e2)
v = findfirst("al-Qalam", my_name)
println(v)
println(my_name[5:12])


# Arrays

a1 = [10, 20, 30, 400]
println(a1)
println(summary(a1))
# empty array 
a2 = []
# empty array with types so functions like push! can work
a3 = Int64[]
push!(a3, 50,90)
println(a3)
# ranges
a4 = 15:20
println(summary(a4))
# using ranges to make arrays 
a5 = collect(a4)
println(a5)
# generating arrays from comprehensions
a6 = [i + 2 for i = 1:10]
printnice(a6)

# error handling

try 
    b * 20
catch err
    # showerror(stdout, err, backtrace()); println()
    println("NOTICE: $err ")
end

# Broadcasting

l = [20,30,42,1,22]
b = l .* 2
println(b)

# Dictionaries
d1 = Dict("firstval" => 69, "secondval" => 70, "thirdval" => 71)
println(d1)
d1["fourthval"] = 72
println(d1)

d2 = Dict{Bool, AbstractString}()
d2[true] = "on"
d2[false] = "off"
println(d2)
# println(haskey(d2, "joh")) # checks for key  

# loops and Maps
for i in 1:2:10
    println("value is: $i")
end

for i = 15:20
    println("value ==> $i")
end

ab = [10,15,92,12]
for i in ab
    println("val: $i")
end

ac = [10,11,22,131,392,12,393,1021,23,332,122, 554,552]
for i in ac
    if i % 2 != 0
        continue
    end
    println("I: $i")
    if i > 500
        break
    end
end

ad = ["one", "two", "three"]
for (i,v) in enumerate(ad)
    println("index: $i, value: $v")
end

for k in sort(collect(keys(d1)))
    println("$k: $(d1[k])")
end

# Julia arrays are 1 indexed unlike Python.


# Numbers can be compared with opperators like <, >, ==, !=

l = ["light yagami"]
if occursin("yagami", l[1])
    println("yes")
else
    println("nein")
end

function checktype(x)
    if x isa Int
        println("integer given")
    elseif x isa Bool
        println("bool given")
    elseif x isa AbstractFloat
        println("floating point number")
    elseif x isa AbstractString
        println("string given")
    elseif x isa Complex
        println("complex number lol")
    elseif x isa AbstractChar
        println("gave me a char")
    else
        println("not sure what this is, bossman")
    end
end

checktype([1,2,3])

# The ternary operator 

lozo = 10 > 5 ? true : false

println(lozo)

# we use && for And(short circuit included) and
# || for Or(short circuit included)

# types i.e structs

mutable struct Person
    name::AbstractString
    age::Int
    male::Bool
    subject::AbstractString
end

p = Person("Ahmad", 16, true,"Microbiology")
println(p)

people = Person[]
push!(people, Person("leo", 32, true, "biochemistry"))
push!(people, Person("aishaah", 18, false, "Neurophysics"))
println(people)



mutable struct Family
    name::AbstractString
    members::Array{AbstractString, 1}
    extended::Bool
    Family(name::AbstractString) = new(name, AbstractString[], false)
    Family(name::AbstractString, members) = new(name, members, length(members) > 3)
end


fam1 = Family("dio", ["luke", "liam", "che", "cho"])
println(fam1)