Return-Path: <linux-usb+bounces-2841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422DC7EA41B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 20:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 248C6B20AB6
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 19:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220DB241E5;
	Mon, 13 Nov 2023 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8Kp98Q/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A22377D;
	Mon, 13 Nov 2023 19:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A820AC433C9;
	Mon, 13 Nov 2023 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699905491;
	bh=xoeYl7TuE4EF2D7ncM6qCuxVxFvqvn3WKO30B5QlGjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8Kp98Q/djwyG6tO7zVzDC1RVushteYHc30PJP1mfd1tgsPLnoxPDiP42QZTbodSK
	 115H8VZp39qYLABPwaTicNtwFKQIeGRaUVOq6StnsmeRE7aRu+crUSL8+9Ryb5ODeP
	 5PVCTpusM+Z+XgFNR9cR03HGszPIT7Rlty710gTn1l+1+c//rrfFPAyDojjucTUE/w
	 KfyTfQrCHGSoPV8xcqxZuuuLU2k2Nx9TjZ4DlNSGf0lwBNpowUdkahlLLOz8dv6A7j
	 Av+weaKLu5FGU1Us1IGCIee0BW/S/phHH3P7x/Aqsfp+ntUShfASPPecVM+3GGDYqf
	 biRFJcgjINOkg==
Date: Mon, 13 Nov 2023 19:58:07 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb
 compatible
Message-ID: <20231113-putdown-handwrite-ddc4abe65266@squawk>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-1-ad1ee714835c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jE6N+wTYJsLt+sDI"
Content-Disposition: inline
In-Reply-To: <20231113-j7200-usb-suspend-v1-1-ad1ee714835c@bootlin.com>


--jE6N+wTYJsLt+sDI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 03:26:56PM +0100, Th=E9o Lebrun wrote:
> On this platform, the controller is reset on resume. This makes it have
> a different behavior from other platforms.
>=20
> Signed-off-by: Th=E9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Do=
cumentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> index 95ff9791baea..77e0c0499936 100644
> --- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - const: ti,j7200-usb
>        - const: ti,j721e-usb
>        - const: ti,am64-usb
>        - items:
>=20
> --=20
> 2.41.0
>=20

--jE6N+wTYJsLt+sDI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVJ/ywAKCRB4tDGHoIJi
0hzZAPwJimQsKLDjP4mD+2DufjQwF5bVQRQVj2lSAAYJ7+YVTQD+IkP9LcRN/CWV
tjMAeeidQdu6hYYI1q9kM+RxFzT/2gs=
=YHV2
-----END PGP SIGNATURE-----

--jE6N+wTYJsLt+sDI--

