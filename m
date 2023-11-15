Return-Path: <linux-usb+bounces-2910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF8D7ED664
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 22:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FEF6B20B9B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 21:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE00941A80;
	Wed, 15 Nov 2023 21:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhNJpuKg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E745BEB;
	Wed, 15 Nov 2023 21:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934A6C433C7;
	Wed, 15 Nov 2023 21:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700085372;
	bh=PSxuJaBO9OQbhVq46qgiadOfIupJ/UF0cV/cyJMMCzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IhNJpuKgRnWYe9Q2fuguzw+iE9QfIkucBc7+ZO3f/zOd72aA3PzWnQO/6kpbo9p0J
	 MvvqKEZEYC8grypWVGMPcTOtjqTvb8sh/VUZuYDSZa+oYBtMH+3J31+7BhjR6giPlV
	 dlYRV49dAF/7galgY5vJm2MM0vhnl/xWTRQfVIfO4uAKjBn0TPi2DeNMLcFetadCiQ
	 CcbIdw+rLJwuh7J2XcyZpNvhXZj3PFV8tzFmtrHgdeMNbLz5YnJGI4UERWhMN/KaeJ
	 Td84D4R9OB2A4zendUGUd0eifvCjRHnXaQjzL0PAetvWlyuExfluzqDNP+W7wltQzD
	 ktf6L3JUxIsTA==
Date: Wed, 15 Nov 2023 21:56:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,usbhs: Document RZ/Five SoC
Message-ID: <20231115-uncommon-handset-fe4f4001bf63@squawk>
References: <20231115211407.32067-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R0+R63p5k7v1HIwy"
Content-Disposition: inline
In-Reply-To: <20231115211407.32067-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--R0+R63p5k7v1HIwy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 09:14:07PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The USBHS IP block on the RZ/Five SoC is identical to one found on the
> RZ/G2UL SoC. "renesas,usbhs-r9a07g043" compatible string will be used on
> the RZ/Five SoC so to make this clear and to keep this file consistent,
> update the comment to include RZ/Five SoC.
>=20
> No driver changes are required as generic compatible string
> "renesas,rza2-usbhs" will be used as a fallback on RZ/Five SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor,

> ---
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/D=
ocumentation/devicetree/bindings/usb/renesas,usbhs.yaml
> index bad55dfb2fa0..40ada78f2328 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> @@ -19,7 +19,7 @@ properties:
>        - items:
>            - enum:
>                - renesas,usbhs-r7s9210   # RZ/A2
> -              - renesas,usbhs-r9a07g043 # RZ/G2UL
> +              - renesas,usbhs-r9a07g043 # RZ/G2UL and RZ/Five
>                - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
>                - renesas,usbhs-r9a07g054 # RZ/V2L
>            - const: renesas,rza2-usbhs
> --=20
> 2.34.1
>=20

--R0+R63p5k7v1HIwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVU+dgAKCRB4tDGHoIJi
0jTaAQDIYJqBns0I4eVyX5yhh7uqDlD2M9rFHmR9yChxiaoV+wEAghJpnEsZrySp
r0WDEQTodZFMDEXutpYK3AtCS6ebLA0=
=/XT9
-----END PGP SIGNATURE-----

--R0+R63p5k7v1HIwy--

