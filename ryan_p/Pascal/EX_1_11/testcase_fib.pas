unit testcase_Fib;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry;

type

  TTestFib= class(TTestCase)
  published
    procedure TestRecursive;
    procedure TestIterative;
    procedure TestIterative2;
    procedure TestIterative35;
    procedure TestRecursive35;
  end;

implementation
uses fib_1_11;
procedure TTestFib.TestRecursive;
begin
  AssertEquals(1892,Fib_Recur(10));
end;

procedure TTestFib.TestIterative;
begin
  AssertEquals(1892,Fib_Iterative(10));
end;

procedure TTestFib.TestIterative2;
begin
  AssertEquals(2,Fib_Iterative(2));
end;

procedure TTestFib.TestIterative35;
begin
  AssertEquals(634170606,Fib_Iterative(35));
end;

procedure TTestFib.TestRecursive35;
begin
  AssertEquals(634170606,Fib_Recur(35));
end;

initialization

  RegisterTest(TTestFib);
end.

