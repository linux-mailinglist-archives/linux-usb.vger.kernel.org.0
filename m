Return-Path: <linux-usb+bounces-37423-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIFiNR/NBGrMPAIAu9opvQ
	(envelope-from <linux-usb+bounces-37423-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 21:12:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71C539AE2
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 21:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4287130BAB17
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE263A987B;
	Wed, 13 May 2026 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K29sOSfe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04603AE199;
	Wed, 13 May 2026 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698752; cv=none; b=VlNV9BCEYOOPLhTxXn/uf2zKRcx3kbJOkA82oS4sAo/cMYEJsTMdj5wmAAkCLdJE0xBbA7acpCH5OByPhhVSA+xjQDy8ein0uptougl8tgsY0sZUOEbP03GlzVwXUO8Lt/9nELuFh/sNUsC7/AXpq7lvGgKuiMGEdBE4MJp8tzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698752; c=relaxed/simple;
	bh=nYOAFJ6m3InYu9vrf4DY7DBLHH+oJwYni2pnsWr7goA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BX9Ap97XoVWQzWdRKOAmbKVUPwkFoXLB/nM/5FS7ra0tVUhcUaCGufmFNqo1xoZINCMiH1hPHFCFz2+7D1EC99U+2JguhHaAogrJHbq+uhRhpCqIyfyXhuJI1WviX5ypik81JAAKiMCSyCgXyiE4QtVOynIddyaIdKAqnn2dUpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K29sOSfe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31567C2BCB7;
	Wed, 13 May 2026 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778698751;
	bh=nYOAFJ6m3InYu9vrf4DY7DBLHH+oJwYni2pnsWr7goA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K29sOSfe1dYeyaqa0XwL9xnoPkBU29LFmbyFslrfC8dcczgDL7WMgsK0VYX0tbDwt
	 yo49TfqL/lRY9alWyg2mOlg945mD3SUEEbviuUwPRd57tCBOBlR49R6POg1yq5F9v5
	 Z4uCCE3PpEWFGL+a/TJ0P3+IGTvLEgrni6+rfuX7w0zVXv+ahPWVReHXN/LbaYXu9m
	 H16E5UcZ/dygo8tRFfBFkXSoChsby9XRd7FKqoelOrQbttFNjVT1lKXcanyeyJyVN0
	 nEU+J/IbOb+Qa5kICUMReohr4MvuvMhvhEG1lAyCArOBaBawV0eUUTwJHLd4XYrcsv
	 I6wjQwRP/kLGQ==
Date: Wed, 13 May 2026 19:59:06 +0100
From: Conor Dooley <conor@kernel.org>
To: pawell@cadence.com
Cc: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: cdns3: Add no_drd property
Message-ID: <20260513-unhappily-thicken-e6350001c2a1@spud>
References: <20260513-b4-no_drd_config-v6-0-e7789cd0e581@cadence.com>
 <20260513-b4-no_drd_config-v6-1-e7789cd0e581@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uHLEYBqjqAlPheWS"
Content-Disposition: inline
In-Reply-To: <20260513-b4-no_drd_config-v6-1-e7789cd0e581@cadence.com>
X-Rspamd-Queue-Id: DB71C539AE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37423-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cadence.com:email]
X-Rspamd-Action: no action


--uHLEYBqjqAlPheWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 01:44:19PM +0200, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
>=20
> Introduce a new boolean property 'no_drd' for Cadence USBSS/USBSSP
> controllers to support hardware configurations where the Dual-Role
> Device (DRD) register block is missing or inaccessible.
>=20
> When 'no_drd' is present:
> - The 'otg' register and interrupt resources are not required.
> - The 'reg' and 'interrupts' properties are restricted to 2 items
>   (host and device).
> - 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.
>=20
> When 'no_drd' is absent, the binding maintains backward compatibility
> by requiring all 3 resource sets (otg, host, dev).
>=20
> To achieve this, the schema is updated with an if-then-else logic
> and 'reg-names'/'interrupt-names' use enums to allow flexible
> ordering during validation.
>=20
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
> v6:
> - Fixed validation error for 'interrupt-names' by correcting
>   the items definition.
> - Adjusted 'minItems'/'maxItems' to properly support the optional
>  'wakeup' interrupt.
> - Fixed 'too long' schema error in examples.
>=20
> v5:
> - Implemented strict conditional validation using if-then-else logic.
> - Enforced 2 register/interrupt items and required 'dr_mode'
>   (host or peripheral) when 'no_drd' is present.
> - Enforced the standard 3 register/interrupt items (otg, host, dev)
>   when 'no_drd' is absent to ensure backward compatibility.
> - Updated 'reg-names' and 'interrupt-names' to use enums in the main
>   properties section to support flexible resource ordering during
>   validation.
> ---
> ---
>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 70 ++++++++++++++++=
+++---
>  1 file changed, 61 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index 2d95fb7321af..717892a05dcd 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -20,19 +20,21 @@ properties:
>      const: cdns,usb3
> =20
>    reg:
> +    minItems: 2
>      items:
>        - description: OTG controller registers
>        - description: XHCI Host controller registers
>        - description: DEVICE controller registers

This is not accurate anymore, given you're allowing no otg registers for
the no_drd case. Probably should have both items lists here, one for
each configuration.

> =20
>    reg-names:
> +    minItems: 2
>      items:
> -      - const: otg
> -      - const: xhci
> -      - const: dev
> +      - enum: [ otg, xhci, dev ]
> +      - enum: [ otg, xhci, dev ]
> +      - enum: [ otg, xhci, dev ]

If you delete the -, you can get away with only having one instance of
the enum. You'd need to set maxItems: 3 though.

> =20
>    interrupts:
> -    minItems: 3
> +    minItems: 2
>      items:
>        - description: XHCI host controller interrupt
>        - description: Device controller interrupt
> @@ -41,12 +43,12 @@ properties:
>                       cleared by xhci core, this interrupt is optional
> =20
>    interrupt-names:
> -    minItems: 3
> +    minItems: 2
>      items:
> -      - const: host
> -      - const: peripheral
> -      - const: otg
> -      - const: wakeup
> +      - enum: [ host, peripheral, otg, wakeup ]
> +      - enum: [ host, peripheral, otg, wakeup ]
> +      - enum: [ host, peripheral, otg, wakeup ]
> +      - enum: [ host, peripheral, otg, wakeup ]

I don't understand this. otg and wakeup are the ones you're making
optional, so this list could remain as it was?

> =20
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
> @@ -79,6 +81,13 @@ properties:
>      description: Enable resetting of PHY if Rx fail is detected
>      type: boolean
> =20
> +  no_drd:

On v1, I mistakenly thought this was a common property, but seems to not
be. In that case, replace the _ with a - and add a vendor prefix.

> +    description:
> +      Indicates that the Dual-Role Device (DRD) register block is not
> +      implemented or is inaccessible. In this case, the controller
> +      must operate in a fixed peripheral or host mode.
> +    type: boolean
> +
>  dependencies:
>    port: [ usb-role-switch ]
> =20
> @@ -93,6 +102,49 @@ allOf:
>    - $ref: usb-drd.yaml#
>    - $ref: usb-xhci.yaml#
> =20
> +  - if:

> +      properties:
> +        no_drd: true

Drop this, it's not needed. "required: - no_drd" does it for you.

> +      required:
> +        - no_drd

> +    then:
> +      required:
> +        - dr_mode

And drop this too.

pw-bot: changes-requested

Thanks,
Conor.

> +      properties:
> +        reg:
> +          maxItems: 2
> +        reg-names:
> +          items:
> +            - const: xhci
> +            - const: dev
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: host
> +            - const: peripheral
> +        dr_mode:
> +          enum: [host, peripheral]
> +    else:
> +      properties:
> +        reg:
> +          minItems: 3
> +        reg-names:
> +          items:
> +            - const: otg
> +            - const: xhci
> +            - const: dev
> +        interrupts:
> +          minItems: 3
> +          maxItems: 4
> +        interrupt-names:
> +          minItems: 3
> +          items:
> +            - const: host
> +            - const: peripheral
> +            - const: otg
> +            - const: wakeup
> +
>  unevaluatedProperties: false
> =20
>  examples:
>=20
> --=20
> 2.43.0
>=20
>=20

--uHLEYBqjqAlPheWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagTJ+gAKCRB4tDGHoIJi
0nGHAP9q+K7T+MNaJelkERkLriDJbEXTgcSlo31BYB/QhVA4qgEA7IAzc2V4n7Lw
zUUf2OFHPNboGyobpHA326vODixDqgY=
=1z7/
-----END PGP SIGNATURE-----

--uHLEYBqjqAlPheWS--

