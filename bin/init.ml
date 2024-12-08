open Graphics;;

let init_graphics () =
  Printf.printf "Début programme\n";
  set_window_title "Interpreteur Graphique";
  Repere.repere ();
;;