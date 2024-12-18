Return-Path: <linux-usb+bounces-18655-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D694C9F6C09
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 18:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D94188DAFC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 17:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F01F1F8ACE;
	Wed, 18 Dec 2024 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8zxrejR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEBA148850;
	Wed, 18 Dec 2024 17:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734541721; cv=none; b=o19pI8U5xg9ECxgU202vtiQZv3grapgHc1NX0cunRURXZvHxjcqtY0+QA0HcEYUCzFzPGPiRzvJXvbceO8vNBqdgEpgZr/f6QXl4R5McJs4dpOJ081e8Gbagl3xmwDOk00y8RUzzTgpYMp0GSTXW185+ITyEkZrNHCkwsQ8mwfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734541721; c=relaxed/simple;
	bh=HSJvssmjfVbnADtEiLh1/d6vzADtedcarOu0FrVSBmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agEa/kby3tf5gsVeeIBm5C6Cu9AR3+Si33wKqiLpuEYitFArwO5davs39nnTfUzGqnU8yooHF8UP36OBxHbabdqqNbNXrcVIEr4+1qCn7rASIy7xd2p9wdwsUvKENH/6b5gBXdh3Wx4VseYNPw0NJIpzHhDiLklgl272eHuOUxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8zxrejR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FD3C4CECD;
	Wed, 18 Dec 2024 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734541721;
	bh=HSJvssmjfVbnADtEiLh1/d6vzADtedcarOu0FrVSBmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8zxrejR4Imz4Fdm/O9PVnRMZxKsztd/3HdvgB81+F5eTqgVSGxQM8FRvFSTd8JmP
	 oynQpFWlIoeFIeYHjPhkiQY6yapBB6ETTZxniyzG45FTqchprrBjox2BGuN2xGP/B6
	 liPYv2nFX224Yz0realUjmV+IlVODaHIvxagoqTTyi3/Y/ETCN1J2cxPsIYphAEDjg
	 shzBaQfNXALJxthQ1VLfdndt3nId0HKLLbHHz3V2g2dQoS6bJ2spXbrJw+HGwFQBDa
	 MRTQnaVZBbeEEpxfVXaRIdUpVDfF9yWr1IlXLfhXWwvbjqxofKpGM+/iGOc4WScV2F
	 jXsN2MZbAgwUQ==
Date: Wed, 18 Dec 2024 17:08:35 +0000
From: Conor Dooley <conor@kernel.org>
To: "Miao.Zhu" <Miao.Zhu@synopsys.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, xu.yang_2@nxp.com,
	andre.draszik@linaro.org, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, heikki.krogerus@linux.intel.com,
	m.felsch@pengutronix.de, rdbabiera@google.com,
	u.kleine-koenig@baylibre.com, conor+dt@kernel.org, jun.li@nxp.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, Jianheng.Zhang@synopsys.com,
	James.Li1@synopsys.com, Martin.McKenny@synopsys.com
Subject: Re: [PATCH v4 2/2] dt-bindings: usb: ptn5110: add TCPC properties
Message-ID: <20241218-washtub-certified-90bec5019b12@spud>
References: <20241218085933.2790127-1-miao@synopsys.com>
 <20241218085933.2790127-3-miao@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xw2WygKi3yIUAjqG"
Content-Disposition: inline
In-Reply-To: <20241218085933.2790127-3-miao@synopsys.com>


--Xw2WygKi3yIUAjqG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 09:59:33AM +0100, Miao.Zhu wrote:
> The TCPCI driver has flags to configure its protperties but
> no way to enable these flags yet. Add these flags into DT
> so that the driver can be compatible with TCPCI  Spec R2 V1.0.
>=20
> Signed-off-by: Miao.Zhu <miao@synopsys.com>
> ---
> V3 -> V4: refine description to follow DTS coding style

Meanwhile missing the rest of the dt coding style?

> V2 -> V3: add description and type for new properties
> V1 -> V2: new patch
> ---
>  .../devicetree/bindings/usb/nxp,ptn5110.yaml       | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Doc=
umentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> index 65a8632..f5059dc7 100644
> --- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> +++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> @@ -21,6 +21,28 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  TX_BUF_BYTE_x_hidden:

Is this x a wildcard?
No underscores in property names please, use -s.
Why is this capitalised?
Missing an nxp vendor prefix.
All of these properties should be type flag, not type boolean.

> +    description:
> +      True when TX_BUF_BYTE_x can only be accessed through
> +      I2C_WRITE_BYTE_COUNT.
> +    type: boolean
> +
> +  RX_BUF_BYTE_x_hidden:
> +    description:
> +      True when RX_BUF_BYTE_x can only be accessed through
> +      READABLE_BYTE_COUNT.

Is the I2C_ intentionally left out of the define here?


Cheers,
Conor.

> +    type: boolean
> +
> +  auto_discharge_disconnect:
> +    description:
> +      True when TCPC can autonomously discharge vbus on disconnect.
> +    type: boolean
> +
> +  vbus_vsafe0v:
> +    description:
> +      True when TCPC can detect whether vbus is at VSAFE0V.
> +    type: boolean
> +
>    connector:
>      type: object
>      $ref: /schemas/connector/usb-connector.yaml#
> --=20
> 2.9.3
>=20

--Xw2WygKi3yIUAjqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MBkwAKCRB4tDGHoIJi
0gO9AP42sd+ZSXPkbenI947adKb+/8ZewAwYDIuK3d6/P+PF3QEAs73W6hmdGuPz
ub7rw1zTKQK3vHwlfH6J0ZaiJPYMQAc=
=UfnL
-----END PGP SIGNATURE-----

--Xw2WygKi3yIUAjqG--

