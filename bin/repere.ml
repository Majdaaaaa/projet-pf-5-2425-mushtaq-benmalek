open Graphics;;
exception Quit;;

(* Fonction pour dessiner un repère orthonormé *)
let repere ()  =
  set_color blue;
  let width = size_x () in
  let length = size_y () in 

  (*axe X*)
  moveto  0 (length/2);
  lineto width (length/2);

  (*axe Y*)
  moveto (width/2) length;
  lineto (width/2) 0;

  (*graduation X*)
  moveto  0 (length/2);
  let rec grad_X spixel nbr_grad acc l =
    if acc <= nbr_grad then (
      set_color black; 
      moveto  ((width/2) + (spixel*acc)) (l/2 - 5);
      lineto  ((width/2) + (spixel*acc)) (l/2 + 1);
      if acc <> 0 then (
        if acc > 0 then
          moveto  ((width/2) + (spixel*acc) - 10) (l/2 - 15) (*Pour les positifs*)
        else
          moveto  ((width/2) + (spixel*acc) + 5) (l/2 - 15); (*Pour les négatifs*)
        draw_string (string_of_int acc)
      );
      grad_X spixel nbr_grad (acc + 1) l
    )
  in
  grad_X (width/19) 9 (-9) length;

  (*graduation Y*)
  moveto (width/2) length;
  let rec grad_Y spixel nbr_grad acc w =
    if acc <= nbr_grad then (
      set_color black;
      moveto (w/2-5) ((length/2)+(spixel*acc)) ;
      lineto  (w/2 + 1) ((length/2) + (spixel*acc)) ;
      if acc <> 0 then (
        if acc > 0 then
          moveto   (w/2 - 15) ((length/2) + (spixel*acc) - 10) (*Pour les positifs*)
        else
          moveto   (w/2 - 15) ((length/2) + (spixel*acc) + 5); (*Pour les négatifs*)
        draw_string (string_of_int acc)
      );
      grad_Y spixel nbr_grad (acc + 1) w
    )
  in 
  grad_Y (length/19) 9 (-9) width;

;;