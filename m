Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11464115E03
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2019 19:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfLGSpL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Dec 2019 13:45:11 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:39597 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726455AbfLGSpL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Dec 2019 13:45:11 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 5F9F056D;
        Sat,  7 Dec 2019 13:45:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sat, 07 Dec 2019 13:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lsf2pr
        EUaWEY9Es/DMnVUXyZUb5cXLd6tejc9e5Mr4U=; b=robPH2daf6wSUZYpMAb5Hp
        ckD3U0FjWE9KnUSb44S+miRE/jiBM7x/oHYa/SvUiBWyXVQboniC3be/EK5nYAga
        SLG3fGmzpapjXoGVDSd/FMgdnnxIn8iax8BbcM9U6R6yMOqUKTuN9S5vlPOh5lwu
        sqXxOcQChLpExBTV69uv+dVwkkvV3RK6SrliwKKgQhfr9Q1ijy5K/QHGDkZ1Imk+
        R62Qh/NV+Ki0RCPiJspaZf6efTvZm1pY0bMkipJXPzTuLcb2Gev98+ykwAhGFo1n
        vxaQzmlsGTHbjIKJyVjX3yVdb6AbbUG6DfeUyt7mDgRUedjNWTYb+ODOXKNsKN3w
        ==
X-ME-Sender: <xms:NfPrXdVmXctZFdtDh_5DHxfa6EXXvX4Kn52roAucYtCQAOmjlXk85A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekhedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
    feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:NfPrXWXCrKAJr0GhgWoETVFpJe8uOOEqc8pzvP04VtYfnTUWNR47mw>
    <xmx:NfPrXYGi8LWbL9IHDNFQhse40Cpz2faqNYAw2KSpEUlopbHwvl7muw>
    <xmx:NfPrXSuue7gfwINqzMTNxbwNF90DZ28TzT_QK7re0YxawmFGSw8new>
    <xmx:NvPrXdhR04cGWmmGoBUigEYny22oC6TdVnZJorGfNnRNa4lx1FjImw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id 306E83060405;
        Sat,  7 Dec 2019 13:45:09 -0500 (EST)
Date:   Sat, 7 Dec 2019 19:45:06 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Suwan Kim <suwan.kim027@gmail.com>, linux-usb@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191207184506.GV1122@mail-itl>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <49f180e4-0e36-1615-0988-31b0199c4e2b@linuxfoundation.org>
 <20191207005807.GQ1122@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R+WA+n3pAWWgNWUs"
Content-Disposition: inline
In-Reply-To: <20191207005807.GQ1122@mail-itl>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--R+WA+n3pAWWgNWUs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock

On Sat, Dec 07, 2019 at 01:58:09AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Dec 06, 2019 at 02:12:08PM -0700, Shuah Khan wrote:
> > On 12/6/19 1:57 PM, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Fri, Dec 06, 2019 at 03:50:58PM +0900, Suwan Kim wrote:
> > > > On Fri, Dec 06, 2019 at 04:24:06AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > Hello,
> > > > >=20
> > > > > I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
> > > > > connect Yubikey 4 and use its CCID interface (for example `ykman =
oath
> > > > > list` command), the client side hangs (100% reliably). After 60s =
I get a
> > > > > message that a CPU hangs waiting for a spinlock (see below).
> > > > >=20
> > > > > I've bisected it to a ea44d190764b4422af ("usbip: Implement SG su=
pport
> > > > > to vhci-hcd and stub driver") commit. Which indeed is also backpo=
rted to
> > > > > 4.19.
> > > > >=20
> > > > > Any idea what is going on here? I can easily provide more informa=
tion,
> > > > > if you tell me how to get it.
> > > > >=20
> > > >=20
> > > > Hi,
> > > >=20
> > > > Thanks for reporting. Could you turn on lockdep and USBIP_DEBUG
> > > > in kernel config and send dmesg log? It will be helpful to figure
> > > > out lock dependency in vhci_hcd.
> > >=20
> > > Hmm, I've tried, but I don't see much more information there (see
> > > below). I've just enabled PROVE_LOCKING and USBIP_DEBUG. Do I need to=
 do
> > > anything more, like some boot option?
> > >=20
> > > Also, this one (as the previous one) is from 4.19.84. Interestingly, =
on
> > > 4.19.87 I don't get the message at all.
> > >=20
> > > Hmm, I've done also another test: got 4.19.84 with "usbip: Implement =
SG
> > > support to vhci-hcd and stub driver" reverted and it still hangs...
> > >=20
> > > I'm going for another bisect round (4.19.81 works, 4.19.84 doesn't).
> >=20
> > Does 4.19.82 work?
>=20
> Yes, it does, or at least something after 4.19.82 works (9da271c1c).

I've done bisect again and again got into the same commit. Most of the
time I didn't get any message about the deadlock, it simply hanged.

Full bisect log:

git bisect start
# good: [ef244c3088856cf048c77231653b4c92a7b2213c] Linux 4.19.81
git bisect good ef244c3088856cf048c77231653b4c92a7b2213c
# bad: [c555efaf14026c7751fa68d87403a5eb5ae7dcaf] Linux 4.19.84
git bisect bad c555efaf14026c7751fa68d87403a5eb5ae7dcaf
# good: [9da271c1cdc14839b694e23889a653c1ed0b5f8f] net: usb: lan78xx: Disab=
le interrupts before calling generic_handle_irq()
git bisect good 9da271c1cdc14839b694e23889a653c1ed0b5f8f
# bad: [8181146cd7de890cdfdda68ddc3730250887d7fc] PCI: tegra: Enable Relaxe=
d Ordering only for Tegra20 & Tegra30
git bisect bad 8181146cd7de890cdfdda68ddc3730250887d7fc
# good: [8e6bf4bc3a88e4b84e5c4ec50143a71a61503336] mm: memcontrol: fix netw=
ork errors from failing __GFP_ATOMIC charges
git bisect good 8e6bf4bc3a88e4b84e5c4ec50143a71a61503336
# good: [0327c7818da27b018464c0b9f541c5d276c57172] can: flexcan: disable co=
mpletely the ECC mechanism
git bisect good 0327c7818da27b018464c0b9f541c5d276c57172
# good: [5e36cf8edb5812e378b57511263d1a0a9172eeb9] configfs: fix a deadlock=
 in configfs_symlink()
git bisect good 5e36cf8edb5812e378b57511263d1a0a9172eeb9
# good: [4f6c5200269998f0066e1bd4db931297b7b2b906] ALSA: usb-audio: Fix pos=
sible NULL dereference at create_yamaha_midi_quirk()
git bisect good 4f6c5200269998f0066e1bd4db931297b7b2b906
# good: [502bd151448c2c76a927b26783e5538875c534ff] sched/fair: Fix low cpu =
usage with high throttling by removing expiration of cpu-local slices
git bisect good 502bd151448c2c76a927b26783e5538875c534ff
# good: [f865ae473c16fb2b8b8601fa04f4f6517ad557b3] usbip: Fix vhci_urb_enqu=
eue() URB null transfer buffer error path
git bisect good f865ae473c16fb2b8b8601fa04f4f6517ad557b3
# bad: [e2dd254bde5cdac24e7774584d6f3c2c61fe09e5] usbip: Implement SG suppo=
rt to vhci-hcd and stub driver
git bisect bad e2dd254bde5cdac24e7774584d6f3c2c61fe09e5
# first bad commit: [e2dd254bde5cdac24e7774584d6f3c2c61fe09e5] usbip: Imple=
ment SG support to vhci-hcd and stub driver


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--R+WA+n3pAWWgNWUs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3r8zMACgkQ24/THMrX
1yzS5Af+P1D/mBRnjobcmV99cuKYxADsW1PVswn7/E0kGhjsvtGu2wuWN2gNwtTl
Z8OjUewS+PiqanDG9XBBsm4u/4Lkeg6n9i6Yxq9eKp3kz24sTm7eOJoKG3v1BqA0
+mhzEMXyj5PuXsUfqMpJoc2f7pDyfs2pI5t7nVlrhQ4UjhwuWKKt1bcZXL4bfWpD
qExAKUnZm7CMjqWHHO7ORJtaA1DDVLlRoz8Y6EsgFKKtpJwYJklBxZF5OR+k0vL3
fpnbncyBnITSi2KmF0PzeU/ATS19mbbyx6NZq/BinZvtbCE9pjzlfKy0oP/c4wrl
3qKITaeR4kgIA6Xv5qQ1sB7JM2GtPw==
=ZxjE
-----END PGP SIGNATURE-----

--R+WA+n3pAWWgNWUs--
