Return-Path: <linux-usb+bounces-3021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598987F17B9
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 16:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9A55B2195A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 15:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B311DA4C;
	Mon, 20 Nov 2023 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXuXXuoy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB31C29C;
	Mon, 20 Nov 2023 15:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645AEC433C8;
	Mon, 20 Nov 2023 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700495143;
	bh=Mf13kzSkExcyvPhnH9lBeXM+1UKNn14DDjcJ3StlIoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXuXXuoyJnfgUCQK1X12FP4JL1Y3eR9/BRp0/MUuTl3MhCF3KK0nFr3436r2pCKXb
	 xkQX/ShmAMDV5lDZsBlsCsbVehE+uguaHwGEiArapYyz87IDl+gW3cbZdsfZfZfPx1
	 ikbg4W0qxv0Bxvfze7lb/aH9l69mtk0wusvkpVpQcCB/Dg1oU38v5OHzFYgLAweCLS
	 3eduYAQKOP/cWI3pb4RulPavh2uTpkHor16JLy2GQ34HS5fOqrMOZEXVUcX7ODvlCo
	 0+rfXJJO94HQDKAiKWECUzw36pHa61BUAhuJublU3SeoSBqrWtzr8Xuo+/CvcqvOov
	 2OC9I3utaCjQA==
Date: Mon, 20 Nov 2023 15:45:39 +0000
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
Message-ID: <20231120-grinch-upbeat-05f7a32a99fa@spud>
References: <20231119023454.1591-1-linux.amoon@gmail.com>
 <20231119023454.1591-2-linux.amoon@gmail.com>
 <20231119-phrasing-reverse-bbc1fde515d5@spud>
 <CANAwSgQ6H9FUEBKz7sCf4kUZSMnCfyXG-cpGTMZoT15W9187Kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i584DEwwEuaJNfQd"
Content-Disposition: inline
In-Reply-To: <CANAwSgQ6H9FUEBKz7sCf4kUZSMnCfyXG-cpGTMZoT15W9187Kg@mail.gmail.com>


--i584DEwwEuaJNfQd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 08:57:28PM +0530, Anand Moon wrote:
> Hi Conor,
>=20
> On Sun, 19 Nov 2023 at 19:28, Conor Dooley <conor@kernel.org> wrote:
> >
> > On Sun, Nov 19, 2023 at 08:04:50AM +0530, Anand Moon wrote:
> > > Add the binding example for the USB3.1 Genesys Logic GL3523
> > > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > > hub.
> >
> > But no comment in the commit message about the new property for the
> > "peer hub". $subject saying "dt-bindings: usb: Add the binding example
> > for the Genesys Logic GL3523 hub" is misleading when the meaningful
> > parts of the patch are unrelated to the example.
> >
> > >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > V3: fix the dt_binding_check error, added new example for Genesys GL3=
523
> > > v2: added Genesys GL3523 binding
> > > v1: none
> > > ---
> > >  .../bindings/usb/genesys,gl850g.yaml          | 63 +++++++++++++++++=
--
> > >  1 file changed, 59 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yam=
l b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > index ee08b9c3721f..f8e88477fa11 100644
> > > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> > >  maintainers:
> > >    - Icenowy Zheng <uwu@icenowy.me>
> > >
> > > -allOf:
> > > -  - $ref: usb-device.yaml#
> > > -
> > >  properties:
> > >    compatible:
> > >      enum:
> > > @@ -27,12 +24,44 @@ properties:
> > >
> > >    vdd-supply:
> > >      description:
> > > -      the regulator that provides 3.3V core power to the hub.
> > > +      phandle to the regulator that provides power to the hub.
> > > +
> > > +  peer-hub:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      phandle to the peer hub on the controller.
> >
> > What is this, why is it needed? Please explain it in your commit
> > message.
> >
> Ok, GL3523 integrates Genesys Logic self-developed USB 3.1 Gen 1
> Super Speed transmitter/receiver physical layer (PHY) and USB 2.0
> High-Speed PHY
>=20
> peer-hub is used to cross-connect those phy nodes so that it can help
> hub power on/off simultaneously.

I said please explain it in your commit message, but on reflection I
think that would be insufficient. Extending the description to explain
what the peer-hub is would be great too. "peer hub on the controller"
doesn't seem to make sense to me either, as the peer hub phandle is to
another phy, not to the controller. I think that would probably also be
resolved by explaining what the peer hub is in a more detailed manner.

If this is purely a genesys thing, the property should grow a genesys,
prefix also.

Cheers,
Conor.

--i584DEwwEuaJNfQd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVt/IwAKCRB4tDGHoIJi
0l7WAP4jO2VytV+gaR4Fr/4ZJpmrfQ2P5ysd6CPf71fn0gDBSgEA0EeG15JAP0T2
UF4SNHfWgFn93keokaU5a5twE8yTlQA=
=o5XT
-----END PGP SIGNATURE-----

--i584DEwwEuaJNfQd--

