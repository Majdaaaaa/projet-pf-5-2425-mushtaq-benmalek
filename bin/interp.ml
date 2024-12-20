exception Quit;;
open Graphics;;

(* open_graph " 800x600";; *)

let i = ref 0;;

let () =
  Option.size();
  try
    let nbargs = Array.length Sys.argv in 
    if nbargs <= 1 then ( 
      Option.cr !i ();
      Printf.printf "Il faut donné un programme a éxécuté\n";
      raise Quit;
    ) 
    else 
      Arg.parse Format.speclist Format.anon_fun Format.usage_msg; 
    Option.bc ();
    (*? changement de la couleur de l'avant plan pour dessiner le repère *)
    Option.fc ();
    Init.init_graphics ();
    Option.bc ();
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
      if eve.key = 'e' then (
        Option.bc ();
        Init.init_graphics ();
      );
      (* ? rétablir la couleur de l'avant plan demandé *)
      Option.fc ();
    done
  with 
  | Quit -> close_graph ()
  | Option.Arg -> Printf.printf "Mauvais arguments "; close_graph ();;