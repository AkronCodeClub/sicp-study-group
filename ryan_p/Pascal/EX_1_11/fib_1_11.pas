unit fib_1_11;

{$mode delphi}

interface

function Fib_Recur(x : qword) : qword;
function Fib_Iterative(x : qword) : qword;

implementation

function Fib_Recur(x : qword) : qword;
begin
  result := x;
  if x >= 3 then
    result := Fib_Recur(x - 1) +
             (Fib_Recur(x - 2) * 2) +
             (Fib_Recur(x - 3) * 3);
end;


function Fib_Iterative(x : qword) : qword;

    function f_iter(a, b, c, count : qword):qword;
    begin
      result := a;
      if count >= 3 then
        result := f_iter(a + (2*b) + (3*c),
                         a,
                         b,
                         count - 1);
    end;

begin //Fib_Iterative
  result := x;
  if x >= 3 then
    result := f_iter(2,1,0,x);
end;

end.

