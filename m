Return-Path: <linux-usb+bounces-28476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C122CB91A0D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 16:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89B077A8315
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 14:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7831DD9AC;
	Mon, 22 Sep 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="PFRBBh7Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IV1ZQhFb"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840261DE3A5
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550669; cv=none; b=otU+WmdnfDnsVVjfIbf+JvATtMHW+SANEQymFFEwG1s0D7mNQwxV0ACpeXQ41bAgb3o1OqlSxPUB98PNgKCAFdlpEqrXnPY6/SOxoNLwAr+JmoDcCJymiyHsa3LC1ra7sLHlGfcphgyHARDfshuZN93pHdkVZJ7U/C6UdvvL238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550669; c=relaxed/simple;
	bh=3eKyBgp+WT+e8KC37n7VRnX0W0v2JZfkpzF/JO7ksZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFIgpHG5B7cv025tDfR4+mqg/0EnEfcoMJ1+jd0ZUvCGJ/7wdfoA85wL6ZOz/KhIFSu6OUnRvIzFCG1BPTbxw9mEwQ4vW8sBP7oQVzVBaKI+vke1uLsaBscK3kZj4ktgjOrqPXIYfs1ibfCBqlJrzM+V+noPVhjnyBbt11KBcuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=PFRBBh7Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IV1ZQhFb; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9EE821400149;
	Mon, 22 Sep 2025 10:17:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 22 Sep 2025 10:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758550665;
	 x=1758637065; bh=Caao1wprbauVrMRQ1cTVzLZ78dh/vprkYxFt24ovDHw=; b=
	PFRBBh7ZY/ZEbawxinvGxzf6xcTsrw/bh/Y0FR5ZFOg9PztcZIjNgoUqzXMOIzh7
	wPr7ESYBae96VqATUgbCkLP/8xFLT7TGJbvqTG6SWOmfBCMCB+6iGIeIDO9cWePI
	WmR9JYd3Z13F29h7p4Ap9ooN3kig7jVlbRMmstEmppeOiUTI9wOwyroijyq1uA6Q
	/1+5dhT4VtS/IHthAlk95P1gRLDztofk8jTR+avwKlVMUFuHlGc49rQUKN/lBYFL
	5yVKJBmwsEhQxbWlB9bMv+vI/PHkzWbmbpfhb4MIy93kHS4nkYArLaP8E8figrXL
	oAOyGDwY+9xBz+5S9rTHYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758550665; x=1758637065; bh=Caao1wprbauVrMRQ1cTVzLZ78dh/vprkYxF
	t24ovDHw=; b=IV1ZQhFbjsoms6XjyB18fvl5gEgVkGNUFnqVteaKmtw1/wv5tL6
	5anlAEaV3xHyzOTR7/VkLYt77CXtPXih+gRyFFxd7mphUrPAeUwDYx/hmy3AkcnU
	YzlorLzlWydkEtVBmnXRVyKAhwxTQk68TL0rwoK+FmcszIvSUWFiK+IbT1u4Rtud
	y3H6MMi+DSeBxWNWOVRdqSydMnLzKqCH/NW7UeGJWbQa51NBQqY6rRUaO/xlw2Mf
	h76EiUp30/1n3vbunDMFOu9HmLbyqFe3lG6Z7D03VWOu/b1KThDugilPL6P450FY
	KwipcgJJLPhpSXJhvQDtG/KL2EtaWVzXnLw==
X-ME-Sender: <xms:iVrRaAhF-nxXQcePqGOJuOyipux-_nf-SwEmHBzOv1ioFFQQGKBSqA>
    <xme:iVrRaG_dzsvSNjV_i5VunWyGjWNofET_7vkUFkNre1C99OgLRVUhUzwaQdWlJaitP
    enCqpkov_chFEDNmpXaiQgU0cbUnY9WNMjv-3fIa6_HHd0e>
X-ME-Received: <xmr:iVrRaPp_IPDaFeUSuuxfEumnkJW4Q4LCg52flflV_gLqWyHnVGkRReAXT5svRydF8CE-2Id5uhDwp3ZosUyRvNgvD-IV6109tcc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehkedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueejteeg
    leelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrghinh
    epghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepmhgrthhhihgrshdrnhihmhgrnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtph
    htthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iVrRaN8E4dQFBTLA5fOBHBCpasIVlwPbHL4gUFFGkU2hBKgbwAbfRw>
    <xmx:iVrRaLUfWIl6NDpOIIdK0Cmhj2eaQwIH8v65W-LYMWIfJKOkQUgSIg>
    <xmx:iVrRaLAVsImunp_xo7gamk9-W4eDGMuBvxua4K5RfLxXttXlGGItZw>
    <xmx:iVrRaExkM6a8Ew0YzlR5qirf27c613-JGq9luKM88QJWkZ--vn-xUg>
    <xmx:iVrRaOU7Th0DiplOxhg_9-_P8Km1jgf7jd03zmw5S_0R9d1EFVUPhzG0>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Sep 2025 10:17:44 -0400 (EDT)
Date: Mon, 22 Sep 2025 16:17:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: XHCI debug device is not detected after debug target enables it
Message-ID: <aNFahjGnkU4nRxSh@mail-itl>
References: <aNDBQ-xLHB3ETiPb@mail-itl>
 <a97c6aa9-b7fb-4a25-9c1c-97ec19a98aac@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xVdlFWPl4pTRe9To"
Content-Disposition: inline
In-Reply-To: <a97c6aa9-b7fb-4a25-9c1c-97ec19a98aac@linux.intel.com>


--xVdlFWPl4pTRe9To
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Sep 2025 16:17:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: XHCI debug device is not detected after debug target enables it

On Mon, Sep 22, 2025 at 04:39:47PM +0300, Mathias Nyman wrote:
> On 22.9.2025 6.23, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > I have a setup where XHCI console is used to debug Xen on a laptop.
> > There are two system involved:
> > 1. SUT - an x86 laptop running Xen, and configured to expose
> > console over XHCI debug capability
> > 2. debugger - Raspberry Pi 4B to which the debug cable is connected and
> > where the console can be accessed
> >=20
> > The XHCI debug cable is a simple USB3 A-A cable, with D+, D- and Vbus
> > pins cut. When SUT isn't configured to serve debug console (for
> > example during boot while in firmware), debugger complains about
> > connected device, like this:
> >=20
> >      usb usb2-port2: config error
> >      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> >      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> >      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> >      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> >      usb usb2-port2: attempt power cycle
> >      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> >      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> >      usb usb2-port2: unable to enumerate USB device
> >      usb usb2-port2: config error
> >=20
> > This is expected, as two USB hosts are connected together here. But once
> > Xen starts and configures XHCI debug console, it's supposed to be
> > detected as ttyUSB0. When it works, it looks like this:
> >=20
> >      usb 2-2: new SuperSpeed USB device number 11 using xhci_hcd
> >      usb 2-2: LPM exit latency is zeroed, disabling LPM.
> >      usb 2-2: New USB device found, idVendor=3D1d6b, idProduct=3D0010, =
bcdDevice=3D 0.00
> >      usb 2-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumbe=
r=3D3
> >      usb 2-2: Product: Debug console
> >      usb 2-2: Manufacturer: Xen
> >      usb 2-2: SerialNumber: 0
> >      usb_debug 2-2:1.0: xhci_dbc converter detected
> >      usb 2-2: xhci_dbc converter now attached to ttyUSB0
> >=20
> > This worked fine with 5.15.92 (from Raspberry Pi fork) on debugger. It
> > also works fine with RPi debugger replaced with another x86 box
> > (regardless of the kernel version). But after updating RPi to 6.6.78
> > (also RPi fork) it stopped working. Updating further to 6.12.48 (RPi) or
> > even 6.16.7 (vanilla) didn't fixed it either. I didn't test vanilla
> > 5.15, but I find it unlikely it worked only due to some RPi patch
> > before.
> >=20
> > When it's broken, SUT waits for the XHCI to enter "configured" state,
> > IIUC in this loop:
> > https://gitlab.com/xen-project/xen/-/blob/staging/xen/drivers/char/xhci=
-dbc.c?ref_type=3Dheads#L864
> >=20
> > There are two options to fix it in this state:
> > - unplugging the cable and plugging it back
> > - _reading_ /sys/bus/usb/devices/usb2/2-0:1.0/usb2-port2/disable
> >=20
> > In the latter case, kernel prints this (note the first line):
> >=20
> >      xhci_hcd 0000:01:00.0: port 2-2 resume PLC timeout
> >      usb 2-2: new SuperSpeed USB device number 11 using xhci_hcd
> >      usb 2-2: LPM exit latency is zeroed, disabling LPM.
> >      usb 2-2: New USB device found, idVendor=3D1d6b, idProduct=3D0010, =
bcdDevice=3D 0.00
> >      usb 2-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumbe=
r=3D3
> >      usb 2-2: Product: Debug console
> >      usb 2-2: Manufacturer: Xen
> >      usb 2-2: SerialNumber: 0
> >      usb_debug 2-2:1.0: xhci_dbc converter detected
> >      usb 2-2: xhci_dbc converter now attached to ttyUSB0
> >=20
> > I can 100% reliably reproduce the issue on warm reboot. On cold boot
> > usually it works.
> >=20
> > Any ideas?
> >=20
>=20
> Best guess is that the Raspberry PI, debugger xHC is runtime suspended.
>=20
> Reconnecting the cable, or reading the port "disable" sysfs entry causes =
the host
> to resume, run, and detect the connected device.
>=20
> The xHCI host is probably allowed to suspend after several failed enumera=
tion attempts,
> which is expected due to the connected device also being in host mode.
>=20
> I think runtime pm support was enabled as default for most xHCI hosts aro=
und late 5.x,
> early 6.x kernels, so that would fit.

This would kinda match also that "usb usb2-port2: Cannot enable"
messages stop appearing after some time.

> Does preventing the roothub, and thus the host from runtime suspend help:
>=20
> On the Raspberry Pi debugger:
> echo on > /sys/bus/usb/devices/usb2/power/control

I tried that on the port before, but not on the root hub. Now tried on
the root hub as you shown above, but unfortunately it didn't help.

I tried also setting /sys/bus/usb/devices/usb2/power/autosuspend to -1,
didn't help either.

After this change, just reading the disable file is not enough, I need
to write 1 and then 0 to it...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xVdlFWPl4pTRe9To
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjRWoYACgkQ24/THMrX
1yyqEgf+MnYQ3PRnH5m47ZyhLCashl9801z+JsJlENWMuzQxn8Gn2Ltg+SLx9Qog
rFiPanvAWP3NIU4or58a48ZswIZR077Uwijhiw5JLUt6yjMLxGRkU3OqzwFnIjNV
mXfsRzetCnCorn2ADFUi69g/BKZDpoSJpr44q5evjL04Veq2qdca2GnfxrK9YlK9
N6yhuaOPLmErF3211C+6YTNzWrZWAh7bszUuPTQ9PXe8Xs426AfGXa4dnmDApjiG
ZFmvSYFBzyPHojI9+FeQ8rs6ds5xCF23SzIsk8HSJLw2MJ6ZsU0mTEqxuuak7Uh+
CnwjlbUpWMxOEAWUZq8PonWokUaGAg==
=Ogcm
-----END PGP SIGNATURE-----

--xVdlFWPl4pTRe9To--

