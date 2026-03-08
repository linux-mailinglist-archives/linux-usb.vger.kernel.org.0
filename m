Return-Path: <linux-usb+bounces-34195-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IJaNBBArWmN0AEAu9opvQ
	(envelope-from <linux-usb+bounces-34195-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 10:23:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D751922F28A
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 10:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2847D3009F34
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 09:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1C43603FD;
	Sun,  8 Mar 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M37YQ8ed"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954CD27E;
	Sun,  8 Mar 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772961797; cv=none; b=o6c28GL2gmmn/uopFkxibrDvdOgJdVZvUqTd+6GcU23pmSNew9KcftNFI3mqtAZJy+wOVRpzKpuoK82DOkRQLD4ZLRodeErDmQq4gNK18R8+6OpB4srKFBDHd/8U3ytqXHeoEjJpubKky0ENwly9asdkLxSIGBViBSJs89WflNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772961797; c=relaxed/simple;
	bh=NEB1M50nTMnxvScDgTWtPQCJnftjAXFrgFRMMp7y984=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dv4Ld/ct1ZTrE7/cuUIT8Zl3Eqwt7av1Rl2AwQ2ZapvIS6OsbXO7WBiN29U4dxW6odhj57fUIu8Ow/ZHzV+sqtHMOaPLBjjLGE3tkdXLTKv7rGD6fxFX184t0bQOMiidFXAiZOgPF20UnV6CicFEdLNlL+n21n39/hyd23iktMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M37YQ8ed; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954F3C116C6;
	Sun,  8 Mar 2026 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772961797;
	bh=NEB1M50nTMnxvScDgTWtPQCJnftjAXFrgFRMMp7y984=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M37YQ8edEOeCCWj5Up3vBaddVLy3OxGfpBbuUN3cAGBqO+rZLYvK04JWOpeo4EgnT
	 FanZLNVcW2wawRgZXMpVgpuFwvnDBhKwkHz7KT6UEgseuDpeGBMK0aTE6C8bFRpudQ
	 /CX7DfMdH1/T2QI81qOIEDHUUDbfsqaOuwzfVnuTvyrSXvspFvu0nENC1e1heB8bV7
	 syPsb9fKkrbsK7fUHtFUQLQ1Ifhm0PSlvzCNF9WRczGI3VaHtRoY+3oIQMC+3UqAnd
	 bUCXZuAj5zNtocaRwFACIpc8QT2v6TqONIGnB3AWJ/+05Ur4QYtuvTz1aDR9duiLou
	 Tb4CiIWgwYHzw==
Date: Sun, 8 Mar 2026 10:23:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Herve Codina <herve.codina@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
Message-ID: <20260308-camouflaged-sage-warthog-fdbb7d@quoll>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
X-Rspamd-Queue-Id: D751922F28A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34195-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 09:16:19AM +0000, Charan Pedumuru wrote:
> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
> to the generic OHCI schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml      | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index 961cbf85eeb5..a8a94b9c1fee 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -55,6 +55,7 @@ properties:
>            - ti,ohci-omap3
>        - items:
>            - enum:
> +              - atmel,at91rm9200-ohci
>                - cavium,octeon-6335-ohci
>                - nintendo,hollywood-usb-ohci
>                - nxp,ohci-nxp
> @@ -137,6 +138,16 @@ properties:
>        The associated ISP1301 device. Necessary for the UDC controller for
>        connecting to the USB physical layer.
>  
> +  atmel,vbus-gpio:

gpio is deprecated. All bindings use gpios. Also, pins do not use vendor
prefixes.


> +    description: GPIO used to control or sense the USB VBUS power.
> +    minItems: 1
> +    maxItems: 3

Why is this flexible? There is only one VBUS, no? Which pin is it
exactly on this device?

> +
> +  atmel,oc-gpio:
> +    description: GPIO used to signal USB overcurrent condition.
> +    minItems: 1
> +    maxItems: 3

Same question here - how is the pin called in the schematics?

> +
>  required:
>    - compatible
>    - reg
> @@ -144,6 +155,28 @@ required:
>  
>  allOf:
>    - $ref: usb-hcd.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: atmel,at91rm9200-ohci
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: ohci_clk
> +            - const: hclk
> +            - const: uhpck
> +
> +      required:
> +        - clocks
> +        - clock-names

There is already if:then:else covering clocks, so this makes multiple
clauses being applied to same device. That's not really readable.
Unfortunately that's a bit of a mess from existing binding. This can be
solved by moving this to separate schema, especially that you want to
add some specific properties to this device.

> +
> +    else:
> +      properties:
> +        atmel,vbus-gpio: false
> +        atmel,oc-gpio: false
> +
>    - if:
>        not:
>          properties:
> 
> -- 
> 2.53.0
> 

