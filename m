Return-Path: <linux-usb+bounces-32740-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLW6IPqQd2m9hgEAu9opvQ
	(envelope-from <linux-usb+bounces-32740-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 17:06:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D964C8A79E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 17:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89FF2301A7F0
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 16:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558592D593E;
	Mon, 26 Jan 2026 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMXyhFyu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57E02C3260;
	Mon, 26 Jan 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443571; cv=none; b=FewzTomqjWZLlBfh4mrcOCD/ayK29xNojtFrDwDzwtSDdMtgtOX6kcdPk7bEdPUFYxDbLhGaG3heukG9mxEFTpibixCrORtQ3LfzYrKi3OU5P4yROm0SpzA/j3f69VRNqoEA4Ay9cUWUfJvJY0Vw696R1qUGXQx3/H8IRiX0OGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443571; c=relaxed/simple;
	bh=IKZjpeboVi1KaXGr1fV+IuQZSXvW1+LrsCscH7Aa58A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnWRhthG8vkEXocmXvPvMgD1R1kyHNwaC6uy2ZZ/Z2ByqhcHih3aPv9ACOaKQ0qDoE986r5brDqjLF4YDukjTqx2zXYWP55pUPvfpUoLfJJ33hFs+ei13lk36rhxYbkmqcV9R4kqp+9bAG4lElJWHmP6xbSja8snqOwu2eF/clo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMXyhFyu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47346C116C6;
	Mon, 26 Jan 2026 16:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443571;
	bh=IKZjpeboVi1KaXGr1fV+IuQZSXvW1+LrsCscH7Aa58A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMXyhFyujiTBLbkl7cD1umWTOJCNuJf9d/Mp0pxal/pbsdZJF8e67F4PGtpsXNqmk
	 q8vy8Vgel6mX2RYXCOlgnBQQP8m4gwS5K4l6H3fdwK5i4eyM5K1tVQy79MIYx2Jv9O
	 zs8yx1o5P5M/VJcFkEqef0HhZY0SdpAwZBc+Xt0nEC1ncbdNHpcifgBiyEKWOxj/eM
	 oAi28n2cPUihj6K+Q5zMScQ7N36ntjFzTWl1JXmwe7NuAVqAVojCv7PoYfLa1vtMoi
	 4WtDiS91UeF4ZtDKn6Tv2h4pS+c71ZBS7GjduX0nZQkVORqMx9rfsEDc/EedAPDN/Q
	 KGzAJJbfdBz4Q==
Date: Mon, 26 Jan 2026 10:06:10 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: ti,omap4-musb: convert to DT schema
Message-ID: <20260126160610.GA2471873-robh@kernel.org>
References: <20260126-ti-usb-v1-0-2855c129eb6d@gmail.com>
 <20260126-ti-usb-v1-1-2855c129eb6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-ti-usb-v1-1-2855c129eb6d@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[ti.com:server fail,tor.lore.kernel.org:server fail,4a0ab000:server fail,devicetree.org:server fail];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32740-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D964C8A79E
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 01:22:04PM +0000, Charan Pedumuru wrote:
> Convert OMAP MUSB USB OTG Controller binding to DT schema.
> Changes during conversion:
> - Introduce new compatible string patterns "am35x_otg_hs" and "usb_otg_hs"
>   to properly match existing nodes already defined in the DT sources.
> - Include "interrupts" and "interrupt-names" properties in the YAML, as
>   they are used by many in-tree DTS files.
> - Extend the "power" property to allow the value 150 (in addition to
>   existing values), since this is present in several in-tree DTS examples.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/ti,omap4-musb.yaml     | 133 +++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml b/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml
> new file mode 100644
> index 000000000000..16e95fe4c38d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,omap4-musb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments OMAP MUSB USB OTG Controller
> +
> +maintainers:
> +  - Felipe Balbi <balbi@ti.com

Missing '>'

> +
> +description:
> +  Texas Instruments glue layer for the Mentor Graphics MUSB OTG controller.
> +  Handles SoC-specific integration including PHY interface bridging(ULPI/
> +  UTMI), interrupt aggregation, DMA engine coordination (internal/
> +  external), VBUS/session control via control module mailbox, and
> +  clock/reset management. Provides fixed hardware configuration parameters
> +  to the generic MUSB core driver.
> +
> +properties:
> +  $nodename:
> +    pattern: "^(am35x_otg_hs|usb_otg_hs|usb)@[0-9a-f]+$"

Again, do not document non-standard names. That's anything not in the DT 
spec.

> +
> +  compatible:
> +    enum:
> +      - ti,omap3-musb
> +      - ti,omap4-musb
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Specifies the name of the TI PRCM (Power, Reset and Clock Management)
> +      hardware module that must be enabled (powered and clocked) for this
> +      device node to operate. The value "usb_otg_hs" refers to the USB
> +      On-The-Go High-Speed controller IP block.
> +    const: usb_otg_hs

deprecated: true

(I think we want that everywhere?)

Actually, looks like only omap2430 sets this, but that's not covered by 
this schema. Unless you need to add "ti,omap2-musb"?

> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [mc, dma]

I would assume only 'dma' is optional? Does this work?:

items:
  - const: mc
  - const: dma

> +
> +  multipoint:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Indicates the MUSB controller supports multipoint. This is a MUSB
> +      configuration-specific setting.
> +    const: 1
> +
> +  num-eps:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Specifies the number of endpoints. This is a MUSB configuration
> +      specific setting.
> +    const: 16
> +
> +  ram-bits:
> +    description:
> +      Specifies the RAM address size.
> +    const: 12
> +
> +  interface-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Describes the type of interface between the controller and the PHY.
> +      0 for ULPI, 1 for UTMI.
> +    enum: [0, 1]
> +
> +  mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: 1 for HOST, 2 for PERIPHERAL, 3 for OTG.
> +    enum: [1, 2, 3]
> +
> +  power:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Signifies the controller can supply up to 100mA when operating
> +      in host mode.
> +    enum: [50, 150]

Which value corresponds to 100mA?

> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: usb2-phy
> +
> +  usb-phy:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: Phandle for the PHY device.
> +    deprecated: true
> +
> +  ctrl-module:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle of the control module this glue uses to write to mailbox.
> +
> +required:
> +  - reg
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    usb_otg_hs@4a0ab000 {

usb@...

> +        compatible = "ti,omap4-musb";
> +        reg = <0x4a0ab000 0x1000>;
> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "mc", "dma";
> +        ti,hwmods = "usb_otg_hs";
> +        multipoint = <1>;
> +        num-eps = <16>;
> +        ram-bits = <12>;
> +        ctrl-module = <&omap_control_usb>;
> +        phys = <&usb2_phy>;
> +        phy-names = "usb2-phy";
> +        interface-type = <1>;
> +        mode = <3>;
> +        power = <50>;
> +    };
> +...
> 
> -- 
> 2.52.0
> 

