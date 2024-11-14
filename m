Return-Path: <linux-usb+bounces-17599-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1F9C914B
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 19:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BE9EB3D177
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 17:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9271318E021;
	Thu, 14 Nov 2024 17:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+fsqv1g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E2018BB82;
	Thu, 14 Nov 2024 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731606313; cv=none; b=JV+RVXZWHrxzk/mWHw/V3hZpCM7FSW0e1KysBRiNWVA85Be8dHDFWFMzbAuYcOzw2ZElOpu0K7opQaTpLW+4x1tXpNI+p/+0NZVMeJx4RjzQzEHd4p77pGJUaq0oS/BWoUY37qeUA3T2BM9MQKBY8K7peoftXilKjFLCPQR2xUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731606313; c=relaxed/simple;
	bh=g2Nti/vf3sUh6QVaYsrF23szsr80tZFZx8AOgvPabRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ga8oDKPM3tndBjqT+NOYfQcctp7jaDQuOWyg476uO2ft8We9UvdIEbSutFJNQbTB9+X2zNGtdEkJgn8ByMfWiHnxlWzV6RE+8ltt9DtTT61+5U/dHGNj8e02fle5XJeQsmUWVoG5SZrvOe9aghm81uQ6WiVrBkUvmL9B3Mg7I/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+fsqv1g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF05DC4CED0;
	Thu, 14 Nov 2024 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731606312;
	bh=g2Nti/vf3sUh6QVaYsrF23szsr80tZFZx8AOgvPabRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+fsqv1glf0GmgzH6OSjBqoombd9ydRBitGr7WMDXZ7M+kbjT0zIQHzmfVmKwMWoa
	 fE+ilVhIy3AfBcBmjSUsQSk+8DHW5ORHxtCGp988nYZXeC/VyvLAGm/4WQHhCkVtwO
	 G9H6V3P03U1g07EebDTsHjOFSwgRx9TXoHPoS1BNkZvRBCayrSGDWTvlIHTSRYB3dx
	 fWYf36G1GPwYZXBEJzKEE1OB2VnYCr2z31aemas+incrKM6EOvrmq9K3M5/kgbsibP
	 1ZZfUJ0PcFchtMGZulz+q2n3Y09WJc59G7TKz/pMhrroyugMM/Nieq3e+5Ji1h0NFm
	 AOOeeuVUt6HUA==
Date: Thu, 14 Nov 2024 17:45:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: imx8mq-usb: optionally refer to
 usb-switch.yaml
Message-ID: <20241114-marmalade-bottling-8fe656515ee7@spud>
References: <20241114102203.4065533-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tOtGMvqBontwFfXh"
Content-Disposition: inline
In-Reply-To: <20241114102203.4065533-1-xu.yang_2@nxp.com>


--tOtGMvqBontwFfXh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 06:22:03PM +0800, Xu Yang wrote:
> The i.MX95 usb-phy can work with or without orientation-switch. With
> current setting, if usb-phy works without orientation-switch, the
> dt-schema check will show below error:
>=20
> phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
>         'port' is a required property
>         'ports' is a required property
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb=
-phy.yaml#
>=20
> This will add a condition to optionally refer to usb-switch.yaml.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

$subject is not what the patch does.

> ---
>  Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yam=
l b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> index 6d6d211883ae..1238792157f8 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> @@ -118,6 +118,8 @@ allOf:
>            contains:
>              enum:
>                - fsl,imx95-usb-phy
> +      required:
> +        - orientation-switch
>      then:
>        $ref: /schemas/usb/usb-switch.yaml#
> =20
> --=20
> 2.34.1
>=20

--tOtGMvqBontwFfXh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzY3IwAKCRB4tDGHoIJi
0lZiAPsGD+L5kP752Lq06LoPa8MBvAshVTvc47iKq4VPeQ5BmAD7BdOzlk6wBkqL
VeQlwYSD0nAuy3ALgJk41OF0j5zyiAA=
=c160
-----END PGP SIGNATURE-----

--tOtGMvqBontwFfXh--

