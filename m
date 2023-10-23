Return-Path: <linux-usb+bounces-2061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC777D2775
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 02:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2C341C2087D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 00:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C16E374;
	Mon, 23 Oct 2023 00:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ek9yWICR"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345CE7E;
	Mon, 23 Oct 2023 00:18:10 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DACCDB;
	Sun, 22 Oct 2023 17:18:09 -0700 (PDT)
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B9676606F85;
	Mon, 23 Oct 2023 01:18:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698020287;
	bh=4Z1XHTk+ALsRgwRr7R3lLjwa13S7I+K3DpeSPC4sFgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ek9yWICRyg8JotFltL9yj0hU1kfPisDHrOSSvs9hwB4mKx7HxH+5mLnMk0cqWE5AG
	 +BJX61xnr8aqDOolSQD2u6f3gTBV+5vHpmrT41mxjjHdu3LE0ColLFoxGOXZpxuIYI
	 uAAdQQYjgNC4vsuNynoDnA9rvqIrYrY22JPhBb8pDsfafcvduZnpVYn29rCty9CloZ
	 JNs9/4AwMmMq1mTPSOMkXdAfluhBPOfuhQuCBVlOzNIJHl4GyXfyzT0s2youipjUk7
	 /iyVJ+6r5dZw3WspwCSGgF8qW6GA5+VG8WD8DXzUTNyN/tWvxZy9PS+zg9EVCT04/E
	 7AtO7LEjrKMAw==
Received: by mercury (Postfix, from userid 1000)
	id E8615106050E; Mon, 23 Oct 2023 02:18:03 +0200 (CEST)
Date: Mon, 23 Oct 2023 02:18:03 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: add rk3588 compatible to
 rockchip,dwc3
Message-ID: <20231023001803.7fylnbv74zp2ynx7@mercury.elektranox.org>
References: <20231020150022.48725-1-sebastian.reichel@collabora.com>
 <20231020150022.48725-2-sebastian.reichel@collabora.com>
 <20231020-shudder-tackle-cc98a82f1cd0@spud>
 <20231020160329.uqgjjr6ubfrcqjkj@mercury.elektranox.org>
 <20231022214219.GA706888-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="efodancjhx3m5yv4"
Content-Disposition: inline
In-Reply-To: <20231022214219.GA706888-robh@kernel.org>


--efodancjhx3m5yv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Sun, Oct 22, 2023 at 04:42:19PM -0500, Rob Herring wrote:
> On Fri, Oct 20, 2023 at 06:03:29PM +0200, Sebastian Reichel wrote:
> > On Fri, Oct 20, 2023 at 04:36:19PM +0100, Conor Dooley wrote:
> > > On Fri, Oct 20, 2023 at 04:11:40PM +0200, Sebastian Reichel wrote:
> > > > [...]
> > > > +allOf:
> > > > +  - $ref: snps,dwc3.yaml#
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: rockchip,rk3328-dwc3
> > > > +    then:
> > > > +      properties:
> > > > +        clocks:
> > > > +          minItems: 3
> > > > +          maxItems: 4
> > > > +        clock-names:
> > > > +          minItems: 3
> > > > +          items:
> > > > +            - const: ref_clk
> > > > +            - const: suspend_clk
> > > > +            - const: bus_clk
> > > > +            - const: grf_clk
> > >=20
> > > minItems for clocks and clock-names is already 3, is it not?
> >=20
> > Yes, but the following 'maxItems: 4' implicitly sets it to 4,
> > so I had to set it again. The same is true for clock-names -
> > providings new 'items:' effectively drops the "minItems: 3"
> > from the generic section.
>=20
> Are you sure? We don't add anything implicit in the if/then schemas.=20
> Could be a tool issue though.

I had this issue in the past. But just in case I also did a re-test
before sending my last mail and I did get a warning. So yes, I'm
quite sure :)

-- Sebastian

--efodancjhx3m5yv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmU1u7gACgkQ2O7X88g7
+ppiog//dTq13sn4IdxnxaJPIqoOT87S1/uSFXDk18+PMySQWvlRgvG6Go7ozL5k
TKjrhVcYad7SVuJZ+ngEdGkU7RlNui+ioKTwiurqWA1yGC2p6vNm5SCndv9onUPk
oiaFGoaY+qTlqInwSibs3pT9XrXVY4TXQxALndF48NxV4UyBfhRVeWSC246NYJr+
BZL0MFKTHdnshHNEDMoBpsVl0tp7kGjFZtbYUYpbTrzNNpb36aR4nGds/ovoqYOL
Yz2w2EHFvlEpvyTLuXy4UN+pgeayL0wLBG+uk3l4B7ikiO5Yi8GI7DKxRyV9bVvF
/z1jSj6dbaub0oYO9DR8e3a2k/Z2YZ7DffL8oPf8ZhaZGj6rxZHSzBV2ipt5wTwZ
5YyWQtWuxmka4PrJfFLxm3syheXWnwyUnvFAeuBM/hbp5TtdpIq0zcfVX/T9AcFt
PctvrZo4HLOxnwQoyd+lnTFrhw4VygC9akpUWHj+3KXzVCB80W/qX63DiLL0X7cq
Snx1KgXTHZ0AM0J5nCWK2ttN7/yU54kqwg2v/sSRp6iyY24kau9endcwi8v5pdIx
e2ci77l3IfIKpoKUgpsiKxQp6H2pQ6B2qwodlfcaphde1GDEdeCPplILEC1IsstQ
bXuYBy3niQdeh+F5W0YWbwQpQ2Ns030D6ZUWs4ft9Dqut2C/fgk=
=F+il
-----END PGP SIGNATURE-----

--efodancjhx3m5yv4--

