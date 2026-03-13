Return-Path: <linux-usb+bounces-34724-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOAbLwq1s2l5aAAAu9opvQ
	(envelope-from <linux-usb+bounces-34724-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:56:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06D27E665
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8385930312C5
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 06:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1320235F61F;
	Fri, 13 Mar 2026 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2A/6cVk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B134214F
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384954; cv=none; b=R/5Ni3nptcVYIvyt11SUJFGrR0MjAH03Wipmsl9/8uj3d5j3MXPqcCgoTa8m7p45Xhvmfo962jQTMym9Dy6gQez90yX/G1TZylPp0J5ZWHVCTUdZeJDW0OK6kuudX6QoA+mJr0br6xmwebMxmZRobVottAlaCPVk5HXKmPzh29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384954; c=relaxed/simple;
	bh=Mvuas3KatxkkAZHpPOupTnzF25JszjgI3sDC3JxkWw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGZ+wFQcraEkvB9z1681Ax08L77tKOimsZ8m1j5iycIgAvXkcsG6gKzLa9XBikghjB3xwee4qwUJn3FwIOa35nyODI4G6f0+KXvUBEK18b8ReUOgBHLls1MCxDiC/CHDUN6hd1OIYK3lR0LLPMiTKcJaGMz/bw0RA5DQXKlzHg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2A/6cVk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35a1a36f0c0so918094a91.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773384952; x=1773989752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKspgt19BRlk3T3bnDher33Ubx6JY+szccGAPMVxMvU=;
        b=d2A/6cVkR3e2t/h6zZ1/yZBgpDd2GbVyIcZ1r7nxvVVaCEKtib09P2gbEzVGzm7DWG
         oaqn4Bx25n0x1YgYdChqRcZtv7P3RhemLb9QOrhIVp1Yj4+J8D6d3hcXs12ZrHTYpLlq
         kFYUC6tm5axnsURB3drLliMNo1q9texlkKd9M3xeoF4ZnxMrybLcII+IF5gCG2HIxSjE
         3ngN1DeFmQQImPv2EdqX6SF+M6WUBCx0zKaK0c+qAKiv276WGIH4uwcJijx6qWZ6nE2U
         MXXn8h44kbWiuPOaE/2GcNKuSNzKWUIt+68in7kvBWcVqb6J5doquKGhptb88e859YVt
         uceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384952; x=1773989752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKspgt19BRlk3T3bnDher33Ubx6JY+szccGAPMVxMvU=;
        b=o1FOSYTD3Neooh7BU9lztWnactghZ4IS39gLwGzyOIEpmpkW4WzSIFueksVZvS81Yi
         M5TGH5qtdY5nnnOkB+NrmrSdxkZODTL3RgSd5G6Jt0uCxtZ6hX3tdTk2EEMDOMyTlm/1
         dF5XgoaG7T2nxgYnM4fV5RDZW6KmvkO02/+VloxAOAnplQdQU2XGFclhvVfp8aVhdDma
         eoYkdLqonXaySivkn/gflBZW/Qy/In3e3JAd8sJ+yOEkddLvC1S6CdjDNv2ir9lh3vRj
         0hKZLjjSX8au27APn1xe71cPHbfzpqfX6Ytiea5sVRIgQlNlZ5f2kj3TjjV4NwQq/hyu
         7JZw==
X-Forwarded-Encrypted: i=1; AJvYcCU1v/Z9XG/qW+vs/kMKnrIzZcDa0MrYWEZbELXEZS2wPeoLVfS73ifHdv3bod5HV8gf7BGfndOoybE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0jj44rKu2yZs8YoroZri90IGnrvReoJBqOEV88KP3octngb8V
	RuGnSHTMJNQ7olwEMk7x/cSwl9NKRQb22Umvp+WX2qH5IGOT459MxyrW
X-Gm-Gg: ATEYQzzWtpLs1QJam0+sJfVYtC2r3SFbPyS/EguuuCCbUhXNd7wKzmikGLXYHssB3B0
	QsDeD46fculzCS4tlRS6s0Q7hwFogQva+0PeTV2MfA3aMOJP0YMWplPz8n8EAqlkyiquW9ZaKO2
	g4JOgWjyQznnBftJeEyxkZDs/Duu5ZJQfZbDS9+erDNf3FEUw/RiPzYoTxOp7DAGoSY5BpFS6iY
	6r4gstXBbIRZSq5BN2o5vF2Utf3zTlThXkeddt86wfgWMvApoLlhmveUooSg1afly8nhgswNhwz
	+mik0ThjWhANHJk/DGjH379epX1pweq5UmG89s8AaS6nfELupDRaiKcMM2E2wbQM7XQJb9Ene7S
	AUlnz4A+dZ821HX8XWlJY2IZZ+17d8edahA9OnFEIifEwXR6RGcz8zY7XplxFRwv+v1aoCPJDMq
	SsEXM7j6sy+biNuf/WIorwcP10Wmrn7yNeKV8CbVnERAkk
X-Received: by 2002:a17:90a:e7d0:b0:359:806c:7a94 with SMTP id 98e67ed59e1d1-35a21e4edfdmr2091970a91.7.1773384952107;
        Thu, 12 Mar 2026 23:55:52 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359fc97356dsm8699301a91.8.2026.03.12.23.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:55:51 -0700 (PDT)
Message-ID: <c60b4ee6-74bc-49b9-b6e7-2f4d535b13a8@gmail.com>
Date: Fri, 13 Mar 2026 12:25:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-4-3dc48fe772be@gmail.com>
 <20260308-nifty-honest-buzzard-ccde9b@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260308-nifty-honest-buzzard-ccde9b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34724-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,bootlin.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 5E06D27E665
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 08-03-2026 14:57, Krzysztof Kozlowski wrote:
> On Sat, Mar 07, 2026 at 09:16:21AM +0000, Charan Pedumuru wrote:
>> Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
>> Changes during conversion:
>> - Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
>>   they are required by existing in-tree DTS definitions.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++
> 
> Where is the actual conversion? You are supposed to remove other file
> for this to be a "convert".
> 
>>  1 file changed, 77 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
>> new file mode 100644
>> index 000000000000..6961cd5d5d89
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-udc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Atmel AT91 USB Device Controller (UDC)
>> +
>> +maintainers:
>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
>> +
>> +description:
>> +  The Atmel AT91 USB Device Controller provides USB gadget (device-mode)
>> +  functionality on AT91 SoCs. It requires a peripheral clock and an AHB
>> +  clock for operation and may optionally control VBUS power through a GPIO.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - atmel,at91rm9200-udc
>> +      - atmel,at91sam9260-udc
>> +      - atmel,at91sam9261-udc
>> +      - atmel,at91sam9263-udc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
> 
> Drop

Sure.

> 
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: pclk
>> +      - const: hclk
>> +
>> +  atmel,vbus-gpio:
>> +    description: GPIO used to enable or control VBUS power for the USB bus.
>> +    maxItems: 1
>> +
>> +  atmel,matrix:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the Atmel bus matrix controller.
>> +
>> +  atmel,pullup-gpio:
>> +    description:
>> +      GPIO controlling the USB D+ pull-up resistor used to signal device
>> +      connection to the host.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
> 
> additionalProperties

Okay.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.


