Return-Path: <linux-usb+bounces-30499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AC804C59B57
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 20:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 71BCB357A10
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 19:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796C331AF31;
	Thu, 13 Nov 2025 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAWm3OCd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E727031A810;
	Thu, 13 Nov 2025 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763061383; cv=none; b=JVl3SY6n8601ne40rHfjV1PlWI6M5I6gSystZiiSud/hniXNF7dGYHc8E2cKFvJZZnS7VS0nHpJMuX4C/QNDD+24JZyUvutNxojBHKSGvKQTcXtLCRS1htfD/lXXwbgIZtR3nxBDZLyGGVn2f0VXaO3WyHfrQ3Lmg9EOMkPT8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763061383; c=relaxed/simple;
	bh=IblUqGpTbIRtiXEqbdz5S15EKx867g0thOANjT9zzo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqXoN29cJz50toETGMuTyXeEIKDHkpHuKz27Quf3GPAT0nf4E1PNdnODQS6Rx7Hy0GWS72T03z2ZO93Ii42gACQC4lTG7H9P0NswBLeUCkn/CDr+QSRbtQlAHx/ac3FdAb0VkLqH/B3Ti4ECzcLDy6ZdRNgBqemB1opCGpkzX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAWm3OCd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE21C113D0;
	Thu, 13 Nov 2025 19:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061382;
	bh=IblUqGpTbIRtiXEqbdz5S15EKx867g0thOANjT9zzo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAWm3OCdZCohQVKp5xXcn4czTWQ2MTmmYQBUnepiL/xkhVs6FGcaMfyOJocxIz7Bp
	 5V1tpOfeN/K8T7KYy8X/7mAkx2OyFLh336Et0Q8Xr4N6XyTYOUBc/j6rhxx/P90J1r
	 w2YIuNuxfi2VH0RJo2wSezaWCaZ7uUnHVrpbxdVG3LWs5GMsAJMv5QaW2quFEtKicP
	 K12bENP+L8JMTxNVY1si2rwXPADgiezPGKXDCtVWufNcSKOD6PqjHfQRr5D1OIiw5u
	 u9JNu2wVtrmHHuBzWHK2yOj/8BefmBT2ArjGapig3s8vDGX4KDuSvXVKvpHQcuEJr9
	 T+6Q/gD9Wrpig==
Date: Thu, 13 Nov 2025 19:16:18 +0000
From: Conor Dooley <conor@kernel.org>
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: Describe the reset
 constraint for the versal platform
Message-ID: <20251113-risk-doorstop-4ec156b58d0a@spud>
References: <20251112155430.1326426-1-radhey.shyam.pandey@amd.com>
 <20251112-bagging-diameter-4ebab1f9ed45@spud>
 <MN0PR12MB59537C0F520B40977620BFCDB7CDA@MN0PR12MB5953.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R/LfrMLgE6sszEZI"
Content-Disposition: inline
In-Reply-To: <MN0PR12MB59537C0F520B40977620BFCDB7CDA@MN0PR12MB5953.namprd12.prod.outlook.com>


--R/LfrMLgE6sszEZI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:15:02PM +0000, Pandey, Radhey Shyam wrote:
> [Public]
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Thursday, November 13, 2025 12:38 AM
> > To: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>
> > Cc: gregkh@linuxfoundation.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; Simek, Michal <michal.simek@amd.com>; linux-
> > usb@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; git (AMD-Xili=
nx)
> > <git@amd.com>
> > Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: Describe the reset =
constraint for
> > the versal platform
> >
> > On Wed, Nov 12, 2025 at 09:24:30PM +0530, Radhey Shyam Pandey wrote:
> > > AMD Versal platform USB 2.0 IP controller receives one reset input
> > > from the SoC controlled by the CRL.RST_USB [RESET] register so
> > > accordingly describe reset constraints.
> > >
> > > Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> > > ---
> > >  .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 43
> > > +++++++++++++++----
> > >  1 file changed, 34 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> > > b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> > > index 36f5c644d959..cd0cc9da242f 100644
> > > --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> > > @@ -50,17 +50,22 @@ properties:
> > >      description:
> > >        A list of phandles for resets listed in reset-names.
> > >
> > > -    items:
> > > -      - description: USB core reset
> > > -      - description: USB hibernation reset
> > > -      - description: USB APB reset
> > > +    oneOf:
> > > +      - items:
> > > +          - description: USB controller reset
> > > +      - items:
> > > +          - description: USB core reset
> > > +          - description: USB hibernation reset
> > > +          - description: USB APB reset
> > >
> > >    reset-names:
> > > -    items:
> > > -      - const: usb_crst
> > > -      - const: usb_hibrst
> > > -      - const: usb_apbrst
> > > -
> > > +    oneOf:
> > > +      - items:
> > > +          - const: usb_crst
> >
> > Why do we need all this oneOf stuff if both have the same first reset?
> > Can't you just set minItems: 1?
>=20
> Thanks. I have now set minItems:1 and defined compatible based
> reset min/max constraints. Doing some more validation and
> will send out the v2.
>=20
> Example:
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -47,6 +47,7 @@ properties:
>        - const: ref_clk
>=20
>    resets:
> +    minItems: 1
>      description:
>        A list of phandles for resets listed in reset-names.
>=20
> @@ -56,6 +57,7 @@ properties:
>        - description: USB APB reset
>=20
>    reset-names:
> +    minItems: 1
>      items:
>        - const: usb_crst
>        - const: usb_hibrst
> @@ -95,6 +97,28 @@ required:
>    - resets
>    - reset-names
>=20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,versal-dwc3
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> +    else:
> +      properties:
> +        resets:
> +          minItems: 3
> +          maxItems: 3

FWIW, this maxItems is not needed as it matches the number in the list.

--R/LfrMLgE6sszEZI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYuggAKCRB4tDGHoIJi
0gT9AQCko4kdzAGADmzJ9rqSW1og+tEAc0KZ4IN9qoyyNQ7pigEA50Ga3HW83D8L
WvF3aHpMsTZijeLjVl33kuBr+RPqgAY=
=GL2A
-----END PGP SIGNATURE-----

--R/LfrMLgE6sszEZI--

