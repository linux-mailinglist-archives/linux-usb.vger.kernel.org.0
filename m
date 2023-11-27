Return-Path: <linux-usb+bounces-3375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932DD7FA8E2
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 19:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 702D91C20B41
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 18:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E933DB8A;
	Mon, 27 Nov 2023 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="BWxoRKu0"
X-Original-To: linux-usb@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03B992;
	Mon, 27 Nov 2023 10:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SNVechLYXqvOX/AArSP2A06NM8kGgDgyWoojg2wGWbM=; b=BWxoRKu0B+1c/eQlg1eT9WIB6g
	dv1XQ1y9ipi1UkzucxcBM+zN0g8BXn0ytMT8TS0TszSxwH/q3S26rTNARF15mma3puUNjT4K5lTA7
	HWpl7pueh519W6nj0ksBoj+HbciQR6n9kDr1O9IzGC9P2Mavq9i0Yr+NQ98pfdJKC77TyP59ccGz8
	09179pOtki0/y7aKjBr3u9q0s3GZGR/pzxt7xoTmEFbrgXzK2UrAvLSzCnw28qL8HMQgvKyZMRFYG
	d2QZS6ybBAOyKwxFD5J43ks+RU/WOulnKeRZOvfrI8+KNwuCeDhYWZpZ8qzf0jd4/FSDjVoi3YDoj
	DCUIySvg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1r7gEG-00ANiX-Ul; Mon, 27 Nov 2023 18:21:09 +0000
Date: Mon, 27 Nov 2023 19:21:06 +0100
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
Message-ID: <20231127182106.p6zjcozwqguqnojj@mraw.org>
Organization: Debian
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <20231127003432.7aztwjxper2a3o33@mraw.org>
 <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
 <20231127115538.npv23hhn7jfrk3fc@mraw.org>
 <892c2e2f-3187-491b-b464-56d099b6fd49@gmx.net>
 <20231127130225.lyk2jngfru5lw6sd@mraw.org>
 <d22e404b-30e5-4c1f-add0-77c0bb88351d@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="enguv7l6mg7h36au"
Content-Disposition: inline
In-Reply-To: <d22e404b-30e5-4c1f-add0-77c0bb88351d@gmx.net>
X-Debian-User: kibi


--enguv7l6mg7h36au
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Stefan Wahren <wahrenst@gmx.net> (2023-11-27):
> can you please check what happens if you add the following to
> config.txt:
>=20
> [cm4]
> otg_mode=3D1

I've only rebooted a few times but the system seems to be booting fine
once this setting is added to config.txt.

Writing stuff to a USB stick with or without the patches seems to give
similar performances: ~ 18 MB/s after 3 minutes of copying /dev/null to
/dev/sda with a 32M block size; similar CPU usage for dd, usb-storage,
and the relevant kworker thread.


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--enguv7l6mg7h36au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmVk3gsACgkQ/5FK8MKz
VSCnTQ/6Ao90LSyY1CLWughKy/yH4RsSA/Q21yKPVdGUmFLY/7okPzqs3XF2/Zwj
ULHfoc5hGZXO8CaefPnjmzwsrz+evftz68Qa7atPSCWEWnajds9OPKfXcEIUy4oD
3pkXiIgRJSdyaBrCLv6W9ap3RBATlI482ggJS/nQxLvRob9RhMU9rMyuNc81x95v
D6u1j6lOXWsFAFt9axw9Rzwt+MC4upmRr7qcRWd8JdPviW+AgA6kGMMvXAelq5Zs
pihCB+QKpRDPsOzJQ2B1zn7G6w3CUkjxhAVlMZ07UwEfUPL2+1n8jcIziYlfy1eV
vDf49+JUV1EkggpPfT55M+kBsXfkLPsKeF+aFPpQgEN7MoNemATkhIPez42ndLdk
qWnMkAPd8+n7z/EM3FPshOu1CdtLVDcWfAQBn5qAZtRhIgicjdZLYNVTEvnzBfhe
QykQOM1xxVb1lRcm0PiPYvegPyHJtKkegX8rancNYesf7k2Gxk1VF2fUXvXV4bjT
JQTGoUnSocl2cB2cXlVsV+28ASaHJ6kT589gyRX9U4AQP2oLdNGglpL6v9Pwi7Jy
MyzKrQVLZerwcWUxPBHP054oHVsVIxUx5g1s2RYbOVyE53jhIAAa1VA6AphrwRn4
lVNr6I/zsz/AZlYN9CxKPgidlU25xXypN/h/k7+j+7JiD4c+vl0=
=DusX
-----END PGP SIGNATURE-----

--enguv7l6mg7h36au--

