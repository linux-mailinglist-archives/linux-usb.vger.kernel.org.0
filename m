Return-Path: <linux-usb+bounces-37521-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIJTE9ZeB2pa0QIAu9opvQ
	(envelope-from <linux-usb+bounces-37521-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 19:58:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53C555C0A
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 19:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A35733126E6C
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 17:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081CD4F7982;
	Fri, 15 May 2026 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8BhrY4L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870314EA39C;
	Fri, 15 May 2026 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865136; cv=none; b=uMH5WqFLUJkcek3BP9hRDMhVyr4+V2KMxb4QHeaSLgy8FvMf95vJl4FRbmwzHfli6i9LG94EpAFXXDyY8Q99hC5WjykwGvqc2LwhtbcMqG+89v1azu4SYO6+xjvJ0bBLMKJlDSXb7JxBu+s9FQaYcV3MxkJCgGgUgb/NTN4mTB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865136; c=relaxed/simple;
	bh=lVx20nY5k6WfUTNYYuj7+6U/+0BEEm+VhIbKbqnHp/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEmkFUNqAQPMqXRyBPfG/ItlJ83mwSbCUOVtAoj0AgOkOqpCdc6YPd2d7S0znF3owStpPo/mZjLYpPlLJXAg7BoYfPpHmDWnHzvQMRdx9+QnR1pOZJlirUV3wdq0Uc1MRqNVd9W3z6bGB3AmvgpN0jMda5mtnoeXYJGclaFnFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8BhrY4L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA5EC2BCB0;
	Fri, 15 May 2026 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778865136;
	bh=lVx20nY5k6WfUTNYYuj7+6U/+0BEEm+VhIbKbqnHp/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8BhrY4LS5y5Fy/T9DT23FXbx4brTITAih8EUbam1fs6jdC4Etc6RTrqLmCI+NNOJ
	 yXRlfX06kHmam6lxDgzH3BjSlNqnZYEoRYpXk1hbs4vFmNThn7yma3xvqPGC5/yM/A
	 j9uqfrMv+aLZG0XbVoXANpEKalUNGPq/1Aq8G19KtHTfvTRWU8pO3jLPP/PmoOkmud
	 vhU+iCanp8n+TKoB6e46DQm+EKZYbvKErUvlFBLo16cViRPQxwtkryiKCCJt6c1ytb
	 fRbpBakBIAiVHGB22HPSsU0OTANgR34DHBfSZ5lnFaYf3dS0DHeRtnE5OmRVwOJ0di
	 JkCuAfOtx4fyA==
Date: Fri, 15 May 2026 18:12:11 +0100
From: Conor Dooley <conor@kernel.org>
To: pawell@cadence.com
Cc: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd
 compatible string
Message-ID: <20260515-trinity-unthawed-c5ab5d7783f2@spud>
References: <20260515-b4-no_drd_config-v8-0-75cb05317679@cadence.com>
 <20260515-b4-no_drd_config-v8-1-75cb05317679@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oU+EBlqr1NLgTGjz"
Content-Disposition: inline
In-Reply-To: <20260515-b4-no_drd_config-v8-1-75cb05317679@cadence.com>
X-Rspamd-Queue-Id: AC53C555C0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37521-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--oU+EBlqr1NLgTGjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 01:24:38PM +0200, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
>=20
> Introduce a new compatible string 'cdns,cdnsp-no-drd' for Cadence
> USBSS/USBSSP controllers to support hardware configurations where the
> Dual-Role Device (DRD) register block is missing or inaccessible.
>=20
> This change follows the recommendation to imply hardware limitations
> directly from the compatible string rather than using a dedicated
> boolean property.
>=20
> When 'cdns,cdnsp-no-drd' is used:
> - The 'otg' register and interrupt resources are not required.
> - The 'reg' and 'interrupts' properties are restricted to 2 items
>   (host and device).
> - 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.
>=20
> The standard 'cdns,usb3' compatible remains unchanged, maintaining
> backward compatibility by requiring all 3 resource sets (otg, host, dev).
>=20
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
> v8:
> - Update commit message to reflect schema changes.
> - Removed 'cdns,no-drd' boolean property as per Rob Herring's suggestion.
> - Introduced a new compatible string 'cdns,cdnsp-no-drd' for controller
>   variants that lack the DRD/OTG register block.
>=20
> v7:
> - Rename 'no_drd' to 'cdns,no-drd'.
> - Update commit message to reflect property renaming and schema changes.
> - Simplify 'reg-names' using a single enum.
> - Revert 'interrupt-names' to a list of constants.
> - Move 'reg' item descriptions to if/else blocks for accuracy.
> - Clean up 'if/then' logic (remove redundant checks).
> - Add explicit 'items' list for 'interrupt-names' in the 'else' block.
>=20
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
>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 60 ++++++++++++++++=
++----
>  1 file changed, 50 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index 2d95fb7321af..7b0aa9c4a2bd 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -17,22 +17,22 @@ description:
> =20
>  properties:
>    compatible:
> -    const: cdns,usb3
> +    enum:
> +      - cdns,usb3
> +      - cdns,cdnsp-no-drd

I doubt this is what Rob meant, he asked for soc-specific compatibles
and this is generic. A soc-specific compatible would be something like
microchip,newsoc-usb3

Thanks,
Conor.

> =20
>    reg:
> -    items:
> -      - description: OTG controller registers
> -      - description: XHCI Host controller registers
> -      - description: DEVICE controller registers
> +    minItems: 2
> +    maxItems: 3
> =20
>    reg-names:
> +    minItems: 2
> +    maxItems: 3
>      items:
> -      - const: otg
> -      - const: xhci
> -      - const: dev
> +      enum: [ otg, xhci, dev ]
> =20
>    interrupts:
> -    minItems: 3
> +    minItems: 2
>      items:
>        - description: XHCI host controller interrupt
>        - description: Device controller interrupt
> @@ -41,7 +41,7 @@ properties:
>                       cleared by xhci core, this interrupt is optional
> =20
>    interrupt-names:
> -    minItems: 3
> +    minItems: 2
>      items:
>        - const: host
>        - const: peripheral
> @@ -93,6 +93,46 @@ allOf:
>    - $ref: usb-drd.yaml#
>    - $ref: usb-xhci.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          const: cdns,cdnsp-no-drd
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: XHCI Host controller registers
> +            - description: DEVICE controller registers
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
> +          items:
> +            - description: OTG controller registers
> +            - description: XHCI Host controller registers
> +            - description: DEVICE controller registers
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
> +
>  unevaluatedProperties: false
> =20
>  examples:
>=20
> --=20
> 2.43.0
>=20
>=20

--oU+EBlqr1NLgTGjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdT6wAKCRB4tDGHoIJi
0mHMAQDXK44EcqDZV0N4wuWMjD7LVhe3QX1z1UZShOG5sKHSsQD/WGQShOijn1Za
73rkweiN7OO7+SPw76gcXMYmvUHwhwY=
=LP2i
-----END PGP SIGNATURE-----

--oU+EBlqr1NLgTGjz--

