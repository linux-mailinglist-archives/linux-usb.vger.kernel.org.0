Return-Path: <linux-usb+bounces-28449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA960B8EDBD
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 05:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A089F3B6022
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 03:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA34E2EF66A;
	Mon, 22 Sep 2025 03:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="H62c+1Eb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aiw4c5rV"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D012EC0BF
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 03:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758511433; cv=none; b=OpJ6KYCJOyqXKvKyl91QHSay/1q35tAd75GrMSX/Qau95OMdNE7G5SQd1d5ioxdwiCar+Xv8uKjkc8/H/Yr/4TjrSKDBD3TXvZhywHx7pM0hVLW38JZMTtAnQzo19byRXNp+PEBYC4ZvBaZdP5BEjbOyHNyCuoDGP8GnqcuZhAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758511433; c=relaxed/simple;
	bh=HJaLRI4KLzQ+Qegkqx5Qh90uac/LScsJEjD63HkxJsI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i9d4XaWD9S5YUNry7aeRGTdz3OPR+9d9aWU52o5OkMVxrb689++YDu5s4rjoGPSCYGlXJzhYgvzVMun+nKXCCvhWNI00VoDVqKT08S5rP9LA1KJm61/FUbmShc2MD6u5ZmwGNgPkSLJU3+coEARQivh9u+gUvfP22qPYqyhgNK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=H62c+1Eb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aiw4c5rV; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3A5047A019A
	for <linux-usb@vger.kernel.org>; Sun, 21 Sep 2025 23:23:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 21 Sep 2025 23:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1758511430; x=1758597830; bh=Ml60H9wn0j
	pYWjkSlZVBUICDihc/QCWBHVaaO814eO8=; b=H62c+1EbVGpI+ZuzYhtv8KiL1B
	4nQYY8WE4yCkCR7Lvf9PwYrgRxsnAhPNFyqNeaIylrLxLSQ4wrluDh3UWtg6ApS1
	iyIf7ELIQINpPJ0Pkaw2bh2hpRnTT6hjkOeCMlRbV8Z4ZzDpFJ8aQPgrj5RvbRiz
	n95Sy2ZFxGh/2XXxE1az7FT8ZuZC4EpEBChJEjhGo7v46hYIz0ws9Jf93ZKfcbVk
	rkftgDokbjvUopNOl4UbHAhGRQ4bOiA5X307oyF1BiWD/lzEaWwaR8cUdyCBwHu2
	7fWJPOTBcfdni3DuDdh7YVv3Pb0WNHHWTPVEcvD9Hdj9L0vgm3TaK0G/oH9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758511430; x=
	1758597830; bh=Ml60H9wn0jpYWjkSlZVBUICDihc/QCWBHVaaO814eO8=; b=a
	iw4c5rVNk7SkuOn6QWPX6WvhJkW5ZH8++vzdtPdXZxJsHbuBmW7rS1ddTlWIrYe7
	YniIX75+qZlpZhh3TG4BKj3PMsVOuWzEes7zh7NCrkMWhmfnQROvpkjKI+qm/MSP
	RkiPvgcrEGPd1qQ2B9KLKtztXZTOTdnc4AGiHqJMYoOd/ps4/S517srnMM7pEt9t
	yrWqwOloOgsVUIUsvrRhiv2KnY7El+Dt/jgUxt6uIiCl2YYO6JkxghD4nYSKH4c9
	cR6fW0M+rz83qHWeP9H4LlrcoAfwc1LxpKnP4bCuBq/uciVWfAzJQI9F5HvCcrWA
	7c53hNheZr4i4cIdRB05A==
X-ME-Sender: <xms:RcHQaApmSrdg12oQmGIKHevKwFJ_wq5dQxRHsu6pL0qOOVA2m_C-3g>
    <xme:RcHQaIrZtBueRhUYBLEXUF_K9PzBYFseAbdcn4QKmBDh-EF-CmWLhIoMdE-YYAFpI
    -EHPx3TAW7ekg>
X-ME-Received: <xmr:RcHQaOkcIOcYXxtxV96f4tChmFckWZ1Gfkf_uOItj6onjp5xtw_7RY5u1RPeoVjkR84skUANpxlLEIps-FSOKJy603rKWVdadpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehieejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttdejne
    cuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtf
    frrghtthgvrhhnpeeiffejueehgefhueetffdtueefhfeitefhheevheetfefgueduleff
    feffheelvdenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhs
    ihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:RcHQaKGalpis0aeO-4KEx23IiUhphusP9VzMXeO27lnIN3H5qdTIzw>
    <xmx:RcHQaHppIzNVN9W93jQsuU9WQ-vD2cpUrfXkYRn0DUSjRLBk_iKEPg>
    <xmx:RcHQaG6OTq69G26vjCHPddqeEVWktOaRWaoCthpUgKruTBek5tBILQ>
    <xmx:RcHQaF4YZVUz_F1zs4jETRH0Xm1yVf7M3BnjXNS-px01dX5C8H9BCA>
    <xmx:RsHQaNCpkS7Vav-MJrYPLrPu12scWrXLXTH_6rD1KdmlJhWKwhHNdPDW>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-usb@vger.kernel.org>; Sun, 21 Sep 2025 23:23:49 -0400 (EDT)
Date: Mon, 22 Sep 2025 05:23:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-usb@vger.kernel.org
Subject: XHCI debug device is not detected after debug target enables it
Message-ID: <aNDBQ-xLHB3ETiPb@mail-itl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NOGRtyAsX5TvT4OG"
Content-Disposition: inline


--NOGRtyAsX5TvT4OG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Sep 2025 05:23:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-usb@vger.kernel.org
Subject: XHCI debug device is not detected after debug target enables it

Hi,

I have a setup where XHCI console is used to debug Xen on a laptop.
There are two system involved:
1. SUT - an x86 laptop running Xen, and configured to expose
console over XHCI debug capability
2. debugger - Raspberry Pi 4B to which the debug cable is connected and
where the console can be accessed

The XHCI debug cable is a simple USB3 A-A cable, with D+, D- and Vbus
pins cut. When SUT isn't configured to serve debug console (for
example during boot while in firmware), debugger complains about
connected device, like this:

    usb usb2-port2: config error
    usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    usb usb2-port2: attempt power cycle
    usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    usb usb2-port2: unable to enumerate USB device
    usb usb2-port2: config error

This is expected, as two USB hosts are connected together here. But once
Xen starts and configures XHCI debug console, it's supposed to be
detected as ttyUSB0. When it works, it looks like this:

    usb 2-2: new SuperSpeed USB device number 11 using xhci_hcd
    usb 2-2: LPM exit latency is zeroed, disabling LPM.
    usb 2-2: New USB device found, idVendor=3D1d6b, idProduct=3D0010, bcdDe=
vice=3D 0.00
    usb 2-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
    usb 2-2: Product: Debug console
    usb 2-2: Manufacturer: Xen
    usb 2-2: SerialNumber: 0
    usb_debug 2-2:1.0: xhci_dbc converter detected
    usb 2-2: xhci_dbc converter now attached to ttyUSB0

This worked fine with 5.15.92 (from Raspberry Pi fork) on debugger. It
also works fine with RPi debugger replaced with another x86 box
(regardless of the kernel version). But after updating RPi to 6.6.78
(also RPi fork) it stopped working. Updating further to 6.12.48 (RPi) or
even 6.16.7 (vanilla) didn't fixed it either. I didn't test vanilla
5.15, but I find it unlikely it worked only due to some RPi patch
before.

When it's broken, SUT waits for the XHCI to enter "configured" state,
IIUC in this loop:
https://gitlab.com/xen-project/xen/-/blob/staging/xen/drivers/char/xhci-dbc=
=2Ec?ref_type=3Dheads#L864

There are two options to fix it in this state:
- unplugging the cable and plugging it back
- _reading_ /sys/bus/usb/devices/usb2/2-0:1.0/usb2-port2/disable

In the latter case, kernel prints this (note the first line):

    xhci_hcd 0000:01:00.0: port 2-2 resume PLC timeout
    usb 2-2: new SuperSpeed USB device number 11 using xhci_hcd
    usb 2-2: LPM exit latency is zeroed, disabling LPM.
    usb 2-2: New USB device found, idVendor=3D1d6b, idProduct=3D0010, bcdDe=
vice=3D 0.00
    usb 2-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
    usb 2-2: Product: Debug console
    usb 2-2: Manufacturer: Xen
    usb 2-2: SerialNumber: 0
    usb_debug 2-2:1.0: xhci_dbc converter detected
    usb 2-2: xhci_dbc converter now attached to ttyUSB0

I can 100% reliably reproduce the issue on warm reboot. On cold boot
usually it works.

Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NOGRtyAsX5TvT4OG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjQwUMACgkQ24/THMrX
1ywF3gf+N25LmjC30sFBQ6fKCfNIvHNNZ0Hz2ytXzfAZ7/4IMxBrMWZEJwYnj66V
C4lCx/ht68RoMndhSy8JkBReXkRozwOSOqGNUN68BBsNsEEBKRjsKZoIdguCwjO8
5xHJJEfUqsacypd5i4H1/+BJtOvygjHqOKS7UmVZRigVykNWMba8taCSpUsdXO9U
fleHDLDTdc8Rtul68h/rPERRb1ZY7j50V8Wv1cLG27o6ZrEngyFUYtlswesZSo9D
XWZerGAFr7wLxMzi63XzGMVT9GU2Q1WOiiILLRCFi8g17P0eVmbQQO0bZanI+I8G
m4AlozmyoBkE+DVM+pw0wllFE3tT7g==
=7XY8
-----END PGP SIGNATURE-----

--NOGRtyAsX5TvT4OG--

