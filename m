Return-Path: <linux-usb+bounces-30978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B833C8B807
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 19:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 115DA3B9511
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 18:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E478340280;
	Wed, 26 Nov 2025 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFP2/FOM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEB4312836;
	Wed, 26 Nov 2025 18:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183463; cv=none; b=lYWYr0UigMCSxbL8rsNCnz6Kjzj/4hYqaTCFxpFpTAr8J/L0KIzczFJOkei8K6nol5M5FB1Dvhoe8fSbpFDk4jeHOM2q7FFRGnGCbGA0XJUop4iNFkCEppB+QRpuVz+3TdiMaR/dYGctaFxhUjQgQBx99zg8MmFI3bTyOKwqMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183463; c=relaxed/simple;
	bh=5WZhiEaQvVblhY9cHM2bDr2i/VGrZtzzWJLLnZPv9/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIqFEiRhdIergjneaTTykuwYBj2WzGFaBX8TiEjNSdJUGzcz9VGuQIwMLubHVCH1pZ2oSuuZeIA94ci9eaw9Z3Uady/gOCer1uCkTNHAyG8Lyx4er1YJgEYO+cdDi2jf6AiTuRCaFVh9xGF/MVR+Q8LnLJF1Pf/P9rJa4b6s0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFP2/FOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B269C4CEF7;
	Wed, 26 Nov 2025 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764183463;
	bh=5WZhiEaQvVblhY9cHM2bDr2i/VGrZtzzWJLLnZPv9/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFP2/FOM2zXTrZN2QsYPPCPXEpFVOSFXEAZGmBRZ61FBruYQAQezRO2q3/C8mqgEp
	 UsmodebIZPM4M50YGMjgQpYsALxbwTOIDGs7D8Tf631RGMUUE48D9SSlRITcFqm4lx
	 SVNxcMsAhN16tIapEs4jJQsIz587hM82BNqZOdtyQpSv0fxx+4yQe/y5Tz4ChxkhXg
	 70SBH1LyAPX7iD2SDtkc7RoMXmvX6uH2FipmM/JdEDsWrxHZb5Oun1M49hSPZTkbcz
	 z1D5gRCMvzAKFYVTfz4xVp2vy0SMTyNu283EW2Xs84tXTSEu5vQvsGIXZbUS9mYqS6
	 DHWwoc69+l7jA==
Date: Wed, 26 Nov 2025 18:57:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: aspeed,usb-vhub: Add ast2700
 support
Message-ID: <20251126-protegee-ragged-067de2fd6488@spud>
References: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
 <20251126-upstream_vhub-v1-1-910709937ee0@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uyAOyONr3gMni1/q"
Content-Disposition: inline
In-Reply-To: <20251126-upstream_vhub-v1-1-910709937ee0@aspeedtech.com>


--uyAOyONr3gMni1/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 04:26:30PM +0800, Ryan Chen wrote:
> Add the "aspeed,ast2700-usb-vhub" compatible. The ast2700 vhub
> controller requires an reset, so make the "resets" property
> mandatory for this compatible to reflect the hardware requirement.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml | 14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b=
/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> index 7f22f9c031b2..c9ebb6e004d1 100644
> --- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> +++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> @@ -26,6 +26,7 @@ properties:
>        - aspeed,ast2400-usb-vhub
>        - aspeed,ast2500-usb-vhub
>        - aspeed,ast2600-usb-vhub
> +      - aspeed,ast2700-usb-vhub
> =20
>    reg:
>      maxItems: 1
> @@ -33,6 +34,9 @@ properties:
>    clocks:
>      maxItems: 1
> =20
> +  resets:
> +    maxItems: 1
> +
>    interrupts:
>      maxItems: 1
> =20
> @@ -107,6 +111,16 @@ required:
>    - aspeed,vhub-downstream-ports
>    - aspeed,vhub-generic-endpoints
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: aspeed,ast2700-usb-vhub
> +
> +then:
> +  required:
> +    - resets

Do other aspeed platforms have resets? If not, please add an else here
to block its use on other platforms.

> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.34.1
>=20

--uyAOyONr3gMni1/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSdNogAKCRB4tDGHoIJi
0vfcAP4+UCM4+9oWQTzC169bxxTWFttidmoFlgVoPjRLljlb4wEA6tOi+qKVBja+
SvHDIXAz6NXJyWJc8UKtdaXJy+N1sw0=
=wiN/
-----END PGP SIGNATURE-----

--uyAOyONr3gMni1/q--

