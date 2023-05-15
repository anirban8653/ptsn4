(* ::Package:: *)

SetDirectory["~/Desktop/ptsn4/updated_v1/data"];
(*SetDirectory["~/Desktop/ptsn4/surface/eig"]*)
(*evallist = {};*)
Clear[matr,mati];
CloseKernels[];
LaunchKernels[60];
nk = 50;
uli = 12 ;(*unit layer increament*)
basis=84; (*orbital basis*)
unitlayer=3; (*unit layer containing all interactions*)
nn=basis*unitlayer;(*total number of nearest layer interactions*)
layer=nn*uli; (*total matrix dimension including all the layers*)
kkm =nk*nk;


(*For[k=1,k<=2,k++,*)
(*k =1;*)

evallist = ParallelTable[
matr=Import[StringJoin["hopping_ky_0plane_r_",ToString[k],".csv"]];
mati=Import[StringJoin["hopping_ky_0plane_i_",ToString[k],".csv"]];
mat0=Chop[matr+I*mati];
matr=Import[StringJoin["hopping_ky_1plane_r_",ToString[k],".csv"]];
mati=Import[StringJoin["hopping_ky_1plane_i_",ToString[k],".csv"]];
mat1=Chop[matr+I*mati];
matr=Import[StringJoin["hopping_ky_m1plane_r_",ToString[k],".csv"]];
mati=Import[StringJoin["hopping_ky_m1plane_i_",ToString[k],".csv"]];
matm1=Chop[matr+I*mati];
matr=Import[StringJoin["hopping_ky_2plane_r_",ToString[k],".csv"]];
mati=Import[StringJoin["hopping_ky_2plane_i_",ToString[k],".csv"]];
mat2=Chop[matr+I*mati];
matr=Import[StringJoin["hopping_ky_m2plane_r_",ToString[k],".csv"]];
mati=Import[StringJoin["hopping_ky_m2plane_i_",ToString[k],".csv"]];
matm2=Chop[matr+I*mati];


fullmatk=SparseArray[{
Band[{1,1},{nn,nn}]->{mat0},
Band[{1,1+(2-1)*basis},{nn,nn}]->{mat1},
Band[{1,1+(3-1)*basis},{nn,nn}]->{mat2},
Band[{1+(2-1)*basis,1},{nn,nn}]->{matm1}
,Band[{1+(3-1)*basis,1},{nn,nn}]->{matm2}},
{nn,nn}];
upmatk=SparseArray[{Band[{1+(2-1)*basis,1},{nn,nn}]->{mat2},Band[{1+(3-1)*basis,1},{nn,nn}]->{mat1}},{nn,nn}];
dnmatk=SparseArray[{Band[{1,1+(2-1)*basis},{nn,nn}]->{matm2},Band[{1,1+(3-1)*basis},{nn,nn}]->{matm1}},{nn,nn}];
(*upmatk1[[137,1]] dnmatk1[[1,137]]*)
(*fullmatlayerk=SparseArray[{Band[{1,1},{layer,layer}]->{fullmatk},Band[{1,1+(2-1)*nn},{layer,layer}]->{upmatk},Band[{1+(2-1)*nn,1},{layer,layer}]->{dnmatk}},{layer,layer}];
*)(*HermitianMatrixQ[Round[fullmatlayerk,10^-4]]*)
(*fullmatk = (fullmatk + ConjugateTranspose[fullmatk])/2;*)
(*fullmatlayerk=SparseArray[{Band[{1,1},{layer,layer}]->{fullmatk}(*,Band[{1,1+(2-1)*nn},{layer,layer}]->{upmatk},Band[{1+(2-1)*nn,1},{layer,layer}]->{dnmatk}*)},{layer,layer}];
(*HermitianMatrixQ[Round[fullmatlayerk,10^-4]]*)*)
fullmatlayerk=SparseArray[{
Band[{1,1},{layer,layer}]->{fullmatk},
Band[{1,1+(2-1)*nn},{layer,layer}]->{upmatk},
Band[{1+(2-1)*nn,1},{layer,layer}]->{dnmatk},
Band[{1,1+(uli-1)*nn},{layer,layer}]->{dnmatk},
Band[{1+(uli-1)*nn,1},{layer,layer}]->{upmatk}},{layer,layer}];
fullmatlayerk = (fullmatlayerk + ConjugateTranspose[fullmatlayerk])/2;
eval = Eigenvalues[fullmatlayerk];
eval,{k,1,kkm}];



Print["start exporting !"]
(*AppendTo[evallist,eval]]*)
SetDirectory["~/Desktop/ptsn4/updated_v1"];
Export[StringJoin["energy_bulk_lyr",ToString[unitlayer*uli],"_kmesh",ToString[kkm],".dat"],evallist];
Print["done !"]
Exit[];



