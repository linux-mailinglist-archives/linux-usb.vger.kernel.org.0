Return-Path: <linux-usb+bounces-1997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC567D1380
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 18:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 587B9B2154B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 16:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469E31E52F;
	Fri, 20 Oct 2023 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IQFefCmv"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425731E506;
	Fri, 20 Oct 2023 16:03:35 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C018AB3;
	Fri, 20 Oct 2023 09:03:33 -0700 (PDT)
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1B29F660731B;
	Fri, 20 Oct 2023 17:03:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697817812;
	bh=gdDLnZkjmHu+Sk+/2xbwhd6fH/+pG0s/huYMTIz5rp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQFefCmvfeF1DgM1gwp4s6N4cgiJZSOLMPM4KqmFPhcDEqYra/6qGuzOZ8uXfsM1G
	 dndXiXqb3HzXVk1aMsaSQ0S56EMTjnZjF64NXuuVRQQz8/270jgTiqIxtulr4wGb7c
	 OPhUDYPn+hXJEAf4rl9wOAcZA/tf/eSSJYQQzh0N/+XupthBNbSDHU/kqHqFhTr5Z6
	 x0j1cSz2oJoChJT4pr/9Vo3CP/ji3vHYFZ8GgNTQvXtN7ZRdbaJeFsp0+fPOob5UUU
	 Tu62TlLLx4w2HAGI92a3SiNLOaUFO/rvEo7+sxOqggfemBvjNEz+vG+DrTd/1cZKNv
	 kvpOyb/vt5z8A==
Received: by mercury (Postfix, from userid 1000)
	id 1E11910603FC; Fri, 20 Oct 2023 18:03:29 +0200 (CEST)
Date: Fri, 20 Oct 2023 18:03:29 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: add rk3588 compatible to
 rockchip,dwc3
Message-ID: <20231020160329.uqgjjr6ubfrcqjkj@mercury.elektranox.org>
References: <20231020150022.48725-1-sebastian.reichel@collabora.com>
 <20231020150022.48725-2-sebastian.reichel@collabora.com>
 <20231020-shudder-tackle-cc98a82f1cd0@spud>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdmk4yrcxo3we24y"
Content-Disposition: inline
In-Reply-To: <20231020-shudder-tackle-cc98a82f1cd0@spud>


--bdmk4yrcxo3we24y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Fri, Oct 20, 2023 at 04:36:19PM +0100, Conor Dooley wrote:
> On Fri, Oct 20, 2023 at 04:11:40PM +0200, Sebastian Reichel wrote:
> > [...]
> > +allOf:
> > +  - $ref: snps,dwc3.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: rockchip,rk3328-dwc3
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          maxItems: 4
> > +        clock-names:
> > +          minItems: 3
> > +          items:
> > +            - const: ref_clk
> > +            - const: suspend_clk
> > +            - const: bus_clk
> > +            - const: grf_clk
>=20
> minItems for clocks and clock-names is already 3, is it not?

Yes, but the following 'maxItems: 4' implicitly sets it to 4,
so I had to set it again. The same is true for clock-names -
providings new 'items:' effectively drops the "minItems: 3"
=66rom the generic section.

> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks,
> Conor.

Thanks,

-- Sebastian

--bdmk4yrcxo3we24y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmUypMQACgkQ2O7X88g7
+prWug//YTS5WE0ntNTSommlUibet+KcZPc5blw/2DH/Lx7UHSPecqtfjAWpAB/j
Cg9pHPgOumi0wJSdmqKRkJST7bKaCOkpw4N4HLqnrNBL+PNLG7sQOo9qMwaV2x7B
3nFbsXLjoxlHuYGrupRoFAUL/LevwpWC1vgnrKdk37p0uJzmhRVyUtMrjE3wqzVU
FbiI4NgxpflWpRQ8VqtUzZVGA/15RXZVqnFjHgGZ624NhDD/2KsIUYOscvwq5qYa
1QylGUeTFE3D7EGbmTLd/voxlGKTntEPbYw+hP8JVf/oA7d01zlFRFa3MLmVM4vg
cRbaTt96A6ugCjBdUdkHYhw0aEROd4u/5hCdRv5whBOqWmz5HJ4jKsc+hrneNE7T
M9tHr6WpbtHu/s4Gepx+AxScNwOEF/A93pOuQXcy1CYOjF/hvx9zP0PYsQwD7b03
Qtr6Qnp95rozYYFt/2NforFTdFAwcGxR3XtUmd7qAMkIQYmApzgaQiDzLoJb/Gtv
1nSAiW0lvgHALq+PefTqKCqPXs28wJXdojJJscTIRk7RbkoLkxScdnaZG85kp+Qj
xSAtSGrvjE6PLvTdwxP3G+R9Qlh1O5mzze9iydGtwY4UsW6vR+Xybvu6e8V5rC8B
R/C1la6YhCZoGPgK93jn4tVCqwHxiOX3TMY1NlCj4hn+2WU2AxQ=
=a1sC
-----END PGP SIGNATURE-----

--bdmk4yrcxo3we24y--

