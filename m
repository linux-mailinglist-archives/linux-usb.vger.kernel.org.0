Return-Path: <linux-usb+bounces-3699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E1803B15
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 18:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6C63281091
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 17:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401232E635;
	Mon,  4 Dec 2023 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JChpAYHi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99904171D9;
	Mon,  4 Dec 2023 17:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFCEC433C8;
	Mon,  4 Dec 2023 17:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701709471;
	bh=P+UWpGYQw9cHPhsOzB7zUN5u6QOr2IQI7845Qq7rmWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JChpAYHiSFUKba8vUOvFO+LPMhtXPdx6jjA5zQ35H/ZD1ylQj8O1bz/C97QsPEMJq
	 VaYMRlG4q0yyPuMQubb2SzGug1V98Gr8CJE/Y+5bnrbrdHTGulejqIt686x74SKQsp
	 I6aAOx42zhjJHAAP9+t6dBvGQ0HHNWovvjgDNFrjwyT9rlw5uoyT8KfmJPSuX/dYPC
	 HBOEdfaGygGtiwCorGwh3N0ioe9Pne9eYgRqqQ8tycmFOpKhG/9GPXTqNbqHlpqR5y
	 pkCiCdetkzq1p2ONsQIkU/aTN1bpda9VsicpeUW4Ud8tQbwXyL5dBYJlbZYYcPSsmy
	 fryXzjbOQnSWQ==
Date: Mon, 4 Dec 2023 17:04:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Cyril Brulebois <kibi@debian.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 1/3] dt-bindings: usb: xhci: add support for BCM2711
Message-ID: <20231204-sevenfold-slashing-bb7ea3419c92@spud>
References: <20231202232217.89652-1-wahrenst@gmx.net>
 <20231202232217.89652-2-wahrenst@gmx.net>
 <20231203-chair-zen-afb8b280ca2f@spud>
 <20231203-traffic-aide-cb03afdb3546@spud>
 <7dd529a0-ebee-4f3b-879b-c7b1033cfdb9@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FoLWAdGXhqeSpqYw"
Content-Disposition: inline
In-Reply-To: <7dd529a0-ebee-4f3b-879b-c7b1033cfdb9@gmx.net>


--FoLWAdGXhqeSpqYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 05:56:24PM +0100, Stefan Wahren wrote:
> Hi,
>=20
> Am 03.12.23 um 12:11 schrieb Conor Dooley:
> > On Sun, Dec 03, 2023 at 11:06:43AM +0000, Conor Dooley wrote:
> > > On Sun, Dec 03, 2023 at 12:22:15AM +0100, Stefan Wahren wrote:
> > > > The xHCI IP on the BCM2711 SoC is compatible to "brcm,xhci-brcm-v2",
> > > > but also requires a power domain.
> > Hmm
> > This & the driver change makes it look like your compatible setup should
> > be `compatible =3D "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";.
> i don't have insight into the hardware, but the fact that the other
> Broadcom SoC didn't require a power domain before let me think we
> shouldn't do this. Otherwise this binding was broken before. But Justin
> and Florian could clarify this.
> > If the pattern in this patch was repeated, we'd have to modify the
> > driver like your 2nd patch does for each and new broadcom system that
> > needs the power domain.
> From my understanding the DT compatible should be specific as possible.

Note that I am suggesting have 2 compatibles. One specific, falling back
to the existing generic one.

--FoLWAdGXhqeSpqYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW4GmgAKCRB4tDGHoIJi
0l2TAP9XICOfjnIB73laF0LJRz+79Jmicl6iTNQve0Eh6qAxPQD8CNHmgFi0TcDr
FdXa/A8/P+7n01pK2Dg8u1tqOQrH4gw=
=EduR
-----END PGP SIGNATURE-----

--FoLWAdGXhqeSpqYw--

