(* Gompertz:        y' = a y - b y Log[y]  *)
(* von Bertalanffy: y' = a y^(2/3) - b y   *)

ClearAll["Global`*"];

a = 2; b = 1;                       (* parametre cemo redom mijenjati (2,3) i (5,5) *)

fG[y_] := a y - b y Log[y];
fV[y_] := a y^(2/3) - b y;

(*ekvilibriji*)
KG = E^(a/b);
KV = (a/b)^3;

(* stabilnost ću dobiti kao redznak derivacije    *)
dfG[y_] = D[fG[y], y];
dfV[y_] = D[fV[y], y];

Print["Gompertz:K = ", N[KG], ",  f'(K) = ", dfG[KG], "  ->  ",
  If[dfG[KG] < 0, "STABILAN", "NESTABILAN"]];

Print["von Bertalanffy: K = ",  N[KV], ",  f'(K) = ", dfV[KV], "  ->  ",
  If[dfV[KV] < 0, "STABILAN", "NESTABILAN"]];

Print["y = 0: f'(y) -> ", Limit[dfG[y], y -> 0, Direction -> -1],
  " kad y -> 0+, pa je y = 0 NESTABILAN (za oba modela)"];


crtaj[f_, K_, naslov_]  := 
	Plot[Evaluate[Table[ NDSolveValue[{y'[t] == f[y[t]], y[0] == y0}, y[t], {t, 0, 10}],
   			 {y0, {0.5, 2, 5, 12}}]],{t, 0, 10},
   PlotRange -> All,
   AxesLabel -> {"t", "y"},
  PlotLabel -> naslov <> ",  ekvilibrij K = " <> ToString[N[K, 4]],
   Epilog -> {Red, Dashed, Thick, Line[{{0, N[K]}, {10, N[K]}}]}
];

crtaj[fG, KG, "Gompertzov model"]
crtaj[fV, KV, "von Bertalanffyjev model"]
