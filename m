Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2EA224A76
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jul 2020 11:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgGRJyn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jul 2020 05:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgGRJyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jul 2020 05:54:43 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCFCC0619D2
        for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2020 02:54:43 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id d18so12886783ion.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2020 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7sFn7+vjnRttTEb4fcwZRoteovghpQy1u69jf0/tE0Q=;
        b=WCL4p8qRS4ZYh5tS2qla1Mt7vIpcrA2SWXDdLdFH3KNhyG2XlSkeac1MehJH6r0GfC
         XFy3lVnRh/27m2Jfn4c8QiT8S73mcbqFRpZuQIlVQemVlTJxi5Qz9G8EBuANY0IL7lxw
         WvUnZIoXSXHpFm4gN94S0JGbHaNV9x9aXwpY5/eb3dwnOZy8JNBO9gUcEas7bAAQRzDi
         9DV7n3POLyQEjcPlYINm8+qyCelS39tHqGDUJGgrHNEbbxXv66/mR19I7feppZV2txst
         /vxoJwIs8GQ3vEuap1Io+FfuU86r/AcN1kBys8Ek9UlpxYFvwPwSlprtAdf4I9znzk+0
         giBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7sFn7+vjnRttTEb4fcwZRoteovghpQy1u69jf0/tE0Q=;
        b=nlpLlJOIwHyOl+LRie90TLNOCO7tG3p0fTy79mhOzcO2/gREh71QqKKMeUArRotyPu
         gfz+BB4xC6hnsdBMVxlICYjihug2vCtcBNjAi8PdPFVSNpGCyjAVsJQwPFRcKxWsDsW+
         8sEG4M24HRxTfWZC46JvOAbdYfPA3EPS8YxfTkvJr7KDi9oIicjRAvBV4iH8AlbcwLaL
         dmL6bHtp6+ZqIBhQPF/pWFfL81YCPMpBwOSfhshhsUOSRs45zZtBbWmAq247gLpNun7N
         KHM3hVR9QQzin5J9YB2vt3OY9yI9hLbniJwM3r3x6IjMfaxrwG2/qTDeiv2DZANm53IS
         dUfA==
X-Gm-Message-State: AOAM533bkiCi+ayvGdz1Mt7UfMl0t13Fmmkr7fSlhyRgtoHBfuze46r3
        R+a7l+orrGxVouyH3GeWMKfC27ZdnEGtv5Aib3A=
X-Google-Smtp-Source: ABdhPJyVOVtQQaqNUNg14Lk6qNHW3p07iGKSzdX+v+GHnLsTi7Q8MepU5FxXB0IwxIP7PIL8DToDjeXxTbfq37+DWCs=
X-Received: by 2002:a05:6638:2601:: with SMTP id m1mr8544850jat.141.1595066082392;
 Sat, 18 Jul 2020 02:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com> <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
 <20200714133024.GA27406@gothmog.test> <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
 <20200715025849.GA8160@nessie> <CANAwSgRpfex_SroibCNxzOooXoUCi1NyRShoyonS5R=GrtH38A@mail.gmail.com>
 <CANAwSgTock11-Z8SuyyLOEsb=fQnq_Yn1fLpR2R0khoPpndN8g@mail.gmail.com>
 <CANAwSgRV_QybXAK8uLUx1KB4AxkQE_a-6WRaq9=tKOzgMdzLkw@mail.gmail.com>
 <CANAwSgT7XrdEKREr6qLCH0D2RO1K+H4Q-41JkykLW0JXaUwvHw@mail.gmail.com> <46ff6ff0-f8dc-d0c8-3ae0-ffd8b78d3a21@baylibre.com>
In-Reply-To: <46ff6ff0-f8dc-d0c8-3ae0-ffd8b78d3a21@baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Sat, 18 Jul 2020 15:24:31 +0530
Message-ID: <CANAwSgRmzU3djT1KhTayeS4mQZJmD6R+QO04fXsgjGmcn8dxig@mail.gmail.com>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Dan Robertson <dan@dlrobertson.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Neil,

On Sat, 18 Jul 2020 at 14:16, Neil Armstrong <narmstrong@baylibre.com> wrot=
e:
>
> Hi Anand,
>
> Le 18/07/2020 =C3=A0 08:31, Anand Moon a =C3=A9crit :
> > Hi Dan,
> >
> >>> Sorry for the _noise_ :=E2=80=91(
> >>> This feature seems to be working fine with VRTC drivers.
> >>> I have tested this with a pre-compiled image of Archlinux distro.
> >>>
> >>> [root@alarm alarm]# uname -a
> >>> Linux alarm 5.7.8-1-ARCH #1 SMP Sun Jul 12 03:38:28 UTC 2020 aarch64 =
GNU/Linux
> >>> [root@alarm alarm]# rtcwake -s 30 -m mem
> >>> rtcwake: assuming RTC uses UTC ...
> >>> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:10:14 197=
0
> >>> [  583.591477] PM: suspend entry (deep)
> >>> [  583.593737] Filesystems sync: 0.002 seconds
> >>> [  583.818967] Freezing user space processes ... (elapsed 0.005 secon=
ds) done.
> >>> [  583.825802] OOM killer disabled.
> >>> [  583.828966] Freezing remaining freezable tasks ... (elapsed 0.003
> >>> seconds) done.
> >>> [  583.880280] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> >>> [  584.020094] PM: suspend devices took 0.190 seconds
> >>> [  584.070586] Disabling non-boot CPUs ...
> >>> [  584.075037] CPU1: shutdown
> >>> [  584.075223] psci: CPU1 killed (polled 0 ms)
> >>> [  584.097199] CPU2: shutdown
> >>> [  584.098546] psci: CPU2 killed (polled 0 ms)
> >>> [  584.115370] CPU3: shutdown
> >>> [  584.116500] psci: CPU3 killed (polled 0 ms)
> >>> [  584.128116] CPU4: shutdown
> >>> [  584.129235] psci: CPU4 killed (polled 10 ms)
> >>> [  584.140122] CPU5: shutdown
> >>> [  584.147289] psci: CPU5 killed (polled 0 ms)
> >>> bl30 get wakeup sources!
> >>> process command 00000006
> >>> bl30 enter suspend!
> >>> Little core clk suspend rate 1896000000
> >>> Big core clk suspend rate 24000000
> >>> store restore gp0 pll
> >>> suspend_counter: 3
> >>> Enter ddr suspend
> >>> ddr suspend time: 16us
> >>> alarm=3D31S
> >>> process command 00000001
> >>> GPIOA_11/13 off
> >>> cec ver:2018/04/19
> >>> CEC cfg:0x0000
> >>> WAKEUP GPIO cfg:0x00000000
> >>> use vddee new table!
> >>> use vddee new table!
> >>> exit_reason:0x03
> >>> Enter ddr resume
> >>> DMC_DRAM_STAT3: 0x544
> >>> ddr resume time: 3188us
> >>> store restore gp0 pll
> >>> cfg15 33b00000
> >>> cfg15 33b00000
> >>> Li[  584.148720] Enabling non-boot CPUs ...
> >>> [  584.149124] Detected VIPT I-cache on CPU1
> >>> [  584.149167] CPU1: Booted secondary processor 0x0000000001 [0x410fd=
034]
> >>> [  584.149594] CPU1 is up
> >>> [  584.160687] Detected VIPT I-cache on CPU2
> >>> [  584.160730] arch_timer: CPU2: Trapping CNTVCT access
> >>> [  584.160741] CPU2: Booted secondary processor 0x0000000100 [0x410fd=
092]
> >>> [  584.161327] CPU2 is up
> >>> [  584.177645] Detected VIPT I-cache on CPU3
> >>> [  584.177668] arch_timer: CPU3: Trapping CNTVCT access
> >>> [  584.177675] CPU3: Booted secondary processor 0x0000000101 [0x410fd=
092]
> >>> [  584.178036] CPU3 is up
> >>> [  584.195338] Detected VIPT I-cache on CPU4
> >>> [  584.195361] arch_timer: CPU4: Trapping CNTVCT access
> >>> [  584.195368] CPU4: Booted secondary processor 0x0000000102 [0x410fd=
092]
> >>> [  584.195762] CPU4 is up
> >>> [  584.213002] Detected VIPT I-cache on CPU5
> >>> [  584.213024] arch_timer: CPU5: Trapping CNTVCT access
> >>> [  584.213032] CPU5: Booted secondary processor 0x0000000103 [0x410fd=
092]
> >>> [  584.213450] CPU5 is up
> >>> ttle core clk resume rate 1896000000
> >>> Big core clk resume rate 50000000
> >>> [  584.279042] meson8b-dwmac ff3f0000.ethernet eth0: No Safety
> >>> Features support found
> >>> [  584.281232] meson8b-dwmac ff3f0000.ethernet eth0: configuring for
> >>> phy/rgmii link mode
> >>> [  584.401216] usb usb1: root hub lost power or was reset
> >>> [  584.401470] usb usb2: root hub lost power or was reset
> >>> [  584.655446] dwc3-meson-g12a ffe09000.usb: switching to Device Mode
> >>> [  584.801108] usb 2-1: reset SuperSpeed Gen 1 USB device number 2
> >>> using xhci-hcd
> >>> [  584.979632] usb 1-1: reset high-speed USB device number 2 using xh=
ci-hcd
> >>> [  585.260450] usb 2-1.1: reset SuperSpeed Gen 1 USB device number 3
> >>> using xhci-hcd
> >>> [  585.333303] PM: resume devices took 1.100 seconds
> >>> [  585.333507] OOM killer enabled.
> >>> [  585.335549] Restarting tasks ... done.
> >>> [  585.378044] PM: suspend exit
> >>> rtcwake: read rtc alarm failed: Invalid argument
> >>> [root@alarm alarm]#
> >>>
> >>> -Anand
> >>
> >> After confirming that the suspend resume feature is working correctly
> >> I found the solution to the reset warning on 5.8.x kernel
> >> Please can you try this following patch.
> >>
> >> $ cat resetwarn.patch
> >> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c
> >> b/drivers/usb/dwc3/dwc3-meson-g12a.c
> >> index 1f7f4d88ed9d..60a6f49139fd 100644
> >> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> >> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> >> @@ -730,7 +730,7 @@ static int dwc3_meson_g12a_probe(struct
> >> platform_device *pdev)
> >>
> >>         platform_set_drvdata(pdev, priv);
> >>
> >> -       priv->reset =3D devm_reset_control_get_shared(dev, NULL);
> >> +       priv->reset =3D devm_reset_control_get_shared(dev, "dwc3_meson=
");
> >>         if (IS_ERR(priv->reset)) {
> >>                 ret =3D PTR_ERR(priv->reset);
> >>                 dev_err(dev, "failed to get device reset, err=3D%d\n",=
 ret);
> >>
> >> -Anand
> >
> > Apologize once again above changes break the usb functionality.
> > the correct fix along with these changes should be as below.
> > reset controllers need *resets* and *reset-names* to work correctly.
> >
> > But the _reset controller_ warning continues on suspend / resume featur=
es,
> > I am looking to find a FIX into this issue.
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> > b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> > index 593a006f4b7b..6d34dfa9825c 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> > @@ -2318,6 +2318,7 @@ usb: usb@ffe09000 {
> >
> >                         clocks =3D <&clkc CLKID_USB>;
> >                         resets =3D <&reset RESET_USB>;
> > +                       reset-names =3D "dwc3_meson";
> >
> >                         dr_mode =3D "otg";
> >
> > -Anand
> >
>
>
> Theses 2 changes :
>
> >> -       priv->reset =3D devm_reset_control_get_shared(dev, NULL);
> >> +       priv->reset =3D devm_reset_control_get_shared(dev, "dwc3_meson=
");
>
> and
>
> > +                       reset-names =3D "dwc3_meson";
>
> are a no-op, since devm_reset_control_get_shared(dev, NULL) takes the
> first reset, with or without a reset-names.
>

Thanks for resolving my query. Sorry for the noise.

> Neil

-Anand
