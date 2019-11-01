Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28373EC07A
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 10:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbfKAJZ4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 1 Nov 2019 05:25:56 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37147 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfKAJZ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Nov 2019 05:25:56 -0400
Received: from imac.fritz.box ([46.142.157.91]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MGQSj-1iBqCV0Niv-00GnEz for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019
 10:25:54 +0100
From:   Michael Dreher <michael@5dot1.de>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] USB: serial: ch341: fix wrong baud rate setting
 calculation
Message-Id: <BFA71FA8-3944-4203-B842-77C375BDC7A3@5dot1.de>
Date:   Fri, 1 Nov 2019 10:25:53 +0100
To:     linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.11)
X-Provags-ID: V03:K1:7cn8hZ2HoRSLicL1MINpeXlnrULrYRnNFPiqT0wzREKywAeAxE/
 a5hG9xty8pHFr/x/PX63MzW1227ncTO2SgClaTEI+rzFOFth5tUYj+Bz5jhS+eA0U/ImXQH
 Chm93gwyXuKM43cFq6sOMqI2ZE2N0pLNs/ZRWZ6sCURL+cLq8tEB6sRBwJk7rzigPwQOFxC
 oDk70+2Jw442n925AiKEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+XmzQc+b17c=:QncviCtpi23/z07RB4xlwC
 QN5zaCU+0SICFdwkqmsLlrGOWW6hU81fNMBtTR41DfxOfW4HlfFypEk+gF9IXK4j8dcBZRK5t
 TSKcJmsfF1QP8UskYmD6H2CjOLyWnIw9LLKkxFXKOd2xmhthm6umDodpIr3K+f5yNRPVrRBME
 gBoB9AjNVxUhAjOJRymboeOoEW9XNZdHS4V+Na83YFE6AEQFx303BGwi619f+gjtP8/xo4dDI
 0726myvea2EkmkFnBFdqn8VavtJQy7Xyi/8yxLnFtD8IlkUPe6f7rWDdbLgxnN0WSspWNol/s
 19xl3QkvUGTXy9US/w5Vsi6C131RkRUeT00MPn538Rhd67njuNckItLM+X7GvexyIv3lukVPK
 G41ntRINzqmGkNKtM8w0hKPz89WzJnQ40zdrL6pvHwytepDpfnEueRTtPgyJAYkh8Jzo0H5Hg
 6o8EwSKF0agEJtRuAdjhSSpCiMy1daR00gzTgwyY0+3HeYFG+S7gsSuXmY5xAtM32u27M4dyl
 WaL84LWzHA83NWt0o/Ue0tHP8JH7DV8+PZbbHdaabgWvVFmsURGZm4Q7206HRzr/V2poRX8/s
 ObebjsfUJp//GruCweW0AbluKao3w11lKMkGk59OvkT6W03HzPCH+AbKYkTbucFtOhbDCZGty
 crxpRpNrFkag/OwCJcyINnSSiaZj6Noid01hBcKoJVp38M7UgPFrNRHUYQ367b2j0L3/Vsa4i
 BkqXIrnjR9c6mJn/+Paaw3hOczslgYorBcE53kCIzELanIOrI4cuoHWug4ajeO1F4QnggKtyU
 9vaGxXRJSu6g4jX2BgW/6pINVvYb14pYEckHZZzW57qsUhgldPzNe90BT4BSFdL0WfLMXOkXF
 L0UzptlJwbTbMn+MXUlBE8yoX3wMCL1/lP2wRId6Y=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan

>> https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/README.md
>Interesting! From a very quick glance this looks very promising (although he doesn't seem to handle rounding yet). I'll take a closer look and compare with what I've done. 

That’s my code. I actually do rounding. It might not be obvious that the '(*2 + 1) / 2’
in  ((2UL * CH341_OSC_F) + / (prescaler * priv->baud_rate) + 1UL) / 2UL
does a bankers rounding, that why I explained it in the README.MD:
https://github.com/nospam2000/ch341-baudrate-calculation#rounding-issues

Rounding issues

Why not just using the simple formula (CH341_CRYSTAL_FREQ / (prescaler * baud_rate))? Because we are using integer arithmetic and truncating values after the division leads to an error which only goes into the positive direction because the fractional part of divisor is lost.
With floating point arithmetic you would do 5/10 bankers rounding to spread the error equally between positive and negative range:

divisor = TRUNC(CH341_CRYSTAL_FREQ / (prescaler * baud_rate) + 0.5)

which is equal to

divisor = TRUNC((10 * CH341_CRYSTAL_FREQ / (prescaler * baud_rate) + 5) / 10)

The formula in the code does the same but using dual system integer arithmetic and therefore use *2 +1 /2 instead of *10 +5 /10.

> I also noticed that we should always pick the higher base clock if the resulting divisor is odd (and within the valid range).

The general rule from the perspective of mathematics is to use the highest possible divider (and therefore the lowest possible prescaler)
because that gives the lowest possible relative error in the division. As long as the result of divider*prescaler is the same it doesn’t
matter which combination you choose. For example my algorithm prefers 1*208=208 over 2*104=208 of the other algorithms which
doesn’t make a difference.

At 110 baud there is the only difference between my algorithm and Jonathan’s code for the commonly used baud rates
because I  pick 512*213 whereas he doesn’t use the 512 prescaler and therefore uses 1024*107 (both values are odd).

The reason why my algoorithm and Jonathan’s have different end results is because I use all possible prescaler combinations and he
doesn’t use the prescalers 64 and 512 which gives different results for baud rates around 100.

Please look at my comparison table at 
https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/patches/README.MD
which is created by the unit test
at https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/patches/check_baud_rates_unittest.c

baud    errOrig errMike errJon  pre*divOrig     pre*divMike     pre*divJon
46      -0.10%  -0.10%  -0.10%  1024*255        1024*255        1024*255
50      +0.16%  +0.16%  +0.16%  1024*234        1024*234        1024*234
75      +0.16%  +0.16%  +0.16%  1024*156        1024*156        1024*156
110     -0.44%  +0.03%  -0.44%  1024*107        512*213         1024*107
135     -0.22%  -0.22%  -0.22%  1024*87         512*174         1024*87
150     +0.16%  +0.16%  +0.16%  1024*78         512*156         1024*78
300     +0.16%  +0.16%  +0.16%  1024*39         512*78          1024*39
600     +0.16%  +0.16%  +0.16%  128*156         128*156         128*156
1200    +0.16%  +0.16%  +0.16%  128*78          64*156          128*78
1800    +0.16%  +0.16%  +0.16%  128*52          64*104          128*52
2400    +0.16%  +0.16%  +0.16%  128*39          64*78           128*39
4800    +0.16%  +0.16%  +0.16%  16*156          16*156          16*156
7200    +0.16%  +0.16%  +0.16%  16*104          8*208           16*104
9600    +0.16%  +0.16%  +0.16%  16*78           8*156           16*78
14400   +0.16%  +0.16%  +0.16%  16*52           8*104           16*52
19200   +0.16%  +0.16%  +0.16%  16*39           8*78            16*39
31250   +0.00%  +0.00%  +0.00%  2*192           2*192           2*192
38400   +0.16%  +0.16%  +0.16%  2*156           2*156           2*156
45450   +0.01%  +0.01%  +0.01%  2*132           2*132           2*132
56000   +0.13%  +0.13%  +0.13%  2*107           1*214           2*107
57600   +0.16%  +0.16%  +0.16%  2*104           1*208           2*104
76800   +0.16%  +0.16%  +0.16%  2*78            1*156           2*78
100000  +0.00%  +0.00%  +0.00%  2*60            1*120           2*60
115200  +0.16%  +0.16%  +0.16%  2*52            1*104           2*52
128000  -0.27%  -0.27%  -0.27%  2*47            1*94            2*47
153846  +0.00%  +0.00%  +0.00%  2*39            1*78            2*39
187500  +0.00%  +0.00%  +0.00%  2*32            1*64            2*32
230400  +0.16%  +0.16%  +0.16%  2*26            1*52            2*26
250000  +0.00%  +0.00%  +0.00%  2*24            1*48            2*24
256000  -2.34%  -0.27%  -0.27%  2*24            1*47            1*47
307200  -2.34%  +0.16%  +0.16%  2*20            1*39            1*39
460800  +0.16%  +0.16%  +0.16%  2*13            1*26            2*13
500000  +0.00%  +0.00%  +0.00%  2*12            1*24            2*12
750000  +0.00%  +0.00%  +0.00%  2*8             1*16            2*8
857143  -0.00%  -0.00%  -0.00%  2*7             1*14            2*7
921600  -6.99%  +0.16%  +0.16%  2*7             1*13            1*13
1000000 +0.00%  +0.00%  +0.00%  2*6             1*12            2*6
1090909 -8.33%  +0.00%  +0.00%  2*6             1*11            1*11
1200000 +0.00%  +0.00%  +0.00%  2*5             1*10            2*5
1333333 -10.00% +0.00%  +0.00%  2*5             1*9             1*9
1500000 +0.00%  +0.00%  +0.00%  2*4             2*4             2*4
2000000 +0.00%  +0.00%  +0.00%  2*3             2*3             2*3
3000000 +0.00%  +0.00%  +0.00%  2*2             2*2             2*2


baud means the requested baud rate
errOrig is the relative error of the resulting baud rate using the original code
errMike is the relative error of the resulting baud rate using my new code
errJon is the relative error of the resulting baud rate using Jonathan Olds' code
pre/divOrig the values of prescaler and divisor using the original code
pre/divMike the values of prescaler and divisor using my new code
pre/divJon the values of prescaler and divisor using Jonathan Olds' code

  Michael

