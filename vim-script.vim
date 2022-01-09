let i = 1
while i <= 3
    echo "i = " . i
    let i+= 1
endwhile

if !exists("g:i")
    echo "$i does not exists"
else
    echo "$i = " . g:i
endif

echo i > 5 ? "i is big" : "i is 0small"

execute "echo 'hello world' " . i

let optname = 'path'
let optval = eval('&' . optname)

function Min(n1, n2)
    return a:n1 < a:n2 ? a:n1 : a:n2
endfunction
