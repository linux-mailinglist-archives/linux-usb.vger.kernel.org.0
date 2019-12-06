Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAD2D11585B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 21:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfLFU5r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 15:57:47 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43551 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726325AbfLFU5r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 15:57:47 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id DD5E22294C;
        Fri,  6 Dec 2019 15:57:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 06 Dec 2019 15:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=doyRWW
        sndr+K8jaiBWC2h17fY+dGyuXZqRGrQyBMlnk=; b=Vzrce7kxaxHbq/587Ik8aN
        lcmhTCWW73ZXm4UD63nM97wytAaMIXAT/soUvhMKJRuyUv+fXUXDqN4zK0vpZO/c
        FBGj4QVVuexlqP9Esggjbk7Nyqb+2eGQS297ahpzbbFyHxT1otAbjAvapQiRvH8n
        bZ7cU+k1GYyPp7d7l9bviQK6Ec7Y67KBatLpRTH93IgNB1Blk7YWIkAnvWzBRr5B
        SebmzBY+D2yFkOHkq4Jf9tPl3RoymRfDVKl1eZCpgUWNoMbK+TjJp8klnwEAPypJ
        rbj4jhva0MT7v7HlVloSCGvdv8DFCSiM0uPo7o2xiwwahe0TquQZPsdujlOKtVsw
        ==
X-ME-Sender: <xms:ycDqXVg-lWYX8IdvqmeMyOm_o-t-LURoYw835RebaR8mQPE-56WvFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekfedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
    feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ycDqXRBc3e_1fVkOmiy8QSlVqXzWNinH7TQ-VetY-Ekuh7s-SeP6VA>
    <xmx:ycDqXaGgoC5hwGCVUxyqivDXvBfl82O6gEOGV9ZQ0uAzL1l5YynAmA>
    <xmx:ycDqXZIYQbbmRtqbbZtAVi2TVTkq6cTbgfQ05_gw0J5yo5jtvGM22w>
    <xmx:ycDqXZDCh6DUmVh3zeb46RF9XutQNrxcb_F6V-RCL2aEQ8eEDVFMWg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id DC93D80059;
        Fri,  6 Dec 2019 15:57:44 -0500 (EST)
Date:   Fri, 6 Dec 2019 21:57:42 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191206205742.GP1122@mail-itl>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JVu9XMG6uEpKCPDY"
Content-Disposition: inline
In-Reply-To: <20191206065058.GA9792@localhost.localdomain>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--JVu9XMG6uEpKCPDY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock

On Fri, Dec 06, 2019 at 03:50:58PM +0900, Suwan Kim wrote:
> On Fri, Dec 06, 2019 at 04:24:06AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hello,
> >=20
> > I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
> > connect Yubikey 4 and use its CCID interface (for example `ykman oath
> > list` command), the client side hangs (100% reliably). After 60s I get a
> > message that a CPU hangs waiting for a spinlock (see below).
> >=20
> > I've bisected it to a ea44d190764b4422af ("usbip: Implement SG support
> > to vhci-hcd and stub driver") commit. Which indeed is also backported to
> > 4.19.
> >=20
> > Any idea what is going on here? I can easily provide more information,
> > if you tell me how to get it.
> >=20
>=20
> Hi,
>=20
> Thanks for reporting. Could you turn on lockdep and USBIP_DEBUG
> in kernel config and send dmesg log? It will be helpful to figure
> out lock dependency in vhci_hcd.

Hmm, I've tried, but I don't see much more information there (see
below). I've just enabled PROVE_LOCKING and USBIP_DEBUG. Do I need to do
anything more, like some boot option?

Also, this one (as the previous one) is from 4.19.84. Interestingly, on
4.19.87 I don't get the message at all.

Hmm, I've done also another test: got 4.19.84 with "usbip: Implement SG
support to vhci-hcd and stub driver" reverted and it still hangs...

I'm going for another bisect round (4.19.81 works, 4.19.84 doesn't).

[  212.890519] usb 1-1: recv xbuf, 42
[  212.891177] vhci_hcd: vhci_shutdown_connection:1024: stop threads
[  212.891228] vhci_hcd: vhci_shutdown_connection:1032: release socket
[  212.891388] vhci_hcd: vhci_shutdown_connection:1058: disconnect device
[  212.891637] usb 1-1: USB disconnect, device number 2
[  277.967398] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  277.967456] rcu: 	1-...0: (1 GPs behind) idle=3Dd66/1/0x4000000000000000=
 softirq=3D32543/32544 fqs=3D15856=20
[  277.967544] rcu: 	(detected by 2, t=3D65009 jiffies, g=3D65285, q=3D5921)
[  277.967560] Sending NMI from CPU 2 to CPUs 1:
[  277.968606] NMI backtrace for cpu 1
[  277.968607] CPU: 1 PID: 450 Comm: kworker/1:3 Tainted: G           O    =
  4.19.84-1.pvops.qubes.x86_64 #2
[  277.968608] Workqueue: usb_hub_wq hub_event
[  277.968608] RIP: 0010:_raw_spin_lock+0x2c/0x40
[  277.968609] Code: 44 00 00 55 48 89 fd 65 ff 05 40 b8 60 7c ff 74 24 08 =
48 8d 7f 18 45 31 c9 31 c9 41 b8 01 00 00 00 31 d2 31 f6 e8 64 f0 71 ff <48=
> 89 ef 58 5d e9 1a 3a 72 ff 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
[  277.968610] RSP: 0018:ffffb29f00bbbb90 EFLAGS: 00000082
[  277.968610] RAX: ffff8fa938768000 RBX: ffff8fa981fe3950 RCX: a50d71adbc2=
b783b
[  277.968611] RDX: 00000000c093239f RSI: 00000000158aa627 RDI: 00000000000=
00046
[  277.968611] RBP: ffffffff8450c860 R08: 0000000000000001 R09: 00000000000=
c0490
[  277.968612] R10: 0000000000000000 R11: a50d71adbc2b783b R12: ffff8fa981f=
e3968
[  277.968612] R13: ffff8fa91728e000 R14: ffffffff8434e626 R15: 00000000000=
40200
[  277.968613] FS:  0000000000000000(0000) GS:ffff8fa9f5a80000(0000) knlGS:=
0000000000000000
[  277.968613] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  277.968614] CR2: 00006335daf937b8 CR3: 00000000b0410002 CR4: 00000000001=
606e0
[  277.968614] Call Trace:
[  277.968614]  ? usb_hcd_flush_endpoint+0x122/0x170
[  277.968615]  usb_hcd_flush_endpoint+0x122/0x170
[  277.968615]  usb_disable_interface+0x3c/0x50
[  277.968616]  usb_unbind_interface+0x181/0x260
[  277.968616]  device_release_driver_internal+0x18b/0x250
[  277.968617]  bus_remove_device+0xfc/0x170
[  277.968617]  device_del+0x165/0x380
[  277.968617]  usb_disable_device+0x93/0x240
[  277.968618]  usb_disconnect+0xc1/0x2c0
[  277.968618]  hub_event+0xcc4/0x1620
[  277.968618]  process_one_work+0x221/0x580
[  277.968619]  worker_thread+0x50/0x3b0
[  277.968619]  ? process_one_work+0x580/0x580
[  277.968620]  kthread+0x122/0x140
[  277.968620]  ? kthread_create_worker_on_cpu+0x70/0x70
[  277.968620]  ret_from_fork+0x3a/0x50



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--JVu9XMG6uEpKCPDY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3qwMUACgkQ24/THMrX
1yz98ggAjFqB38tqv2e+Tfsck+xlQ/RBfWwy7GABfC44+Ho8J/g9B1xi7p6TXE81
5yR0UC+GJwsjWDgGxmcAlkCLbVcOB+MyLzkDVgJTT/kCRDrcFDapZR+hzsp34WGI
rW4C+ZVVNr1xfesOZk77Sutabo7SCxsiEPJu5g7K/YSc3Noub+OvsR83qpYNUY7v
ZAuPl7zotmx+FBuCdHziozMus0EibIxjoZ0DrYq7/qzaiXxqMXlwVr24c/28l1Tt
sgvArGyK/2gfMprsnQJTQitB1de4zhR7N4BJWSIlvFNeUqBHCj850t+pDT6k/Pm+
Yd+7V0aFU7F/1sjRh1NHaHh9Q68P5Q==
=0Dog
-----END PGP SIGNATURE-----

--JVu9XMG6uEpKCPDY--
