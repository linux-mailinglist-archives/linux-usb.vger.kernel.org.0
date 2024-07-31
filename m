Return-Path: <linux-usb+bounces-12759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52C943896
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 00:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81771B2125A
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 22:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF8716D306;
	Wed, 31 Jul 2024 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="NjFKwqiM"
X-Original-To: linux-usb@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A450160860
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 22:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722463596; cv=none; b=C8CR/IYCq1O6f67FNw+30qQyBcWRSPRJ4xzTGH6gWwOaUYZzAbDv/1nyuRoI8/6gRzdkxeQRTZmhlEdkLRjbobgp6tufQ8ExQ/Xurj0siuHSh1hCsJpZYFYBaje3cSifKvruKuSG1xcEmrVT/XCsvoGiY9qAZW8UZlh9TJIHHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722463596; c=relaxed/simple;
	bh=4e1ibNxz18HdrbD261xViMv+ZXOEo2yBY/zjy/xepNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wiy7oyu9TXj0RfTOlOH2HkE7r11df+G1nV2QsmFWG53G6fnHLz8kQu4V1z9oniI0tmg+FfU1a7FvPE6oxJ7o5pad1IheF1Vr4m4+Ijy9n6U5DqVtmhISNrPQCM/Ct13AlUqjla5nCofQss5J1iniBlDOuJ7Agrn7TwOn5jNJWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=NjFKwqiM; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k4zP5egedQTvJD9ozuAOE9DebhgTotwy5f+reJwXWHs=; b=NjFKwqiMBfLHFcuTjEa140zEKw
	IWFkdFHSRrUl6GTZVbS6lvdVBOXGIYsRwNtfrSXjFd963e9HIdssIvfUm51nY6VZLYyfplxlJsy4E
	prhdCFahZtw8kgIntymHksO64WtzEWAdK2HlHOV+wowelcSTalVjUR0g1GoIZSvgUPPXfKxSVQYUu
	FE4ncQZlxkjHoOVGsL808VjRmGmheNYV3gRZWMHPChPEmxjyzMS/c6JTSJYaHelgPo/OuZPUPRtO1
	G2Ok8pxnH5HsR9qdN9Vvancz9NUEUnOCoo58p2RbnQSXW1zNhX2vsuMDqvhX2ZsIpwK2HxzL+TBJW
	XhpYkNGQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1sZHSh-00DE7Q-1r; Wed, 31 Jul 2024 22:06:23 +0000
Date: Thu, 1 Aug 2024 00:06:20 +0200
From: Cyril Brulebois <kibi@debian.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] xhci-pci: Make xhci-pci-renesas a proper modular
 driver
Message-ID: <20240731220620.sdammhk7t7od3mil@mraw.org>
Organization: Debian
References: <2024073145-curdle-bronco-b9ca@gregkh>
 <ZqqfXYRJf7kGaqus@decadent.org.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jwm6p3gaobkce5a7"
Content-Disposition: inline
In-Reply-To: <ZqqfXYRJf7kGaqus@decadent.org.uk>
X-Debian-User: kibi


--jwm6p3gaobkce5a7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ben Hutchings <ben@decadent.org.uk> (2024-07-31):
> v2:
> - Fix definition of xhci_pci_probe() to remain static
> - Rebase onto v6.11-rc1

Tested-by: Cyril Brulebois <cyril@debamax.com>

On top of 21b136cc63d2a9ddd60d4699552b69c214b32964, starting from a
distribution-oriented .config (Debian's 6.10-1~exp1 arm64 package),
default answers to oldconfig, adding CONFIG_USB_XHCI_PCI_RENESAS=3Dm
afterwards.

On the hardware side: Raspberry Pi CM4 Lite on a CM4 IO Board, with two
(slightly) different Supahub PCIe-to-quad-USB cards (006 and 006S),
everything is good with the firmware available. Otherwise this happens:

[    8.037155] xhci-pci-renesas 0000:01:00.0: failed to load firmware renes=
as_usb_fw.mem, fallback to ROM
[    8.046687] xhci-pci-renesas 0000:01:00.0: xHCI Host Controller
[    8.052712] xhci-pci-renesas 0000:01:00.0: new USB bus registered, assig=
ned bus number 1
[   27.944117] xhci-pci-renesas 0000:01:00.0: can't setup: -110
[   27.949903] xhci-pci-renesas 0000:01:00.0: USB bus 1 deregistered
[   27.956121] xhci-pci-renesas 0000:01:00.0: init 0000:01:00.0 fail, -110
[   27.962837] xhci-pci-renesas 0000:01:00.0: probe with driver xhci-pci-re=
nesas failed with error -110

(No onboard ROM on those.)

Thanks, Ben!


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--jwm6p3gaobkce5a7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmaqtVgACgkQ/5FK8MKz
VSC2LxAAgqtEReWk6rdhyb2S7dFm2zC5TJVKWaeVgP7dhMNo58Tw4T7Jg7m8dOnm
sDdOpfETFoUNpi4rPOD6lTk2PMv0IEeddrTKq7pBxCbtwuhkWUwcYQ1+ClOgPJKm
jz5Cng3p3cEAh/802AUHTeHuQOby0BFq5CIbRsGBJ5Miw0K5HrZ6ddFvSarm3Ji6
XIGeReeY44mtGr6+Zwdx4Md0cg0jdy4vxG0UMuCZdXacEtgPnK1stG+cXbVUVO3t
4d1YyHB9CoSOFCk9NkqRe8FW3kxAANXjqRUQ2pmtztFj3T89lLH8bvzVE5BqgfUh
wC4Fum39CjCutseXQEDpAzCBzJahBywXUVMu/hy6GL7M/X4kA2NlawyF8qWCBsgt
7LyWtvJ26/OD89ux8shLWAiUtCFBgDVRo/NKYSWIxNej4hpu/3IMdnccvXPTGvsh
aTOPHu79UmEnnMslqPieOliawlsOrH5AafMSnofF5sFsGnbHHD0jjIlFLb4WU4A+
f+RW0zJr8Yrmqiubl5jRC0iZ5KcqyniSApAESu2Fh6QxWVswcwxY/BLnViI8zr9X
fxi3TBqBKsT65x2McbPY841wwk1f1IfyJ/ZlInKCUu8RS9BHn3mQ6QIK6KTbB2qR
ufesPhVcdpOJOkSK1ZLebO90HdHhqWwUVBafWXJ5sL6mw7iSc1E=
=Ckck
-----END PGP SIGNATURE-----

--jwm6p3gaobkce5a7--

