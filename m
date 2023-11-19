Return-Path: <linux-usb+bounces-2995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644CB7F06A2
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 14:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 950901C2090B
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 13:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F64710A06;
	Sun, 19 Nov 2023 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEQu5GXI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6911D525;
	Sun, 19 Nov 2023 13:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24E4C433C8;
	Sun, 19 Nov 2023 13:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700402284;
	bh=GA3KZwIDCb9kgmSAqn+rUvlw/BkjxhX9ULd5EqH49ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEQu5GXIBH0dQxohxznCAQzyPcolkxa3kh62fMGO81WQ+qcG3Voqug/ZCrcLVaZUs
	 K8/4UZdV8X5JfbgJHgiNc43KCxXPYOMlf35L97GHwo4hx0GCFEyJE6K7ZXS0yXhoLu
	 bQmVYUV+CrLg2rEP7Dp08JWJsEZQCnfHmaSRtYZjhk0blu9s5AoCPN6XjsXoatPrD6
	 nc9u8r7AOR6JeUrClFUTqDRYorsaZvpCpKaHtxmVlNtRQYMZvRg1dZ6W49GlyO8xmm
	 qpiXeeWm7UpDGlf5/J6Kpxw+NdFnq5IUk9oYhaJPxTprkkMWSrjhzrVA4Xhp6kFDL9
	 HiPjuMUbqxNfA==
Date: Sun, 19 Nov 2023 13:58:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
Message-ID: <20231119-phrasing-reverse-bbc1fde515d5@spud>
References: <20231119023454.1591-1-linux.amoon@gmail.com>
 <20231119023454.1591-2-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MdiojqQRKNqEOCzn"
Content-Disposition: inline
In-Reply-To: <20231119023454.1591-2-linux.amoon@gmail.com>


--MdiojqQRKNqEOCzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 08:04:50AM +0530, Anand Moon wrote:
> Add the binding example for the USB3.1 Genesys Logic GL3523
> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> hub.

But no comment in the commit message about the new property for the
"peer hub". $subject saying "dt-bindings: usb: Add the binding example
for the Genesys Logic GL3523 hub" is misleading when the meaningful
parts of the patch are unrelated to the example.

>=20
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> V3: fix the dt_binding_check error, added new example for Genesys GL3523
> v2: added Genesys GL3523 binding
> v1: none
> ---
>  .../bindings/usb/genesys,gl850g.yaml          | 63 +++++++++++++++++--
>  1 file changed, 59 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/=
Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index ee08b9c3721f..f8e88477fa11 100644
> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
>  maintainers:
>    - Icenowy Zheng <uwu@icenowy.me>
> =20
> -allOf:
> -  - $ref: usb-device.yaml#
> -
>  properties:
>    compatible:
>      enum:
> @@ -27,12 +24,44 @@ properties:
> =20
>    vdd-supply:
>      description:
> -      the regulator that provides 3.3V core power to the hub.
> +      phandle to the regulator that provides power to the hub.
> +
> +  peer-hub:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the peer hub on the controller.

What is this, why is it needed? Please explain it in your commit
message.

Thanks,
Conor.

> =20
>  required:
>    - compatible
>    - reg
> =20
> +allOf:
> +  - $ref: usb-device.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - usb5e3,608
> +    then:
> +      properties:
> +        peer-hub: false
> +        vdd-supply: false
> +        reset-gpios: true
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - usb5e3,610
> +              - usb5e3,620
> +    then:
> +      properties:
> +        peer-hub: true
> +        vdd-supply: true
> +        reset-gpios: true
> +
>  additionalProperties: false
> =20
>  examples:
> @@ -49,3 +78,29 @@ examples:
>              reset-gpios =3D <&pio 7 2 GPIO_ACTIVE_LOW>;
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    usb {
> +        dr_mode =3D "host";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        /* 2.0 hub on port 1 */
> +        hub_2_0: hub@1 {
> +            compatible =3D "usb5e3,610";
> +            reg =3D <1>;
> +            peer-hub =3D <&hub_3_0>;
> +            reset-gpios =3D <&gpio 20 GPIO_ACTIVE_LOW>;
> +            vdd-supply =3D <&vcc_5v>;
> +        };
> +
> +        /* 3.1 hub on port 4 */
> +        hub_3_0: hub@2 {
> +            compatible =3D "usb5e3,620";
> +            reg =3D <2>;
> +            peer-hub =3D <&hub_2_0>;
> +            reset-gpios =3D <&gpio 20 GPIO_ACTIVE_LOW>;
> +            vdd-supply =3D <&vcc_5v>;
> +        };
> +    };
> --=20
> 2.42.0
>=20

--MdiojqQRKNqEOCzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoUaAAKCRB4tDGHoIJi
0iqHAQCKhkBZCos0AsQrxs71ZfT1KMhFwjJGUUoqz02mNG1qhQEAoj2QVsdOyjw1
wLv5XvOw4ZLu8eTGH5Q9fvXJoThMsA4=
=EJLk
-----END PGP SIGNATURE-----

--MdiojqQRKNqEOCzn--

