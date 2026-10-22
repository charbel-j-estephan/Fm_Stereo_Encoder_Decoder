# FM Stereo Encoder

## Final version

The final version is Encoder_gen. Open Encoder_gen.kicad_pro in KiCad 10. It holds the schematic (Encoder_gen.kicad_sch) and the board (Encoder_gen.kicad_pcb). Use these two files for printing and for building.

## Goal of this part

This board is the encoder half of the FM stereo project. It takes the left and right audio from the J3 input and turns them into one stereo multiplex (MPX) signal on the J4 output. The output feeds the FM transmitter module.

The board does these jobs.

1. It protects the inputs and filters the audio to 15 kHz.
2. It builds the sum (left plus right) and the difference (left minus right).
3. It makes a 38 kHz carrier. A CD4046 phase locked loop locks to a 19 kHz sine you feed into the BNC (J5) and doubles it.
4. It modulates the difference signal onto the 38 kHz carrier with an MC1496.
5. It adds the sum, the modulated difference and the 19 kHz pilot into one MPX signal and filters it.

JP1 flips the carrier phase. If left and right come out swapped at the receiver, move the JP1 shunt to the other position. No reprint is needed.

## Other files in this folder

- FM_Encoder_Build_and_Test_Guide.pdf is the stage by stage soldering and test guide. Follow it in order.
- FM_Encoder_Buy_List.xlsx is the EKT buy list with links and prices.
- Encoder_compact and Encoder_final are older versions without the 38 kHz generator. Keep them only as a backup.
- MC1496.kicad_sym and R0.kicad_sym are symbol libraries the project needs. Do not delete them.

## Known open points

- The J5 BNC footprint is an estimate. Replace it with your own footprint after you order the part, then check that it fits.
- R51 (12k) and C47 (1n) set the VCO range. Check the free running frequency on TP33 during stage 7 of the guide.
- EKT does not stock 360k, 2.4k and 1.2n. The guide shows the substitutes.
