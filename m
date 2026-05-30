Return-Path: <linux-usb+bounces-38174-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFAZLsiQGmrK5ggAu9opvQ
	(envelope-from <linux-usb+bounces-38174-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 09:24:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2060760B935
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 09:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90A19305876F
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 07:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0AA388E66;
	Sat, 30 May 2026 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrWQMlLX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF9935F5F8;
	Sat, 30 May 2026 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780125850; cv=none; b=RSFlqlE88pgkLIEH+jynPioKTpZLAVfPSaL1+bZO6Dy8Iu1nwQGi/dQdkMNDQKY3gunipczsZmvXwbWnXFZBiSI7HeSthh3QM89ExGLSy6T5D4eQtLdJuOAFv6qAVDDSLhG/iq09dBbWUO8DWEdZxFOV6Rb4csD216BxKARp7ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780125850; c=relaxed/simple;
	bh=OhL96no5Bl5iHBqpM33mnUMSRzJs4QsmiLe0eDBBHmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7KSAGg3EQvfWegjioU3bJt9/j/45y3dAveRWM2L8M5/+QTOzdt8nsKinfGE//VM/VqQF4WHc1DI2qw8MFo6D2j9sEwUzyt8u2BBi7Fm/+PDmsHC0FdYd9mTIVqrM6uz+TkzWyemlx+pOuOO1gCUZhTjnXpIdC7hrFHoHeK14Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrWQMlLX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FF21F00898;
	Sat, 30 May 2026 07:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780125849;
	bh=G9ZxHD3lU6TqxXiyrUwIWUka9kcwymS8eSuEmeSwNp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SrWQMlLX6NWBWp3WwaKRjpDn21QuLaWwSyN1B2BBBvuRJfgihk3UN57HN/ZCFYs0n
	 ecJt082rTGSb9VEp38ewpuc5pXjeBw416BRuatMuj7BGb1bRB60xe1YFjydrgRe4r/
	 XcM7wWW0m8tcXg1P4n1kUFhQUx9h31mJsDy5Xtwqu4aDl+EvyDEqVMvC3KsOeevxet
	 Zn4kSS9aIRWu5ZmWcG4O8TloVQmLCxqqn9nvz3YE5ZPHwV5C7+/aSuEvC5EC5lP3y7
	 TOozi/7/Gzy17N1SU7H7x374WHRS/aUE9Fn20XZMTRWQR/LAmXlUWQEKl1L7feFjL+
	 toBq+SjoDxTEg==
Message-ID: <a08cd9e4-9144-4707-be37-ccd1cfe25dd9@kernel.org>
Date: Sat, 30 May 2026 09:24:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: convert PXA USB bindings to YAML
To: Jeremiah Bishop <jbishop.dev@gmail.com>, gregkh@linuxfoundation.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529213506.37462-1-jbishop.dev@gmail.com>
 <20260530022955.32728-1-jbishop.dev@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260530022955.32728-1-jbishop.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38174-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,4c000000:email,bootlin.com:url,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 2060760B935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/05/2026 04:29, Jeremiah Bishop wrote:
> Convert the legacy pxa-usb.txt binding documentation to YAML schemas.

DT schema. Not YAML. There is no such thing as YAML schemas. See also
submitting patches. Same for subject.

> 
> The original text binding documented two distinct devices: the PXA OHCI
> USB host controller and the PXA270 USB device controller. Split the
> documentation into separate schemas, marvell,pxa-ohci.yaml and
> marvell,pxa270-udc.yaml, and remove the obsolete text binding.
> 
> The schemas preserve the existing compatible strings and properties used
> by current in-tree users while adding machine-readable validation and
> examples.

Drop, redundant. Say if you changed the binding.

> 
> Signed-off-by: Jeremiah Bishop <jbishop.dev@gmail.com>
> ---
> Changes in v2:
> - Add vbus1-supply, vbus2-supply, and vbus3-supply properties to the
>   PXA OHCI schema.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

> 
>  .../bindings/usb/marvell,pxa-ohci.yaml        | 100 ++++++++++++++++++
>  .../bindings/usb/marvell,pxa270-udc.yaml      |  50 +++++++++
>  .../devicetree/bindings/usb/pxa-usb.txt       |  53 ----------
>  3 files changed, 150 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/pxa-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
> new file mode 100644
> index 000000000000..5d660b92d3cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/marvell,pxa-ohci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA OHCI USB Host Controller
> +
> +maintainers:
> +  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +  - Alan Stern <stern@rowland.harvard.edu>

No, subsystem maintainers are not maintainers of this binding. This
could be platform maintainer.

> +
> +allOf:
> +  - $ref: usb-hcd.yaml#
> +
> +properties:
> +  compatible:
> +    const: marvell,pxa-ohci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  marvell,enable-port1:
> +    type: boolean
> +    description: Enable USB port 1 if present.
> +
> +  marvell,enable-port2:
> +    type: boolean
> +    description: Enable USB port 2 if present.
> +
> +  marvell,enable-port3:
> +    type: boolean
> +    description: Enable USB port 3 if present.> +
> +  marvell,port-sense-low:
> +    type: boolean
> +    description: Port sense pin in low-active.
> +
> +  marvell,power-control-low:
> +    type: boolean
> +    description: Power control pin is low-active.
> +
> +  marvell,no-oc-protection:
> +    type: boolean
> +    description: Disable over-current protection.
> +
> +  marvell,oc-mode-perport:
> +    type: boolean
> +    description: Enable per-port over-current protection.
> +
> +  marvell,power-on-delay:

power_on_delay? Your commit msg must clearly list the changes done to
the binding during conversion with explanation why.


> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Power On to Power Good time in milliseconds.
> +
> +  marvell,port-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]
> +    description: |
> +      Selects the mode of the ports.
> +        1 = PMM_NPS_MODE
> +        2 = PMM_GLOBAL_MODE
> +        3 = PMM_PERPORT_MODE
> +
> +  marvell,power-budget:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: USB power budget.

There was no such property.

> +
> +  vbus1-supply:
> +    description: Regulator supplying VBUS for port 1.
> +
> +  vbus2-supply:
> +    description: Regulator supplying VBUS for port 2.
> +
> +  vbus3-supply:
> +    description: Regulator supplying VBUS for port 3.

Neither these.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

There were no interrupts or clocks.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    usb@4c000000 {
> +        compatible = "marvell,pxa-ohci";
> +        reg = <0x4c000000 0x100000>;
> +        interrupts = <3>;
> +        clocks = <&clks 11>;
> +        marvell,enable-port1;
> +        marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
> +    };
> diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml b/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
> new file mode 100644
> index 000000000000..0be51e0db80b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/marvell,pxa270-udc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA27x USB Device Controller (UDC)
> +
> +maintainers:
> +  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Same problem

> +
> +properties:
> +  compatible:
> +    const: marvell,pxa270-udc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  gpios:
> +    maxItems: 1
> +    description: GPIO to control the USB D+ pullup.
> +
> +  phys:
> +    maxItems: 1

There was no such property.


Best regards,
Krzysztof

