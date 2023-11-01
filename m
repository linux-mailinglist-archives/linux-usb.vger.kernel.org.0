Return-Path: <linux-usb+bounces-2432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 112207DDF91
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 11:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACC9A1C20BE7
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 10:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9779879FA;
	Wed,  1 Nov 2023 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4lLffvN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0798379E6;
	Wed,  1 Nov 2023 10:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD73C433C8;
	Wed,  1 Nov 2023 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698835084;
	bh=/6eavT+3M08LoPAGFgoG2I6P0BsT3SlbZLcrQZylAdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4lLffvN/RD5YqYRIE5QsF/qtmihx4rOMIaExm7RfnRIXUB0cGuF64uesZ1C4S1lO
	 70MIyyt52eJffG9B01PydcRqVONbA3hlOiaJ0nZtBu0T/WFI/iJjdXLu4tceWaaaWE
	 9JVurBQxR45pp1AI4Rb4RS88Mk9ROEVo+13qQ/LGfWOz6glu5lmOdlWa50MzBE2CcR
	 dOJ0WPhin2wfrR3KDZbT/eFTghjph5V15uh5ETlfUiDnp59YlaaEbLNtLy5TajJrrm
	 jw13PHDTge+j2DQTWuGepuiHrk33KIUtdeJOcXEvD812Lg55andkFWUlQOMXC6X+UM
	 ++I+nT4VxJfnw==
Date: Wed, 1 Nov 2023 10:38:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Naveen Kumar <mnkumar@google.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, royluo@google.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] dt-bindings: usb: add no-64-bit-support
 property
Message-ID: <20231101-diffused-iguana-f411619dc72a@spud>
References: <20231101101625.4151442-1-mnkumar@google.com>
 <20231101101625.4151442-3-mnkumar@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q8l6mWUQIWxzMhnr"
Content-Disposition: inline
In-Reply-To: <20231101101625.4151442-3-mnkumar@google.com>


--Q8l6mWUQIWxzMhnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 10:16:25AM +0000, Naveen Kumar wrote:
> From: Naveen Kumar M <mnkumar@google.com>
>=20
> Add a new DT option to specify whether a host controller is able to
> support 64-bit DMA memory pointers

What host controllers are broken?

> Signed-off-by: Naveen Kumar M <mnkumar@google.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Docume=
ntation/devicetree/bindings/usb/usb-xhci.yaml
> index 180a261c3e8f..20dc134004f3 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> @@ -25,6 +25,10 @@ properties:
>      description: Set if the controller has broken port disable mechanism
>      type: boolean
> =20
> +  quirk-no-64-bit-support:
> +    description: Set if the xHC doesn't support 64-bit DMA memory pointe=
rs

To set this property, you need to know that the host controller is
broken, so why not just make the driver set the quirk once it sees that
the host controller is one of the broken ones?
Unless there are "sometimes broken" host controllers, a dedicated
property should not be needed, right?

> +    type: boolean
> +
>    imod-interval-ns:
>      description: Interrupt moderation interval
>      default: 5000
> --=20
> 2.42.0.820.g83a721a137-goog
>=20

--Q8l6mWUQIWxzMhnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUIqiAAKCRB4tDGHoIJi
0hwqAP9TUBcd4m95x0v6+I5EK4gxYsq7i5MUn4kAJnm2OEdO3QD9FWVk+rDkO91n
wzsNQe5tfjhUPPPjxK1r8usRTPUOngs=
=aTTd
-----END PGP SIGNATURE-----

--Q8l6mWUQIWxzMhnr--

