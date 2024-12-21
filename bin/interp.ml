exception Quit;;
open Graphics;;
open Format;;
exception Arg;;

(* open_graph " 800x600";; *)

let i = ref 0;;

let () =
  Option.size();
  try
    (* let nbargs = Array.length Sys.argv in 
       if nbargs <= 1 then ( 
       Option.cr !i ();
       Printf.printf "Il faut donné un programme a éxécuté\n";
       raise Quit;
       )  *)
    Arg.parse Format.speclist Format.anon_fun Format.usage_msg; 
    if !programme = [] then 
      raise Arg;
    Option.bc ();
    (*? changement de la couleur de l'avant plan pour dessiner le repère *)
    Option.fc ();
    Init.init_graphics ();
    Option.rc();
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit;
      if eve.key = 'n' then (
        (* ? pour dessiné les points de la couleur demandé *)
        Option.pc ();
        Option.cr !i ();
        Option.abs !i ();
        i := !i+1;
      );
      if eve.key = 's' then (
        (* Tout affiché direct au lieu d'appuyer sur N 30 fois*)
        (* let prog_length = Cr.list_length !programme in *)
        while !i < 360 do (
          (* Printf.printf "prog_length %d\n" prog_length ; *)
          Option.cr !i ();
          i := !i+1;
        )
        done 
      );
      if eve.key = 'l' then (
        if !is_abs = false then 
          Cr.run_ligne !programme
      );
      (* ? rétablir la couleur de l'avant plan demandé *)
      Option.fc ();
    done
  with 
  | Quit -> close_graph ()
  | Arg -> Printf.printf "Il faut un programme a éxécuté\n"; close_graph ()