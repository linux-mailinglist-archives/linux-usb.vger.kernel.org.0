Return-Path: <linux-usb+bounces-35028-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKnAFl1lumklWAIAu9opvQ
	(envelope-from <linux-usb+bounces-35028-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:42:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F662B83F4
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D7153116378
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D68F246BC6;
	Wed, 18 Mar 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOR4p4Vk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC499261B8D;
	Wed, 18 Mar 2026 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822979; cv=none; b=YoSYxCNMPVFDDPC3rh++UNHScEH9Uw2WOoGaXPFe7CvmmvyH4LEbfmNFvx7nvCG/M1K3iH4sRNV/cTtCPk6+EevT+gOo/eNPQVtNTF/jeGfoK3VgZlrpkRhw8gXhiVANi35onEdHkxIIjlKJ5cAhNE8Mm1sZHuZlijSr1l0wHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822979; c=relaxed/simple;
	bh=GZV2nGuIMW1Ik1p9g9hDJ9d5KYSCHnB7lBWxqtxINio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzJr5MTIBqKOKRYZiKPVEPY9C49LycebMrfibx+LJf+Cc5FsCBdmuzclaYK6/NWLHb2t9NyqayyVSjlsd2KkFDrZPhtrIPv8+TIP78Xud+5tekJyxjZ0lcAr1u7eYVgcxkf5IqpVfJLlJuSvQbaWSIRRQqdrpLuEL7cbfV/j94w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOR4p4Vk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3B6C19421;
	Wed, 18 Mar 2026 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822979;
	bh=GZV2nGuIMW1Ik1p9g9hDJ9d5KYSCHnB7lBWxqtxINio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOR4p4VkektB9fNYGyHjCbYcVWdSnCUFWT7om10wNolFdJ+AvtRuVCFArcOYn7i2B
	 iXcKErXa2K0H+adQ6H39h33GbTKRX75FRiXcH3G25Wd5PIA8sEWsiCb2AmTdHQzX7O
	 KyeKt//JvrFSTA1cI1tD9Jwk7cyedLwkz4sEBgaRv+ola7nzhemKrnGabDeN9np2wM
	 5Fdei7qdpCcF2lYZQyfRfhCqtdE9l5qGT4DNdjWEspWfxAmVlr2gFtKq/dYKpC6YNj
	 Ig6/RNimGyFeAAa7MK8l8QwtMYcnqLnErrk0XIxarVZesB8x+MpHAPeFkvKaXSuHNB
	 KTQBf1H4UkU6g==
Date: Wed, 18 Mar 2026 09:36:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Junzhong Pan <panjunzhong@linux.spacemit.com>, Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: usb: Add support for Terminus FE1.1s
 USB2.0 Hub controller
Message-ID: <20260318-original-cockle-from-jupiter-a2c9b0@quoll>
References: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
 <20260317-03-usb-hub-fe1-v1-2-71ec3989f5be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-03-usb-hub-fe1-v1-2-71ec3989f5be@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35028-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,chromium.org,linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_WP_URI(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1F662B83F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 08:55:03AM +0000, Yixun Lan wrote:
> Terminus FE1.1s is USB2.0 protocol compliant 4-port USB HUB, It support
> MTT (Multiple Transaction Translator) mode, the upstream port supports
> high-speed 480MHz and full-speed 12MHz modes, also has integrated 5V to
> 3.3V, 1.8V regulator and Power-On-Reset circuit.
> 
> Introduce the DT binding for it.
> 
> Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  .../devicetree/bindings/usb/terminus,fe11.yaml     | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/terminus,fe11.yaml b/Documentation/devicetree/bindings/usb/terminus,fe11.yaml
> new file mode 100644
> index 000000000000..93bb4066f851
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/terminus,fe11.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/terminus,fe11.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Terminus FE1.1/1.1S USB 2.0 Hub Controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@kernel.org>
> +
> +allOf:
> +  - $ref: usb-hub.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb1a40,0101

I do not see vendor prefix used anywhere. Drop that patch, because I
think we do not reserve them for file names or schema IDs.

> +
> +  reg: true
> +
> +  reset-gpios:
> +    description:
> +      GPIO controlling the RESET#, but the reset line can be optional.

Don't repeat constraints in free form text. Schema tells what can be
optional by not requiring it.

> +
> +  vdd-supply:
> +    description:
> +      Regulator supply to the hub, one of 3.3V or 5V can be chosen.

And this cannot be optional.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@':
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +        properties:
> +          reg:
> +            minimum: 1
> +            maximum: 4
> +
> +required:
> +  - compatible
> +  - reg

Missing supply.

> +
> +additionalProperties: false

First, radxa never built tested the DTS when posted it. Yeah, why would
they care...

Second, now you added schema which is nice, but you still did not verify
it with the DTS.

That's the point of DT schema. To verify the DTS. You MUST do it when
you post the binding. Why? To see the errors you have here. See other
hub schemas, like genesys, what goes above - unevaluated.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    usb {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub: hub@1 {

Drop unused label

> +            compatible = "usb1a40,0101";
> +            reg = <1>;
> +            reset-gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
> +            vdd-supply = <&vcc_5v>;
> +        };
> +    };
> 
> -- 
> 2.53.0
> 

