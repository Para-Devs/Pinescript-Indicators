//Takes multiples SMA's with periods following the Fibonacci sequence up to 144. Finds the slopes of these SMA's then finds the average of them. 
//Under 0 is trending bearish, above is trending bullish. Tuning the Slope Length can be helpful in finetuning specific markets. 
//@version=4
strategy("Fibonacci SMA Sweep Slope")
src = input(close, title="SMA Input")
slopeLength = input(64)
sma11 = close //simulating fib 0
sma11_slope = sma11[0] - sma11[slopeLength]

sma12 = sma(close, 1)
sma12_slope = sma12[0] - sma12[slopeLength]


sma13 = sma(close, 1) // arbitrary but makes things ezier
sma13_slope = sma13[0] - sma13[slopeLength]


sma1 = sma(close, 2)
sma1_slope = sma1[0] - sma1[slopeLength]

sma2 = sma(close, 3)
sma2_slope = sma2[0] - sma2[slopeLength]


sma3 = sma(close, 5)
sma3_slope = sma3[0] - sma3[slopeLength]


sma4 = sma(close, 8)
sma4_slope = sma4[0] - sma4[slopeLength]


sma5 = sma(close, 13)
sma5_slope = sma5[0] - sma5[slopeLength]


sma6 = sma(close, 21)
sma6_slope = sma6[0] - sma6[slopeLength]


sma7 = sma(close, 34)
sma7_slope = sma7[0] - sma7[slopeLength]


sma8 = sma(close, 55)
sma8_slope = sma8[0] - sma8[slopeLength]


sma9 = sma(close, 89)
sma9_slope = sma9[0] - sma9[slopeLength]


sma10 = sma(close, 144)
sma10_slope = sma10[0] - sma10[slopeLength]



smaSlopeAvg = (sma1_slope + sma2_slope + sma3_slope + sma4_slope + sma5_slope +  sma6_slope + sma7_slope + sma8_slope + sma9_slope + sma10_slope + sma11_slope + sma12_slope + sma13_slope)/13

color1 = color.green
if(smaSlopeAvg > 0)
    color1 := color.green
if(smaSlopeAvg <= 0)
    color1 := color.red
    

plot(smaSlopeAvg, color=color1)
plot(0, color=color.white)
