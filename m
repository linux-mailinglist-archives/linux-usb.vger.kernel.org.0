Return-Path: <linux-usb+bounces-3119-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F67F3461
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 18:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC819B210CF
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 17:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C123F56759;
	Tue, 21 Nov 2023 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmtlI5Q9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F4B7469;
	Tue, 21 Nov 2023 17:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043EAC433C8;
	Tue, 21 Nov 2023 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700586001;
	bh=OrMmN4aABkmc7mVV4jQIdj8KovDI4fIKhccVEgfoejk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmtlI5Q9xMShTeJ6ggtOMtfC+xVWvdAv5jkPVtKZ24GmwLMdZfDckSX2BPuH9JRuW
	 UU+DkoQakzyrWIPDwgkqzGKVkE8A7BprdWXO/86zIa8kOFCacGzlmb3tvYgs41JqIU
	 iL0OCH19efzNE5ZzX1E7u4AKp7/YrIu6i16tM6/PfNrrD1ETJ2B2HOv/eYnKZM43Pm
	 r4gGpSjvUGLfxJ8qN5FZ1LuCMax4rAMphf+O5+aIEqStVmTeW/HoGSx4tGIbmMMjne
	 qwJtnh2sTJdsYdhVZhrbnB0LOn2NRJq3yAyMRgT6KsagSEQZ6uBZDmX+RRDecp7oZS
	 AB6bAaow1qHyA==
Date: Tue, 21 Nov 2023 16:59:57 +0000
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
Message-ID: <20231121-defendant-hemstitch-a728c39b4e7d@spud>
References: <20231119023454.1591-1-linux.amoon@gmail.com>
 <20231119023454.1591-2-linux.amoon@gmail.com>
 <20231119-phrasing-reverse-bbc1fde515d5@spud>
 <CANAwSgQ6H9FUEBKz7sCf4kUZSMnCfyXG-cpGTMZoT15W9187Kg@mail.gmail.com>
 <20231120-grinch-upbeat-05f7a32a99fa@spud>
 <CANAwSgQGhDMeHLFpe8gnM2c26CjqX8QHOL1GdHrZJSvnBj39bA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FOgsZlX/pgPygzA3"
Content-Disposition: inline
In-Reply-To: <CANAwSgQGhDMeHLFpe8gnM2c26CjqX8QHOL1GdHrZJSvnBj39bA@mail.gmail.com>


--FOgsZlX/pgPygzA3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 21, 2023 at 09:36:37AM +0530, Anand Moon wrote:
> On Mon, 20 Nov 2023 at 21:15, Conor Dooley <conor@kernel.org> wrote:
> > On Sun, Nov 19, 2023 at 08:57:28PM +0530, Anand Moon wrote:
> > > On Sun, 19 Nov 2023 at 19:28, Conor Dooley <conor@kernel.org> wrote:
> > > > On Sun, Nov 19, 2023 at 08:04:50AM +0530, Anand Moon wrote:
> > > > > Add the binding example for the USB3.1 Genesys Logic GL3523
> > > > > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > > > > hub.
> > > >
> > > > But no comment in the commit message about the new property for the
> > > > "peer hub". $subject saying "dt-bindings: usb: Add the binding example
> > > > for the Genesys Logic GL3523 hub" is misleading when the meaningful
> > > > parts of the patch are unrelated to the example.
> > > >

> > > > > +  peer-hub:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > +    description:
> > > > > +      phandle to the peer hub on the controller.
> > > >
> > > > What is this, why is it needed? Please explain it in your commit
> > > > message.
> > > >
> > > Ok, GL3523 integrates Genesys Logic self-developed USB 3.1 Gen 1
> > > Super Speed transmitter/receiver physical layer (PHY) and USB 2.0
> > > High-Speed PHY
> > >
> > > peer-hub is used to cross-connect those phy nodes so that it can help
> > > hub power on/off simultaneously.
> >
> > I said please explain it in your commit message, but on reflection I
> > think that would be insufficient. Extending the description to explain
> > what the peer-hub is would be great too. "peer hub on the controller"
> > doesn't seem to make sense to me either, as the peer hub phandle is to
> > another phy, not to the controller. I think that would probably also be
> > resolved by explaining what the peer hub is in a more detailed manner.
> >
> > If this is purely a genesys thing, the property should grow a genesys,
> > prefix also.
> >
> No, some USB Hub have combined phy for USB 3.x and USB 2.0 and have common
> reset-gpios and power supply, peer-hub node helps connect the USB controller and
> bring up the USB hub.

I don't know what this is a response to.

> I was waiting for more feedback on these changes.
> Once it's ok I will update with proper the commit message in v4.

And the property description too, so that a reader can understand how to
implement it.

Cheers,
Conor.

--FOgsZlX/pgPygzA3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVziDQAKCRB4tDGHoIJi
0uLyAP0XacgZ4YIqCPBG2yQQt0anbyYpcMvqyLcwj+XJbNqzogD/fU7dUFH+dWnN
K1As/KVRhQar29x35Q7tsbiDGctVfQI=
=ozYs
-----END PGP SIGNATURE-----

--FOgsZlX/pgPygzA3--

