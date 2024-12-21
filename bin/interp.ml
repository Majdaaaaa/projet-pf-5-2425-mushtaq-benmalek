exception Quit;;
open Graphics;;
open Format;;
exception Arg;;

(* open_graph " 800x600";; *)

let i = ref 0;;
let j = ref (-1);;


let () =
  try
    let nbargs = Array.length Sys.argv in 
    if nbargs <= 1 then ( 
      Printf.printf "Il faut donné un programme a éxécuté\n";
      raise Quit;
    ) else 
      Arg.parse Format.speclist Format.anon_fun Format.usage_msg; 
    if !prog = [] then 
      raise Arg;
    Option.size ();
    Option.bc ();
    (*? changement de la couleur de l'avant plan pour dessiner le repère *)
    Option.fc ();
    Init.init_graphics ();
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit;
      try
        if eve.key = 'n' then (
          (* ? pour dessiné les points de la couleur demandé *)
          Option.pc ();
          Option.cr !i ();
          Option.rc();
          Option.abs !j ();
          i := !i+1;
          j := !j+1;
        );
        if eve.key = 's' then ( 
            while true do
              Option.cr !i  ();
              Option.abs !j ();
              i := !i+1;
              j := !j+1;
            done
        )
      with
      | Cr.Fin -> set_color red;  moveto 2 70 ; draw_string "Fin du programme";
        (* ? rétablir la couleur de l'avant plan demandé *)
        Option.fc ();
    done
  with 
  | Quit -> close_graph ()
  | Arg -> Printf.printf "Il faut un programme a éxécuté\n"; close_graph ()