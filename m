Return-Path: <linux-usb+bounces-3572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E414480100C
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 17:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EDA22810BF
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785BD4CDF3;
	Fri,  1 Dec 2023 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ls4evAN1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBEE4205E;
	Fri,  1 Dec 2023 16:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DACC433CA;
	Fri,  1 Dec 2023 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701447901;
	bh=WHX+WsXOPW9nED7NSLzCA0t/DtZhNiJWBJNAXgWODOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ls4evAN1EVItfj420OdQsIDOxVkJZXVmhbzXXBr034w5T7NhZP1DizYgvq8O1DTIK
	 5ukikE/FN8itWO6kF3Dj0AquR2Ss6wHKfFimoTRe1knhpY0OkCV5xF/lR/nCEGlDce
	 uDjMQx899XB6lKb/JzJisCdmn/qQE541gZJ6giA3U8Cp4CcSAhMqlmzc/fEFFUGNQ6
	 RY5KPHPzy5qJycwIlnmIy+2zLEzrrir38l5guVguuDB+OSpIlVXcbe3+FzpC+5t/0P
	 yKkpHZ/vSi03wEJoJFB5PuNvAnAFKG5Pn+QXUefpKAM6I0ly+pP8+zQfXaRlYvLie/
	 jPplpV6/qWciQ==
Date: Fri, 1 Dec 2023 16:24:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Cyril Brulebois <kibi@debian.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: usb: xhci: Add optional power-domains
Message-ID: <20231201-scandal-zap-c55d403d683b@spud>
References: <20231130154229.22334-1-wahrenst@gmx.net>
 <20231130154229.22334-2-wahrenst@gmx.net>
 <c9f14a17-0dd8-4bf8-a969-8592593b39c5@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IOhvxCgFFqC7KSVg"
Content-Disposition: inline
In-Reply-To: <c9f14a17-0dd8-4bf8-a969-8592593b39c5@broadcom.com>


--IOhvxCgFFqC7KSVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 09:50:17AM -0800, Florian Fainelli wrote:
> On 11/30/23 07:42, Stefan Wahren wrote:
> > BCM2711 SoC use a power domain for the xHCI. So allow supplying this
> > domain in bindings.
> >=20
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   Documentation/devicetree/bindings/usb/generic-xhci.yaml | 3 +++
> >   1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/=
Documentation/devicetree/bindings/usb/generic-xhci.yaml
> > index 594ebb3ee432..e48beaff7d0d 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> > @@ -49,6 +49,9 @@ properties:
> >         - const: core
> >         - const: reg
> >=20
> > +  power-domains:
> > +    maxItems: 1
>=20
> That works, I am not sure whether we want to key off based upon the
> compatible string, but either way:

If by "key it off" you mean selectively permit "power-domains" based on
the compatible, I think that would be a good idea. There is no bcm2711
specific compatible though at present and I figured there could well be
god-knows-how-many other users of generic-xhci out there that also make
use of power domains, which is why I did not request it of Stefan.

--IOhvxCgFFqC7KSVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWoI2AAKCRB4tDGHoIJi
0mrpAQDgUgyrK+x8GSX/dHdxDugO91zYvg+HF+Ieg+KlXO1+sgEA0ws6ZRVXOoqd
3xJDyd56FjPjGTR7/tSQT5P/fhwDHgU=
=YpRX
-----END PGP SIGNATURE-----

--IOhvxCgFFqC7KSVg--

