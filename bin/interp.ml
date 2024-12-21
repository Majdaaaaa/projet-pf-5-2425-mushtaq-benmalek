exception Quit;;
open Graphics;;
open Format;;

let i = ref 0;;
let j = ref (-1);;
let () =
  try
    let nbargs = Array.length Sys.argv in 
    if nbargs <= 1 then ( 
      Option.cr !i ();
      Printf.printf "Il faut donné un programme a éxécuté\n";
      raise Quit;
    ) else 
      Arg.parse Format.speclist Format.anon_fun Format.usage_msg; 
    condition();
    Option.size ();
    Option.choix_prog ();
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
        Option.abs !j ();
        Option.ae !i ();
        i := !i+1;
        j := !j+1;
      );
      if eve.key = 's' then (
        (* Tout affiché direct au lieu d'appuyer sur N 30 fois*)
        (* let prog_length = Cr.list_length !programme in *)
        while !i < 2000 do (
          (* Printf.printf "prog_length %d\n" prog_length ; *)
          Option.cr !i ();
          i := !i+1;
        )
        done 
      );
      (* ? rétablir la couleur de l'avant plan demandé *)
      Option.fc ();
    done
  with 
  | Quit -> close_graph ()
  | Arg -> Printf.printf "Il faut un programme a éxécuté\n"; close_graph ()
  | Not_in_rectangle -> Printf.printf "La coordonnée (0.0, 0.0) n'est pas dans le rectangle donnée.\n"
  | Abs_ae_exception -> Printf.printf "Les options -ae et -abs ne peuvent pas s'éxecuter en même temps.\n"
  | Rc_only -> Printf.printf "L'option -rc doit être utiliser avec l'option -abs ou -ae.\n"
  | Not_color -> Printf.printf "Ce n'est pas une couleur valide.\n"

  (* "Choissisez entre le programme 1,2,3 ou 4 "*)