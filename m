Return-Path: <linux-usb+bounces-3711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6770B80404B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 21:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA552812EF
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 20:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAE4321A8;
	Mon,  4 Dec 2023 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxCDgTX1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61FC35EEC;
	Mon,  4 Dec 2023 20:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C13C433C8;
	Mon,  4 Dec 2023 20:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701722572;
	bh=Lmoi8XwHQCqK7LERSrjIKu8bjIayDclnu7A7yUmdltQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxCDgTX1c7nBHQG8KhWWmuNY8veYxJ6UpPpZQ78RrL/gN1JlynCemOuSWHAjCadHt
	 xwxD9To/bWsYHb3zEtHBqJoju/7BtLMPmldr89zyvKqQ4XiDx4+qv6vj1rAbv3wEHV
	 +Z8IYEs9Lo1kPZYyiR66TkungMSWR1k6jp2y2nwgolmY9dSzeqxmmulwJmUHzikWCn
	 bTG6XRLNBfj55L+z4w4O7NdgiWisG9gVLA5WOkfVyzCxvwLHlNjuZNbfonZNNUmtu8
	 dQ08Da1jbwiUcP/h/dc3S7IsHNqcyP8C7jmPBUyUZeewzwfblsZFtT7fHiS5STpSRw
	 MO7n1qb4sYyQg==
Date: Mon, 4 Dec 2023 20:42:47 +0000
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
Message-ID: <20231204-specimen-overwrite-3e39b79293c0@spud>
References: <20231202232217.89652-1-wahrenst@gmx.net>
 <20231202232217.89652-2-wahrenst@gmx.net>
 <20231203-chair-zen-afb8b280ca2f@spud>
 <20231203-traffic-aide-cb03afdb3546@spud>
 <7dd529a0-ebee-4f3b-879b-c7b1033cfdb9@gmx.net>
 <20231204-sevenfold-slashing-bb7ea3419c92@spud>
 <0f7fa9f1-2337-428f-8a76-a5b4cac30677@broadcom.com>
 <c26b1792-567a-4156-8907-df3472f843eb@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QwrVvUhlUJPN4Vw7"
Content-Disposition: inline
In-Reply-To: <c26b1792-567a-4156-8907-df3472f843eb@gmx.net>


--QwrVvUhlUJPN4Vw7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 09:27:54PM +0100, Stefan Wahren wrote:
> Hi,
>=20
> Am 04.12.23 um 18:49 schrieb Florian Fainelli:
> > On 12/4/23 09:04, Conor Dooley wrote:
> > > On Sun, Dec 03, 2023 at 05:56:24PM +0100, Stefan Wahren wrote:
> > > > Hi,
> > > >=20
> > > > Am 03.12.23 um 12:11 schrieb Conor Dooley:
> > > > > On Sun, Dec 03, 2023 at 11:06:43AM +0000, Conor Dooley wrote:
> > > > > > On Sun, Dec 03, 2023 at 12:22:15AM +0100, Stefan Wahren wrote:
> > > > > > > The xHCI IP on the BCM2711 SoC is compatible to "brcm,xhci-br=
cm-v2",
> > > > > > > but also requires a power domain.
> > > > > Hmm
> > > > > This & the driver change makes it look like your compatible setup
> > > > > should
> > > > > be `compatible =3D "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";.
> > > > i don't have insight into the hardware, but the fact that the other
> > > > Broadcom SoC didn't require a power domain before let me think we
> > > > shouldn't do this. Otherwise this binding was broken before. But Ju=
stin
> > > > and Florian could clarify this.
> >=20
> > That seems to me like the right approach, the XHCI controller in 2711
> > is tied to a power domain, however that is not the case for other
> > Broadcom STB SoCs.
> before i send just another trial and error version of this series, this
> what i understand:
>=20
> diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> index 594ebb3ee432..6f8744d1ace7 100644
> --- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> @@ -9,9 +9,6 @@ title: USB xHCI Controller
> =A0maintainers:
> =A0=A0 - Mathias Nyman <mathias.nyman@intel.com>
>=20
> -allOf:
> -=A0 - $ref: usb-xhci.yaml#
> -
> =A0properties:
> =A0=A0 compatible:
> =A0=A0=A0=A0 oneOf:
> @@ -25,6 +22,11 @@ properties:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - marvell,armada-380-xhci
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - marvell,armada-8k-xhci
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: generic-xhci
> +=A0=A0=A0=A0=A0 - description: Broadcom BCM2711 SoC
> +=A0=A0=A0=A0=A0=A0=A0 items:

The comment and enum here kinda contradict eachother.
I'd probably say "Broadcom SoCs with power domains" or just leave the
comment out altogether. But in general, yes. You can keep the tag.

Thanks,
Conor.

> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - enum:
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - brcm,bcm2711-xhci
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: brcm,xhci-brcm-v2
> =A0=A0=A0=A0=A0=A0 - description: Broadcom STB SoCs with xHCI
> =A0=A0=A0=A0=A0=A0=A0=A0 enum:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - brcm,xhci-brcm-v2
> @@ -49,6 +51,9 @@ properties:
> =A0=A0=A0=A0=A0=A0 - const: core
> =A0=A0=A0=A0=A0=A0 - const: reg
>=20
> +=A0 power-domains:
> +=A0=A0=A0 maxItems: 1
> +
> =A0unevaluatedProperties: false
>=20
> =A0required:
> @@ -56,6 +61,20 @@ required:
> =A0=A0 - reg
> =A0=A0 - interrupts
>=20
> +allOf:
> +=A0 - $ref: usb-xhci.yaml#
> +=A0 - if:
> +=A0=A0=A0=A0=A0 properties:
> +=A0=A0=A0=A0=A0=A0=A0 compatible:
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 contains:
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const: brcm,bcm2711-xhci
> +=A0=A0=A0 then:
> +=A0=A0=A0=A0=A0 required:
> +=A0=A0=A0=A0=A0=A0=A0 - power-domains
> +=A0=A0=A0 else:
> +=A0=A0=A0=A0=A0 properties:
> +=A0=A0=A0=A0=A0=A0=A0 power-domains: false
> +
> =A0examples:
> =A0=A0 - |
> =A0=A0=A0=A0 usb@f0931000 {
>=20
>=20

--QwrVvUhlUJPN4Vw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW45xwAKCRB4tDGHoIJi
0rLqAP4tdQw32U26NFlZHRyUL4eEAeQ2vAjFMgPdD7zkkK8jXwD/RE1m+kt2eK13
87On6yIisd7+TsYI7dZhE5JHVvVIVw8=
=x6Kt
-----END PGP SIGNATURE-----

--QwrVvUhlUJPN4Vw7--

