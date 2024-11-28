open Graphics;;
open_graph " 1000x1000+500+150";; 
open Repere;;
exception Quit;;



  let () =
  try
    repere () ;
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
  with Quit ->
    close_graph ();;