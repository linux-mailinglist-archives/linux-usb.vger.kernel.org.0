Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD543114B63
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 04:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfLFDYM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 22:24:12 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:54713 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726097AbfLFDYL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 22:24:11 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 8740B74D;
        Thu,  5 Dec 2019 22:24:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 05 Dec 2019 22:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=+KywNJcKwAzlFqyB5781DwOqGjElJ
        +2Kh0r1wpHwyIY=; b=qy6OjjpxoKP5jbwAVaHDe/dtvFAcBMiQc+ZSOfuPeTu23
        gpm8sYfdG/8ba3V+ayu4kS0anOilgYQRjTft7EO9kYczo6iGFXl3bODY1Fd3JFGv
        gFjJmrRjNJNDIijQtgYaloWhwgqxXzj0jOf4fu6woByKBuSMW1I6hfZWL1oTKFYM
        5MfQPyTo86Xy7dwblDwSxrDc/mNDlkRgH66k4nQeg2ySN1mZzcSYIcMFwqJjZqNC
        LbY+bBKLcpGoo2C8EKr4EQlwh+xV5JoZiCpicfBHK1oxt5np+uEmajk+R7FmnhIQ
        LSuc+Ls1fiRecVXIPsAZ5NV6etNXgUy1VDVkjG07A==
X-ME-Sender: <xms:2cnpXc6w_kSdbDEDc-YTtnuiyYJRe3CtBOtXw6YxDL9z_U1_t5I2JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekvddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepghhithhhuhgsrdgt
    ohhmnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehl
    uhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:2snpXUqs9VdhABcjqw4nnwUAZu3T8VGx0zifXD0QxN5I9FoUhNkefQ>
    <xmx:2snpXdO3UF_JQAsrOO9GHqL4lgUP0vWAdHergsztM-ltRtUzbjPXzA>
    <xmx:2snpXc2rJxKmb_HemUf_r5Drugdqh4BVynVHNu-vKYN-rp5JJQHK0A>
    <xmx:2snpXRZNt6O7AOSEiDwhhW86hyM4QO2WMUUvI34RDngHGmIWMR_g7g>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2C50780062;
        Thu,  5 Dec 2019 22:24:09 -0500 (EST)
Date:   Fri, 6 Dec 2019 04:24:06 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     linux-usb@vger.kernel.org
Cc:     Suwan Kim <suwan.kim027@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: "usbip: Implement SG support to vhci-hcd and stub driver" causes a
 deadlock
Message-ID: <20191206032406.GE1208@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: "usbip: Implement SG support to vhci-hcd and stub driver" causes a
 deadlock

Hello,

I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
connect Yubikey 4 and use its CCID interface (for example `ykman oath
list` command), the client side hangs (100% reliably). After 60s I get a
message that a CPU hangs waiting for a spinlock (see below).

I've bisected it to a ea44d190764b4422af ("usbip: Implement SG support
to vhci-hcd and stub driver") commit. Which indeed is also backported to
4.19.

Any idea what is going on here? I can easily provide more information,
if you tell me how to get it.

The kernel log:
[ 6452.701016] usb 1-1: New USB device found, idVendor=3D1050, idProduct=3D=
0407, bcdDevice=3D 4.27
[ 6452.701049] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[ 6452.701075] usb 1-1: Product: Yubikey 4 OTP+U2F+CCID
[ 6452.701092] usb 1-1: Manufacturer: Yubico
[ 6452.711566] input: Yubico Yubikey 4 OTP+U2F+CCID as /devices/platform/vh=
ci_hcd.0/usb1/1-1/1-1:1.0/0003:1050:0407.0001/input/input1
[ 6452.762251] hid-generic 0003:1050:0407.0001: input,hidraw0: USB HID v1.1=
0 Keyboard [Yubico Yubikey 4 OTP+U2F+CCID] on usb-vhci_hcd.0-1/input0
[ 6452.770270] hid-generic 0003:1050:0407.0002: hiddev96,hidraw1: USB HID v=
1.10 Device [Yubico Yubikey 4 OTP+U2F+CCID] on usb-vhci_hcd.0-1/input1
[ 6530.805002] vhci_hcd: unlink->seqnum 111
[ 6530.805024] vhci_hcd: urb->status -104
[ 6531.386607] usb 1-1: recv xbuf, 42
[ 6531.386701] vhci_hcd: stop threads
[ 6531.386718] vhci_hcd: release socket
[ 6531.386734] vhci_hcd: disconnect device
[ 6531.386800] usb 1-1: USB disconnect, device number 2
[ 6591.409099] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[ 6591.409130] rcu:     1-...!: (0 ticks this GP) idle=3D53a/1/0x4000000000=
000000 softirq=3D18978/18978 fqs=3D0=20
[ 6591.409158] rcu:     (detected by 0, t=3D60002 jiffies, g=3D17933, q=3D8=
93)
[ 6591.409181] Sending NMI from CPU 0 to CPUs 1:
[ 6591.410415] NMI backtrace for cpu 1
[ 6591.410416] CPU: 1 PID: 338 Comm: kworker/1:2 Tainted: G           O    =
  4.19.84-1.pvops.qubes.x86_64 #1
[ 6591.410417] Workqueue: usb_hub_wq hub_event
[ 6591.410417] RIP: 0010:_raw_spin_lock_irqsave+0x22/0x40
[ 6591.410418] Code: 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 53 9c 58 0f 1f =
44 00 00 48 89 c3 fa 66 0f 1f 44 00 00 31 c0 ba 01 00 00 00 f0 0f b1 17 <85=
> c0 75 05 48 89 d8 5b c3 89 c6 e8 3e 1c 7e ff 66 90 48 89 d8 5b
[ 6591.410419] RSP: 0000:ffffc900009dfaf8 EFLAGS: 00000046
[ 6591.410419] RAX: 0000000000000000 RBX: 0000000000000082 RCX: 00000000000=
00000
[ 6591.410420] RDX: 0000000000000001 RSI: ffff88801e633e40 RDI: ffff8880067=
40be0
[ 6591.410420] RBP: ffff888006740be0 R08: 0000000000000000 R09: ffffffff813=
46f00
[ 6591.410420] R10: ffff888014f5b5d8 R11: 0000000000000000 R12: 00000000fff=
fff94
[ 6591.410421] R13: ffff88803ff06000 R14: ffff88803ff06000 R15: ffff88801e6=
33e40
[ 6591.410421] FS:  0000000000000000(0000) GS:ffff8880f5b00000(0000) knlGS:=
0000000000000000
[ 6591.410421] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 6591.410422] CR2: 00005eede8b122a8 CR3: 000000000220a002 CR4: 00000000003=
606e0
[ 6591.410422] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[ 6591.410423] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[ 6591.410423] Call Trace:
[ 6591.410423]  vhci_urb_dequeue+0x2b/0x280 [vhci_hcd]
[ 6591.410423]  usb_hcd_flush_endpoint+0x119/0x190
[ 6591.410424]  usb_disable_endpoint+0x7b/0xa0
[ 6591.410424]  usb_disable_interface+0x3e/0x50
[ 6591.410424]  usb_unbind_interface+0x117/0x250
[ 6591.410425]  device_release_driver_internal+0x17d/0x240
[ 6591.410425]  bus_remove_device+0xe5/0x150
[ 6591.410425]  device_del+0x161/0x360
[ 6591.410426]  ? usb_remove_ep_devs+0x1b/0x30
[ 6591.410426]  usb_disable_device+0x93/0x240
[ 6591.410426]  usb_disconnect+0x90/0x270
[ 6591.410427]  hub_port_connect+0x83/0xab0
[ 6591.410427]  hub_event+0x8d1/0xab0
[ 6591.410427]  process_one_work+0x191/0x370
[ 6591.410428]  worker_thread+0x4f/0x3b0
[ 6591.410428]  kthread+0xf8/0x130
[ 6591.410428]  ? rescuer_thread+0x340/0x340
[ 6591.410428]  ? kthread_create_worker_on_cpu+0x70/0x70
[ 6591.410429]  ret_from_fork+0x35/0x40
[ 6591.410432] rcu: rcu_sched kthread starved for 60002 jiffies! g17933 f0x=
0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D1
[ 6591.411962] rcu: RCU grace-period kthread stack dump:
[ 6591.411980] rcu_sched       I    0    10      2 0x80000000
[ 6591.411998] Call Trace:
[ 6591.412015]  ? __schedule+0x3f5/0x870
[ 6591.412030]  schedule+0x32/0x80
[ 6591.412044]  schedule_timeout+0x16f/0x350
[ 6591.412059]  ? __next_timer_interrupt+0xc0/0xc0
[ 6591.412077]  rcu_gp_kthread+0x569/0x950
[ 6591.412092]  kthread+0xf8/0x130
[ 6591.412106]  ? rcu_nocb_kthread+0x560/0x560
[ 6591.412119]  ? kthread_create_worker_on_cpu+0x70/0x70
[ 6591.412136]  ret_from_fork+0x35/0x40

Some more details are available here:
https://github.com/QubesOS/qubes-issues/issues/5498

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3pydYACgkQ24/THMrX
1yzqqwf/SggFYZuRHLkV72PIClH0xnHlnK4u/mbYwQm20kMw3HRYg/3LxiEYNklN
yQR3vDnQS0DcBVUDornDZXL+FBOb8xLTKzucaJHoX26ZJTW4RqFB8X8MHY+0DA9m
NVYJkjm6mnbkfXs7fsYVpWRF9LHFj3yQOuTvaL/QURrvlLKaKPUHo5d9zgMR0neS
pqQ0hktcb90FB4tPqX5CVhWKaZiKg5y6Eduis1K/8MVGwK8s/76qgI5dibkzVTc8
cLWcBY3P5NTteHWOcGy6A91WW5TU8Cdj694uEndK80/w9r0CDyJyC3P2b+PbmacV
cNKjPkedZirbNKN2np/GY0jjeH4RMg==
=+a+X
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
