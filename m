Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2042F2249F3
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jul 2020 10:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgGRIqE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jul 2020 04:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgGRIqE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jul 2020 04:46:04 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB49C0619D2
        for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2020 01:46:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o11so13379191wrv.9
        for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2020 01:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=6kGtO5nIKZQ02M+gdGO/nfLeAnCXb76Rn3sa0cOykbo=;
        b=yZ8BxNk1TmRGJ4L0Pzp9fp0gWVKh1PIdW1Fnp4wADK53W9wPcK7Sv/xNGPslGIcx5u
         8LuXbVWCwuf/C28OpYqnD4aSg73BWaAjvREwljx4AJWi7BIb6YkFKQAjxMywCYCKgajy
         juQsjs3X5rFPYf9PVtAtj3uzMNw3xrwJwp4XVAkGaf8iXttw9ZA0XhYKN0RCqxrXku1E
         h8/vnJriFND10EEsrtAKSgMPOb7AdoYrqPOEU/dDwIa+g+ygZzC4AlJabuaU3stACrWv
         g1Zxeer2hI++DmqnDr74EEpHkFa5B37XSCn2NGkrcTapnMz+JgZl4jhxhtHYbHL+UwbA
         nu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=6kGtO5nIKZQ02M+gdGO/nfLeAnCXb76Rn3sa0cOykbo=;
        b=qzrnaOynngtBagJkh4AGOPLcC2L/Qs7MlJltC966GWDzC3x1/Clnnf+QTe+wp1rRC4
         7ffmTiYQTj2+NyhZqGZCmXFKsr7O5rNAnz69nUAmrW1daF/Tq8dcHio4D6yF3anNYVAv
         kUNKUgfG2cUcJ08BkWLJ1jYeB0QGJ3EKgLfaZjzanMTaZJX7zrc/lE4Bix7+ZK4rHz6y
         Rkxd+7nUYUKRRnTET4ubMvhwbGMsiuKs4ujG3lqd7SddZ+GfsHGsssVhMDkmakqQVr+i
         P+p2XDf5UfQ/dNWuvbkSEByEC32HKDpYHon3gaPF+SZX+9IcHlMCwlRt0UWzhZ1OJeRu
         sXHA==
X-Gm-Message-State: AOAM533DNOYpRTxhBw034qlWHEbiND97Qmijc3z8LcHcaw5JH1D8fsl+
        ia3Dv2CGdr+hhWjz2Bngzqe2/A==
X-Google-Smtp-Source: ABdhPJwwjkJN2vH4caLMEoco3/hJwfOWMs2nsoNHyxn4m254iFV3FXDCS/UGhpcAkelTX/NPLdLxHQ==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr14701851wrm.40.1595061962273;
        Sat, 18 Jul 2020 01:46:02 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local ([2a01:e35:2ec0:82b0:9d0:bf63:799d:4aa1])
        by smtp.gmail.com with ESMTPSA id j15sm18956100wrx.69.2020.07.18.01.46.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Jul 2020 01:46:01 -0700 (PDT)
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Anand Moon <linux.amoon@gmail.com>,
        Dan Robertson <dan@dlrobertson.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
 <20200714133024.GA27406@gothmog.test>
 <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
 <20200715025849.GA8160@nessie>
 <CANAwSgRpfex_SroibCNxzOooXoUCi1NyRShoyonS5R=GrtH38A@mail.gmail.com>
 <CANAwSgTock11-Z8SuyyLOEsb=fQnq_Yn1fLpR2R0khoPpndN8g@mail.gmail.com>
 <CANAwSgRV_QybXAK8uLUx1KB4AxkQE_a-6WRaq9=tKOzgMdzLkw@mail.gmail.com>
 <CANAwSgT7XrdEKREr6qLCH0D2RO1K+H4Q-41JkykLW0JXaUwvHw@mail.gmail.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From:   Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <46ff6ff0-f8dc-d0c8-3ae0-ffd8b78d3a21@baylibre.com>
Date:   Sat, 18 Jul 2020 10:46:01 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgT7XrdEKREr6qLCH0D2RO1K+H4Q-41JkykLW0JXaUwvHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Anand,

Le 18/07/2020 à 08:31, Anand Moon a écrit :
> Hi Dan,
> 
>>> Sorry for the _noise_ :‑(
>>> This feature seems to be working fine with VRTC drivers.
>>> I have tested this with a pre-compiled image of Archlinux distro.
>>>
>>> [root@alarm alarm]# uname -a
>>> Linux alarm 5.7.8-1-ARCH #1 SMP Sun Jul 12 03:38:28 UTC 2020 aarch64 GNU/Linux
>>> [root@alarm alarm]# rtcwake -s 30 -m mem
>>> rtcwake: assuming RTC uses UTC ...
>>> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:10:14 1970
>>> [  583.591477] PM: suspend entry (deep)
>>> [  583.593737] Filesystems sync: 0.002 seconds
>>> [  583.818967] Freezing user space processes ... (elapsed 0.005 seconds) done.
>>> [  583.825802] OOM killer disabled.
>>> [  583.828966] Freezing remaining freezable tasks ... (elapsed 0.003
>>> seconds) done.
>>> [  583.880280] sd 0:0:0:0: [sda] Synchronizing SCSI cache
>>> [  584.020094] PM: suspend devices took 0.190 seconds
>>> [  584.070586] Disabling non-boot CPUs ...
>>> [  584.075037] CPU1: shutdown
>>> [  584.075223] psci: CPU1 killed (polled 0 ms)
>>> [  584.097199] CPU2: shutdown
>>> [  584.098546] psci: CPU2 killed (polled 0 ms)
>>> [  584.115370] CPU3: shutdown
>>> [  584.116500] psci: CPU3 killed (polled 0 ms)
>>> [  584.128116] CPU4: shutdown
>>> [  584.129235] psci: CPU4 killed (polled 10 ms)
>>> [  584.140122] CPU5: shutdown
>>> [  584.147289] psci: CPU5 killed (polled 0 ms)
>>> bl30 get wakeup sources!
>>> process command 00000006
>>> bl30 enter suspend!
>>> Little core clk suspend rate 1896000000
>>> Big core clk suspend rate 24000000
>>> store restore gp0 pll
>>> suspend_counter: 3
>>> Enter ddr suspend
>>> ddr suspend time: 16us
>>> alarm=31S
>>> process command 00000001
>>> GPIOA_11/13 off
>>> cec ver:2018/04/19
>>> CEC cfg:0x0000
>>> WAKEUP GPIO cfg:0x00000000
>>> use vddee new table!
>>> use vddee new table!
>>> exit_reason:0x03
>>> Enter ddr resume
>>> DMC_DRAM_STAT3: 0x544
>>> ddr resume time: 3188us
>>> store restore gp0 pll
>>> cfg15 33b00000
>>> cfg15 33b00000
>>> Li[  584.148720] Enabling non-boot CPUs ...
>>> [  584.149124] Detected VIPT I-cache on CPU1
>>> [  584.149167] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
>>> [  584.149594] CPU1 is up
>>> [  584.160687] Detected VIPT I-cache on CPU2
>>> [  584.160730] arch_timer: CPU2: Trapping CNTVCT access
>>> [  584.160741] CPU2: Booted secondary processor 0x0000000100 [0x410fd092]
>>> [  584.161327] CPU2 is up
>>> [  584.177645] Detected VIPT I-cache on CPU3
>>> [  584.177668] arch_timer: CPU3: Trapping CNTVCT access
>>> [  584.177675] CPU3: Booted secondary processor 0x0000000101 [0x410fd092]
>>> [  584.178036] CPU3 is up
>>> [  584.195338] Detected VIPT I-cache on CPU4
>>> [  584.195361] arch_timer: CPU4: Trapping CNTVCT access
>>> [  584.195368] CPU4: Booted secondary processor 0x0000000102 [0x410fd092]
>>> [  584.195762] CPU4 is up
>>> [  584.213002] Detected VIPT I-cache on CPU5
>>> [  584.213024] arch_timer: CPU5: Trapping CNTVCT access
>>> [  584.213032] CPU5: Booted secondary processor 0x0000000103 [0x410fd092]
>>> [  584.213450] CPU5 is up
>>> ttle core clk resume rate 1896000000
>>> Big core clk resume rate 50000000
>>> [  584.279042] meson8b-dwmac ff3f0000.ethernet eth0: No Safety
>>> Features support found
>>> [  584.281232] meson8b-dwmac ff3f0000.ethernet eth0: configuring for
>>> phy/rgmii link mode
>>> [  584.401216] usb usb1: root hub lost power or was reset
>>> [  584.401470] usb usb2: root hub lost power or was reset
>>> [  584.655446] dwc3-meson-g12a ffe09000.usb: switching to Device Mode
>>> [  584.801108] usb 2-1: reset SuperSpeed Gen 1 USB device number 2
>>> using xhci-hcd
>>> [  584.979632] usb 1-1: reset high-speed USB device number 2 using xhci-hcd
>>> [  585.260450] usb 2-1.1: reset SuperSpeed Gen 1 USB device number 3
>>> using xhci-hcd
>>> [  585.333303] PM: resume devices took 1.100 seconds
>>> [  585.333507] OOM killer enabled.
>>> [  585.335549] Restarting tasks ... done.
>>> [  585.378044] PM: suspend exit
>>> rtcwake: read rtc alarm failed: Invalid argument
>>> [root@alarm alarm]#
>>>
>>> -Anand
>>
>> After confirming that the suspend resume feature is working correctly
>> I found the solution to the reset warning on 5.8.x kernel
>> Please can you try this following patch.
>>
>> $ cat resetwarn.patch
>> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c
>> b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> index 1f7f4d88ed9d..60a6f49139fd 100644
>> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
>> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> @@ -730,7 +730,7 @@ static int dwc3_meson_g12a_probe(struct
>> platform_device *pdev)
>>
>>         platform_set_drvdata(pdev, priv);
>>
>> -       priv->reset = devm_reset_control_get_shared(dev, NULL);
>> +       priv->reset = devm_reset_control_get_shared(dev, "dwc3_meson");
>>         if (IS_ERR(priv->reset)) {
>>                 ret = PTR_ERR(priv->reset);
>>                 dev_err(dev, "failed to get device reset, err=%d\n", ret);
>>
>> -Anand
> 
> Apologize once again above changes break the usb functionality.
> the correct fix along with these changes should be as below.
> reset controllers need *resets* and *reset-names* to work correctly.
> 
> But the _reset controller_ warning continues on suspend / resume features,
> I am looking to find a FIX into this issue.
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 593a006f4b7b..6d34dfa9825c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2318,6 +2318,7 @@ usb: usb@ffe09000 {
> 
>                         clocks = <&clkc CLKID_USB>;
>                         resets = <&reset RESET_USB>;
> +                       reset-names = "dwc3_meson";
> 
>                         dr_mode = "otg";
> 
> -Anand
> 


Theses 2 changes :

>> -       priv->reset = devm_reset_control_get_shared(dev, NULL);
>> +       priv->reset = devm_reset_control_get_shared(dev, "dwc3_meson");

and

> +                       reset-names = "dwc3_meson";

are a no-op, since devm_reset_control_get_shared(dev, NULL) takes the
first reset, with or without a reset-names.

Neil
