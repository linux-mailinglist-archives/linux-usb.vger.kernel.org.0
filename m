Return-Path: <linux-usb+bounces-3609-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CEE80229E
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 12:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45911F210B7
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 11:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45A39477;
	Sun,  3 Dec 2023 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkyYSH6I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131548833;
	Sun,  3 Dec 2023 11:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E26BC433C7;
	Sun,  3 Dec 2023 11:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701601608;
	bh=/5uq1CQzGZNdHIzMtVGTpLPtK/zkbFq2U4Y9E9SBsWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkyYSH6I1TjuHiJ74rtWQsfIJxV0uzfdA6Ob7W7X0plSVkwXYhHzzwjAd84Wrm7Ul
	 VQjoFKEt0z1hJLkEPib7azSBcsq0lxj55L5UQd72OoeVLFD02Xrl4gxJpTFjawVDCo
	 qkG2+w68ViEJveu426U6ni7OUMfZBX6lLunThsHeoYVR2Hqc5cXJpB9S1ZlaTJv8bX
	 ieXDQRZ16QctF8K7P5xlMX+XcmZYoMXYQlx5z/EaKpzC6EWL25U9V1oIWNZCWtLdEe
	 1/VR/GoB3uv32UPgzovS19xdARxslDhhBjCyWU4mO5HesrKwN1+bVzuyyaQpxpFIpr
	 o0rf6Ro+HWdFw==
Date: Sun, 3 Dec 2023 11:06:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Cyril Brulebois <kibi@debian.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 1/3] dt-bindings: usb: xhci: add support for BCM2711
Message-ID: <20231203-chair-zen-afb8b280ca2f@spud>
References: <20231202232217.89652-1-wahrenst@gmx.net>
 <20231202232217.89652-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VQSfyViANYpZgCLE"
Content-Disposition: inline
In-Reply-To: <20231202232217.89652-2-wahrenst@gmx.net>


--VQSfyViANYpZgCLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 12:22:15AM +0100, Stefan Wahren wrote:
> The xHCI IP on the BCM2711 SoC is compatible to "brcm,xhci-brcm-v2",
> but also requires a power domain. So introduce a new compatible
> and the specific constraints. Since the key allOf can only occur
> once, merge the reference below.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/usb/generic-xhci.yaml | 21 ++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-xhci.yaml
> index 594ebb3ee432..b6e10b0a3c24 100644
> --- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> @@ -9,9 +9,6 @@ title: USB xHCI Controller
>  maintainers:
>    - Mathias Nyman <mathias.nyman@intel.com>
>=20
> -allOf:
> -  - $ref: usb-xhci.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -28,6 +25,7 @@ properties:
>        - description: Broadcom STB SoCs with xHCI
>          enum:
>            - brcm,xhci-brcm-v2
> +          - brcm,bcm2711-xhci
>            - brcm,bcm7445-xhci
>        - description: Generic xHCI device
>          const: xhci-platform
> @@ -49,6 +47,9 @@ properties:
>        - const: core
>        - const: reg
>=20
> +  power-domains:
> +    maxItems: 1
> +
>  unevaluatedProperties: false
>=20
>  required:
> @@ -56,6 +57,20 @@ required:
>    - reg
>    - interrupts
>=20
> +allOf:
> +  - $ref: usb-xhci.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2711-xhci
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false
> +
>  examples:
>    - |
>      usb@f0931000 {
> --
> 2.34.1
>=20

--VQSfyViANYpZgCLE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxhQwAKCRB4tDGHoIJi
0qf6AQCobUSsGXTH1WvP+u6hdLRn2l2UEqDOa6l6put5tg25ngD/dNggWg02qYbT
V70cCDru9hnNGqh7AjNRoT99v0Zgdw0=
=pn7t
-----END PGP SIGNATURE-----

--VQSfyViANYpZgCLE--

