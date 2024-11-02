
(* Code de la Section 3 du projet. *)

type coord2D = {
    x : float;
    y : float
  }
type point = coord2D
type vector = coord2D
type angle = float

let translate (v : vector) (p : point) : point = 
  let new_x = p.x +. v.x and new_y = p.y +. v.y in
  {x=new_x ; y=new_y}
;;
let rad_of_deg (a : angle) : angle =
  let pi = 3.141592653589793 in 
  a *. (pi /. 180.)

;;

let deg_of_rad (a : angle) : angle =
  let pi = 3.141592653589793 in 
  a *. (180. /. pi)
;;

let rotate (c : point) (alpha : angle) (p : point) : point =
  let rad_a = rad_of_deg alpha in 
  let new_x = c.x +. (p.x -. c.x) *. (cos rad_a) -. (p.y -. c.y) *. (sin rad_a) 
  and new_y = c.y +. (p.x -. c.x) *. (sin rad_a) +. (p.y -. c.y) *. (cos rad_a) 
in {x=new_x ; y=new_y}
;;
  
type transformation =
  Translate of vector
| Rotate of point * angle

let transform (t : transformation) (p : point) : point =
  match t with 
  Translate v -> translate v p 
  |Rotate(c,a) -> rotate c a p
;;

type rectangle = {
    x_min : float;
    x_max : float;
    y_min : float;
    y_max : float
  }

let in_rectangle (r : rectangle) (p : point) : bool =
  let test_x = p.x >= r.x_min && p.x <=  r.x_max 
  and test_y = p.y >= r.y_min && p.y <=  r.y_max 
in test_x && test_y
;;

let corners (r :rectangle) : point list =
  let s_1 = {x=r.x_min; y= r.y_min}
  and s_2 = {x=r.x_min; y= r.y_max}
  and s_3 = {x=r.x_max; y= r.y_min}
  and s_4 = {x=r.x_max; y= r.y_max}
in s_1::s_2::s_3::s_4::[]
;;
  
let rectangle_of_list (pl : point list) : rectangle = 
  failwith "À compléter"
