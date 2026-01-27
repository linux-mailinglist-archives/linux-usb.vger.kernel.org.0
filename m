Return-Path: <linux-usb+bounces-32828-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAkgEMzeeGkCtwEAu9opvQ
	(envelope-from <linux-usb+bounces-32828-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:50:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE99718A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D765131221B7
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63ECD364E89;
	Tue, 27 Jan 2026 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGP4ffXF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F7E361DDD
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527601; cv=none; b=PdzNA4H2Oc16jM19Vzo/TMWe2Mou8NOxi7Vgg5sLfhh1+TmRji2HNBE62lZRyT4bGeAuofFQComWDD7vI8zjzg4/KW3OVzdI6eSbwWH3+YiN4FvcehFdYPUsbgFOh53BkfVnIO1pzvnzUKAJk3EtPuFbDXy22Hj1Ob5PLdQC1yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527601; c=relaxed/simple;
	bh=vx3jLTsBw4rxu7hoSeZBPfSAXJs751JIn0jAWWF5Xbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Db0N3tKoM1jj6JO+uysZhmuhXar2wp3V1Wgn/z6uXRynu4OrkxGTynd4EPkryyxsqUIH9o6EmQWjIjtXvaz8t8K3QN1Koljm0zK71JOCnyHAUrscPijDkS7ZPLZ32O/A8ClQRO2r929BdtBSW+UUBqbvuS9MMg8oI5EFlxmr59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGP4ffXF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so42654605ad.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 07:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769527599; x=1770132399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/fsCYTkIXDItTcE/n6muZz7y6GpmWCERYqeftONhwg=;
        b=QGP4ffXFHYsQg3cvB0lFgrynOjqO413hWZG7svBN6ys0WSKS5O9r1+eOhhxNc6eYVT
         vI+x1rHcenB6SMnKYfePU2+mVHaA88dAHf5tpIKpAoGpVq6joM0sDVeeL3l36983x+sF
         FQp7mDPHg1b3NU4jhQNl1zKBy0izeeanmPhEl0qdroxWyTsORsOq69xmXa8Yjq6koIxV
         Z0WCZbkvUHjQ4qz8xvc0KUh24fwlZ1YK/2UW/Og1wso0U70DWxmQs9uSbTBvc/UjJLs2
         CNcN6GPNbCA+OCtiAf4E4CbfZ3hPDqkh1BUBM6126zZcgrtSYWeV7bwhushMLKPRfTCI
         RiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527599; x=1770132399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/fsCYTkIXDItTcE/n6muZz7y6GpmWCERYqeftONhwg=;
        b=VvZ2yO32XA1Clm4Ve2rI20pM8T0J0grTkTWZ2QaOKd059RTNJ0z/f+7aCN8wSod75c
         7M4xicE3uSAM/P5yc34gaAoXoDpj0gCHk1mlrfaeidbBdYNpb1DfrBAKII8+Zdx50DAg
         VKTW2buROcD8flR7qYfa4YBlX7BCbW4ALJECUG1li0WKuqC6zjdXlBohUFc2n/Vx+lgT
         BBvz1sijh7Uc7pR/JajYmi7aKz1bPQuYdA2/G9cDzfWcGNamwYpVTCRD+Gnime8JGmEL
         4A2uTFukaO9pjJ3TK+niGuig67AlzoJLm57NRZISt414wwI8clxHaF9+sesE1gYGfZBU
         1A6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWJod+7JwdELOHZpsAIGPmvlIAs0lJcHwapxsVsMU2QR43x6qYaoAz49PUjJ1NhOXQ7PANHRSt5gw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfncmjvgv5TVfI3NyFbSwwtIOcOwvq/3D3zDLM6fhvd7TcUFWQ
	KT221FkMCKkzyz+miC6/yluj0/lFMMswp8MusaGbLLtqBCUnxajF7GF2
X-Gm-Gg: AZuq6aJIROOOZ04qSffhypjvwSYKevVIyXpp2rLo1FRXRtTCnfLCOqKo5kkJUWdiP0T
	niQVIrs2tbMR05ln8VzBplwUGewZ+KplfjsM5FypQQR39veJl2MEi7QEdrmARWYys6jb2g/Mvxl
	/0hiMes7RYqe/4YoVwGhDqm9w2fEZTqd2+Lou9VSvIeiuPZELgfpCdfPEL0nh+j7+Pmv0frv5oJ
	TcBc9lkCMbz6FhnGqoLl4rHu/wlvmP5jIiPJIGq0ACvFlHzgnICRHM9vxZkqNBIqzi86cNCnIb7
	a/H8+2jgVn8weqmI8fUWLV3Px/nNCh0qKRgq/nsKgwjKTx66Z+eQlhcBtVxqq73c0mkus/zYKCE
	M5gOI1KgOOZqPqhJjsBl+T4Ig07xbPe5yDDkDNXWlCJc0T69Cg6qzDgbq4rY54pw48YHrfKoWFg
	vOgpCIwKVoK/VqwOXsHo7DP56WizwLJa5tEZE=
X-Received: by 2002:a17:903:2cf:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a870d7446cmr22169425ad.23.1769527599292;
        Tue, 27 Jan 2026 07:26:39 -0800 (PST)
Received: from [192.168.1.5] ([115.99.251.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd70asm123437515ad.92.2026.01.27.07.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 07:26:38 -0800 (PST)
Message-ID: <e1b2b86f-6762-4b6b-bcb9-f8c7349e8077@gmail.com>
Date: Tue, 27 Jan 2026 20:56:34 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: ti,omap4-musb: convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260126-ti-usb-v1-0-2855c129eb6d@gmail.com>
 <20260126-ti-usb-v1-1-2855c129eb6d@gmail.com>
 <20260126160610.GA2471873-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260126160610.GA2471873-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32828-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,ti.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,4a0ab000:email]
X-Rspamd-Queue-Id: D9EE99718A
X-Rspamd-Action: no action



On 26-01-2026 21:36, Rob Herring wrote:
> On Mon, Jan 26, 2026 at 01:22:04PM +0000, Charan Pedumuru wrote:
>> Convert OMAP MUSB USB OTG Controller binding to DT schema.
>> Changes during conversion:
>> - Introduce new compatible string patterns "am35x_otg_hs" and "usb_otg_hs"
>>   to properly match existing nodes already defined in the DT sources.
>> - Include "interrupts" and "interrupt-names" properties in the YAML, as
>>   they are used by many in-tree DTS files.
>> - Extend the "power" property to allow the value 150 (in addition to
>>   existing values), since this is present in several in-tree DTS examples.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../devicetree/bindings/usb/ti,omap4-musb.yaml     | 133 +++++++++++++++++++++
>>  1 file changed, 133 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml b/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml
>> new file mode 100644
>> index 000000000000..16e95fe4c38d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml
>> @@ -0,0 +1,133 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/ti,omap4-musb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments OMAP MUSB USB OTG Controller
>> +
>> +maintainers:
>> +  - Felipe Balbi <balbi@ti.com
> 
> Missing '>'

Yeah, I missed it, will add in the next rev.

> 
>> +
>> +description:
>> +  Texas Instruments glue layer for the Mentor Graphics MUSB OTG controller.
>> +  Handles SoC-specific integration including PHY interface bridging(ULPI/
>> +  UTMI), interrupt aggregation, DMA engine coordination (internal/
>> +  external), VBUS/session control via control module mailbox, and
>> +  clock/reset management. Provides fixed hardware configuration parameters
>> +  to the generic MUSB core driver.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^(am35x_otg_hs|usb_otg_hs|usb)@[0-9a-f]+$"
> 
> Again, do not document non-standard names. That's anything not in the DT 
> spec.

Sure, I will remove pattern entirely.

> 
>> +
>> +  compatible:
>> +    enum:
>> +      - ti,omap3-musb
>> +      - ti,omap4-musb
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ti,hwmods:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      Specifies the name of the TI PRCM (Power, Reset and Clock Management)
>> +      hardware module that must be enabled (powered and clocked) for this
>> +      device node to operate. The value "usb_otg_hs" refers to the USB
>> +      On-The-Go High-Speed controller IP block.
>> +    const: usb_otg_hs
> 
> deprecated: true
> 
> (I think we want that everywhere?)
> 
> Actually, looks like only omap2430 sets this, but that's not covered by 
> this schema. Unless you need to add "ti,omap2-musb"?

Okay, in that case I will drop the property.

> 
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      enum: [mc, dma]
> 
> I would assume only 'dma' is optional? Does this work?:
> 
> items:
>   - const: mc
>   - const: dma

Yes, this works.

> 
>> +
>> +  multipoint:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Indicates the MUSB controller supports multipoint. This is a MUSB
>> +      configuration-specific setting.
>> +    const: 1
>> +
>> +  num-eps:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Specifies the number of endpoints. This is a MUSB configuration
>> +      specific setting.
>> +    const: 16
>> +
>> +  ram-bits:
>> +    description:
>> +      Specifies the RAM address size.
>> +    const: 12
>> +
>> +  interface-type:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Describes the type of interface between the controller and the PHY.
>> +      0 for ULPI, 1 for UTMI.
>> +    enum: [0, 1]
>> +
>> +  mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: 1 for HOST, 2 for PERIPHERAL, 3 for OTG.
>> +    enum: [1, 2, 3]
>> +
>> +  power:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Signifies the controller can supply up to 100mA when operating
>> +      in host mode.
>> +    enum: [50, 150]
> 
> Which value corresponds to 100mA?

50 corresponds to 100mA, I will add it to the description.

> 
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: usb2-phy
>> +
>> +  usb-phy:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: Phandle for the PHY device.
>> +    deprecated: true
>> +
>> +  ctrl-module:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle of the control module this glue uses to write to mailbox.
>> +
>> +required:
>> +  - reg
>> +  - compatible
>> +  - interrupts
>> +  - interrupt-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    usb_otg_hs@4a0ab000 {
> 
> usb@...

Okay.

> 
>> +        compatible = "ti,omap4-musb";
>> +        reg = <0x4a0ab000 0x1000>;
>> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "mc", "dma";
>> +        ti,hwmods = "usb_otg_hs";
>> +        multipoint = <1>;
>> +        num-eps = <16>;
>> +        ram-bits = <12>;
>> +        ctrl-module = <&omap_control_usb>;
>> +        phys = <&usb2_phy>;
>> +        phy-names = "usb2-phy";
>> +        interface-type = <1>;
>> +        mode = <3>;
>> +        power = <50>;
>> +    };
>> +...
>>
>> -- 
>> 2.52.0
>>

-- 
Best Regards,
Charan.


