[%sexp {x: int; y: string}]

let _ = fun {x: int; y: string} -> ()

let _ = {A.b= A.b}

let {A.b} = x

let _ =
  object
    method x = {<x = A.x>}
  end

let a = {x}

let b = {x: a}

let c = {x: a :> b}

let d = {x= x [@foo]}

let e = {x= y}

let {x} = f

let deep = {x; y= {x}}

let x = {(*test*) aaa: aa; bbb: bb}

let x = {aaa: aa (* A *); bbb: bb}

let x = {aaa: aa; (* A *) bbb: bb}

let x = {(*test*) aaa: aa = aa; bbb: bb}

let x = {aaa: aa (* A *) = aa; bbb: bb}

let x = {aaa: aa = (* A *) aa; bbb: bb}

let x = {aaa: aa; (* A *) bbb: bb}

let {(*a*) a: a} = e

let {a (*a*): a} = e

let {a: (*a*) a} = e

let {a: a (*a*)} = e

let _ =
  (* comment here *)
  { (* comment here *)
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaa= aaaaaaaaaaaaaaaaaaaaaaaa
  ; bbbbbbbbbbbb: bbbbbbbbbbb = bbbbbbbbbbbbbbbbb }

let { (* comment here *)
      aaaaaaaaaaaaaaaaaaaaaaaaaaaaa= aaaaaaaaaaaaaaaaaaaaaaaa
    ; bbbbbbbbbbbb: bbbbbbbbbbb = bbbbbbbbbbbbbbbbb } =
  e

type t =
  { (* comment here *)
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaa: aaaaaaaaaaaaaaaaaaaaaaaa
  ; bbbbbbbbbbbb: bbbbbbbbbbb }

let _ = x {a= (a' : string); b= (b' : string)}

let _ = x {a: string = a'; b: string = b'}

let _ = x {a= (a' : string); b: string = b'}

let _ = x {a: string = a'; b= (b' : string)}

let x = function {a= (_ : string); _} -> ()

let x = function {a: string = _; _} -> ()

let {x (*b*): z} = e

let {(* a *) x (*b*): (* c *) z (* d *)} = e

let _ = {(*a*) x (*b*): (*c*) t (*d*) :> (*e*) t (*f*) = (*g*) e (*h*)}

type t = C of (*a*) {(*b*) x (*c*): (*d*) t (*e*)} (*f*)

type t = C : (*a*) {(*b*) x (*c*): (*d*) t (*e*)} (*f*) -> t

let _ = {x: t}

let _ = {x: t :> t}

let _ = {x:> t}

let _ = {x: t :> t}

let _ = {x: t :> t}
