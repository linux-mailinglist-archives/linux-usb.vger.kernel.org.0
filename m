Return-Path: <linux-usb+bounces-773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1187B3429
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 16:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 5B50E282C39
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 14:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E9048820;
	Fri, 29 Sep 2023 14:04:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8533C37;
	Fri, 29 Sep 2023 14:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A273C433C7;
	Fri, 29 Sep 2023 14:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695996273;
	bh=kllDxxZDnI55vJYq/PxnYJDIVVqb3qsnid1yZ4I5Z7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGbtJU9UV6/I+/s6FSJ4NI759RriRRm7zXnXdUVkMHjlMp5iN5aNZ34iF6DTzZCHx
	 QpAQjc5q0luFoKWw0ENykWg8mlUbpbgzG2y8cTDsmRDMSC+0pecXc7zlw3LvKXcgmo
	 erBnuvjNEeOPIb6vRCUqjpeNXO6ckCn7koXPJk2cPQfeUE14WFpY1rnSdgpgRlpjw2
	 jDE9Q1KyPcuyBGRlvPqUwZdzGZ3E8viByHEf5olOD6Mnsw/XMrN7mAm9vJ03WpnZeX
	 Gh/JWmKehcF4PgFRXazhbfqoazNx9OiuGSq6qZDQIspEkq1beYJkb+a59JeMD/SbmF
	 EpJMRmaCguAJA==
Date: Fri, 29 Sep 2023 15:04:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: gregkh@linuxfoundation.org, michal.simek@amd.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	peter.chen@kernel.org, linus.walleij@linaro.org,
	paul@crapouillou.net, arnd@arndb.de, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [RFC PATCH 1/3] dt-binding: usb: ulpi-phy: add ulpi-phy binding
Message-ID: <20230929-harmonics-chapter-54f1819383fa@spud>
References: <20230929064852.16642-1-piyush.mehta@amd.com>
 <20230929064852.16642-2-piyush.mehta@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N1ZSGQNLJzaSLTXk"
Content-Disposition: inline
In-Reply-To: <20230929064852.16642-2-piyush.mehta@amd.com>


--N1ZSGQNLJzaSLTXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Sep 29, 2023 at 12:18:50PM +0530, Piyush Mehta wrote:
> Create an ulpi-phy binding to read and write PHY registers with explicit
> control of the address and data using the usb.VIEWPORT register.
>=20
> Signed-off-by: Piyush Mehta <piyush.mehta@amd.com>
> ---
> This binding patch was created to support generic platforms. This binding
> will be modified in accordance with patch [3/3] procedures. One of the
> approch may be Create a zynq phy platform driver in "driver/usb/phy" with
> driver source "phy-ulpi-zynq-usb.c" and then the binding will be particul=
ar
> to the Xilinx/AMD zynq platform.

I don't understand what the drivers have to do with describing the
hardware here. You have a zynq platform with this phy, so the compatible
should reflect that. Whether you create some software that supports
generic platforms is mostly a separate question IMO.

> This binding was built with the Zynq hardware design example in considera=
tion
> of as a generic platform. The viewport provide access the Chipidea contro=
ller
> to interface with the ULPI PHY.
> ---
>  .../devicetree/bindings/usb/ulpi-phy.yaml     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ulpi-phy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ulpi-phy.yaml b/Docume=
ntation/devicetree/bindings/usb/ulpi-phy.yaml
> new file mode 100644
> index 000000000000..490b2f610129
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ulpi-phy.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ulpi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ULPI PHY- Generic platform
> +
> +maintainers:
> +  - Piyush Mehta <piyush.mehta@amd.com>
> +
> +properties:
> +  compatible:
> +    const: ulpi-phy

Please add a device specific compatible here.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  external-drv-vbus:
> +    description:
> +      If present, configure ulpi-phy external supply to drive 5V on VBus.
> +    type: boolean
> +
> +  view-port:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Address to read and write PHY registers with explicit control of
> +      the address and data using the usb.VIEWPORT register.

Why would this not just be a second entry in reg?

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - view-port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy0@e0002000 {
> +        compatible =3D "ulpi-phy";
> +        #phy-cells =3D <0x00>;
> +        reg =3D <0xe0002000 0x1000>;
> +        view-port =3D <0x170>;
> +        external-drv-vbus;
> +    };
> --=20
> 2.17.1
>=20

--N1ZSGQNLJzaSLTXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRbZbAAKCRB4tDGHoIJi
0o8KAP9OXTDirN/hUstii6+IrAPKuGM6r/lwZKpvExF6Mbf/sgD/eYh+BO5rYspr
Xm/vVpg8e044cRuShplXfMnQimDUqQI=
=Lb9Z
-----END PGP SIGNATURE-----

--N1ZSGQNLJzaSLTXk--

