(* TEST
   include testing
*)

(* GPR#1271 *)

module F (X : sig val x : int end) = struct
  let rec f1 y = f270 (X.x + y)
  and f2 y = (f1 [@inlined never]) y
  and f3 y = (f2 [@inlined never]) y
  and f4 y = (f3 [@inlined never]) y
  and f5 y = (f4 [@inlined never]) y
  and f6 y = (f5 [@inlined never]) y
  and f7 y = (f6 [@inlined never]) y
  and f8 y = (f7 [@inlined never]) y
  and f9 y = (f8 [@inlined never]) y
  and f10 y = (f9 [@inlined never]) y
  and f11 y = (f10 [@inlined never]) y
  and f12 y = (f11 [@inlined never]) y
  and f13 y = (f12 [@inlined never]) y
  and f14 y = (f13 [@inlined never]) y
  and f15 y = (f14 [@inlined never]) y
  and f16 y = (f15 [@inlined never]) y
  and f17 y = (f16 [@inlined never]) y
  and f18 y = (f17 [@inlined never]) y
  and f19 y = (f18 [@inlined never]) y
  and f20 y = (f19 [@inlined never]) y
  and f21 y = (f20 [@inlined never]) y
  and f22 y = (f21 [@inlined never]) y
  and f23 y = (f22 [@inlined never]) y
  and f24 y = (f23 [@inlined never]) y
  and f25 y = (f24 [@inlined never]) y
  and f26 y = (f25 [@inlined never]) y
  and f27 y = (f26 [@inlined never]) y
  and f28 y = (f27 [@inlined never]) y
  and f29 y = (f28 [@inlined never]) y
  and f30 y = (f29 [@inlined never]) y
  and f31 y = (f30 [@inlined never]) y
  and f32 y = (f31 [@inlined never]) y
  and f33 y = (f32 [@inlined never]) y
  and f34 y = (f33 [@inlined never]) y
  and f35 y = (f34 [@inlined never]) y
  and f36 y = (f35 [@inlined never]) y
  and f37 y = (f36 [@inlined never]) y
  and f38 y = (f37 [@inlined never]) y
  and f39 y = (f38 [@inlined never]) y
  and f40 y = (f39 [@inlined never]) y
  and f41 y = (f40 [@inlined never]) y
  and f42 y = (f41 [@inlined never]) y
  and f43 y = (f42 [@inlined never]) y
  and f44 y = (f43 [@inlined never]) y
  and f45 y = (f44 [@inlined never]) y
  and f46 y = (f45 [@inlined never]) y
  and f47 y = (f46 [@inlined never]) y
  and f48 y = (f47 [@inlined never]) y
  and f49 y = (f48 [@inlined never]) y
  and f50 y = (f49 [@inlined never]) y
  and f51 y = (f50 [@inlined never]) y
  and f52 y = (f51 [@inlined never]) y
  and f53 y = (f52 [@inlined never]) y
  and f54 y = (f53 [@inlined never]) y
  and f55 y = (f54 [@inlined never]) y
  and f56 y = (f55 [@inlined never]) y
  and f57 y = (f56 [@inlined never]) y
  and f58 y = (f57 [@inlined never]) y
  and f59 y = (f58 [@inlined never]) y
  and f60 y = (f59 [@inlined never]) y
  and f61 y = (f60 [@inlined never]) y
  and f62 y = (f61 [@inlined never]) y
  and f63 y = (f62 [@inlined never]) y
  and f64 y = (f63 [@inlined never]) y
  and f65 y = (f64 [@inlined never]) y
  and f66 y = (f65 [@inlined never]) y
  and f67 y = (f66 [@inlined never]) y
  and f68 y = (f67 [@inlined never]) y
  and f69 y = (f68 [@inlined never]) y
  and f70 y = (f69 [@inlined never]) y
  and f71 y = (f70 [@inlined never]) y
  and f72 y = (f71 [@inlined never]) y
  and f73 y = (f72 [@inlined never]) y
  and f74 y = (f73 [@inlined never]) y
  and f75 y = (f74 [@inlined never]) y
  and f76 y = (f75 [@inlined never]) y
  and f77 y = (f76 [@inlined never]) y
  and f78 y = (f77 [@inlined never]) y
  and f79 y = (f78 [@inlined never]) y
  and f80 y = (f79 [@inlined never]) y
  and f81 y = (f80 [@inlined never]) y
  and f82 y = (f81 [@inlined never]) y
  and f83 y = (f82 [@inlined never]) y
  and f84 y = (f83 [@inlined never]) y
  and f85 y = (f84 [@inlined never]) y
  and f86 y = (f85 [@inlined never]) y
  and f87 y = (f86 [@inlined never]) y
  and f88 y = (f87 [@inlined never]) y
  and f89 y = (f88 [@inlined never]) y
  and f90 y = (f89 [@inlined never]) y
  and f91 y = (f90 [@inlined never]) y
  and f92 y = (f91 [@inlined never]) y
  and f93 y = (f92 [@inlined never]) y
  and f94 y = (f93 [@inlined never]) y
  and f95 y = (f94 [@inlined never]) y
  and f96 y = (f95 [@inlined never]) y
  and f97 y = (f96 [@inlined never]) y
  and f98 y = (f97 [@inlined never]) y
  and f99 y = (f98 [@inlined never]) y
  and f100 y = (f99 [@inlined never]) y
  and f101 y = (f100 [@inlined never]) y
  and f102 y = (f101 [@inlined never]) y
  and f103 y = (f102 [@inlined never]) y
  and f104 y = (f103 [@inlined never]) y
  and f105 y = (f104 [@inlined never]) y
  and f106 y = (f105 [@inlined never]) y
  and f107 y = (f106 [@inlined never]) y
  and f108 y = (f107 [@inlined never]) y
  and f109 y = (f108 [@inlined never]) y
  and f110 y = (f109 [@inlined never]) y
  and f111 y = (f110 [@inlined never]) y
  and f112 y = (f111 [@inlined never]) y
  and f113 y = (f112 [@inlined never]) y
  and f114 y = (f113 [@inlined never]) y
  and f115 y = (f114 [@inlined never]) y
  and f116 y = (f115 [@inlined never]) y
  and f117 y = (f116 [@inlined never]) y
  and f118 y = (f117 [@inlined never]) y
  and f119 y = (f118 [@inlined never]) y
  and f120 y = (f119 [@inlined never]) y
  and f121 y = (f120 [@inlined never]) y
  and f122 y = (f121 [@inlined never]) y
  and f123 y = (f122 [@inlined never]) y
  and f124 y = (f123 [@inlined never]) y
  and f125 y = (f124 [@inlined never]) y
  and f126 y = (f125 [@inlined never]) y
  and f127 y = (f126 [@inlined never]) y
  and f128 y = (f127 [@inlined never]) y
  and f129 y = (f128 [@inlined never]) y
  and f130 y = (f129 [@inlined never]) y
  and f131 y = (f130 [@inlined never]) y
  and f132 y = (f131 [@inlined never]) y
  and f133 y = (f132 [@inlined never]) y
  and f134 y = (f133 [@inlined never]) y
  and f135 y = (f134 [@inlined never]) y
  and f136 y = (f135 [@inlined never]) y
  and f137 y = (f136 [@inlined never]) y
  and f138 y = (f137 [@inlined never]) y
  and f139 y = (f138 [@inlined never]) y
  and f140 y = (f139 [@inlined never]) y
  and f141 y = (f140 [@inlined never]) y
  and f142 y = (f141 [@inlined never]) y
  and f143 y = (f142 [@inlined never]) y
  and f144 y = (f143 [@inlined never]) y
  and f145 y = (f144 [@inlined never]) y
  and f146 y = (f145 [@inlined never]) y
  and f147 y = (f146 [@inlined never]) y
  and f148 y = (f147 [@inlined never]) y
  and f149 y = (f148 [@inlined never]) y
  and f150 y = (f149 [@inlined never]) y
  and f151 y = (f150 [@inlined never]) y
  and f152 y = (f151 [@inlined never]) y
  and f153 y = (f152 [@inlined never]) y
  and f154 y = (f153 [@inlined never]) y
  and f155 y = (f154 [@inlined never]) y
  and f156 y = (f155 [@inlined never]) y
  and f157 y = (f156 [@inlined never]) y
  and f158 y = (f157 [@inlined never]) y
  and f159 y = (f158 [@inlined never]) y
  and f160 y = (f159 [@inlined never]) y
  and f161 y = (f160 [@inlined never]) y
  and f162 y = (f161 [@inlined never]) y
  and f163 y = (f162 [@inlined never]) y
  and f164 y = (f163 [@inlined never]) y
  and f165 y = (f164 [@inlined never]) y
  and f166 y = (f165 [@inlined never]) y
  and f167 y = (f166 [@inlined never]) y
  and f168 y = (f167 [@inlined never]) y
  and f169 y = (f168 [@inlined never]) y
  and f170 y = (f169 [@inlined never]) y
  and f171 y = (f170 [@inlined never]) y
  and f172 y = (f171 [@inlined never]) y
  and f173 y = (f172 [@inlined never]) y
  and f174 y = (f173 [@inlined never]) y
  and f175 y = (f174 [@inlined never]) y
  and f176 y = (f175 [@inlined never]) y
  and f177 y = (f176 [@inlined never]) y
  and f178 y = (f177 [@inlined never]) y
  and f179 y = (f178 [@inlined never]) y
  and f180 y = (f179 [@inlined never]) y
  and f181 y = (f180 [@inlined never]) y
  and f182 y = (f181 [@inlined never]) y
  and f183 y = (f182 [@inlined never]) y
  and f184 y = (f183 [@inlined never]) y
  and f185 y = (f184 [@inlined never]) y
  and f186 y = (f185 [@inlined never]) y
  and f187 y = (f186 [@inlined never]) y
  and f188 y = (f187 [@inlined never]) y
  and f189 y = (f188 [@inlined never]) y
  and f190 y = (f189 [@inlined never]) y
  and f191 y = (f190 [@inlined never]) y
  and f192 y = (f191 [@inlined never]) y
  and f193 y = (f192 [@inlined never]) y
  and f194 y = (f193 [@inlined never]) y
  and f195 y = (f194 [@inlined never]) y
  and f196 y = (f195 [@inlined never]) y
  and f197 y = (f196 [@inlined never]) y
  and f198 y = (f197 [@inlined never]) y
  and f199 y = (f198 [@inlined never]) y
  and f200 y = (f199 [@inlined never]) y
  and f201 y = (f200 [@inlined never]) y
  and f202 y = (f201 [@inlined never]) y
  and f203 y = (f202 [@inlined never]) y
  and f204 y = (f203 [@inlined never]) y
  and f205 y = (f204 [@inlined never]) y
  and f206 y = (f205 [@inlined never]) y
  and f207 y = (f206 [@inlined never]) y
  and f208 y = (f207 [@inlined never]) y
  and f209 y = (f208 [@inlined never]) y
  and f210 y = (f209 [@inlined never]) y
  and f211 y = (f210 [@inlined never]) y
  and f212 y = (f211 [@inlined never]) y
  and f213 y = (f212 [@inlined never]) y
  and f214 y = (f213 [@inlined never]) y
  and f215 y = (f214 [@inlined never]) y
  and f216 y = (f215 [@inlined never]) y
  and f217 y = (f216 [@inlined never]) y
  and f218 y = (f217 [@inlined never]) y
  and f219 y = (f218 [@inlined never]) y
  and f220 y = (f219 [@inlined never]) y
  and f221 y = (f220 [@inlined never]) y
  and f222 y = (f221 [@inlined never]) y
  and f223 y = (f222 [@inlined never]) y
  and f224 y = (f223 [@inlined never]) y
  and f225 y = (f224 [@inlined never]) y
  and f226 y = (f225 [@inlined never]) y
  and f227 y = (f226 [@inlined never]) y
  and f228 y = (f227 [@inlined never]) y
  and f229 y = (f228 [@inlined never]) y
  and f230 y = (f229 [@inlined never]) y
  and f231 y = (f230 [@inlined never]) y
  and f232 y = (f231 [@inlined never]) y
  and f233 y = (f232 [@inlined never]) y
  and f234 y = (f233 [@inlined never]) y
  and f235 y = (f234 [@inlined never]) y
  and f236 y = (f235 [@inlined never]) y
  and f237 y = (f236 [@inlined never]) y
  and f238 y = (f237 [@inlined never]) y
  and f239 y = (f238 [@inlined never]) y
  and f240 y = (f239 [@inlined never]) y
  and f241 y = (f240 [@inlined never]) y
  and f242 y = (f241 [@inlined never]) y
  and f243 y = (f242 [@inlined never]) y
  and f244 y = (f243 [@inlined never]) y
  and f245 y = (f244 [@inlined never]) y
  and f246 y = (f245 [@inlined never]) y
  and f247 y = (f246 [@inlined never]) y
  and f248 y = (f247 [@inlined never]) y
  and f249 y = (f248 [@inlined never]) y
  and f250 y = (f249 [@inlined never]) y
  and f251 y = (f250 [@inlined never]) y
  and f252 y = (f251 [@inlined never]) y
  and f253 y = (f252 [@inlined never]) y
  and f254 y = (f253 [@inlined never]) y
  and f255 y = (f254 [@inlined never]) y
  and f256 y = (f255 [@inlined never]) y
  and f257 y = (f256 [@inlined never]) y
  and f258 y = (f257 [@inlined never]) y
  and f259 y = (f258 [@inlined never]) y
  and f260 y = (f259 [@inlined never]) y
  and f261 y = (f260 [@inlined never]) y
  and f262 y = (f261 [@inlined never]) y
  and f263 y = (f262 [@inlined never]) y
  and f264 y = (f263 [@inlined never]) y
  and f265 y = (f264 [@inlined never]) y
  and f266 y = (f265 [@inlined never]) y
  and f267 y = (f266 [@inlined never]) y
  and f268 y = (f267 [@inlined never]) y
  and f269 y = (f268 [@inlined never]) y
  and f270 y = (f269 [@inlined never]) y
end

let words0 = Gc.minor_words ()
let words1 = Gc.minor_words ()
module X = F (struct let x = 42 end)
let words2 = Gc.minor_words ()

let expected = words1 -. words0

let () =
  match Sys.backend_type with
  | Sys.Native ->
    Printf.printf "%.0f" ((words2 -. words1) -. expected)
  | Sys.Bytecode | Sys.Other _ ->
    print_string "0"
