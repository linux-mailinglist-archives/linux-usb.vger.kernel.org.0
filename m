Return-Path: <linux-usb+bounces-34748-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAXYCYYVtGlkgwAAu9opvQ
	(envelope-from <linux-usb+bounces-34748-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 14:47:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E82842FF
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 14:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10D9D30CE392
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AD33A381A;
	Fri, 13 Mar 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YftBR75F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483B39A042
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408553; cv=none; b=tSKJY4u6/qJwLpMDIp21CJF18CMJXDDdS1j+HYU4V0XmPEgiRIxGmzig9i8RzW3GwP4rIXNeLXONi/iAuGGON3HqZ19s5+BjzdKLAQhBDa7Nx63YMukfAyQaH34h1eo15pQf6HOgvyxgn1VHsN2pGhVh3kXM78RBtu6SSfedANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408553; c=relaxed/simple;
	bh=W+oJvqnLEifFCeBQyBdAn57oCqIxPD8AugBnx9rd9yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HemTNFRnoZfYFVTr0gk42a1rc7lJSPT7YxVj+oysimjHlG2Mz+heSqGrsJgEuY7OAgxcCA2HvX0+JWMhN31lmVRhX/YwlyEwVvuOI2CUJbMxgGT7uUPV1cvGlETVF/4jX4aj9A2Zu5ifwA0NWHQjmqh7UMXVOiFQfxHQ0k5os0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YftBR75F; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829afe24fb5so1729111b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 06:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408551; x=1774013351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajhis7YBLb7dOjMFcfePYTC4MgS14P3pGiFFUMVogos=;
        b=YftBR75Fqt3T0F/NQXaI/IJYCR9xFhyr8CzrH2QL43E6Pqd5JcTCWgFBgJL64ONYTS
         /AqbsgRdfPrhAep0s9QOj0Ksdx+lRDovROXj1HEWmV19FmZBCj86qVwhlJ1DaAXlWvvP
         YV6FZeSi80gqtL1RiB83Wj4U4jUGpSoF/RV6WRN51GKCh7QZjTP91P7aKWHArBzpPaBE
         WzxGp6L5nnj1y6XgoPGSzSCzImDERRJLoGpsQKxjV5y+iBI4Hj8/AbALRR0yfrZuprRV
         w064v8Jt7NSmWxGHG6FZ13VhsQXMT11KsUGC+zkcRnHAh5d8S2i7k0wvKKaKw3hbwqp2
         b2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408551; x=1774013351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajhis7YBLb7dOjMFcfePYTC4MgS14P3pGiFFUMVogos=;
        b=Dcn8eXMFKZknJLO2jEBUkTxeXhT2sifbKjGblrF1Z6Hic8tW1SyRaSXfhXvFMV9iD6
         n+pVhtr1XFsN93xIlN4iw55pKfv5/CX0byp9DcU13NEMOr+CG7UgpF87zlL/t21UlVFT
         j329va1SwA+Eec1Wv6fhNZ4jgjT9/iA/fzoM/dP/9x6W3AGuMyL1RCXQJjVritfzRsD8
         Tt7QtNOjGPuiwHkZoe7wYkdLso2fH0NWBeh79MfYmffwJXWQA8IUA32COoP/k4YxmtVY
         uxoLUlY9dU9sf/IZyTkIFljVJ9y3EQnq5kIKYrhhTALjEh0dKIiBA78lbJZuz9E6ZNRp
         I2QA==
X-Forwarded-Encrypted: i=1; AJvYcCWP00SLEcnRuT4O+SK8iSxCm7TZdr01pgt/9D1LFGeY7bOfvwZ6fBwOKw2u3UdQzrJJiqZzA0h550Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVtdsKRoKSrpelGbD/+NVvyijqxOtTvHQsKXR/A4uJGt23Lqt
	d3Pnob6qAuJZ+ZDnXJhUznlCyR/K5kL5lBlDndujDwkSdtAnJGDyXCl5
X-Gm-Gg: ATEYQzxTFbZnC++wLWHfx7WBs1hWQhj/+l3tOhOfgi1vUmeWjxZlhXNDZtrk+K25X4v
	X8KGqXZ2g39Q0dPMm3eVIzis3qkx0rFuUlYLQved8Z+ZdzkTRecB+egd9fOhsZREif5EYW1Q164
	6Zckua5sk4yJ1T8E8o1zG/v3dU+7HJPxIVaXzhoMU2dBy1Qp/pyiXIbc/KHSgMIKu/tsffTxJEq
	QtFkgwxsSVQo9yHsfmlTejFtNPsFtzEnd/T2DnGBSyffoPD72wRs33bJF8apj1Iq72TaaxImByj
	umXcUykKGay1bWKOnRIVJzfH3v4osFHzAlXAutPcFVLAppZzJ117h1e+//bCsK4nELnTx/TEB3U
	bpBqraQVs0YSRgazvKBvgsDq/GG+3PuRxZuEeRgK/0zD+0kBe99rRnnPndko1UD3DA+cS+slhqT
	Qq8LYiWUWAyde1amQqzlK2vrRzu5NbxPSJF6oHvC0jHxPtwX0STjb5nJk=
X-Received: by 2002:a05:6a00:94e3:b0:81f:9b09:ad02 with SMTP id d2e1a72fcca58-82a196f589emr3056858b3a.1.1773408550556;
        Fri, 13 Mar 2026 06:29:10 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0738bca8sm5870880b3a.60.2026.03.13.06.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 06:29:10 -0700 (PDT)
Message-ID: <db8639c3-c7b1-446f-b178-d1e47fae776d@gmail.com>
Date: Fri, 13 Mar 2026 18:59:03 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] dt-bindings: usb: atmel,at91sam9rl-udc: convert to
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
 <20260307-atmel-usb-v3-5-3dc48fe772be@gmail.com>
 <20260308-cherubic-misty-cricket-80fad0@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260308-cherubic-misty-cricket-80fad0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34748-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fff78000:email]
X-Rspamd-Queue-Id: 364E82842FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 08-03-2026 14:59, Krzysztof Kozlowski wrote:
> On Sat, Mar 07, 2026 at 09:16:22AM +0000, Charan Pedumuru wrote:
>> +
>> +  reg:
>> +    maxItems: 2
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
>> +    minItems: 2
>> +    maxItems: 2
>> +    items:
>> +      enum: [pclk, hclk]
> 
> No, list the items instead. Why is this flexible? Nothing in commit msg
> explains that.

Some of the DTS files use those clock-names in different order, I will write this in the commit message.

> 
>> +
>> +  atmel,vbus-gpio:
>> +    description: GPIO used to detect the presence of VBUS, indicating that
>> +      the USB cable is connected.
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
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/clock/at91.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    gadget@fff78000 {
>> +        compatible = "atmel,at91sam9g45-udc";
>> +        reg = <0x00600000 0x80000
>> +               0xfff78000 0x400>;
>> +        interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
>> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
>> +        clock-names = "pclk", "hclk";
>> +        atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
>> deleted file mode 100644
>> index 12183ef47ee4..000000000000
>> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
>> +++ /dev/null
>> @@ -1,125 +0,0 @@
>> -Atmel SOC USB controllers
>> -
>> -OHCI
>> -
>> -Required properties:
>> - - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
> 
> Why do you remove OHCI here? There is no conversion of this compatible.
> Don't combine multiple different changes in one commit.

I will remove each binding from the text file for each patch while converting them.

> 
> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.


