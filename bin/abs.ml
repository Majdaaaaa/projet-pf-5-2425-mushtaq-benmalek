open Graphics;;
open Pf5.Geo;;
open Pf5.Approx;;

(** [draw_rect] dessine [rect]
    @param rect le rectangle à dessiner
*)
let draw_rect rect =
    let origine = ( size_x () / 2 , size_y () / 2) in
    let int_x_min = fst origine + (int_of_float rect.x_min * (size_x()/19)) in
    let int_y_min = snd origine + (int_of_float rect.y_min * (size_y()/19)) in
    let int_x_max = fst origine + (int_of_float rect.x_max * (size_x()/19)) in
    let int_y_max = snd origine + (int_of_float rect.y_max * (size_y()/19)) in
    let w = (int_x_max - int_x_min) in
    let h = (int_y_max - int_y_min ) in
    fill_rect int_x_min int_y_min w h
;;

(** [run_abs] execute [prog] sur [rect]
    @param rect le rectangle à dessiner prog le programme à exécuter
*)
let run_abs prog rect =
    rect := over_approximate prog !rect;
    draw_rect !rect;
;;