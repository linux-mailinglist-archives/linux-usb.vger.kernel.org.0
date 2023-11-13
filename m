Return-Path: <linux-usb+bounces-2843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF57EA4CE
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 21:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E728F1C209DD
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 20:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFB522F1C;
	Mon, 13 Nov 2023 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ56aqx3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD37250EB;
	Mon, 13 Nov 2023 20:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB1BC433C9;
	Mon, 13 Nov 2023 20:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699907502;
	bh=fIARVbAefPJU30DddQ1rgV4vuTrk0KJXRxsHjap3SPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ56aqx3L5+oc843PafhWwRe9LSIfrJkXlAZyn4pAKiJk8nkwDPbGz7xGB0/RqgWI
	 FGnnkvOTBVW0stF6Nays6N4CAqat8dWY/RvWnZRKtuHwrd1/if8dxbfXan9s+scbhx
	 3FSzORu6SL7Fv6xWwOwD3YlRtwwwa77FFsDguQXBAHsoL4WQu7+bzm02EdsUqVB8xq
	 PNVfylEgf0H7ENR9w8wAac0hmyHZQQhFXA6qjjWxrYwHr93RSD28zgfy4rL0Nln8/Q
	 z2ZfB3DiidattULbCqbo64l+lt/iPQeeAa9+UuqTlBSu4oM8HdDiDtdaAD/10xIWDW
	 Apv81Ne1eoPMQ==
Date: Mon, 13 Nov 2023 20:31:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: microchip,usb5744: Add second
 supply
Message-ID: <20231113-extruding-regroup-8c26fe2eec63@squawk>
References: <20231113145921.30104-1-francesco@dolcini.it>
 <20231113145921.30104-2-francesco@dolcini.it>
 <20231113-jargon-manliness-584f34a5cf85@squawk>
 <ZVKCKop2zxI5FvCv@francesco-nb.int.toradex.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y1ODAo1e3RHl1YOW"
Content-Disposition: inline
In-Reply-To: <ZVKCKop2zxI5FvCv@francesco-nb.int.toradex.com>


--Y1ODAo1e3RHl1YOW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 09:08:10PM +0100, Francesco Dolcini wrote:
> Hello Conor,
> thanks for the review.
>=20
> On Mon, Nov 13, 2023 at 07:55:20PM +0000, Conor Dooley wrote:
> > On Mon, Nov 13, 2023 at 03:59:20PM +0100, Francesco Dolcini wrote:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > >=20
> > > The USB5744 has two power supplies one for 3V3 and one for 1V2. Add t=
he
> > > second supply to the USB5744 DT binding.
> > >=20
> > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > >  .../devicetree/bindings/usb/microchip,usb5744.yaml         | 7 +++++=
+-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.=
yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> > > index ff3a1707ef57..6d4cfd943f58 100644
> > > --- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> > > @@ -36,7 +36,11 @@ properties:
> > > =20
> > >    vdd-supply:
> > >      description:
> > > -      VDD power supply to the hub
> > > +      3V3 power supply to the hub
> > > +
> > > +  vdd2-supply:
> > > +    description:
> > > +      1V2 power supply to the hub
> >=20
> > How about v1p2-supply?
>=20
> The reason for vdd2 is this

I see.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Y1ODAo1e3RHl1YOW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVKHqAAKCRB4tDGHoIJi
0mNjAP9fUcaKxFMcv3wv7oSMVK4Tu6svAPmuTFLJRlXDXPbO5QD8DIgec0uLbdKm
Ikp0/BZFsla62RWFEecdOwC5K+OG+wM=
=fEzx
-----END PGP SIGNATURE-----

--Y1ODAo1e3RHl1YOW--

