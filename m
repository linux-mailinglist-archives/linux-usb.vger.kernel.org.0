Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F0A22378E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 11:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgGQJBj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 05:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgGQJBi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 05:01:38 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5542DC061755
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 02:01:38 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id k23so9679191iom.10
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=leUJ/jeEHzF3HojM0O1b9G1Za9XJRxnVEfnj/G9u97I=;
        b=uWiRNfB0HCFLU29tvRQwGH4ucKkNsN/BFVWReOyh6ZnFt+GXPl0vhSpM6OBnBL8SwR
         Xf/p5SAAo7CvPX7pABBUf/oHd6epNxsRuZMa3G330xDVa8hX2fZ42rUZuCk6g13nIvkF
         Z4McUxd8T1hwke5TQfKkDkPbkVDiRI3K789Td1xoraawvuwecGh65RYSs2yAHmYp2Alz
         RHn5mVx8xAO1T492Y1LxpVErFRTI0jr/FN/zQ9m+IcsH3LRsIf8AtNXRuEliamdWKWLd
         g0sQpcoa3yuOXo+ryJCx6UuVrNLWowuen7HuK2Uq/wf1Ur/jkC2VVMYvMHHqa9Y7Fd6L
         /Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=leUJ/jeEHzF3HojM0O1b9G1Za9XJRxnVEfnj/G9u97I=;
        b=BnSGK+byTYvXrmtJAg41oI/ovphpY3h5ub9SwZPzAVRwSyPKwrr5YFoPhL230KYbG2
         n4F+xL8UvdTOBDmeUdX5ydfxQhmY5m5UYoQcw/b0pACqmvEsoQLjeh7/xj8yByEv5n0Q
         vSCLXINRWNfr59sR83WN6ujB+jXaj4WVq6MKgoHLtC1Mdu3AWHOv3WhTTPR7/FxTeeVL
         Ize79MHgHQP7SGgmNpmaevbqACfHaRy3293k5dIUrMAPKTm6GU/LcXC8aZ2avK05Tn3a
         u6b4rXj0B0wapqSBb5coyUqhz4gqDMNDIQk31gPPPHb4P+R8K1Zhcg9Y1LtQ/iK/8PlS
         elrg==
X-Gm-Message-State: AOAM532SS20f/rUkM9+4cUJzE0SADZMZa3fuK2B4rDVmiXDWXprj5DYi
        q0Vorms0/0wh0ZHcF880Eu7OgoHicsXYp9O5ZTRhC6h9
X-Google-Smtp-Source: ABdhPJy9tQK4gNMCRQin3x4roZxatoAaFqQXNvLctOrueCUk5CZIPOp8EK4T/YptOpihwpl6JvTzlcsVr/pr3JkdGeA=
X-Received: by 2002:a6b:b4d1:: with SMTP id d200mr8516181iof.128.1594976497565;
 Fri, 17 Jul 2020 02:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com> <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
 <20200714133024.GA27406@gothmog.test> <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
 <20200715025849.GA8160@nessie> <CANAwSgRpfex_SroibCNxzOooXoUCi1NyRShoyonS5R=GrtH38A@mail.gmail.com>
In-Reply-To: <CANAwSgRpfex_SroibCNxzOooXoUCi1NyRShoyonS5R=GrtH38A@mail.gmail.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Fri, 17 Jul 2020 14:31:27 +0530
Message-ID: <CANAwSgTock11-Z8SuyyLOEsb=fQnq_Yn1fLpR2R0khoPpndN8g@mail.gmail.com>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Dan Robertson <dan@dlrobertson.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
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

Hi Dan,

On Wed, 15 Jul 2020 at 21:53, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Dan,
>
> On Wed, 15 Jul 2020 at 08:48, Dan Robertson <dan@dlrobertson.com> wrote:
> >
> > On Tue, Jul 14, 2020 at 08:57:35PM +0530, Anand Moon wrote:
> > > Hi Dan,
> > >
> > > On Tue, 14 Jul 2020 at 19:00, Dan Robertson <dan@dlrobertson.com> wro=
te:
> > > >
> > > > Hi Anand!
> > > >
> > > > On Tue, Jul 14, 2020 at 12:26:57PM +0530, Anand Moon wrote:
> > > > > hi Dan,
> > > > >
> > > > > On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com>=
 wrote:
> > > > > >
> > > > > > When testing suspend for another driver I noticed the following=
 warning:
> > > > > >
> > > > > > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_con=
trol_assert+0x184/0x19c
> > > > > > Hardware name: Hardkernel ODROID-N2 (DT)
> > > > > > [..]
> > > > > > pc : reset_control_assert+0x184/0x19c
> > > > > > lr : dwc3_meson_g12a_suspend+0x68/0x7c
> > > > > > [..]
> > > > > > Call trace:
> > > > > >  reset_control_assert+0x184/0x19c
> > > > > >  dwc3_meson_g12a_suspend+0x68/0x7c
> > > > > >  platform_pm_suspend+0x28/0x54
> > > > > >  __device_suspend+0x590/0xabc
> > > > > >  dpm_suspend+0x104/0x404
> > > > > >  dpm_suspend_start+0x84/0x1bc
> > > > > >  suspend_devices_and_enter+0xc4/0x4fc
> > > > > >
> > > > > > In my limited experience and knowlege it appears that we hit th=
is
> > > > > > because the reset control was switched to shared and the the us=
e
> > > > > > of the reset control was not changed.
> > > > > >
> > > > > > > * Calling reset_control_assert without first calling reset_co=
ntrol_deassert
> > > > > > > * is not allowed on a shared reset control. Calling reset_con=
trol_reset is
> > > > > > > * also not allowed on a shared reset control.
> > > > > >
> > > > > > The above snippet from reset_control_get_shared() seems to indi=
cate that
> > > > > > this is due to the use of reset_control_reset() in dwc3_meson_g=
12a_probe()
> > > > > > and reset_control_deassert is not guaranteed to have been calle=
d
> > > > > > before dwc3_meson_g12a_suspend() and reset_control_assert().
> > > > > >
> > > > > > After some basic tests with the following patch I no longer hit=
 the
> > > > > > warning. Comments and critiques on the patch are welcome. If th=
ere is a
> > > > > > reason for the current use of the reset control, I'd love to le=
arn why!
> > > > > > Like I said before, I have not really looked at this driver bef=
ore and
> > > > > > have verify limited experience with reset controls... Was worki=
ng on
> > > > > > another driver, hit the warning, and thought I'd take a shot at=
 the
> > > > > > fix :-)
> > > > > >
> > > > > Thanks, I was also looking into this issue
> > > >
> > > > Awesome!
> > > >
> > > > > So best Fix to this issue is to drop the call of reset_control_as=
sert
> > > > > from dwc3_meson_g12a_suspend
> > > > > and drop the call of reset_control_deassert from dwc3_meson_g12a_=
resume
> > > > > With these changes we do not see the warning on suspend and resum=
e
> > > >
> > > > We definitely would avoid hitting the warning without the
> > > > reset_control_(de)assert calls in suspend and resume. That is a val=
id use of
> > > > the reset control, but why would that be best?
> > > >
> > > > From reset_control_reset():
> > >
> > > Before entering the suspend state the code tries to do following
> > >      clk_bulk_disable_unprepare
> > >      regulator_disable
> > >      phy_power_off
> > >      phy_exit
> > >
> > > After this operation it's needless to call *reset_control_assert*
> > > I tried to move this call before all the above operations
> > > but still no success with this.
> >
> > How so? Once the reset() is removed prope() and deassert() is guarantee=
d
> > to have been called before suspend, like what is in the patch and simil=
ar
> > to other uses of shared reset controllers, this is possible.
> >
> > > Similarly on resume we should avoid calling resume
> > > *reset_control_deassert* earlier
> > > as the core is just reinitializing the devices.
> > >       clk_bulk_prepare_enable
> > >       usb_init
> > >       phy_init
> > >       phy_power_on
> > >       regulator_enable
> > > >
> > > > > * Consumers must not use reset_control_(de)assert on shared reset=
 lines when
> > > > > * reset_control_reset has been used.
> > > >
> > > > If we use reset_control_reset() then we can not (de)assert the rese=
t line
> > > > on suspend/resume or any other time. Wouldn't we want to be able to
> > > > (de)assert the reset line? And why do we no longer want to (de)asse=
rt the
> > > > reset line on suspend/resume?
> > > >
> > > > > > Can you try this attached patch?
> > > > >
> > > > I think I had already tested something similar. Removing the (de)as=
sert calls
> > > > but keeping reset will definitely remove the warning, but it means =
we can not
> > > > (de)assert the line. My guess is that this is not what we want, but=
 I could be
> > > > wrong. Thoughts, input, or references to documentation on this woul=
d be
> > > > appreciated.
> > > >
> > >
> > > As per my knowledge suspend to mem will do complete power down of the
> > > devices with support suspend and resume feature sequentially and then=
 it tries
> > > to bring the device up one by one.
> > > So it should also take care of reset lines as well.
> >
> > So do we only _actually_ care about the reset line in the probe? Seems =
like we
> > should remove the reset controller from the structure if that is the ca=
se.
> >
> > Cheers,
> >
> >  - Dan
>
> Sorry I am not the _expert_ in suspend/resume feature but I can debug thi=
s,
> Certainly we need to look into whether reset controller calls are needed
> to suspend or resume for this driver.
>
> First thing we need to get the RTC driver to work on Odroid N2 for
> suspend wakeup
> to work properly.
> For this I have created the following patches.
>
> [0] https://patchwork.kernel.org/cover/11665865/
>
> With these patches the RTC feature for wake up is broken right now in
> my testing.
> Once I get something to work further I will update you.
>
> --Anand

Sorry for the _noise_ :=E2=80=91(
This feature seems to be working fine with VRTC drivers.
I have tested this with a pre-compiled image of Archlinux distro.

[root@alarm alarm]# uname -a
Linux alarm 5.7.8-1-ARCH #1 SMP Sun Jul 12 03:38:28 UTC 2020 aarch64 GNU/Li=
nux
[root@alarm alarm]# rtcwake -s 30 -m mem
rtcwake: assuming RTC uses UTC ...
rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:10:14 1970
[  583.591477] PM: suspend entry (deep)
[  583.593737] Filesystems sync: 0.002 seconds
[  583.818967] Freezing user space processes ... (elapsed 0.005 seconds) do=
ne.
[  583.825802] OOM killer disabled.
[  583.828966] Freezing remaining freezable tasks ... (elapsed 0.003
seconds) done.
[  583.880280] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  584.020094] PM: suspend devices took 0.190 seconds
[  584.070586] Disabling non-boot CPUs ...
[  584.075037] CPU1: shutdown
[  584.075223] psci: CPU1 killed (polled 0 ms)
[  584.097199] CPU2: shutdown
[  584.098546] psci: CPU2 killed (polled 0 ms)
[  584.115370] CPU3: shutdown
[  584.116500] psci: CPU3 killed (polled 0 ms)
[  584.128116] CPU4: shutdown
[  584.129235] psci: CPU4 killed (polled 10 ms)
[  584.140122] CPU5: shutdown
[  584.147289] psci: CPU5 killed (polled 0 ms)
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 1896000000
Big core clk suspend rate 24000000
store restore gp0 pll
suspend_counter: 3
Enter ddr suspend
ddr suspend time: 16us
alarm=3D31S
process command 00000001
GPIOA_11/13 off
cec ver:2018/04/19
CEC cfg:0x0000
WAKEUP GPIO cfg:0x00000000
use vddee new table!
use vddee new table!
exit_reason:0x03
Enter ddr resume
DMC_DRAM_STAT3: 0x544
ddr resume time: 3188us
store restore gp0 pll
cfg15 33b00000
cfg15 33b00000
Li[  584.148720] Enabling non-boot CPUs ...
[  584.149124] Detected VIPT I-cache on CPU1
[  584.149167] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[  584.149594] CPU1 is up
[  584.160687] Detected VIPT I-cache on CPU2
[  584.160730] arch_timer: CPU2: Trapping CNTVCT access
[  584.160741] CPU2: Booted secondary processor 0x0000000100 [0x410fd092]
[  584.161327] CPU2 is up
[  584.177645] Detected VIPT I-cache on CPU3
[  584.177668] arch_timer: CPU3: Trapping CNTVCT access
[  584.177675] CPU3: Booted secondary processor 0x0000000101 [0x410fd092]
[  584.178036] CPU3 is up
[  584.195338] Detected VIPT I-cache on CPU4
[  584.195361] arch_timer: CPU4: Trapping CNTVCT access
[  584.195368] CPU4: Booted secondary processor 0x0000000102 [0x410fd092]
[  584.195762] CPU4 is up
[  584.213002] Detected VIPT I-cache on CPU5
[  584.213024] arch_timer: CPU5: Trapping CNTVCT access
[  584.213032] CPU5: Booted secondary processor 0x0000000103 [0x410fd092]
[  584.213450] CPU5 is up
ttle core clk resume rate 1896000000
Big core clk resume rate 50000000
[  584.279042] meson8b-dwmac ff3f0000.ethernet eth0: No Safety
Features support found
[  584.281232] meson8b-dwmac ff3f0000.ethernet eth0: configuring for
phy/rgmii link mode
[  584.401216] usb usb1: root hub lost power or was reset
[  584.401470] usb usb2: root hub lost power or was reset
[  584.655446] dwc3-meson-g12a ffe09000.usb: switching to Device Mode
[  584.801108] usb 2-1: reset SuperSpeed Gen 1 USB device number 2
using xhci-hcd
[  584.979632] usb 1-1: reset high-speed USB device number 2 using xhci-hcd
[  585.260450] usb 2-1.1: reset SuperSpeed Gen 1 USB device number 3
using xhci-hcd
[  585.333303] PM: resume devices took 1.100 seconds
[  585.333507] OOM killer enabled.
[  585.335549] Restarting tasks ... done.
[  585.378044] PM: suspend exit
rtcwake: read rtc alarm failed: Invalid argument
[root@alarm alarm]#

-Anand
