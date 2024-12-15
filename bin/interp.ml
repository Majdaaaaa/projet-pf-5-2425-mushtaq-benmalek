exception Quit;;
open Graphics;;
open_graph " 800x600";;

let draw_line (x1, y1) (x2, y2) =
  moveto x1 y1;
  lineto x2 y2;;
let i = ref 0;;
let () =
  try
    let nbargs = Array.length Sys.argv in
    if nbargs <= 1 then ( 
      Printf.printf "Il manque des arguments\n";
      raise Quit;
    ) 
    else 
      Arg.parse Format.speclist Format.anon_fun Format.usage_msg;
    Option.bc ();
    (*? changement de la couleur de l'avant plan pour dessiner le repère *)
    Option.fc ();
    Init.init_graphics ();
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit;
      if eve.key = 'n' then (
        (* ? pour dessiné les points de la couleur demandé *)
        Option.pc ();
        Option.cr !i ();
        i := !i+1;
      );
      (* ? rétablir la couleur de l'avant plan demandé *)
      Option.fc ();
      draw_line (0, 0) (30, 20);
    done
  with 
  | Quit -> close_graph ();;
