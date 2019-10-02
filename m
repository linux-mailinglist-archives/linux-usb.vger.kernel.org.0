Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B877C8E12
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 18:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfJBQPZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 12:15:25 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:32846 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfJBQPY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 12:15:24 -0400
Received: by mail-ed1-f65.google.com with SMTP id c4so15813510edl.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RfGDcmIw7ulMJh06QAxIbycvPjPVshGqNxweR1BvyX8=;
        b=hyUxHIjLkkm9IaQFFZ1kmQyAiDIv1+r8y9bMgHtQa+VLE2Ql1bjL2Go+eKXMPKIUET
         HIipHzALP13gdblS08IjbEJaYEq7ens4gFbPm8cr1fy2D0Wk6qyU27jQMA5Q7fRrrXQ8
         5KbRxSV1ic1iqybWfimTC5cSceNXxxEv6exg6pD6quvw51bSnz9+Vj8higxWrsVpRlq9
         +z9JG/eUG9L/pI2MF+bdPB1mzntrY4bdanEucNUfdFJdRujdKBdkOx3dPs5Bemas/eop
         mxrOxc5HPubxPX5KS6fn0oBrxfJcezgwMpDijgOCc5N4qdTPSLTKztGn3zmgixpsXRDo
         OzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RfGDcmIw7ulMJh06QAxIbycvPjPVshGqNxweR1BvyX8=;
        b=ZsZoTTcogA0njY4pvl0Oq+TMnxsXOOdJC0ZnDW+TP5qOzXKq94OEmy7sAInCivrGy1
         ocleJFxC7+yw6ewQBK3jLKGXJqTOASAoYz/0sJF1nKgwr5r7QH90YmYyT7+P+O7qUrQx
         XyKU+4gr9VhTkhm+gl8E5rhRtQnoWqkJXBFEETmOqPVpkmjTMgCriwSFLvbwAs7S/FrO
         RUNEoKvGd+58cK5fTRFiCr32+SBusmKAzmLHi+KkKlWOqSBlp0hpFfwKFf5hulGDmVXH
         PYuHh/rdJpJNmKX1ezsyIlFJTbitZYwYusecWcy+uu2XCC5nqr6x2DnUpTtANMolEFhz
         1ZTg==
X-Gm-Message-State: APjAAAXNJE7WGA7i8klVGYKA+wfSa4QTIsH0DE9g1OPVm3VFNn9FgGF+
        TrjNmOgQATntT5I4juoHZfC4tomeRSXscrLeGXw=
X-Google-Smtp-Source: APXvYqxxwoQbCormbL9BMcmuaRngT05GFCchOM/q1ruWoUlm2RrUPD90Z7PvNZmHv6pGekbyYsxE8/gDf1HmaPdpJT8=
X-Received: by 2002:a05:6402:2054:: with SMTP id bc20mr4882932edb.55.1570032922474;
 Wed, 02 Oct 2019 09:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAByghJYLLdtYiQGNCxJ4HEjm5Y1v0LQ1pc+dmHemoNWxx2h6jg@mail.gmail.com>
 <VI1PR04MB53276A58AE76E5EADD822E498B870@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAByghJbF-zBVWsGqCq9b3xF7xe2KZuhCd_E4kskH9K-gZu1bNA@mail.gmail.com>
In-Reply-To: <CAByghJbF-zBVWsGqCq9b3xF7xe2KZuhCd_E4kskH9K-gZu1bNA@mail.gmail.com>
From:   Igor Opaniuk <igor.opaniuk@gmail.com>
Date:   Wed, 2 Oct 2019 19:15:11 +0300
Message-ID: <CAByghJZ4EKkYs2VnCOSC=_SxBVkg1icXt+hxBNVM3TXfHv8Rnw@mail.gmail.com>
Subject: Re: [chipidea] continuous USB resets on NXP i.MX 6ULL device
To:     Peter Chen <peter.chen@nxp.com>, Jun Li <jun.li@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Stefan Agner <stefan.agner@toradex.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+ Li Jun

Hi Peter, Li,

On Mon, Sep 30, 2019 at 2:35 PM Igor Opaniuk <igor.opaniuk@gmail.com> wrote=
:
>
> Hi Peter,
>
> On Wed, Sep 25, 2019 at 3:44 AM Peter Chen <peter.chen@nxp.com> wrote:
> >
> >
> > >
> > > Hi Fabio, Peter, Stefan,
> > >
> > > I've incidentally discovered your last year discussion in ML [1] (I h=
ope it rings the
> > > bell) regarding the issue I'm still observing on the same device with=
 the mainline
> > > kernel.
> > >
> > > The difference between i.MX 6ULL EVK and this particular device, is t=
hat usbotg2 is
> > > used only in host mode with the usb hub integrated on the carrier boa=
rd [2] [3].
> > >
> > > root@colibri-imx6:~# lsusb -s 1:1 --tree
> > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > >
> > > However I can't reproduce the same behavior with i.MX 6ULL EVK with c=
onnected
> > > usb hub to usbotg2. Also this behavior can't be reproduced with NXP d=
ownstream
> > > kernel (Linux version 4.9.144) on my device.
> > >
> > > After digging in a bit I found out that this happens only when autosu=
spend is
> > > enabled for the usb controller:
> > > echo auto > /sys/bus/usb/devices/1-1/power/control
> > >
> > > It tries to go to suspend mode, but everytime fails and resumes:
> > > root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_statu=
s
> > > suspended
> > > root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_statu=
s
> > > resuming
> > > root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_statu=
s
> > > suspended
> > > root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_statu=
s
> > > suspended
> > > root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_statu=
s
> > > suspended
> > > root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_statu=
s
> > > resuming
> > >
> > > I'm observing ~2 seconds wakeup interrupts handled in ci_irq() in cor=
e.c and
> > > subsequent invocation of imx_controller_resume().
> > >
> > > Meantime usboh3 remains enabled all the time (though
> > > imx_disable_unprepare_clks() should disable it):
> > > root@colibri-imx6:~# cat /sys/kernel/debug/clk/clk_summary | grep usb
> > >     usbphy2_gate                      1        1        0           0
> > >         0     0  50000
> > >     usbphy1_gate                      1        1        0           0
> > >         0     0  50000
> > >           pll7_usb_host               1        1        0   480000000
> > >         0     0  50000
> > >              usbphy2                  1        1        0   480000000
> > >         0     0  50000
> > >           pll3_usb_otg                2        3        0   480000000
> > >         0     0  50000
> > >              usbphy1                  0        0        0   480000000
> > >         0     0  50000
> > >                          usboh3       1        1        0    66000000
> > >         0     0  50000
> > >
> > > While I'm trying to localize the root cause, maybe you can give some =
hints where to
> > > look into?
> > >
> >
> > Would you please look below two downstream patches see if it helps?
> >
> > commit e8e95658fe75f3873e06d5ad72a6bf0bad40f068
> > Author: Li Jun <jun.li@nxp.com>
> > Date:   Mon Oct 16 23:13:19 2017 +0800
> >
> >     MLK-16576 usb: phy: mxs: set hold_ring_off for USB2 PLL power up
> >
> >     USB2 PLL use ring VCO, when the PLL power up, the ring VCO=E2=80=99=
s supply also
> >     ramp up. There is a possibility that the ring VCO start oscillation=
 at
> >     multi nodes in this phase, especially for VCO which has many stages=
, then
> >     the multiwave will kept until PLL power down. Hold_ring_off(bit11) =
can
> >     force the VCO in one determined state when VCO supply start ramp up=
, to
> >     avoid this multiwave issue. Per IC design's suggestion it's better =
this
> >     bit can be off from 25us after pll power up to 25us before USB TX/R=
X.
> >
> >
> > commit aa4680d844a340a5b6b60484f6e04cb9ba613c65
> > Author: Peter Chen <peter.chen@nxp.com>
> > Date:   Wed Sep 7 12:16:59 2016 +0800
> >
> >     MLK-13125 usb: phy: phy-mxs-usb: enable weak 1p1 regulator for imx6=
ul during suspend
> >
> >     For imx6ul PHY, when the system enters suspend, its 1p1 is off by d=
efault,
> >     that may cause the PHY get inaccurate USB DP/DM value. If the USB w=
akeup
> >     is enabled at this time, the unexpected wakeup may occur when the s=
ystem
> >     enters suspend.
> >
> >     In this patch, when the vbus is there, we enable weak 1p1 during th=
e PHY
> >     suspend API, in that case, the USB DP/DM will be accurate for USB P=
HY,
> >     then unexpected usb wakeup will not be occurred, especially for the=
 USB
> >     charger is connected scenario. The user needs to enable PHY wakeup =
for
> >     USB wakeup function using below setting.
> >
> > Peter
> >
> > > Thanks for helping me!
> > >
> > > [1]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fm=
arc.info%2
> > > F%3Fl%3Dlinux-
> > > usb%26m%3D151844741732751&amp;data=3D02%7C01%7Cpeter.chen%40nxp.co
> > > m%7Cb61742d4ff4646c2cb9408d740d735fe%7C686ea1d3bc2b4c6fa92cd99c5c30
> > > 1635%7C0%7C0%7C637049165376859788&amp;sdata=3DeZdOVCuyVyA502DgwoN
> > > 16QmU5WDknrqCK5xmEbIovAE%3D&amp;reserved=3D0
> > > [2]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%
> > > 2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Farch%2Farm%2Fboot%2Fdts%2Fimx6
> > > ull-
> > > colibri.dtsi%23L191&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Cb6174=
2d
> > > 4ff4646c2cb9408d740d735fe%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C
> > > 0%7C637049165376859788&amp;sdata=3D7%2FVP15v1XGeQzweIu%2FaGhJEt1ov
> > > Tn4zl%2F3pghKBcGlw%3D&amp;reserved=3D0
> > > [3]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%
> > > 2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Farch%2Farm%2Fboot%2Fdts%2Fimx6
> > > ull-colibri-eval-
> > > v3.dtsi%23L143&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Cb61742d4ff=
4
> > > 646c2cb9408d740d735fe%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> > > C637049165376859788&amp;sdata=3DM43BXrJedKgszOJkZ9W4h5bqQo9WBaxe7C
> > > L4tAD2Ouk%3D&amp;reserved=3D0
> > >
> > > --
> > > Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations
> > >
> > > Igor Opaniuk
> > >
> > > mailto: igor.opaniuk@gmail.com
> > > skype: igor.opanyuk
> > > +380 (93) 836 40 67
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fua=
.linkedin.co
> > > m%2Fin%2Fiopaniuk&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Cb61742
> > > d4ff4646c2cb9408d740d735fe%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> > > C0%7C637049165376859788&amp;sdata=3DqzgWZaeraIUjiLG24s9x%2BUQEnRrJ2
> > > TiRKD%2F6ndna4Ws%3D&amp;reserved=3D0
>
>
> Unfortunately these two commits didn't help (+ 'MLK-10170 usb: phy:
> mxs: keep USBPHY2's clk always on',
> which one of the commits depends on).
>
>
> --
> Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations
>
> Igor Opaniuk
>
> mailto: igor.opaniuk@gmail.com
> skype: igor.opanyuk
> +380 (93) 836 40 67
> http://ua.linkedin.com/in/iopaniuk

So finally I found the commit in the downstream NXP kernel
which fixes this behaviour
6bdc038751("MLK-14285-3 usb: phy: mxs: optimize disconnect line condition")=
.

Seems that no one tried to upstream it yet (I can't find anything in
the ML archieves),
so if you don't have any objections I'll apply/test on top 5.4-rc1/
send to ML (or just let me know if you are planning to do it on your own).

Thanks!

--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk

mailto: igor.opaniuk@gmail.com
skype: igor.opanyuk
+380 (93) 836 40 67
http://ua.linkedin.com/in/iopaniuk
