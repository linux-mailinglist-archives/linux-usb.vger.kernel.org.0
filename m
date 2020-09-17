Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C1726DE33
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 16:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgIQO1N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 10:27:13 -0400
Received: from sonic309-24.consmr.mail.ir2.yahoo.com ([77.238.179.82]:41338
        "EHLO sonic309-24.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727096AbgIQO0c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 10:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1600352754; bh=DoOGMeT+rzDkU+yXqlGJSeN+NYryD3fNpUhnbWupp98=; h=Date:From:Reply-To:Subject:References:From:Subject; b=cBD8yIkQ49iVw9QrZcEXzyNKnedUj+sefc7FJS/XRewzG2GHe+ZoFk6LUD10NPB1dT8zvxIu4z79xngSmZRaobiEaNhzmIZUkN7TI5jsYcRrhyK/wpvUPrKKMevaNeSeTZj+QBTGLz4japOPr6DT9hn9+bEX0AYNrdP/2D4NhJWMyuaUHseWmTwJoogL08ii7y0pNXaplqH7J10OtcpQPSLOxikkr2rpudP0rg27sSUtH4rVyNnefz1v61N0JuGjp6dcW9PYJzIqnAgW5xKcRx7JgPI06iVmBQq0okJa24T8qUOPN85/sZnO7u6Vwuv4csWGgCTaZgVNKBGoce3yxQ==
X-YMail-OSG: NrE4KJcVM1lq1LuGtuIChBYNHRxd9U6ML.jtlevdG8zyj72OLzO9gm6Hij5GP.u
 i_Gz8FG0NgFHCe9RfWAwmCT_CN5UkE5K4992WOWBChPrQ8T80sGQhLzfAMRlVh.KVelLS2QtEed0
 cYhjgadUZxsWk2ycSJcnB3p5MPxRYZMfj1Fi49cem7.RcRCCl9OGpDrdLX6lpsj4MTGPSa9ve5iB
 mWZljjNFE56y8xyhe0xJ0hvxhiFzJK2c8LbGPPibxHXBATaKZ3KGuRSCk5ndTb1ORlzC8jxZ3z8T
 SLBViXckRh5m.9cGIPSzfDCr8aSyGffg8VbzTo181A_QBXxrwfBi_eKQQPctXY5bmBRpOcwtQApp
 I75eYFQyMa0Qaze_UEm.xotesJ.ug5qeuzTO3e7h75ZagYoJQNg6P..9aU9HnwOWo4Fc_BE.6YHD
 xtRWSbsqLFX9U9cMlNnL0hWYZ.v9wO6INXqpxEBIgti8mjyvsvSryZenpE77iIhQea6xxbh2vHtu
 3yp.FmJXsztL3hCmI7l7aHfLMKpOubtWUkqdhtW6wbkhwb4qlmQ2W6e9zO5YTudn2LUm_vlnJRr_
 JyVrqb4L.HAHYhmY2UfGrtuCqP2X8JFmvOZdBgdIwOfxrIE4SZ52Kr5qbxdKz8qo9muusEW3J7Pi
 rGJ.YgA2ImPe.wk_Tx_nCuXsDpG6IG9vcZGu2k75mgJulFnOEW1zrqJr57oPotubNHKzQ4be38xg
 IC6TWHTockxuN0OlARtPjCu766Cv9hZEZvU.iktVaNCMycnL2wwDc4F_NDLi9bRZYmTBL3Y9InCL
 yeX0sKkaafHI2uHscuRM0ddkxBRHXobrQd9fT6eoeW9FfTupryG.RIPSnlKF_Uihdqk3C1hTegpY
 J32fSUIth5dBrwGwKIYeMoeLJhJRjCedNMLO6huZGyII8AtSw2eEY2hNm_Aeb.PJ4AQJxSlOS3Un
 jdSzsWl1KvBWHN.hEkkXLZ2Dq.ygKgk9bneDQmqBBed0CP8ERB5M6tw0qoleCKI35Mdp5QBb.fXc
 x2eJk2xb6kZKGMzjFNW2QTWquMn.azgtuKiEPAlHeBgsVNKUTegoMlsCcVn.wdI4fqm96GsiFK5_
 ssjD8khh.oraTAXh_6g7TNULpqtSWkNEZRTq6_7hW4EyAGS7Vc9cx1Pt9zULKhweLNyMprbFOsF.
 VqUXr8xxp6jEdNJeDvHRxqVt7VcnzOkPLoN7qFghsGP8zmIIRp3Q4IklIL8tBNFSIFt6KiyYTHaD
 lGYPqkVXV.8YDSXlNNMpYxjys86_K3xcvMlI5dYvtBRzd2TiWx.G0i.CzAoBHIhRed5zYQu8GjVg
 ikC6n5GdmAysOcg8ARYqaC1kbvAIitThvHWV649pcCWWXlXjx9H8JjQklcVLwnKyWuYB8Z_F1lB.
 yh9FX1unT_vYYDrDFi8L6C7vrtoSbyR48xxS8hfJcPiR9AwK7uuM9qFzo67w00Xy9Bg3.bVF3J08
 eYhcNCK_rgNN1n20.NqaK2Ln6jSdAr1iYbUVfOzXPUqEO2qM-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ir2.yahoo.com with HTTP; Thu, 17 Sep 2020 14:25:54 +0000
Date:   Thu, 17 Sep 2020 14:14:51 +0000 (UTC)
From:   Sergeant Emad Alabbasi <mrszainabmadina.golf@gmail.com>
Reply-To: sergeantemad.alabbasi@gmail.com
Message-ID: <1652095270.1121538.1600352091034@mail.yahoo.com>
Subject: Hello,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1652095270.1121538.1600352091034.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16583 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
 Hope I can trust you with the huge money I recently shared with my colleague during our peace keeping mission recently in an Oil reach area in Lybia.

The sum of $13.5 million US Dollars is my share and already with the company that will bring it to you for us to share 50% for you and mine 50%. 
Kindly reply for me to tell you everything directly [sergeantemad.alabbasi@gmail.com]

Thanks

Sergeant Emad Alabbasi

