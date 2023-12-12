Return-Path: <linux-usb+bounces-4077-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222CD80F61F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 20:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CF27B20F60
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 19:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285198005A;
	Tue, 12 Dec 2023 19:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="amWo4Qg0"
X-Original-To: linux-usb@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A68BD;
	Tue, 12 Dec 2023 11:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JOfmT37a1O6ltRt9f24ymIuuDIGdgEf/puwz89pIzfk=; b=amWo4Qg0R+e+2YnuKeDk/37FCs
	R7MsaQh8Psr8Jr8ybt6AVcOkHAaooWWy/nxORyp9d9cBjBKGpEut52euP4jkhaPP9M0RAUIczQgQ8
	g2jboNJsJQ1YDcsa/IcqpuhsxogjK+h0ZpPmrYwW1YWfk6o4imK+XBVmcx2RqBOI63jofeWTiBLcS
	c95yCsK4Bl8lZhw4tHoS9Y9H5nhEJHfqbJ2kA55UQsn/I8FJgUwMQCtrIcP8s79u5F3XVli1YO5iS
	sbkrxXCjSoqsb3qp3Ism/lqEwyHvBoCNzxC2r5TkvA8SrfK33U7uC5BcODEhYwAvpfA3+Hg4gjmAj
	cEsqN10w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1rD885-0068fw-HD; Tue, 12 Dec 2023 19:09:18 +0000
Date: Tue, 12 Dec 2023 20:09:04 +0100
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
Subject: Re: [PATCH V4 0/3] ARM: dts: bcm2711: Add BCM2711 xHCI support
Message-ID: <20231212190904.igxm2twvftokhdwr@mraw.org>
Organization: Debian
References: <20231205200531.8232-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mascii7e2qhbhct"
Content-Disposition: inline
In-Reply-To: <20231205200531.8232-1-wahrenst@gmx.net>
X-Debian-User: kibi


--2mascii7e2qhbhct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <wahrenst@gmx.net> (2023-12-05):
> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
> does not have a VL805 USB 3.0 host controller, which is connected via
> PCIe. Instead, the Compute Module provides the built-in
> xHCI of the BCM2711 SoC.
>=20
> Changes in V4:
> - use "brcm,xhci-brcm-v2" as fallback compatible as suggested by
>   Conor & Florian
>=20
> Changes in V3:
> - introduce a new compatible for BCM2711 in order to make the
>   power domain dependency SoC specific, which also results in
>   a driver change

This is still:

Tested-by: Cyril Brulebois <cyril@debamax.com>


Again, I'm also applying Jim Quinlan's PCIe patch series v8, to be able
to fully test what happens with USB devices, onboard and behind PCIe:
  https://lore.kernel.org/all/20231126201946.ffm3bhg5du2xgztv@mraw.org/

With the following on a CM4 IO Board, with a Samsung flash drive and a
USB keyboard connected to onboard USB ports:
 - CM4 Lite Rev 1.0
 - CM4 8/32 Rev 1.0
 - CM4 4/32 Rev 1.1

and using one of the three PCIe-to-USB boards referenced previously,
connecting another Samsung flash drive on one of its USB ports.

Conclusion: I can see and use onboard USB devices alongside behind-PCIe
USB devices, either with or without adding otg_mode=3D1 to config.txt.

On a CM4-based product that uses both onboard USB ports and PCIe-to-USB
ports, all USB components still work fine (3 RF adapters, 1 modem), with
or without otg_mode=3D1.

(All of this is still with a Debian 12 arm64 user space.)


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--2mascii7e2qhbhct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmV4r8wACgkQ/5FK8MKz
VSBkYg//cI6s0//qpVlGV1kSosOTyG1w3Ze7eLTkFQpsWTE9Cq1zvEiD7Kx/fA/y
M9BzcNz7nqRWiykkqNXpjPwkFLINb7EPgfYypfXLZbHl39Q4QgfcfsxpW/WDQ9Vw
6PUNf68xW1HL4zGsZkkKTEeZvsTFULW1SZG8z3//etz1vS0inBRR6l8vNkzKQ44W
CwzqhrP/glLv/fs/K1Kq+H2ICGbUah4ejdk8thgv6k2C8ASjFrOlyOso/HjAN4hN
gXYpJgHpCxlcDwpT/75FHcxkuZNCf5IYE+NeaRyNodzml/nCFAe4npfhA8aZlNc2
Z3T7cKOWNsygKxMiJrYVVGr5Ln304DCp9Ay4WxNFaxXisC9ebk4qDkUKDJKupzzr
aKJi7nB992Od0g65AgfDWOcxcQFqDHqr3Sw1G/zlTuw/OZugy96H+0EXCkU46eLX
DcM8zaRy6ITIKq08ZxVdhcYPNXg4dBuxXbXqGS8xUDHKEK4Zsy/ZjnlU5NmwS27p
Wl/PmS7xGCAtNzjvfCzyFsx4xc6VQ/+EUbkjjaWjT5FeSpmPQND4+M5HuV2ab1Z0
Ur0C3kfi3S/hcsClOaaakfiRTZhgTLAp4Tj9RGAh9Vbu+5jKOYYz1fyfx2FWjLSE
q7Jyf53O/0m+IhCasy2nFvK9Qmnmr7Aa/8/Ws8Dx+JPdYEKc50o=
=w+VB
-----END PGP SIGNATURE-----

--2mascii7e2qhbhct--

