Return-Path: <linux-usb+bounces-32818-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IKqMG/VeGmNtQEAu9opvQ
	(envelope-from <linux-usb+bounces-32818-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:10:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCBC96611
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C30F30305D3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A5A35D615;
	Tue, 27 Jan 2026 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eu4jX37C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C3235DCE7
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526249; cv=none; b=SFMfrlDjH+9QVY5Clz7/lD3pIh5/LeI+IoEFe4kUr22kGQcu7CsPpRRVypkFl52fqxWbUD2HNVAT2GHRBZYoeVcM9GjXWc5//U6H8gTod7jHO8hOw/Kf6TRq4wA8VhiMQm5r1J+aof30W0xHihgtINKu+MMvvWxUaMgAj6X23Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526249; c=relaxed/simple;
	bh=2oYYDYAvm4jTAaky3FQraxx496L7hwtdllCzqgHnnGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeAa2gpdXttHn3hDAk0aXfWGgRE38YFomAdUsRiTLsavzhjYTU6Y0LpfJFag9EYBMafYklNEHd4/rWdthk4Hp6UL9kHp8L3IQ99jyYSOLygKFXu3QuwjQbk+HnNu1OxH05TtqlJcQHqbv+n+ovB3ZdLWKoOhTPzbj66Wdl4W24E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eu4jX37C; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c622ce9a33bso1825420a12.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 07:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526247; x=1770131047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ph6GwNlod+IS+C8k9beoEWeYzHPUGffF1N1gSwv1l98=;
        b=Eu4jX37CyCQCa/yNytVuptcAAQpbp1KaIYE0d+tgs9YiGn1QA9GJ6aMGYX/doWddkA
         ggG8/3ke5LFL2dbVT8hLY+nVW8AfJCwFg8qfuSYir9yKSurNsafdBr0uMXIUa8sJalRA
         GSGvhA6M+eKhOw9bL/D4rS4XHBKNxCqeB0WJu8f3GxW7VRPFpa9+qlozwG0ICACGxSYz
         AVjx+/9Jn/42DvqQDCuY/6BpaglSIdbpuGLiH9PlEAz4GEW29vQ33FEWqUonPNA+2QiG
         2huiSIuqz5QWJJ4KQ3fHE//w0nZNt1OadoBc5b0FWGHl5smonefJgYRFjE3a8hlASA+G
         T4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526247; x=1770131047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ph6GwNlod+IS+C8k9beoEWeYzHPUGffF1N1gSwv1l98=;
        b=rOwi4caICWEtfgmd3z6ik9VyoiZdqiZg0Cclb43hCsKPSlerp+V8xOKr5m0lBbDH9F
         lUceWUb+Yp1uzVocf9cBTNTLJI6HKyZdVSgtWf35R2kNilXtNdxzYitNL5dkOjOnO7sa
         /Ngy+Q5wHIaP5asbRGWcfRjOcd08oW0UL2fCGvNKo9G0Jbhfs4iOR1L+EPkCnpui8PaH
         o2ZpWjeboPClZArYYaOP5b02O3ppth3G+UeYzBwhyCI77GjYk9+rCBGXwj754Uv6HPSl
         4Ae6SfhgDwJvyebHlE4o9H0Dlh4VvsTRlBOjU8OLgy+e+epjdB94mLDhUPROz0Cl6cHG
         UMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm8yaaEViJmAawOtIQ3iiWpAlFtbY9Vbbz7NMaibx2MsCTsRNvMMGKLkmR7bsQXr2jMWELQCDPyPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx820u1ttOf2Wbj/5SywIkgaIBxN8gA0QCGdsEb6/A+quiEU3Z8
	u/istxOJ9p23QnwwjiqUlBiKCTmtdQiPP11vHZXejCy72LaRFH1ohGCn
X-Gm-Gg: AZuq6aKUPczqX6MyGuLvURjSgi9OXtwYKryZ/6vfF6W/JRZQWgptlOwueWk2dZXmNUy
	ySbFLNgTp4+BQy+jvFdabjmxaIkusn4+D4qw6f/IBBe61+cFqBokgqHbJzwk2rogXJ6w5HQ3opv
	W5PdSb+BoMUkr4b8/6oe/RM9tWp+pG7Ypch2CAPxbQWSy4VcomgrCeetGHlQbywzxgPTguv6KDc
	OjwzYhWE9YELwvbYUgXUpNfU3HMOHyzRsNNbs29V/PSn61IdpSWDqE1ta7gUrUTqt7zZMqOTxTh
	rtPt6PpAggcc3GJ9ouANqxN5kl1Rj6BuAENQUtGLJnMhLRP/jAN85YQyZV7U/b9DR6QrAj0eWtM
	PZ1BFCAwfSxq+gR5hVL46YTlvI8N99Sas2sHJrcJ1+A4KfmcawhBYURdyr6aHJd6r3QME20Q1nd
	Oq75kwz0P7kqfjiDzAEauuzjfdmieb4qyr/d4=
X-Received: by 2002:a17:90b:1d02:b0:34a:e9b:26b1 with SMTP id 98e67ed59e1d1-353fed9900fmr2036177a91.26.1769526246430;
        Tue, 27 Jan 2026 07:04:06 -0800 (PST)
Received: from [192.168.1.5] ([115.99.251.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f5f96293sm2952869a91.0.2026.01.27.07.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 07:04:06 -0800 (PST)
Message-ID: <a8c5e85c-6f42-4a5a-8dab-fe43728e8009@gmail.com>
Date: Tue, 27 Jan 2026 20:34:00 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: ti,dwc3: convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260126-ti-usb-v1-0-2855c129eb6d@gmail.com>
 <20260126-ti-usb-v1-2-2855c129eb6d@gmail.com>
 <20260126160835.GA2502193-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260126160835.GA2502193-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-32818-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.39.16:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 1DCBC96611
X-Rspamd-Action: no action



On 26-01-2026 21:38, Rob Herring wrote:
> On Mon, Jan 26, 2026 at 01:22:05PM +0000, Charan Pedumuru wrote:
>> Convert OMAP DWC3 USB Glue Layer binding to DT schema.
>> Changes during conversion:
>> - Introduce a new compatible string pattern "omap_dwc3" to match nodes
>>   already present in existing device tree sources.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/usb/omap-usb.txt |  80 ---------------
>>  Documentation/devicetree/bindings/usb/ti,dwc3.yaml | 112 +++++++++++++++++++++
>>  2 files changed, 112 insertions(+), 80 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/omap-usb.txt b/Documentation/devicetree/bindings/usb/omap-usb.txt
>> deleted file mode 100644
>> index f0dbc5ae45ae..000000000000
>> --- a/Documentation/devicetree/bindings/usb/omap-usb.txt
>> +++ /dev/null
>> @@ -1,80 +0,0 @@
>> -OMAP GLUE AND OTHER OMAP SPECIFIC COMPONENTS
>> -
>> -OMAP MUSB GLUE
>> - - compatible : Should be "ti,omap4-musb" or "ti,omap3-musb"
>> - - ti,hwmods : must be "usb_otg_hs"
>> - - multipoint : Should be "1" indicating the musb controller supports
>> -   multipoint. This is a MUSB configuration-specific setting.
>> - - num-eps : Specifies the number of endpoints. This is also a
>> -   MUSB configuration-specific setting. Should be set to "16"
>> - - ram-bits : Specifies the ram address size. Should be set to "12"
>> - - interface-type : This is a board specific setting to describe the type of
>> -   interface between the controller and the phy. It should be "0" or "1"
>> -   specifying ULPI and UTMI respectively.
>> - - mode : Should be "3" to represent OTG. "1" signifies HOST and "2"
>> -   represents PERIPHERAL.
>> - - power : Should be "50". This signifies the controller can supply up to
>> -   100mA when operating in host mode.
>> - - usb-phy : the phandle for the PHY device
>> - - phys : the phandle for the PHY device (used by generic PHY framework)
>> - - phy-names : the names of the PHY corresponding to the PHYs present in the
>> -   *phy* phandle.
>> -
>> -Optional properties:
>> - - ctrl-module : phandle of the control module this glue uses to write to
>> -   mailbox
>> -
>> -SOC specific device node entry
>> -usb_otg_hs: usb_otg_hs@4a0ab000 {
>> -	compatible = "ti,omap4-musb";
>> -	ti,hwmods = "usb_otg_hs";
>> -	multipoint = <1>;
>> -	num-eps = <16>;
>> -	ram-bits = <12>;
>> -	ctrl-module = <&omap_control_usb>;
>> -	phys = <&usb2_phy>;
>> -	phy-names = "usb2-phy";
>> -};
>> -
>> -Board specific device node entry
>> -&usb_otg_hs {
>> -	interface-type = <1>;
>> -	mode = <3>;
>> -	power = <50>;
>> -};
>> -
>> -OMAP DWC3 GLUE
>> - - compatible : Should be
>> -	* "ti,dwc3" for OMAP5 and DRA7
>> -	* "ti,am437x-dwc3" for AM437x
>> - - ti,hwmods : Should be "usb_otg_ss"
>> - - reg : Address and length of the register set for the device.
>> - - interrupts : The irq number of this device that is used to interrupt the
>> -   MPU
>> - - #address-cells, #size-cells : Must be present if the device has sub-nodes
>> - - utmi-mode : controls the source of UTMI/PIPE status for VBUS and OTG ID.
>> -   It should be set to "1" for HW mode and "2" for SW mode.
>> - - ranges: the child address space are mapped 1:1 onto the parent address space
>> -
>> -Optional Properties:
>> - - extcon : phandle for the extcon device omap dwc3 uses to detect
>> -   connect/disconnect events.
>> - - vbus-supply : phandle to the regulator device tree node if needed.
>> -
>> -Sub-nodes:
>> -The dwc3 core should be added as subnode to omap dwc3 glue.
>> -- dwc3 :
>> -   The binding details of dwc3 can be found in:
>> -   Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> -
>> -omap_dwc3 {
>> -	compatible = "ti,dwc3";
>> -	ti,hwmods = "usb_otg_ss";
>> -	reg = <0x4a020000 0x1ff>;
>> -	interrupts = <0 93 4>;
>> -	#address-cells = <1>;
>> -	#size-cells = <1>;
>> -	utmi-mode = <2>;
>> -	ranges;
>> -};
>> -
>> diff --git a/Documentation/devicetree/bindings/usb/ti,dwc3.yaml b/Documentation/devicetree/bindings/usb/ti,dwc3.yaml
>> new file mode 100644
>> index 000000000000..859da4b1f207
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/ti,dwc3.yaml
>> @@ -0,0 +1,112 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/ti,dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments OMAP DWC3 USB Glue Layer
>> +
>> +maintainers:
>> +  - Felipe Balbi <balbi@ti.com>
>> +
>> +description:
>> +  Texas Instruments glue layer for Synopsys DesignWare USB3 (DWC3)
>> +  controller on OMAP and AM43xx SoCs. Manages SoC-specific integration
>> +  including register mapping, interrupt routing, UTMI/PIPE interface mode
>> +  selection (HW/SW), and child DWC3 core instantiation via address space
>> +  translation. Supports both legacy single-instance and multi-instance
>> +  (numbered) configurations.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^omap_dwc3(_[0-9]+)?@.*$"
> 
> Drop.

Sure.

> 
>> +
>> +  compatible:
>> +    enum:
>> +      - ti,dwc3
>> +      - ti,am437x-dwc3
>> +
>> +  ti,hwmods:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      TI PRCM hardware module name that must be enabled (powered and
>> +      clocked) for this node. "usb_otg_ss" refers to the SuperSpeed
>> +      (USB3 + USB2 OTG) controller wrapper/glue layer found in OMAP5,
>> +      DRA7, AM57x, and similar TI SoCs using DWC3.
>> +    const: usb_otg_ss
> 
> Drop. Not used anywhere.

Okay.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  utmi-mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Controls the source of UTMI/PIPE status for VBUS and OTG ID.
>> +      1 for HW mode, 2 for SW mode.
>> +    enum: [1, 2]
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +  extcon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle for the extcon device used to detect connect/
>> +      disconnect events.
>> +
>> +  vbus-supply:
>> +    description: Phandle to the regulator device tree node if needed.
>> +
>> +patternProperties:
>> +  "^usb@[0-9a-f]+$":
>> +    type: object
>> +    $ref: snps,dwc3.yaml#
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - reg
>> +  - compatible
>> +  - interrupts
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - utmi-mode
>> +  - ranges
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    omap_dwc3_1@0 {
>> +        compatible = "ti,dwc3";
>> +        reg = <0x0 0x10000>;
>> +        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        utmi-mode = <2>;
>> +        ranges = <0 0 0x20000>;
>> +
>> +        usb@10000 {
>> +            compatible = "snps,dwc3";
>> +            reg = <0x10000 0x17000>;
>> +            interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "peripheral", "host", "otg";
>> +            phys = <&usb2_phy1>, <&usb3_phy1>;
>> +            phy-names = "usb2-phy", "usb3-phy";
>> +            maximum-speed = "super-speed";
>> +            dr_mode = "otg";
>> +            snps,dis_u3_susphy_quirk;
>> +            snps,dis_u2_susphy_quirk;
>> +        };
>> +    };
>> +...
>>
>> -- 
>> 2.52.0
>>

-- 
Best Regards,
Charan.


