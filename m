Return-Path: <linux-usb+bounces-3610-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897FE8022A4
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 12:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B717F1C208D4
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 11:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD68947F;
	Sun,  3 Dec 2023 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B86yJ4rl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3A68833;
	Sun,  3 Dec 2023 11:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291DBC433C8;
	Sun,  3 Dec 2023 11:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701601874;
	bh=axh+C9i/WNo7QI5/h/RxNR+LYbThXfmZV9VO9RE6NdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B86yJ4rlMvJqKKKzAoiG/uY7bChF3LIFDp+Jky7dRuI5bXLSdWt6rJB1FONIy39h7
	 IdDSVMVpA4t/4UaKHCmKPWqJDsMJ4Dv5s4eJ10cSiifucZhIhct627XNj1UvYNvlDw
	 V6aOm1o3R126GZ741cf6q6k/CU5L+xE7nJ0ayQ9ABncUhH4LcJrfrEo/FIrfnDQsKw
	 MaeIHVcuCgGAgQ61mxMu9tNsVF0jDEBPcQ5IEjk6tC8kE28tw7oYae8ADHm0h+PapQ
	 pmdr92cTLegEiJbUq6jHqNSd5j92K83b71mk+fnlmYSx5GHLPDbF9aN4624CYzbn+l
	 mPHofHmZENduw==
Date: Sun, 3 Dec 2023 11:11:09 +0000
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
Message-ID: <20231203-traffic-aide-cb03afdb3546@spud>
References: <20231202232217.89652-1-wahrenst@gmx.net>
 <20231202232217.89652-2-wahrenst@gmx.net>
 <20231203-chair-zen-afb8b280ca2f@spud>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Oqdw2jwLt/x//D/T"
Content-Disposition: inline
In-Reply-To: <20231203-chair-zen-afb8b280ca2f@spud>


--Oqdw2jwLt/x//D/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 11:06:43AM +0000, Conor Dooley wrote:
> On Sun, Dec 03, 2023 at 12:22:15AM +0100, Stefan Wahren wrote:
> > The xHCI IP on the BCM2711 SoC is compatible to "brcm,xhci-brcm-v2",
> > but also requires a power domain.
Hmm
This & the driver change makes it look like your compatible setup should
be `compatible =3D "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";.
If the pattern in this patch was repeated, we'd have to modify the
driver like your 2nd patch does for each and new broadcom system that
needs the power domain.


> > So introduce a new compatible
> > and the specific constraints. Since the key allOf can only occur
> > once, merge the reference below.
> >=20
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Cheers,
> Conor.
>=20
> > ---
> >  .../devicetree/bindings/usb/generic-xhci.yaml | 21 ++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/=
Documentation/devicetree/bindings/usb/generic-xhci.yaml
> > index 594ebb3ee432..b6e10b0a3c24 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> > @@ -9,9 +9,6 @@ title: USB xHCI Controller
> >  maintainers:
> >    - Mathias Nyman <mathias.nyman@intel.com>
> >=20
> > -allOf:
> > -  - $ref: usb-xhci.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -28,6 +25,7 @@ properties:
> >        - description: Broadcom STB SoCs with xHCI
> >          enum:
> >            - brcm,xhci-brcm-v2
> > +          - brcm,bcm2711-xhci
> >            - brcm,bcm7445-xhci
> >        - description: Generic xHCI device
> >          const: xhci-platform
> > @@ -49,6 +47,9 @@ properties:
> >        - const: core
> >        - const: reg
> >=20
> > +  power-domains:
> > +    maxItems: 1
> > +
> >  unevaluatedProperties: false
> >=20
> >  required:
> > @@ -56,6 +57,20 @@ required:
> >    - reg
> >    - interrupts
> >=20
> > +allOf:
> > +  - $ref: usb-xhci.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: brcm,bcm2711-xhci
> > +    then:
> > +      required:
> > +        - power-domains
> > +    else:
> > +      properties:
> > +        power-domains: false
> > +
> >  examples:
> >    - |
> >      usb@f0931000 {
> > --
> > 2.34.1
> >=20



--Oqdw2jwLt/x//D/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxiTQAKCRB4tDGHoIJi
0pwvAP0ftjAqzLu/r6pNoYYAYQs5oTugu3kN3GmT+drnPNAU4QD/RRZ8W6M+gRsw
4hzlTOnZ7h1U7vo+cBsICs9eV3qTuwI=
=AR0B
-----END PGP SIGNATURE-----

--Oqdw2jwLt/x//D/T--

