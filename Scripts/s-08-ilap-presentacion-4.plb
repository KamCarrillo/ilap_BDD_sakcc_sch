
Prompt seleccionar la PDB para validar
connect ilap_bdd/ilap_bdd@&pdb
Prompt  Indicar la Tecnica para fragmentar servicio_laptop:
accept p_fragmento char prompt  '(L) empleando Laptop,  (S) empleando sucursal: '

whenever sqlerror exit rollback;
set serveroutput on

Prompt Creando procedimientos para validar 

Prompt Personalizando el formato de fechas
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';
set linesize 500

create or replace procedure sp_verifica_tablas wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
23f 1f6
Ye/lfIeCHQl838aibqrErDh3YcIwg3n3VdzhNXQC7QJGv31V0TnX/GKvkbRiCZCQSItblkmZ
4kA2r6nuOmKZBGzcZaH4Mv/e6yZWwVQ2bUv4X/jJmM+60fzOXHLqgcuFgUWmA3XHfBxZFsYR
6/g1PCwzRQvPFOsen3YnRwCgriUeIsgIz6daQuC+Ro9QYGTUq6TnElhR0vZOEcP0UaFEv/E+
rXKnwEr/1Sxxd+WbcWzWYZKu0/pHUDAB9K5xe9cWSfnVMqgoPD4Q95dZo4ztGjtDvSPlV8VM
5XYBw/GeteKJflpg+fDlamCQxUqOXXa+WTpGh5WIlIX6OAJRa/pyIyzKHSSVatzaK/dqTeXy
XuJ6LfQRYgXSiyLZwpg1BqsRPG3Xkva6IHj2VxCcplQgIosFyVu7Ctc0hyqYYcxbDWrWIH/R
TF2PCo8gQ2AuOeuRIasApqVOpjOBJzqjlqfg0oNueZbYWfsh91qs7j14lYSJ0Q==

/
show errors


create or replace procedure sp_valida_inserciones wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
608 347
TC9+MHlYx5Dspz/636xO1XeMZBcwg43Dr0gTZy/NlAw6B7779/atrYPAbHQMNMVW9TeFAKjg
IHEU/XHd9wlDF5Ky7UP8LB7hmRvA4PP6p8m/F4vtePhvnHt7ZeEYypoHrrPfh4A4bl1WupXe
FcBDJ8q+qOm/tE4mhgKFx/M9dMYd07THogePQBs9uX6iz0n1PmUI07kq5ZYhI7ocm6BerMaY
PTLFcLyP2fgvth1i6ZjeDU7vZ9IXBem+iNDGJxBR2vsIrr7q1q0XYM7ztbIUfkH7wARBSJOP
li8mpgX5t4iFrQXCXPsK0siOlw2eUgkafDG1ngqkMEclpIUB99KbwNH1o3iiDBpbIuF+BYXd
q9Cr50fHNUtv+m4L7ws5u65h6Jd/8L7NAtyPmDckBrVQFTY+m37f+Dn//mvK1FhS5kMajrMw
FhPfLDFUK2v6yDfCLm4fk+wdDNyNwezlNQzT6T9noZTv2YSBQUAAjifi9jhMTi2E5qImhI1k
xHaKyVT+ifo4xsKOuAlYPgIq1tiVGYCT9b3tQ9o2ibuTbzvrzyViMBeHkOzSa3Ch5GFgdGM8
AuP7tNji4XDKGo1b6IRrLWYbuIKrkK36wHbE3LkjWk25IBptRUQC3tZOPvYQFXEyI67WgS20
xhuYFFPvk8658E57/lwHQ5TDbTUkeJc9PDaFCA1lAW56pLU/j5diKBwDEQML5PybhxvtpwVb
6JYWtdwm19Nd8zBsNqodqkq1cP2vaggqtRBwHk1uLsRzMR8JdANsjF3FeoTTSROECX8XBfF+
8wNGgRD9SQ3vvqsNddjblKW4kkMkr5D0+A==

/
show errors

create or replace procedure sp_valida_insercion_blob wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1f6 1a5
jBPHPbV1ta/WmvbNhkHctDapoNYwg/DIzPbWfI4C/oOste68MazVCTM8rePs4jjsWlkzqyUr
QI/gfyWw+c7peGtMLN9aj8BOkMeuSK+TrF76f7S3ex7oIidc/boyB0UqJ5qg+AJ4T5TFOPGe
jbaeuWlYxnVbfA3MZhSXSA82GIIhoBnzrp/jZO0601op1wvk8k1OFAWakhdTQR3gB1tI1PM+
Lebp9/c2vRVNFW6CvDBxBzjOjs4BRI2toOi79bGrpVvXisC+KrXekqY0kk15mg08JuKPf7ui
RHCQJgBckBn2ULLPK9S9uTROCEma1NH7djK7Szj2cKNX9sSimJuc/Vvu2NsdE9RCJnWOAo7V
v1xgFofOzI7tphKZ+ee1T4oLyPV00xdWQdTrjoU8XOK0es/7aYtAEQ==

/
show errors


create or replace procedure sp_valida_conteos wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1f5 1b1
B5PqBr8rKkrEU3MNTYBLwy03hj0wg3nM2UgVfC+KjfLkahnTGo7MI9VE+qGn4Cq094bSJ4hL
aRqOjBTN9NBktoeUlfE7gbmKMNQTnhw4bplGI2Q/9ZN+oKMFTAt+zf4sEiYYV7eFlPSR3NNw
OmWi891s0JMYrNvkrunxfKiloaKgyuB6puyBLITPsEcIs61oCbzXuUv6RGGlQcohhOklIWvz
94mCAua47iTwgIycwQ4C0nozcwHFmf0djTFvMl4xqxhVgyuNk3hvM0UlaScR0peQBSXi9b2H
sSNXboFB4hkvSxkT8iB+cyP7c+u/6U5cC5+VENKzj3AGm3WRtKeGuFg+QdkhnITEXOaIkhn1
e5D7tefRjvEKM07k/eXdE5aASELWA6bjRZM1eL63PQpK/zEIEG8dkJiFRLcHD0LFQL8=

/
show errors


create or replace procedure sp_valida_insercion_main wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
b87 3a8
nYqYfNwTxzLkctcSFfVAyJXdWjMwg2OnVUhRZ47G/iu3vGq+hLaDfNbD8DEuTSVivWb70p9l
NUXa/ZHnaWSS5hLt0FAfBTeDOwV7jt5RH8hO2sGqvNIw+SdIYjy8ROlgMyE4uvJUo9tC2zDy
n4ljHdBokov+Y0NA1bR1+eT/0ggvio9RqrO7eYXPDZ+EuLHZ/dksyi49QIII+VGqCxDEVZc5
Z8/h0H5Zxod1258d2U8F1bGeOUDoJvL6ZdyfegFscqFKjj1M2txDXXSev1HS3Hd9jSdZyyxn
7IoRjrD1xgagXTtliWtT2uW/gAUbetSM1gdWwcxxUHnZQEE5Uuppu55hudh/IlBs16qVbGwS
YfC6YSvUBq5Lkkm0tfG5gRKwUkbwJuWOKLOEh1BGaNX8TRnHPqmzXYntw5oRIyWdw9ArMqWQ
ELY3pc7jtG0x6GKbZ4Oi3KG3nTz/B3TXyObwnvdK0N3xG6FuxPp03rJ1ISoQgzdlaR09VLZr
f2uT+gOXaM5wG+KaiG1ip1Su1BcE7yF7hMbDqhdoZYCnPBByiGRa5K80IcDwCmmyga4r47WC
b1IJiaDPFoUKXYvdtz75deJEtMQvkjPASzN6UnZ2pNNqqM9cdkQV2tkCnAinRgqqBAbPctuh
wI5DmvUMSy2oxqZddiVFrAsUWwLD2b3sHvN2/Ptch+2V12XKCjJ9O2rVCGxKzaMdAV5PESmn
atnfr0N4MLZciP8j8A01PX31TSnnvzvegC/q1WKUxcUnXCMQ68tW4CNBC3LXacjbm3ONJFPb
7OjvDdEXXK1B1lSJ5ax2ZexeWhaJrp2MiemOYX9owdLG4oOM4wBzoQp4IOYPPg1kGYaM4Q2d
U6lW/78GfGib4Z5BrE6KMSbNXOdBLA/sY3oenx9wmv8OvLeVaorZD9/M8mM=

/
show errors

create or replace procedure sp_valida_insercion_blob_main wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
176 130
US6rQzlFCKel3k7O7TbaXWvppaswg41KLm0VfC9A7WGPqoXXK6JFFzVaJS05JVmhJSN2/MZr
DlyOM/67isIcaLeZx+xCmkJB1IxAwoHKHHiSinJqLbA4z265B+57JfnPVetjLGA4FSEueyW0
RRZxutWlCt7lDmVKKHre092sSgZJ8dfHOHGiCNi44IYtb/vPF6A1wsL0tM+7v7pwzyb8Z289
wqwRr1xSE3kaSjucvlQfR/LmhJCg6ImRdp3uSUqOeMLQUVTkwG8DJKmT/z3+gRktFeO1XiN/
++riGw8avHCw

/
show errors

create or replace procedure sp_valida_registro_invalido wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1f7 1e6
ds/TqXmMwURw9QG+m989kfVNKmwwgy7Ir9wVZy9A7adGv3W6BRrxrBx0NrcB2rSNYbphOwbe
A6/lLlmojgAEGZeApZVoYo4AWcn5qp8bmn7FV5UOL+fXKz/l/vyT+kw6oyr4VWArMh5+kgDZ
oUPCZwg2KKJQyOP3WyZff/qFAEEAH1Q8u4ESgjQL9BzhtlPmo13nVkp/cKLqsFy2TnfhNVRA
8Rre2xb6iK4Unq8Cx62bc/2aA7oqQNhG5UiXVfnB/SInfQRrC3a0yYjd7riLZUBjsv1mRC6T
u9kjTD4WE3+0TNBAFYiSSEmuEUjZQNUYJqglVcYvto9C42bWaHeDC8eFp/NDNyLRN28wfRIb
8Eop/HXiEMSQs+8rfG2C+m16Yps3y4gtNqQSe5AZ4Q8wqhc9/VcZRJYsY2GxIPwM3g1c2j0l
ujydDLJkAb0c6YLmH2BwiTgeWJp58BSm37GN0RsfnTBi1lw=

/
show errors

create or replace procedure sp_valida_reg_invalido_main wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
806 3d5
hhytNsyuC6a2pA50bGgahNvpYt4wg5XDea4FfC8ZsSv8qlMgSGwdQoBEzYQ3SApAFgw+C09W
eH/IPi2CBSZwnT9K6x8R1ZTeExFMlbzHQZjBKVVMxoZO7pUhHKzF+m6Lk/L0kSgUhjPKWjWC
y4yhsFXemvEg0WjLBk6W1rQeI0qG0tw7PQXegb+j1pA8uLAqg2FBsiTQ4nt5qZIXp9cpXe8O
knTIUpUa3yhiZ1yhbJTXa5ho91aVyF31/3x86SHXxxvNn/9T6ARTFsklV9rNKwqNXpAplzT3
mflQisVY/tjr415/RFVQUnF05xC1f4hbh31gIuYE5pgv7FlysAiRuEK4pK4HFx2GJ8I2hplu
aj8kpWYLon20AF9msLs9lu/STTJCwPUaWCUH9BYv/Gvro7VsOLsQvRIFRqSY+f04tRC9+LLu
mJiUOB+YZH0ZdEl4qoAzATVbEn3REXlL3ILyCejTl43dDpP/uUQfRifUt1mlHCGpZNWxp95d
LPX4EGTBkhk3Hvj5p/nuvEbYU/06ep6hvWLXQ/IllX/6dYl+gMXo6HcD8i7CCtenVvf64IDT
rWINFmsFenkRh5TbcYV0dfeEE1in06FtkhTeUfCAKVZrGEtJYiYVuJag3W3Y9SuejEvk+iFs
TlYBFeCjxz7pFY4uAnEFEYdQRlKjkWBGH7+Zr4LtU7TKlmWJX5QB3Kqxv3hjVCvI9xqIVr8z
CwfyuGhkYjLudQOvUHKRp22TxAevKHzSLpAj16fqQrySKEmxXZ+4rUUEyLR0cvouehuM1faI
vx4I9LPl0NOvOGBCl1/FDZf0yFazySwGLz2GxA1bRxKZddakmWF4KqqzzGR/eRJ4MG8vPDv0
sfuch0QyA7xih0uIIDHeMrQYXs7SlD9cR3TzcK7oQAR8y9mopRsQFTvnLh7kA6bzYG1ATagu
73w+ygFwBThi7Etwgb8wMlKS7ihltwzT

/
show errors

create or replace procedure sp_valida_replica_tipo_monitor wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
401 270
izAvm/GCOM/chY4mAyftxlRtdfMwg5UJsycFfI5V9p5zB/iL9ZFsKZt8fXG4fgGUXBTv2VWM
pX5553E+VPI4jKoNrrTQLuUuYV8AgWPKr43/7cFu1VXxA3aUKoCPM5stKTKxhTXNElXfJR7t
jSg8ESBb3T06iN3tR5MuRFAjxDXkkuR+1iI4q/dL/MKFNuE3DBu/X+CvV6JN5uHA8VXvWqj6
nAqR+0TlwErZdoLsG+lTGEJPIPMkYpxT5yoKDoKbL4lb5X1w+TPhfJSKfRHZMcuLf811zijr
4wDBkMrPKmaM5JHSMUmRoM4FxeQIq0VjCBvvXens6mQOOvmUIbGWUDR1+f0g0J34CDk8ykjz
8IVfF1PmZdUMrE5ZRuD0VxfP+bknvuRLcRQaN95ArgezVBGjqude+YaxrgSQDZ8Ewx4TWwE0
4QHdBf97fWqfg/Ye0WsJDvBe1ijpW7ZNnd7BW5marzEZrF62jXMGgYwr1iovknXXQUEb+Iao
vaMSVVdQTFCei3b1xdMjHhMi1B4UYSKE7gGl32CVyeqhK23Cb5w4DKw+7Ene7BmmmLqmtQ+3
DyjoPTwh6AOw1/BdbvPC+puYL1uQHnid+3m2y4Q=

/

create or replace procedure sp_valida_replica_tipo_procesador wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
426 274
ePWSJxwWJGp07Nb0MOW1EX4Aw6Mwg5Ve1ydofC+5Mh1CB75CXmE4eFWEyjJn9vb98zsBkdoA
nj0rbd0NX2OyIV07kucQLfL2A962I94orefUksm8LBJux6ePoAYEfpa5AQr9Pjk9xEWnFSkZ
4z98DcLCfx3IBtI2j9wU2JfyheVVOU4K67ey+Vpl52mNsE3bafFu9HovHxYB5KaUU0ZGUdp0
f6L6wJRiypXpFaFBL6eVzPxk5pqw/UcPfOfxki2NsasmFtx6urh/qhI5FNUxsz2nA6RHhAUt
CGwx5yyjT9bPKqyM0PoIr3wOVnNVgnpYM/oDuNYWcyhDbepeP7Unlx6qaSITM6l+0A9zairY
azSvk2fJdvfhmYnBiRRN0mrhx//O5FWVwEK+caLDFaAGpc+V2h3CnxK1LHrk5PuMvoN01uWQ
5Oh7sGcyj1kLVqD5VM2gLcFpFlCQXNZOhPj/A6o9PLI5vNYqO/sKG8VOMSkSOznrN9BlEwAi
3L3UB4X2gaOjUPCxm/lWIcUve4aR/fwyjiVyS6qtkf3l9QPVNgqXNMVyc/OJkTAclVLPsoqf
++SWrZ2KmKMT3J/wOoKahXKIY/2JaJKDDEztOkRHFXba

/

create or replace procedure sp_valida_replica_tipo_tarjeta_video wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
450 280
UpkzNhlgPWZyGhjDOG2Jks8IbFIwg5Ve10rrfC+Lg40zpIun0cUKnyn73vry3gbCyetXwG7A
oFngyMxLCrQ7oBGaGICPlUsTTanD0bi0alqGOjq8IGBB8fGOASrpcL/kyns9nhnZTLCrr5CD
iLmitel7ryjljTm4MkL7S0M+Jpk56e2TqCMSQi3mu7jzZa/8ZQwE4UAMFZPmmu+npWL/L63J
1dvK17dirARR9bzjychrxWNTWX8+BhZOa2n+7hyzx8p2F7zH7qFboHZjHHyFWLw04XF8wPHE
6JEd62mfxXpteMN2CnJdKeCFKKxgKYBDyI4xuwbunCOdAmai8Xq1IPkTF4uqc0fk2aqPnau1
W4dPP2oF2lThmIDphVkRrNXbt8JHUux8mkfzY0bcD1VHwSCLAxYffEH7bq0deWchSLtyQwXQ
u3x99lma2dT0ZAnavQnWgjstUEIDlz4LZGvxDqCN7U4uEs29ItUeIx3QcC4X3Zfzl8/1/A6R
ICHO3hu3sLBS4+7zQuKQ0280b800opk7dKn/V7NEqogCRFnImiiHW5a6ecXcJys8ioP9clI3
6Mx2xr9nHMlntSL8sO1IibPmxIty81ue8pvPjRooGf5+xJY/4QQxPlw=

/

create or replace procedure sp_valida_replica_tipo_almacenamiento wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
45e 284
QxXjmayjbEeu00DsVhRWTBvx3zowg5W3micFfI7UvxPmmu5oraSToUVxdHsfjpOT6QHZhZ+/
PiG6/eHGnmEJVCm6zfMz4Lfgv6rKiuB0I6jvHs/Bz53v9cCvf6HFNXC02Vs97GD6h7u6XtUp
RxnyPbnDO9oNgkXHbxFSPzm4ln9kwtPCxVUvUhA/YagsEW9mLyJcQQ7xZ6HH0fMM8xuI8j76
8j90Hxo2R1AANwRmNHHpmVpaN0TXf0OTdmz5Fn0iGdNSwhga9K5MQpotdu+06nSiTrEfZ9Zy
gu4rpY6LgMIX7imsjF0WJGwvCsx8ZS7SgDBnk5vaJOQn3Zqib9wvC7U3j/yVvRm8V6+SLOfR
6L/mxCQPlfj9VIRCDMIvWL2imWbMQYIYzCm3bPOsbToTCkObVcDzf0TrWt0m931WTYOk5Ip6
P7U573B5+Iex3M005ta53THUy1CSKgQXiri9AjnrskW/IilQQgeWybjtAmR8tDwVDrAJM7eC
KGD+YR2a/34z0iEyf/miGfYgd6boCIdBUqlgB6z/ez1Ac3ueeHzv+ax934rxLqNah41CXIeS
bIjXhXoYhs45zlXh2w8jc899JwvaPSozchyAKK+IBcrPwf4ZuZI9KNso1eI=

/


Prompt => Personalizando el formato de fechas
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

set feedback off
Prompt ======================================
Prompt Validando nombres de tablas
Prompt ======================================
exec sp_verifica_tablas 

Prompt ======================================
Prompt Validando inserciones 
Prompt ======================================
exec sp_valida_insercion_main('&&p_fragmento')

Prompt ======================================
Prompt Validando Registros con datos BLOB
Prompt ======================================
exec sp_valida_insercion_blob_main

Prompt ======================================
Prompt Validando registros con datos ivalidos
Prompt ======================================
exec sp_valida_reg_invalido_main

Prompt ======================================
Prompt Validando Replicacion de tablas
Prompt ======================================
exec sp_valida_replica_tipo_monitor
exec sp_valida_replica_tipo_procesador
exec sp_valida_replica_tipo_tarjeta_video
exec sp_valida_replica_tipo_almacenamiento

host sha256sum s-08-ilap-presentacion-4.plb

set feedback on

Prompt Listo!
exit
