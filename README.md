# BUROCRACIA_JAJA
Code for Medali & Geikha's single [*BUROCRACIA_JAJA*](https://geikha.bandcamp.com/album/burocracia-jaja-coded-02), which is in itself an edit of the song *30 Grados* by El Turko & Mandale Flow. Made using [TidalCycles](https://github.com/tidalcycles/Tidal) and [SuperCollider](https://github.com/supercollider/supercollider).

[![image](./ART/BUROCRACIA_JAJA_ART.png)](https://geikha.bandcamp.com/album/burocracia-jaja-coded-02)

## About this repo

### TidalCycles

`BUROCRACIA_JAJA.tidal` contains the code of the song itself. While the `SETUP_250225.tidal` file all possible dependencies for this code, as it's my own personal setup file.

### SuperCollider

The `SC` folder contains a minimal boot for the project. The `SYNTHDEFS` folder contains many of the synths and effects I use as of time of upload.

### Samples

Samples are stored in an encrypted .zip file, you can use the password `geikha` to unzip them.

## About the licenses

The code inside **`BUROCRACIA_JAJA.tidal`** and its resulting audio is protected by the **CC BY-NC-SA license (Creative Commons Attribution-NonCommercial-ShareAlike)**. This means you are allowed to view, share, and adapt the code as long as you credit me somewhere. You cannot use it for commercial purposes, and you may only share your modifications of the code or its audio under this license or a compatible one.

The code inside **`SETUP_250107.tidal`** and everything inside the **`SC` folder** exist under the **GPL v3 license**. Meaning it may be used, shared, and modified at will. But distribution of modified versions must be shared under the same license.

---

```haskell
-- Original code, which turned into the full-length track
-- CC BY-NC-SA 4.0

do
  -- MEDA/BUROKRACIA/GKH;LIVECODED
  hush
  all $ id
  setbpm $ 150
  let trans = note (0)
  let note' n = note (scale "minor" n) |+ trans -- 5A
  let kb = slow 1 $ (rotR (0/8)) $ mono $ g (beat "[0,4,7,12,15]" 16 $ 1)--foot "<0 10>"
      kb2 = "1*4"
  let bsp = "<-7!2 <-7 -4> [-2 -1]>"
      bsp' = bsp |+ "0_3 <2 . 5 0>"
  d1 $ stack [ silence
      ,kb # "shabdp:2" # note' bsp' # sp 2 # sh 0.63 |* g 1.01 # amp 0.6 # cut 1 # lpf 8000
      -- ,kb2 # note' bsp # "909bdp:22" |- note 0.12 # cut 1 # sh 0.85 # eq 45 2.8 # amp 0.66 |* g 0.95 # atk 1
      -- ,"1*4" # "660bd:4" # hpf 150 # ar 0.06 1 # e 0.8 |- note 1.5 # sp 1
      ,un1 "1(3,3) 1(1,2,1)" # "jktnsd" # g 1.02 |- nt 5 # acc 0.1 # rel 0.12 # atk 0.2
      -- ,un1 "1(3,3) 1(1,2,1)" # "tri:1" # note "5 0 0" # rel 0.3 # sp 1.5 # hpf 900 # g 0.9
      -- ,press "1*2" # "808cp2" # sh 0.38 # n 1 # amp 0.62
      -- ,rotR (1/4/32) $ id $ press "909oh*4" # re l 0.2 |* sp 1.49 # hpf 200 |* g 0.97 |- note 5 # b 0.02 # eq 7000 2
      -- ,"traphh*16" # n 4 # rel 0.1 # pan "[0.4 0.65 0.4!2]*2" |* g 0.9
      -- ,"1([11 9],16,[<2 3>])" # "808ht" |- note 8.8 # sp 2 # sh 0.2 # hpf 250 # eq' (4250*2) 12 2.2 |* g 0.88
      -- ,mask "ftt" $ "1([11 9],16,[<2 3>])" # "660ht:6" |- note 13 # sp 2 # sh 0.15 # rel 0.2  # eq 100 (-4) # air 0.5
      -- ,"808rim*16" # n 2 |+ nt 2.5 |* g 0.87
      -- ,"808cr/8" # n 10 # sh 0.88 |* g 0.6 |- note 5 # hpf 5000 # l "<1!3 [1 2]>" # wider 0.7 |- acc 0.23 |- fshift 450
    ]
  d4 -- $ offcut (-0.25) ((\x -> x # ar 0.02 0.18 # sp 2 # comb (rotL 0 rand) # pan (randosc 0.3 0.7) # sh 0.4) . (resetTo "[0~]*8"))
      $ quant 0 $ resetTo "0 0.25*2 0.75 .  0" $ chat' 4 8  "burocracia8ch:0" # cut 1 # sh 0.84 |* g 0.88 # hpf 200 # room' 0.16 0.3 # ar 0 0.2 # eq' 175 (-6) 0.2 # eq2' 12000 4 2
  d6 $ chat' 16 8 "burocracia8:0" # cut 1 # rel 0.4 # hpf 100 # room' 0.017 0.2 # wider 0.1 # sh 0.28 |* g 1.1 # delay' "0 0.05" (nms 7 * 2) 0.93  # eq (9000) 2.2
  -- d8 $ be' 2.19 1 "<0>" # "burocracia" # cut 0 # ts 1 # tsw 2 # sh 0.35 # delay' 0.3 0.3 0.2
  -- d8 $ chop 16 $ be' 16 2 "13.52" # "burocracia8:2" #cut 1 # sh 0.2 # g 0.93 # formant 0.9 # delay' 0.3 0.3 0.4 # gater 0.66 # krush 0.8 # coarse 3 # hpf 200 # eq 230 (-9) # eq2 (slow 2 $ range 1500 4000 sine) 4
  getnow 8
```
