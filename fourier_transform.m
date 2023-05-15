(* ::Package:: *)

SetDirectory["~/Desktop/ptsn4/removed_degeneracy/k_space_data_file"];

nk = 50;
nbasis = 84;

h0 = Import["hjfile_yplane_0_deg_rm.dat"];
h1 = Import["hjfile_yplane_1_deg_rm.dat"];
h2 = Import["hjfile_yplane_2_deg_rm.dat"];
hm1 = Import["hjfile_yplane_-1_deg_rm.dat"];
hm2 = Import["hjfile_yplane_-2_deg_rm.dat"];



For [ i = 1, i<= Length[h0],i ++,
t[Round[h0[[i,1]]]][Round[h0[[i,3]]]][Round[h0[[i,4]]]][Round[h0[[i,5]]]] = h0[[i,6]]+I*h0[[i,7]];
]

nj = 0;
For[jy=0,jy<=nk,jy++,
ky=(2*jy/nk-1)*Pi;
For[jx=0,jx<=nk,jx++,nj++;
kx=(2*jx/nk-1)*Pi;

ham = Table[Sum[t[-cx][-cy][m][n]*Exp[I*(ky*cy+kx*cx)],{cx,-4,4},{cy,-4,4}],{m,1,nbasis},{n,1,nbasis}];
Export[StringJoin["hopping_ky_0plane_r_",ToString[nj],".csv"],Re[ham]];
Export[StringJoin["hopping_ky_0plane_i_",ToString[nj],".csv"],Im[ham]];
Print[nj];
]]


For [ i = 1, i<= Length[h1],i ++,
t[Round[h1[[i,1]]]][Round[h1[[i,3]]]][Round[h1[[i,4]]]][Round[h1[[i,5]]]] = h1[[i,6]]+I*h1[[i,7]];
]

nj = 0;
For[jy=0,jy<=nk,jy++,
ky=(2*jy/nk-1)*Pi;
For[jx=0,jx<=nk,jx++,nj++;
kx=(2*jx/nk-1)*Pi;

ham = Table[Sum[t[-cx][-cy][m][n]*Exp[I*(ky*cy+kx*cx)],{cx,-4,4},{cy,-4,4}],{m,1,nbasis},{n,1,nbasis}];
Export[StringJoin["hopping_ky_1plane_r_",ToString[nj],".csv"],Re[ham]];
Export[StringJoin["hopping_ky_1plane_i_",ToString[nj],".csv"],Im[ham]];
]]


For [ i = 1, i<= Length[h2],i ++,
t[Round[h2[[i,1]]]][Round[h2[[i,3]]]][Round[h2[[i,4]]]][Round[h2[[i,5]]]] = h2[[i,6]]+I*h2[[i,7]];
]

nj = 0;
For[jy=0,jy<=nk,jy++,
ky=(2*jy/nk-1)*Pi;
For[jx=0,jx<=nk,jx++,nj++;
kx=(2*jx/nk-1)*Pi;

ham = Table[Sum[t[-cx][-cy][m][n]*Exp[I*(ky*cy+kx*cx)],{cx,-4,4},{cy,-4,4}],{m,1,nbasis},{n,1,nbasis}];
Export[StringJoin["hopping_ky_2plane_r_",ToString[nj],".csv"],Re[ham]];
Export[StringJoin["hopping_ky_2plane_i_",ToString[nj],".csv"],Im[ham]];
]]


For [ i = 1, i<= Length[hm1],i ++,
t[Round[hm1[[i,1]]]][Round[hm1[[i,3]]]][Round[hm1[[i,4]]]][Round[hm1[[i,5]]]] = hm1[[i,6]]+I*hm1[[i,7]];
]

nj = 0;
For[jy=0,jy<=nk,jy++,
ky=(2*jy/nk-1)*Pi;
For[jx=0,jx<=nk,jx++,nj++;
kx=(2*jx/nk-1)*Pi;

ham = Table[Sum[t[-cx][-cy][m][n]*Exp[I*(ky*cy+kx*cx)],{cx,-4,4},{cy,-4,4}],{m,1,nbasis},{n,1,nbasis}];
Export[StringJoin["hopping_ky_m1plane_r_",ToString[nj],".csv"],Re[ham]];
Export[StringJoin["hopping_ky_m1plane_i_",ToString[nj],".csv"],Im[ham]];
]]


For [ i = 1, i<= Length[hm2],i ++,
t[Round[hm2[[i,1]]]][Round[hm2[[i,3]]]][Round[hm2[[i,4]]]][Round[hm2[[i,5]]]] = hm2[[i,6]]+I*hm2[[i,7]];
]

nj = 0;
For[jy=0,jy<=nk,jy++,
ky=(2*jy/nk-1)*Pi;
For[jx=0,jx<=nk,jx++,nj++;
kx=(2*jx/nk-1)*Pi;

ham = Table[Sum[t[-cx][-cy][m][n]*Exp[I*(ky*cy+kx*cx)],{cx,-4,4},{cy,-4,4}],{m,1,nbasis},{n,1,nbasis}];
Export[StringJoin["hopping_ky_m2plane_r_",ToString[nj],".csv"],Re[ham]];
Export[StringJoin["hopping_ky_m2plane_i_",ToString[nj],".csv"],Im[ham]];
]]


Exit[];
