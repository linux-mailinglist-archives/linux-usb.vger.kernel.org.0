Return-Path: <linux-usb+bounces-37726-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOrkG8uiDGq8jwUAu9opvQ
	(envelope-from <linux-usb+bounces-37726-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 19:50:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68A583524
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 19:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD7EC3010D83
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 17:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22A139DBE4;
	Tue, 19 May 2026 17:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0oNsaGn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36AF4A2E34;
	Tue, 19 May 2026 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779212982; cv=none; b=TAbrUyWwYRzdd+jS5qH4oA3Wx4BoQgYXxIA7SFJ4NUMolQNBSLFT8lz4UppYjGIt2WMADWTyTXQTrha7XN10cs1lRF+M8y0vlc6JhPLzDT5c+LeFgBH7lLIqIB20Gs5m5H1wEpnduLouJVublUE/rDYOU1bZa+xs/y2Ak+dAuMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779212982; c=relaxed/simple;
	bh=rGK250Szwm6raNlcV89FwZaSseSBocQhtjLpYva6xz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTZ+MfzEyQocBpA3xP2uGqkWxbdO1k6NXvK2O9ojF8/KgA3B+OsqiQy5zxzT0K4Qdkf2uIAPogeLmaJ3MKdw7Ssi8oK1Ug7T88oj7HhnRSrgNRawn2Oq2jUp8RMURjGvGQai5CkkX2pI636DOGGRqAHAnaonnFGWXMlx6cdNh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0oNsaGn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE7FC2BCC6;
	Tue, 19 May 2026 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779212981;
	bh=rGK250Szwm6raNlcV89FwZaSseSBocQhtjLpYva6xz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0oNsaGnqKJ9kSBWw6AunK7sDadVjEjhfDSQ3shFeVm3iJMKQh7mYgYRduq7WeA20
	 zvUgEFhiPOrA5nRpMML6XilTGxeZt1qi35SO6T+LP6pmzK4ti+Cpq3tgK1ZxBcS7bS
	 w9Z6qxzXbFQ+4Gh1ijGgc7xwblUBClNwgd7ADl/fPA2OAWFHY6EM/hxelCvhmv56EX
	 /Wuyxm2Tzoj5fuQ/LyiILBgncoGe3G1mFjzBsu3LAVnS1YkNhrVRcpj/wgL4ZstN85
	 Jd4ZiIestMO29nLeWN1gvjXmEFA90QpmEQ09+DAOMYYzKyN+9Pk2TZZ2JdCkYs1+Fw
	 CyfojfB7aiUbg==
Date: Tue, 19 May 2026 18:49:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Pawel Laszczak <pawell@cadence.com>
Cc: Rob Herring <robh@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd
 compatible string
Message-ID: <20260519-defog-spiritual-2eeebb390ba7@spud>
References: <20260515-b4-no_drd_config-v8-0-75cb05317679@cadence.com>
 <20260515-b4-no_drd_config-v8-1-75cb05317679@cadence.com>
 <20260515-trinity-unthawed-c5ab5d7783f2@spud>
 <PH7PR07MB9538E14BE6778498A48FECEBDD002@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nX4sg9Hmi54Wftmx"
Content-Disposition: inline
In-Reply-To: <PH7PR07MB9538E14BE6778498A48FECEBDD002@PH7PR07MB9538.namprd07.prod.outlook.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37726-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BE68A583524
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--nX4sg9Hmi54Wftmx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 08:47:30AM +0000, Pawel Laszczak wrote:
> >
> >On Fri, May 15, 2026 at 01:24:38PM +0200, Pawel Laszczak via B4 Relay wr=
ote:
> >> From: Pawel Laszczak <pawell@cadence.com>
> >>
> >> Introduce a new compatible string 'cdns,cdnsp-no-drd' for Cadence
> >> USBSS/USBSSP controllers to support hardware configurations where the
> >> Dual-Role Device (DRD) register block is missing or inaccessible.
> >>
> >> This change follows the recommendation to imply hardware limitations
> >> directly from the compatible string rather than using a dedicated
> >> boolean property.
> >>
> >> When 'cdns,cdnsp-no-drd' is used:
> >> - The 'otg' register and interrupt resources are not required.
> >> - The 'reg' and 'interrupts' properties are restricted to 2 items
> >>   (host and device).
> >> - 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.
> >>
> >> The standard 'cdns,usb3' compatible remains unchanged, maintaining
> >> backward compatibility by requiring all 3 resource sets (otg, host, de=
v).
> >>
> >> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> >> ---
> >> v8:
> >> - Update commit message to reflect schema changes.
> >> - Removed 'cdns,no-drd' boolean property as per Rob Herring's suggesti=
on.
> >> - Introduced a new compatible string 'cdns,cdnsp-no-drd' for controller
> >>   variants that lack the DRD/OTG register block.
> >>
> >> v7:
> >> - Rename 'no_drd' to 'cdns,no-drd'.
> >> - Update commit message to reflect property renaming and schema
> >changes.
> >> - Simplify 'reg-names' using a single enum.
> >> - Revert 'interrupt-names' to a list of constants.
> >> - Move 'reg' item descriptions to if/else blocks for accuracy.
> >> - Clean up 'if/then' logic (remove redundant checks).
> >> - Add explicit 'items' list for 'interrupt-names' in the 'else' block.
> >>
> >> v6:
> >> - Fixed validation error for 'interrupt-names' by correcting
> >>   the items definition.
> >> - Adjusted 'minItems'/'maxItems' to properly support the optional
> >>  'wakeup' interrupt.
> >> - Fixed 'too long' schema error in examples.
> >>
> >> v5:
> >> - Implemented strict conditional validation using if-then-else logic.
> >> - Enforced 2 register/interrupt items and required 'dr_mode'
> >>   (host or peripheral) when 'no_drd' is present.
> >> - Enforced the standard 3 register/interrupt items (otg, host, dev)
> >>   when 'no_drd' is absent to ensure backward compatibility.
> >> - Updated 'reg-names' and 'interrupt-names' to use enums in the main
> >>   properties section to support flexible resource ordering during
> >>   validation.
> >> ---
> >> ---
> >>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 60
> >++++++++++++++++++----
> >>  1 file changed, 50 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> >b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> >> index 2d95fb7321af..7b0aa9c4a2bd 100644
> >> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> >> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> >> @@ -17,22 +17,22 @@ description:
> >>
> >>  properties:
> >>    compatible:
> >> -    const: cdns,usb3
> >> +    enum:
> >> +      - cdns,usb3
> >> +      - cdns,cdnsp-no-drd
> >
> >I doubt this is what Rob meant, he asked for soc-specific compatibles
> >and this is generic. A soc-specific compatible would be something like
> >microchip,newsoc-usb3
>=20
> Hi Conor, Rob
>=20
> To clarify the hardware situation: I am developing and testing this on
> an FPGA development board connected via pure PCI, without any Device Tree.
> I do not have a specific SoC platform, nor do I know what silicon target
> the end customers will use in the future.
> Introducing a fake SoC-specific compatible string just to pass the DT
> validation feels misleading and unnecessary.
>=20
> Since cdns,usb3 is already an established generic compatible, and we
> cannot use a generic configuration string like cdns,cdnsp-no-drd,
> the cleanest way forward is to make this resource-driven instead of
> compatible-driven.
>=20
> In v9, I propose to:
>  - Keep only the existing cdns,usb3 compatible.
>  - Update cdns,usb3.yaml to allow minItems: 2 for reg and reg-names
>    if dr_mode is explicitly set to "host" or "peripheral" (indicating
>    that the OTG register block is absent).
>  - In the driver code, determine the lack of DRD dynamically if the "otg"
>    resource/register block is missing.
>=20
> This elegantly solves the issue for my PCI/FPGA platform (where I just
> won't pass the "otg" resource), complies with DT practices, and leaves
> the door open for any future customer SoC to use cdns,usb3 with
> standard dr_mode constraints.
>=20
> Does this approach look acceptable to you?

Not really. I want enforcement of the correct properties in the binding,
not permission of multiple different combinations.

Perhaps we could go back to the original cdns,usbssp compatible and
leave an empty slot for the soc-specific compatibles, like:
      - items:
          - {}
          - const: sifive,clint2        # SiFive CLINT v2 IP block

That way you can proceed with this effort without a soc-compatible
but we don't end up permitting a generic compatible.

Cheers,
Conor.

> >>    reg:
> >> -    items:
> >> -      - description: OTG controller registers
> >> -      - description: XHCI Host controller registers
> >> -      - description: DEVICE controller registers
> >> +    minItems: 2
> >> +    maxItems: 3
> >>
> >>    reg-names:
> >> +    minItems: 2
> >> +    maxItems: 3
> >>      items:
> >> -      - const: otg
> >> -      - const: xhci
> >> -      - const: dev
> >> +      enum: [ otg, xhci, dev ]
> >>
> >>    interrupts:
> >> -    minItems: 3
> >> +    minItems: 2
> >>      items:
> >>        - description: XHCI host controller interrupt
> >>        - description: Device controller interrupt
> >> @@ -41,7 +41,7 @@ properties:
> >>                       cleared by xhci core, this interrupt is optional
> >>
> >>    interrupt-names:
> >> -    minItems: 3
> >> +    minItems: 2
> >>      items:
> >>        - const: host
> >>        - const: peripheral
> >> @@ -93,6 +93,46 @@ allOf:
> >>    - $ref: usb-drd.yaml#
> >>    - $ref: usb-xhci.yaml#
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          const: cdns,cdnsp-no-drd
> >> +    then:
> >> +      properties:
> >> +        reg:
> >> +          items:
> >> +            - description: XHCI Host controller registers
> >> +            - description: DEVICE controller registers
> >> +        reg-names:
> >> +          items:
> >> +            - const: xhci
> >> +            - const: dev
> >> +        interrupts:
> >> +          maxItems: 2
> >> +        interrupt-names:
> >> +          items:
> >> +            - const: host
> >> +            - const: peripheral
> >> +        dr_mode:
> >> +          enum: [host, peripheral]
> >> +    else:
> >> +      properties:
> >> +        reg:
> >> +          items:
> >> +            - description: OTG controller registers
> >> +            - description: XHCI Host controller registers
> >> +            - description: DEVICE controller registers
> >> +        reg-names:
> >> +          items:
> >> +            - const: otg
> >> +            - const: xhci
> >> +            - const: dev
> >> +        interrupts:
> >> +          minItems: 3
> >> +          maxItems: 4
> >> +        interrupt-names:
> >> +          minItems: 3
> >> +
> >>  unevaluatedProperties: false
> >>
> >>  examples:
> >>
> >> --
> >> 2.43.0
> >>
> >>

--nX4sg9Hmi54Wftmx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagyisAAKCRB4tDGHoIJi
0sUOAQDsPV7dZ4+McA5DZVUQaQz+096bXovdvq65bsN3yqDH9wEA4UpS06b+az1d
yphyJ4Z5xxKn7Cmwypw+V3fkKz2uPgY=
=saR0
-----END PGP SIGNATURE-----

--nX4sg9Hmi54Wftmx--

