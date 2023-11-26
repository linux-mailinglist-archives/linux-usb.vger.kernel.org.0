Return-Path: <linux-usb+bounces-3327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548937F9270
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 12:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E25B8B20CA1
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 11:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DCEC8F4;
	Sun, 26 Nov 2023 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZigZVV9O"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65370EC2;
	Sun, 26 Nov 2023 11:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5074CC433C8;
	Sun, 26 Nov 2023 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700997257;
	bh=5r7xIarsHy0W/0kWqVKmYRA9kNYffc7+7QtSYV/sB90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZigZVV9OEW8jQfnuovALxI64FWxnyc1X9DLRgNFshlQMZxp3vQHiEmB652gj/3UM7
	 TAHcMq2GkvioVDN0CflhGgXqsmADzxQHEYhSN/jF/vd2PTlBfhJwlG8xCs89oR5A/R
	 lMP9nfWCtL3EobXmXHEDcBe5IZzyS1/R8e2pYQZIwc7BlllxYo/Ne0nbaBYOX4Vu8N
	 BXUGf40UafcwhhXnHxc+f1pv64V4R9JpS+Alu0rb0J0y4cTwNQLh5rx1HxdvXX4Er8
	 Lq4BssDZpYAaHaqNgQTggOH9Qd8ik2txB2QfDNAi/jeIe6gYo8fUSKsx1IHMJDvVBv
	 hDD21eEL7duaQ==
Date: Sun, 26 Nov 2023 11:14:12 +0000
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
Subject: Re: [PATCH 1/3] dt-bindings: usb: xhci: Add optional power-domains
Message-ID: <20231126-tripping-kebab-0ce2ad6a3719@spud>
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <20231126025612.12522-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TcnHgyIJ+wJgw5V5"
Content-Disposition: inline
In-Reply-To: <20231126025612.12522-2-wahrenst@gmx.net>


--TcnHgyIJ+wJgw5V5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 03:56:10AM +0100, Stefan Wahren wrote:
> BCM2711 SoC use a power domain for the xHCI. So allow supplying this
> domain in bindings.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/usb/generic-xhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-xhci.yaml
> index 594ebb3ee432..e48beaff7d0d 100644
> --- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> @@ -49,6 +49,9 @@ properties:
>        - const: core
>        - const: reg
>=20
> +  power-domains:
> +    maxItems: 1
> +
>  unevaluatedProperties: false
>=20
>  required:
> --
> 2.34.1
>=20

--TcnHgyIJ+wJgw5V5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWMogAAKCRB4tDGHoIJi
0qu7AP0d2Xb/XDzNjkgVs/B5VNGgt/9Kkz5dYK5BJqROFIussAD/aCDODZ7XwhpO
DysWBNBqSHrXsmFch9u/q1CkJ2X9QQA=
=qwTm
-----END PGP SIGNATURE-----

--TcnHgyIJ+wJgw5V5--

