Return-Path: <linux-usb+bounces-3290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 437857F73C0
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 13:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6F51F20F1D
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 12:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD607250EA;
	Fri, 24 Nov 2023 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEiy96NI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425DC1EB36;
	Fri, 24 Nov 2023 12:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6D1C433C7;
	Fri, 24 Nov 2023 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700828737;
	bh=vlxD35wUZLsa3nu20qeMCvKiG+VbVgsNZnGNx/02fxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEiy96NIaGLuNYOdK94gKbB9z+I3s/FeaIKV0dBKmINUWvHX3MacJgcR/0ynhWw73
	 IIFk1fma1iNdNrikyHikmXCCesbtdUDE7Ot+SvRtsLCoZJQYwhCrpNQp7WaT14cbuE
	 elmGwdQEoRLZQN/tHB6VW0+FApvFzptjCYF1Ecn7tTEukSwsp6myfWpTcmVysLZQTZ
	 SIE5rwoPxWoKpu2y3VDMwfAWQEJ2uO7eBMeQJ9vj+mEf/LzozfyeU/+igyGLfCfybF
	 ipkwdv6owRq9ndEiTm2swcH1CT3oObSX117KQ9G7u4WzZUpoGMU5YneuqXG1lB8Yzz
	 gbkVOIMrK4GVg==
Date: Fri, 24 Nov 2023 12:25:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
Message-ID: <20231124-clear-aids-2fd63e1dcbcf@spud>
References: <20231122182351.63214-1-linux.amoon@gmail.com>
 <20231122182351.63214-2-linux.amoon@gmail.com>
 <20231123-skeletal-smirk-390543e2d6ab@spud>
 <CANAwSgQCOw_CY_Yy7zYHdme92O=O35Ev=MqHcznYnR=ycaxdPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sjy+fap+ufnQLlh0"
Content-Disposition: inline
In-Reply-To: <CANAwSgQCOw_CY_Yy7zYHdme92O=O35Ev=MqHcznYnR=ycaxdPg@mail.gmail.com>


--Sjy+fap+ufnQLlh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 04:18:23PM +0530, Anand Moon wrote:
> Hi Conor
>=20
> On Thu, 23 Nov 2023 at 23:26, Conor Dooley <conor@kernel.org> wrote:
> >
> > On Wed, Nov 22, 2023 at 11:53:46PM +0530, Anand Moon wrote:
> > > Add the binding example for the USB3.1 Genesys Logic GL3523
> > > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > > hub.
> > >
> > > Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> > > which has a common reset pin and power supply.
> > > peer-hub phandle each peer controller with proper gpio reset
> > > and help each peer power on during initialization
> > > and power off during suspend.
> > >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > v4: Fix the description of peer-hub and update the commit message.
> > > Schematics of the Odroid N2+
> > > https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_2021=
0121.pdf
> > > V3: fix the dt_binding_check error, added new example for Genesys GL3=
523
> > > v2: added Genesys GL3523 binding
> > > v1: none
> > > ---
> > >  .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++=
--
> > >  1 file changed, 63 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yam=
l b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > index ee08b9c3721f..bc3b3f4c8473 100644
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
> > > @@ -27,12 +24,48 @@ properties:
> > >
> > >    vdd-supply:
> > >      description:
> > > -      the regulator that provides 3.3V core power to the hub.
> > > +      phandle to the regulator that provides power to the hub.
> > > +
> > > +  peer-hub:
> >
> > Should the property not be "peer-controller"? Your description refers to
> > them as such.
>=20
> No, as per my understanding, peer-hub represents a complete USB hub.
> See the lock diagram in the below link.
>=20
> >
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> >
> >
> > > +      which has a common reset pin and power supply.
> > > +      peer-hub phandle each peer controller with proper gpio reset

This is what I don't get. You say "peer-hub phandle each peer
controller..". It is hard for me to understand that portion of the
sentence, but the interchanging of "hub" and "controller" is
confusing. The title of the binding says "hub controller", so maybe it
is better to use that here.

> > > +      and help each peer power on during initialization
> > > +      and power off during suspend.
> >
> > I generally hate to talk about non-native speakers grammar etc, but what
> > you have here is in need of a lot of improvement. The below is my
> > attempt to understand what you are trying to say:
> >
> > "For onboard hubs that support USB 3.x and USB 2.0 controllers with
> > shared resets and power supplies, this property is used to identify
> > the controllers with which these are shared."

"For onboard hub controllers that support USB 3.x and USB 2.0 hubs
with shared resets and power supplies, this property is used to identify
the hubs with which these are shared."

I re-worded this again to try and remove the use of "controller".
Do you think that this still makes sense?

> Sorry for the poor grammar, I will update this in the next v5.
>=20
> > Also - this is one particular system, what prevents there being a hub
> > that has more than 2 controllers? Also, as you insist that this is
> > generic, and not just for genesys, should this not be defined in a
> > common location?
>=20
> Here is the block diagram of the Genesys GL3523 hub.
> [0] https://www.genesyslogic.com.tw/en/product_view.php?show=3D67 [Block =
Diagram]
>=20
> It has two USB 2.0 and USB 3.1 controllers, so using peer-hub node
> the onboard hub module will bring up this hub.
>=20
> There are many examples that use similar properties hence it is generic.
>=20
> # Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> # Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> # Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> # Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> # Documentation/devicetree/bindings/usb/vialab,vl817.yaml

Which brings me back to the unanswered question, should this not be
defined in a common location given there are several devices using it?
I assume because it only applies to hub controllers and not other types
of devices.

Also, the descriptions that I saw when looking at some of those other
bindings are similarly poor. I can't bring myself to care any more,
just clean up the ambiguous wording here and I'll ack the next version,
I don't expect you to sort out the wording in other bindings.

Cheers,
Conor.

--Sjy+fap+ufnQLlh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWCWPQAKCRB4tDGHoIJi
0n2KAP4gfrkarKYYdtk0+pmhfTKrC35P8NCTE3zgnTcc7D19xwD9EzBpIn9jIfF4
gxd2BDzJFdP2jjGpQP195vHDU5eDFgY=
=r79W
-----END PGP SIGNATURE-----

--Sjy+fap+ufnQLlh0--

