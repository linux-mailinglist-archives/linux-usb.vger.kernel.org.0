Return-Path: <linux-usb+bounces-37470-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOoqMdrRBmqKoAIAu9opvQ
	(envelope-from <linux-usb+bounces-37470-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:57:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7A54AE45
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 653C8306FA69
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA413F7A84;
	Fri, 15 May 2026 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQCUnjVl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C33AC0F1;
	Fri, 15 May 2026 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831653; cv=none; b=qQ3ACx19J51WqK8MHqPOgWoiAXw96DSJg7LEECAXI+gDF63xAFjf1G2rsAHQV5VhcR7K10uBLjQnFCO0mlpp8BAbReeNfTGH2pqgqika1C7MV3aNokJm83Q1eHuGCf5P0il2tOokU+ReQ5nLbQ3cTuMoGVIG4mutSSra619Zkss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831653; c=relaxed/simple;
	bh=6ceNaQOsWeuicN4hn04erefEjHrpUzdn7iOlsxG3uV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfDpW5MECfhCEczDGi8jEFMh6Avb7qLNHCyzzdglHvPkbvfCc8Ht7MvABtVwyUOoB3JMDMX6M6iOpCcuc5B3ImjsAg/kGdYuDhHz9EeVMrYv2Ryf47ueSvg5rk+M8ysxOjeEjsQ1d4fE8UJnJXwSotVjSiZIKdquylwbdhFzac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQCUnjVl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FA7C2BCC7;
	Fri, 15 May 2026 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778831652;
	bh=6ceNaQOsWeuicN4hn04erefEjHrpUzdn7iOlsxG3uV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQCUnjVl95zerEu5idPYQgFx5D1M+KBHFdz6BwSmSbcvV3+ktlYEqSupy6T017Wof
	 ES3463b/oqdcvR2oGHQqucZl0PtOw2ptAGwcNz63XcWeF1G4/Tm2k+bLVAC5Va18m/
	 +LNI6hPLN693AfDNkwep6l/L9y8dElHu0paB/sczHAXca2lwT7fsefpvjJ0GMcOlDb
	 N1TjpZypvaLrz3IsYBnEhQzm5zX3MgoqZUPecakF402Twai+x3ydBubgEgeQFZaWoZ
	 Dboapk/t353YYcpHvDlXocRN2rx1fHhZ8txKf/FIISCcx9qMdf7HbXcimAZqRY63ze
	 ewa2ALJACJ9lg==
Date: Fri, 15 May 2026 09:54:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH 3/4] dt-bindings: usb: add CIX Sky1 Cadence USB3
 controller
Message-ID: <20260515-dynamic-archetypal-reindeer-dc6dd5@quoll>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
 <20260511024244.981941-4-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511024244.981941-4-peter.chen@cixtech.com>
X-Rspamd-Queue-Id: 2EE7A54AE45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37470-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cixtech.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 10:42:43AM +0800, Peter Chen wrote:
> Add a binding for the CIX Sky1 integration of the Cadence USBSSP DRD
> controller. The schema documents the glue register window, clocks,
> resets, interrupts and S5 system controller phandle.
> 
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  .../bindings/usb/cix,sky1-cdns3.yaml          | 151 ++++++++++++++++++

Why are you mixing USB patches with DTS in one patchset? Don't.

>  1 file changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
> new file mode 100644
> index 000000000000..23d82d8cc9bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml

Complete mess of filename. There is no such compatible.

> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cix,sky1-cdns3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Cadence USB3 Controller
> +
> +maintainers:
> +  - Peter Chen <peter.chen@cixtech.com>
> +
> +description:
> +  The CIX Sky1 USB3 controller is based on the Cadence USBSSP DRD
> +  controller. The integration adds glue registers and mode strap controls
> +  in the Sky1 S5 system controller.
> +
> +allOf:
> +  - $ref: usb-drd.yaml#
> +  - $ref: usb-xhci.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: cix,sky1-usb3
> +      - const: cix,cdns-usb3

I don't understand the fallback compatible. You claim this device is
called EXACTLY like vendor cdns? Nope, you SoC specific compatibles.


> +
> +  reg:
> +    items:
> +      - description: OTG controller registers
> +      - description: Device controller registers
> +      - description: XHCI host controller registers
> +      - description: Sky1 USB glue registers
> +
> +  reg-names:
> +    items:
> +      - const: otg
> +      - const: dev
> +      - const: xhci

Wrong order, look at cdns,usb3 schema.

> +      - const: glue
> +
> +  interrupts:
> +    items:
> +      - description: XHCI host controller interrupt
> +      - description: Device controller interrupt
> +      - description: OTG/DRD controller interrupt
> +      - description: Wakeup interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: host
> +      - const: peripheral
> +      - const: otg
> +      - const: wakeup
> +
> +  clocks:
> +    items:
> +      - description: Start-of-frame clock
> +      - description: AXI bus clock
> +      - description: Low-power mode clock
> +      - description: APB register interface clock
> +
> +  clock-names:
> +    items:
> +      - const: sof
> +      - const: aclk
> +      - const: lpm
> +      - const: pclk
> +
> +  resets:
> +    items:
> +      - description: APB register reset
> +      - description: Controller reset
> +
> +  reset-names:
> +    items:
> +      - const: prst

apb

> +      - const: rst

controller or core

> +
> +  cix,syscon-usb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the Sky1 S5 system controller used to program USB mode
> +      strap controls.
> +
> +  dma-coherent: true
> +
> +  maximum-speed:
> +    enum: [super-speed-plus, super-speed, high-speed, full-speed]

Why isn't this deducible from the compatible?

> +
> +  phys:
> +    minItems: 1
> +    maxItems: 2

No, this is not flexible.

> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      anyOf:
> +        - const: cdns3,usb2-phy
> +        - const: cdns3,usb3-phy

Drop all this and define standard names.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - cix,syscon-usb

phys should be required, no?

> +
> +unevaluatedProperties: false

Best regards,
Krzysztof


