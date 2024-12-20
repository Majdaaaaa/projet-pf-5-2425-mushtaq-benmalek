open Graphics;;

let init_graphics () =
  Printf.printf "Début programme\n";
  set_window_title "Interpreteur Graphique";
  set_text_size 40;
  moveto 2 5;
  draw_string "Appuyez sur <N> pour avancer dans l'execution.";
  moveto 2 20;
  draw_string "Appuyez sur <Q> pour quitter.";
  moveto 2 35;
  draw_string "Appuyez sur <L> pour afficher les traces.";
  moveto 2 50;
  draw_string "Appuyez sur <S> pour afficher la fin du programme.";
  Repere.repere ();
;;