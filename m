Return-Path: <linux-usb+bounces-3334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B49977F96DA
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 01:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68AD6280E12
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 00:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E95915C2;
	Mon, 27 Nov 2023 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="rQxkVgTj"
X-Original-To: linux-usb@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23BEEA;
	Sun, 26 Nov 2023 16:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9/Dhvk4BK4D5HTW2H4Lp1q2moOcg+BRR2jBF3+Yah4o=; b=rQxkVgTjcSmz44tMMXVGYKbOo1
	Gdb+33u79QGfObJYgZffyXz+cG4Erhcz5V7PLR3D6vBzGq8vdClHG/h7o6bOMt4qi8Oc1mJ0Ms/Hy
	YWPCg9cjC/ZM1lhC1VMAir79H+Ys6ripIz67KlV504zpnTgyTdsBKKYEjC/qJp8mIGVtF8gLyUJTt
	2TJtg6926uY6H7oMc+XBLxc346+nJNvCjRHxWvGvBsfzK+NQmKO9/i3B2sVDUb7x1iM6pswLmuqL3
	4SohVenvy6awyK1lJ0u/Q4Hg61XvCaD+MKm5HAw5F46hpA++we6eYnkQQoMl7R/CwzkdANapV/hfe
	eFdxWjgw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1r7Pa7-009ixx-73; Mon, 27 Nov 2023 00:34:35 +0000
Date: Mon, 27 Nov 2023 01:34:32 +0100
From: Cyril Brulebois <kibi@debian.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Message-ID: <20231127003432.7aztwjxper2a3o33@mraw.org>
Organization: Debian
References: <20231126025612.12522-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="plfzmtk733eszflg"
Content-Disposition: inline
In-Reply-To: <20231126025612.12522-1-wahrenst@gmx.net>
X-Debian-User: kibi


--plfzmtk733eszflg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Stefan Wahren <wahrenst@gmx.net> (2023-11-26):
> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
> does not have a VL805 USB 3.0 host controller, which is connected via
> PCIe. Instead, the BCM2711 on the Compute Module provides the built-in
> xHCI.
>
> Stefan Wahren (3):
>   dt-bindings: usb: xhci: Add optional power-domains
>   ARM: dts: bcm2711: Add generic xHCI
>   ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
>
>  Documentation/devicetree/bindings/usb/generic-xhci.yaml | 3 +++
>  arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts       | 9 ++++++++-
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi             | 5 +++++
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi                 | 9 +++++++++
>  4 files changed, 25 insertions(+), 1 deletion(-)

I've tried applying this series on top of v6.6-15365-g305230142ae0 (the
base commit for Jim's v8 patch series regarding PCIe/clkreq[1]), since I
know the unpatched kernel is working fine with a CM4 Lite if there's no
PCIe hardware plugged in.

 1. https://lore.kernel.org/all/20231113185607.1756-1-james.quinlan@broadco=
m.com/

With those patches applied, on the following hardware setup:
 - CM4 Lite (and SD card)
 - CM4 IO Board
 - Ethernet
 - HDMI
 - Serial console

(But neither USB storage or USB keyboard.)

I'm seeing various failure modes, but basically the system no longer
boots. I'm a little short on time right now, but if the following
excerpts aren't sufficient I can adjust logging to capture a full
trace for one or more of those.

This seems like a showstopper on its own, but if you'd like me to try
with an eMMC-equipped CM4, I can do that as well.

    Loading, please wait...
    Starting systemd-udevd version 252.17-1~deb12u1
    [    3.009941] usb_phy_generic phy: dummy supplies not allowed for excl=
usive requests
    [    3.019538] usbcore: registered new interface driver usbfs
    [    3.025266] usbcore: registered new interface driver hub
    [    3.025695] sdhci: Secure Digital Host Controller Interface driver
    [    3.030748] usbcore: registered new device driver usb
    [    3.036984] sdhci: Copyright(c) Pierre Ossman
    [    3.057911] sdhci-pltfm: SDHCI platform and OF driver helper
    [    3.067167] sdhci-iproc fe300000.mmc: allocated mmc-pwrseq
    [    3.082634] xhci-hcd fe9c0000.usb: xHCI Host Controller
    [    3.088051] xhci-hcd fe9c0000.usb: new USB bus registered, assigned =
bus number 1
    [    3.112118] mmc1: SDHCI controller on fe300000.mmc [fe300000.mmc] us=
ing PIO
    [    3.119262] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc] us=
ing ADMA
    [   24.084102] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
    [   24.090107] rcu:     2-...0: (1 ticks this GP) idle=3D125c/1/0x40000=
00000000000 softirq=3D389/393 fqs=3D2454
    [   24.099283] rcu:     (detected by 3, t=3D5252 jiffies, g=3D-607, q=
=3D619 ncpus=3D4)
    [   24.106077] Sending NMI from CPU 3 to CPUs 2:
    [   24.220101] watchdog: Watchdog detected hard LOCKUP on cpu 1
    [   24.225837] Modules linked in: mdio_bcm_unimac sdhci_iproc of_mdio c=
rct10dif_ce sdhci_pltfm crct10dif_common fixed_phy xhci_plat_hcd(+) reset_r=
aspberrypi fwnode_mdio xhci_hcd libphy i2c_bcm2835 usbcore gpio_regulator p=
hy_generic usb_common sdhci fixed
    [   34.111290] rcu: rcu_sched kthread timer wakeup didn't happen for 25=
04 jiffies! g-607 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
    [   34.122579] rcu:     Possible timer handling issue on cpu=3D3 timer-=
softirq=3D2120
    [   34.129634] rcu: rcu_sched kthread starved for 2510 jiffies! g-607 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D3
    [   34.139952] rcu:     Unless rcu_sched kthread gets sufficient CPU ti=
me, OOM is now expected behavior.
    [   34.149034] rcu: RCU grace-period kthread stack dump:
    [   34.154150] task:rcu_sched       state:I stack:0     pid:16    tgid:=
16    ppid:2      flags:0x00000008
    [   34.163591] Call trace:
    [   34.166063]  __switch_to+0xe8/0x130
    [   34.169607]  __schedule+0x398/0xd48
    [   34.173140]  schedule+0x30/0xf0
    [   34.176321]  schedule_timeout+0xa4/0x188
    [   34.180294]  rcu_gp_fqs_loop+0x128/0x488
    [   34.184268]  rcu_gp_kthread+0x134/0x188
    [   34.188151]  kthread+0xec/0xf8
    [   34.191250]  ret_from_fork+0x10/0x20
    [   34.194874] rcu: Stack dump where RCU GP kthread last ran:
    [   34.200431] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.6.0+ #1
    [   34.206430] Hardware name: Raspberry Pi Compute Module 4 Rev 1.0 (DT)
    [   34.212956] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
    [   34.220013] pc : default_idle_call+0x54/0x100
    [   34.224427] lr : default_idle_call+0x40/0x100
    [   34.228841] sp : ffff8000800c3df0
    [   34.232193] x29: ffff8000800c3df0 x28: 0607f6804a328bb4 x27: 4f98c8c=
e00000000
    [   34.239431] x26: f01df0b7242a8fc6 x25: ffff0e8882a55140 x24: 0000000=
000000000
    [   34.246668] x23: 0000000000000000 x22: ffff0e8882a55140 x21: ffffcb7=
db4cdeb38
    [   34.253904] x20: 0000000000000003 x19: ffffcb7db477b008 x18: 0000000=
000000000
    [   34.261140] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000=
000000000
    [   34.268376] x14: ffffffffffffffff x13: 0000000000000444 x12: ffffcb7=
db4cdeb40
    [   34.275613] x11: 0000000000000001 x10: 0000000000000bb0 x9 : ffffcb7=
db2f88cf0
    [   34.282848] x8 : ffff0e8882a55d50 x7 : 0000000000000000 x6 : 0000000=
04f24a986
    [   34.290085] x5 : 4000000000000000 x4 : ffff430b02a2a000 x3 : ffff430=
b02a2a000
    [   34.297321] x2 : 0000000000000001 x1 : ffff430b02a2a000 x0 : ffffcb7=
db477b008
    [   34.304557] Call trace:
    [   34.307029]  default_idle_call+0x54/0x100
    [   34.311089]  do_idle+0x218/0x278
    [   34.314359]  cpu_startup_entry+0x3c/0x50
    [   34.318330]  secondary_start_kernel+0x130/0x158
    [   34.322926]  __secondary_switched+0xb8/0xc0

or:

    Loading, please wait...
    Starting systemd-udevd version 252.17-1~deb12u1
    [    2.994822] usb_phy_generic phy: dummy supplies not allowed for excl=
usive requests
    [    3.003002] sdhci: Secure Digital Host Controller Interface driver
    [    3.009319] sdhci: Copyright(c) Pierre Ossman
    [    3.016194] usbcore: registered new interface driver usbfs
    [    3.021950] usbcore: registered new interface driver hub
    [    3.027475] usbcore: registered new device driver usb
    [    3.028573] sdhci-pltfm: SDHCI platform and OF driver helper
    [    3.048856] sdhci-iproc fe300000.mmc: allocated mmc-pwrseq
    [    3.071825] xhci-hcd fe9c0000.usb: xHCI Host Controller
    [    3.077211] xhci-hcd fe9c0000.usb: new USB bus registered, assigned =
bus number 1
    [    3.107780] mmc0: SDHCI controller on fe300000.mmc [fe300000.mmc] us=
ing PIO
    [    3.112158] mmc1: SDHCI controller on fe340000.mmc [fe340000.mmc] us=
ing ADMA
    [   13.192071] mmc0: Timeout waiting for hardware cmd interrupt.
    [   13.197899] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDHCI =
REGISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    [   13.204426] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00009902
    [   13.210953] mmc0: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
    [   13.217479] mmc0: sdhci: Argument:  0x00000c00 | Trn mode: 0x00000000
    [   13.224007] mmc0: sdhci: Present:   0x01ff0001 | Host ctl: 0x00000001
    [   13.230532] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
    [   13.237059] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00003947
    [   13.243585] mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00018000
    [   13.250112] mmc0: sdhci: Int enab:  0x00ff0003 | Sig enab: 0x00ff0003
    [   13.256638] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
    [   13.263163] mmc0: sdhci: Caps:      0x00000000 | Caps_1:   0x00000000
    [   13.269690] mmc0: sdhci: Cmd:       0x0000341a | Max curr: 0x00000001
    [   13.276215] mmc0: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
    [   13.282741] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
    [   13.289267] mmc0: sdhci: Host ctl2: 0x00000000
    [   13.293766] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    [   23.436070] mmc0: Timeout waiting for hardware cmd interrupt.
    [   23.441896] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDHCI =
REGISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    [   23.448423] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00009902
    [   23.454949] mmc0: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
    [   23.461476] mmc0: sdhci: Argument:  0x80000c08 | Trn mode: 0x00000000
    [   23.468002] mmc0: sdhci: Present:   0x01ff0001 | Host ctl: 0x00000001
    [   23.474528] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
    [   23.481054] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00003947
    [   23.487579] mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00018000
    [   23.494106] mmc0: sdhci: Int enab:  0x00ff0003 | Sig enab: 0x00ff0003
    [   23.500632] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
    [   23.507158] mmc0: sdhci: Caps:      0x00000000 | Caps_1:   0x00000000
    [   23.513684] mmc0: sdhci: Cmd:       0x0000341a | Max curr: 0x00000001
    [   23.520209] mmc0: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
    [   23.526736] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
    [   23.533262] mmc0: sdhci: Host ctl2: 0x00000000
    [   23.537760] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    [   24.100068] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
    [   24.106072] rcu:     1-...!: (0 ticks this GP) idle=3D177c/1/0x40000=
00000000000 softirq=3D266/266 fqs=3D0
    [   24.114984] rcu:     3-...!: (0 ticks this GP) idle=3D1094/1/0x40000=
00000000000 softirq=3D163/163 fqs=3D0
    [   24.123894] rcu:     (detected by 2, t=3D5254 jiffies, g=3D-579, q=
=3D440 ncpus=3D4)
    [   24.130689] Sending NMI from CPU 2 to CPUs 1:
    [   34.135902] Sending NMI from CPU 2 to CPUs 3:
    [   44.141138] rcu: rcu_sched kthread timer wakeup didn't happen for 52=
53 jiffies! g-579 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
    [   44.152427] rcu:     Possible timer handling issue on cpu=3D3 timer-=
softirq=3D87
    [   44.159306] rcu: rcu_sched kthread starved for 5254 jiffies! g-579 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D3
    [   44.169624] rcu:     Unless rcu_sched kthread gets sufficient CPU ti=
me, OOM is now expected behavior.
    [   44.178705] rcu: RCU grace-period kthread stack dump:
    [   44.183820] task:rcu_sched       state:I stack:0     pid:16    tgid:=
16    ppid:2      flags:0x00000008
    [   44.193264] Call trace:
    [   44.195737]  __switch_to+0xe8/0x130
    [   44.199280]  __schedule+0x398/0xd48
    [   44.202813]  schedule+0x30/0xf0
    [   44.205994]  schedule_timeout+0xa4/0x188
    [   44.209967]  rcu_gp_fqs_loop+0x128/0x488
    [   44.213941]  rcu_gp_kthread+0x134/0x188
    [   44.217824]  kthread+0xec/0xf8
    [   44.220921]  ret_from_fork+0x10/0x20
    [   44.224559] watchdog: Watchdog detected hard LOCKUP on cpu 3
    [   44.230292] Modules linked in: crct10dif_ce reset_raspberrypi crct10=
dif_common fixed_phy sdhci_iproc xhci_plat_hcd(+) xhci_hcd fwnode_mdio i2c_=
bcm2835 sdhci_pltfm usbcore libphy sdhci usb_common phy_generic fixed gpio_=
regulator
    [   44.250781] Sending NMI from CPU 2 to CPUs 3:
    [   54.264077] mmc0: Timeout waiting for hardware cmd interrupt.
    [   54.269900] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDHCI =
REGISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    [   54.276426] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00009902
    [   54.282953] mmc0: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
    [   54.289480] mmc0: sdhci: Argument:  0x00000000 | Trn mode: 0x00000000
    [   54.296007] mmc0: sdhci: Present:   0x01ff0000 | Host ctl: 0x00000001
    [   54.302532] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
    [   54.309059] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00003947
    [   54.315585] mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00018001
    [   54.322111] mmc0: sdhci: Int enab:  0x00ff0003 | Sig enab: 0x00ff0003
    [   54.328637] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
    [   54.335162] mmc0: sdhci: Caps:      0x00000000 | Caps_1:   0x00000000
    [   54.341689] mmc0: sdhci: Cmd:       0x00000000 | Max curr: 0x00000001
    [   54.348215] mmc0: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
    [   54.354741] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
    [   54.361267] mmc0: sdhci: Host ctl2: 0x00000000
    [   54.365766] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

or:

    Loading, please wait...
    Starting systemd-udevd version 252.17-1~deb12u1
    [    2.973041] usb_phy_generic phy: dummy supplies not allowed for excl=
usive requests
    [    2.981351] sdhci: Secure Digital Host Controller Interface driver
    [    2.987775] sdhci: Copyright(c) Pierre Ossman
    [    3.000568] sdhci-pltfm: SDHCI platform and OF driver helper
    [    3.021527] sdhci-iproc fe300000.mmc: allocated mmc-pwrseq
    [    3.030308] usbcore: registered new interface driver usbfs
    [    3.036004] usbcore: registered new interface driver hub
    [    3.041518] usbcore: registered new device driver usb
    [    3.059120] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc] us=
ing ADMA
    [    3.066296] mmc1: SDHCI controller on fe300000.mmc [fe300000.mmc] us=
ing PIO
    [    3.081846] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
    [    3.118407] xhci-hcd fe9c0000.usb: xHCI Host Controller
    [    3.123745] xhci-hcd fe9c0000.usb: new USB bus registered, assigned =
bus number 1
    [    4.172083] ------------[ cut here ]------------
    [    4.176768] Firmware transaction timeout
    [    4.176825] WARNING: CPU: 2 PID: 143 at drivers/firmware/raspberrypi=
=2Ec:64 rpi_firmware_property_list+0x250/0x270
    [    4.191121] Modules linked in: xhci_plat_hcd(+) xhci_hcd genet(+) md=
io_bcm_unimac crct10dif_ce reset_raspberrypi crct10dif_common of_mdio usbco=
re i2c_bcm2835 sdhci_iproc fixed_phy fwnode_mdio usb_common sdhci_pltfm lib=
phy fixed gpio_regulator sdhci phy_generic
    [    4.214527] CPU: 2 PID: 143 Comm: kworker/2:2 Not tainted 6.6.0+ #1
    [    4.220880] Hardware name: Raspberry Pi Compute Module 4 Rev 1.0 (DT)
    [    4.227407] Workqueue: events_freezable mmc_rescan
    [    4.232266] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
    [    4.239323] pc : rpi_firmware_property_list+0x250/0x270
    [    4.244618] lr : rpi_firmware_property_list+0x250/0x270
    [    4.249913] sp : ffff80008024ba70
    [    4.253265] x29: ffff80008024ba70 x28: ffff4307837b9428 x27: ffff430=
782b56440
    [    4.260503] x26: 0000000000000009 x25: ffff80008135d008 x24: 0000000=
000001000
    [    4.267739] x23: ffff430784142860 x22: ffffd0cee050ba68 x21: 0000000=
000000014
    [    4.274976] x20: ffff430782b56400 x19: ffff80008135d000 x18: 0000000=
000000006
    [    4.282212] x17: 0000000000000020 x16: 0000000000000002 x15: ffff800=
08024b450
    [    4.289448] x14: 0000000000000000 x13: 74756f656d697420 x12: 6e6f697=
46361736e
    [    4.296684] x11: 00000000ffffefff x10: ffffd0cee035ee20 x9 : ffffd0c=
ede52fc78
    [    4.303921] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000=
000057fa8
    [    4.311157] x5 : 0000000000000fff x4 : 0000000000000000 x3 : 0000000=
000000000
    [    4.318393] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff430=
784188000
    [    4.325629] Call trace:
    [    4.328102]  rpi_firmware_property_list+0x250/0x270
    [    4.333044]  rpi_firmware_property+0x8c/0xe0
    [    4.337369]  rpi_exp_gpio_set+0x60/0xc0
    [    4.341260]  gpio_chip_set_multiple+0x5c/0xa8
    [    4.345675]  gpiod_set_array_value_complex+0x388/0x4b8
    [    4.350884]  gpiod_set_array_value_cansleep+0x34/0x50
    [    4.356003]  mmc_pwrseq_simple_set_gpios_value.isra.0+0x74/0xa8
    [    4.362006]  mmc_pwrseq_simple_post_power_on+0x28/0x60
    [    4.367213]  mmc_pwrseq_post_power_on+0x2c/0x48
    [    4.371802]  mmc_power_up.part.0+0x8c/0x170
    [    4.376038]  mmc_rescan+0x19c/0x360
    [    4.379570]  process_one_work+0x174/0x3b0
    [    4.383632]  worker_thread+0x230/0x458
    [    4.387427]  kthread+0xec/0xf8
    [    4.390523]  ret_from_fork+0x10/0x20
    [    4.394146] ---[ end trace 0000000000000000 ]---
    [    4.398838] raspberrypi-exp-gpio soc:firmware:gpio: Failed to set GP=
IO 1 state (-110 0)
    [    4.398838] raspberrypi-exp-gpio soc:firmware:gpio: Failed to set GP=
IO 1 state (-110 0)
    [   14.476073] mmc1: Timeout waiting for hardware cmd interrupt.
    [   14.481897] mmc1: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDHCI =
REGISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    [   14.488424] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00009902
    [   14.494952] mmc1: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
    [   14.501478] mmc1: sdhci: Argument:  0x00000c00 | Trn mode: 0x00000000
    [   14.508005] mmc1: sdhci: Present:   0x01ff0001 | Host ctl: 0x00000001
    [   14.514532] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
    [   14.521058] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x0000a147
    [   14.527585] mmc1: sdhci: Timeout:   0x00000000 | Int stat: 0x00018000
    [   14.534111] mmc1: sdhci: Int enab:  0x00ff0003 | Sig enab: 0x00ff0003
    [   14.540636] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
    [   14.547162] mmc1: sdhci: Caps:      0x00000000 | Caps_1:   0x00000000
    [   14.553689] mmc1: sdhci: Cmd:       0x0000341a | Max curr: 0x00000001
    [   14.560215] mmc1: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
    [   14.566741] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
    [   14.573268] mmc1: sdhci: Host ctl2: 0x00000000
    [   14.577767] mmc1: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    [   24.132072] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
    [   24.138075] rcu:     0-...0: (1 ticks this GP) idle=3D1574/1/0x40000=
00000000000 softirq=3D245/245 fqs=3D1050
    [   24.147252] rcu:     3-...0: (0 ticks this GP) idle=3D0e04/1/0x40000=
00000000000 softirq=3D167/170 fqs=3D1050
    [   24.156426] rcu:     (detected by 1, t=3D5259 jiffies, g=3D-587, q=
=3D243 ncpus=3D4)
    [   24.163220] Sending NMI from CPU 1 to CPUs 0:
    [   24.224071] watchdog: Watchdog detected hard LOCKUP on cpu 3
    [   24.229806] Modules linked in: xhci_plat_hcd(+) xhci_hcd genet(+) md=
io_bcm_unimac crct10dif_ce reset_raspberrypi crct10dif_common of_mdio usbco=
re i2c_bcm2835 sdhci_iproc fixed_phy fwnode_mdio usb_common sdhci_pltfm lib=
phy fixed gpio_regulator sdhci phy_generic
    [   24.704075] mmc1: Timeout waiting for hardware cmd interrupt.
    [   24.709897] mmc1: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDHCI =
REGISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    [   24.716423] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00009902
    [   24.722950] mmc1: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
    [   24.729476] mmc1: sdhci: Argument:  0x80000c08 | Trn mode: 0x00000000
    [   24.736002] mmc1: sdhci: Present:   0x01ff0001 | Host ctl: 0x00000001
    [   24.742528] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
    [   24.749053] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x0000a147
    [   24.755579] mmc1: sdhci: Timeout:   0x00000000 | Int stat: 0x00018000
    [   24.762105] mmc1: sdhci: Int enab:  0x00ff0003 | Sig enab: 0x00ff0003
    [   24.768631] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
    [   24.775157] mmc1: sdhci: Caps:      0x00000000 | Caps_1:   0x00000000
    [   24.781682] mmc1: sdhci: Cmd:       0x0000341a | Max curr: 0x00000001
    [   24.788208] mmc1: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
    [   24.794734] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
    [   24.801259] mmc1: sdhci: Host ctl2: 0x00000000
    [   24.805757] mmc1: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    [   34.168434] Sending NMI from CPU 1 to CPUs 3:
    [   44.173983] rcu: rcu_sched kthread timer wakeup didn't happen for 50=
13 jiffies! g-587 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
    [   44.185271] rcu:     Possible timer handling issue on cpu=3D1 timer-=
softirq=3D1166
    [   44.192326] rcu: rcu_sched kthread starved for 5019 jiffies! g-587 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D1
    [   44.202645] rcu:     Unless rcu_sched kthread gets sufficient CPU ti=
me, OOM is now expected behavior.
    [   44.211726] rcu: RCU grace-period kthread stack dump:
    [   44.216842] task:rcu_sched       state:I stack:0     pid:16    tgid:=
16    ppid:2      flags:0x00000008
    [   44.226283] Call trace:
    [   44.228755]  __switch_to+0xe8/0x130
    [   44.232296]  __schedule+0x398/0xd48
    [   44.235829]  schedule+0x30/0xf0
    [   44.239010]  schedule_timeout+0xa4/0x188
    [   44.242983]  rcu_gp_fqs_loop+0x128/0x488
    [   44.246957]  rcu_gp_kthread+0x134/0x188
    [   44.250841]  kthread+0xec/0xf8
    [   44.253934]  ret_from_fork+0x10/0x20
    [   44.257555] rcu: Stack dump where RCU GP kthread last ran:
    [   44.263111] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W       =
   6.6.0+ #1
    [   44.270610] Hardware name: Raspberry Pi Compute Module 4 Rev 1.0 (DT)
    [   44.277135] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
    [   44.284192] pc : default_idle_call+0x54/0x100
    [   44.288606] lr : default_idle_call+0x40/0x100
    [   44.293019] sp : ffff8000800b3df0
    [   44.296373] x29: ffff8000800b3df0 x28: 1c7bdfbf00040000 x27: 2ffd2ff=
d00000002
    [   44.303610] x26: bd7e9f7e00400000 x25: ffff430782a50000 x24: 0000000=
000000000
    [   44.310847] x23: 0000000000000000 x22: ffff430782a50000 x21: ffffd0c=
ee02deb38
    [   44.318084] x20: 0000000000000001 x19: ffffd0cedfd7b008 x18: ffff800=
08007bb58
    [   44.325320] x17: ffff80008007bc20 x16: 00000000c3947ad1 x15: 0000000=
04d0489eb
    [   44.332557] x14: 000000001bca148c x13: 26357425424728cd x12: ffffd0c=
ee02deb40
    [   44.339795] x11: 0000000000000001 x10: 0000000000000bb0 x9 : ffffd0c=
ede588cf0
    [   44.347031] x8 : ffff430782a50c10 x7 : 0000000000000000 x6 : 0000000=
04f43c695
    [   44.354268] x5 : 4000000000000000 x4 : ffff7238d73ec000 x3 : ffff723=
8d73ec000
    [   44.361505] x2 : 0000000000000001 x1 : ffff7238d73ec000 x0 : ffffd0c=
edfd7b008
    [   44.368741] Call trace:
    [   44.371212]  default_idle_call+0x54/0x100
    [   44.375273]  do_idle+0x218/0x278
    [   44.378541]  cpu_startup_entry+0x40/0x50
    [   44.382513]  secondary_start_kernel+0x130/0x158
    [   44.387110]  __secondary_switched+0xb8/0xc0


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--plfzmtk733eszflg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmVj5BQACgkQ/5FK8MKz
VSDYnhAAn1UlYJeIyMIs5jJaPnoDhQ1sVwz7QR+WPBDZpGmsFlm88bQq6oQnY4C5
KCqBcTvu+gSgzVhnhjFb4DyV9UVvbV54F9+3SwRRPt7U4bo3dxRs48QNloA3F8xK
UP+grNKlrfVYC3NGk9p+H5keBMk8jfsH/Iy7cjE2Iah5xv43he2DKarBJ1VFFZxD
obrVtO+L/Y6Q+xPOlbWIrcqj2cWXJnIIki0g9vHQZEFekbTn+DABzK3vGsIQXZy0
zI4VqP60/v4oVPz7L6F2ZoBDxyHQZhmbxbYxTbp6pUjMEckseAgHIN1Ga03V5Ie8
ZAJQzDO0/+J3ATEKf5lXB1dhSfUEPPyu/RilGmlbe5+ijcrd0gbirK0xvWsLuOfV
1p85wm9Zf27WuL/CRa4qNCuz2szt4jKd5c7gss4pd2faE1iErQ+SDYbkafFbakTD
Je7m7GmjgekYX0ncYNn1ipjaZt2TByLyd9a0epixDB47PUp+9gzWmJ9m/P6xa+i+
D6TqFrWkvWaaDXn1X8+Hs9AJ0FNBvw4q154dbkMQwYZYxaNgo0t70a3ltB/QvhVm
m2E4WSZo1jRklSMq3Jvf/+Cui4NI7depNXRh35Oc9jhVN2VjVwcHk55FGGAviKEE
DpYoOOp7uF6Viat8dBjK1Pp1flBUTh8lfuRFsuLQs1xVhDTHLjI=
=l9+s
-----END PGP SIGNATURE-----

--plfzmtk733eszflg--

