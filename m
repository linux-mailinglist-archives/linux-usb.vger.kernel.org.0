Return-Path: <linux-usb+bounces-34722-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HHOJ7Ovs2lYZwAAu9opvQ
	(envelope-from <linux-usb+bounces-34722-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:33:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33527E2C8
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4FE53019833
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 06:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC098346A1E;
	Fri, 13 Mar 2026 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaRdAl2v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE34271468
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773383509; cv=none; b=mkICoPYKOs4siru1zWNP9uStPKsH2U6xwLF3IcSCsc3Q2b88iwOyBQe9f64FupFsHOYAZto0CgoO6m2Xw3D2P7DZPF1x86+gZAAUDwVq0PVwjJQoltgpR8GjbEtlp9ntNRJH9PCHPwFk2upFDoe9TB5SRNTc+tp6/xkf+H4zvUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773383509; c=relaxed/simple;
	bh=yC186mT1odJBeJSMepQAkYwRWPnxTp/vnor14K9Iqsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkoTdMOhm+XeHsBA4yidbimvEXIOsOnBqfsXr8WWNOWpDSaMQeKfkr2E45BoUKvKJ6Ac3dxh4vfT+jqTW3Fn0W1MbcXqNMKDVkz2UYwbxfJbLLx3qCnGwpOIuavz5LomQGP7XHj04C2GPIiCSxfHPYo4lPPWwBq1FJbyb3L8mEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaRdAl2v; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aea68839a5so14423785ad.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 23:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773383506; x=1773988306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5B5bkjfvouv3vKy7xOZhVi00OXVaTar+WdRxVUnQ5gA=;
        b=CaRdAl2vlzUJ8M1NUwVDzjMewwH+S0/5xoSjv4B7wuUaFHmNjFsW0+RGUAmkrSSBCa
         yZpMUxPsM8U9wzjSg9QJoEjaxFnU/0VwbDq5rgTCG15t2xHd+aejugEBQZiLergztUoF
         9eYj+1NdosHkZioluuipzVZiSkJDGLu7gLGT8PfOQ1dUbRbafiHcUm4UA4xwa5dNerlQ
         ypAYlmTFx4HJ2PG/31J/AXM6f9RfwN6gn/hliMwVdfZNTkeCHsDJAjPKX/d5jGW6Hr/z
         8PxcWJUASDkT/uINdI78ZUxOuBe4uLUOpuXJLvy/hqE0/+8WuNrDUggKHa4zgCb/BfNO
         d5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383506; x=1773988306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5B5bkjfvouv3vKy7xOZhVi00OXVaTar+WdRxVUnQ5gA=;
        b=dDoXfJjLu45crPCrv+Nb0V/XQ4v+SISgpDZPYtLCcb31fF22mWmsSSaPbfH/pT9rkV
         6cvx/udnW292KWVsvmxx+Rl5A/biXZtdcFdSmL49kjCNyBPRytWtMr3s3akIBVkiIRok
         nwbA9ojm0raoOQBia7AImnH7WzED4rY581mBIAOgtZ0FkDKQnOQUhtT+IC5pvnZN/Vdj
         LT5+4mNAUEOF4WpBkxdyYAYt93jYV2WJHeA3q2pugujkoTGD3XRVHEsXmCwJiQvQvgbD
         AlIvdHtWflx4bLZdBfKRp6OZDnBriivLEUFwcmcFNocIKRW+/JrMh9BDcfzPBEb2rmim
         3FJg==
X-Forwarded-Encrypted: i=1; AJvYcCUlIdHISLa638yX4Ixk2VjOB8SZAjSQFaV6kf5zXTdS1gQQhwbtzhltgSYxSsg2Q94TESKnZMC8Gs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKPvtsIJC9PuNjJgcbLN6BcPfgmAG1/2cmb/P1bC2xQsNP5aoY
	Izpv+D165Q3XZVvvfD00btFawmlVvG1vL4IAm/92hFGufIIqAFEKY+8c
X-Gm-Gg: ATEYQzwM4jDW4fr8wQ53WW+tOdd2O0GsMjXtRtDStKsM/DSY7GiI+LpVxSGRbVL6VYz
	M89oJbFkIhj3gYoMDFNtqpK9qLtjz8R7W1lDdx94BXquJ8U91767NPxoRq8Ir9v5kH1nQJKXdkM
	hQj+QUpqWjuNGTneNazDRt/d7Kyn+MS/AZuMbPR64oQcUhYo16gr6aKnMR3Qs1xb+ZEAs3YCh1L
	7lU1REKaT7/wpqPrq6R/WXJep2jtAHG47UEikyY0Xggh+ziiuGj6VZ8hLCBcLDaxwbI8bqLmDXI
	PjrQfTijZU/CWJBwLUf0PHSuff/n1NT9HmmvEPjdjuX+q1OifWNonN7Ywq/aoLqg43exkxYNopn
	FV2OhQ5P0K72USwdK5ve9AZBcsLP99gYQQlnwk2nqMOvWLiS12V1JKUI2YSmeRcIp7i7T4EXMqF
	nGgDRPL6sA0WvLyyuTfdtBKouPO1YXPFDIQFBiFv05vnqF
X-Received: by 2002:a17:903:186:b0:2ae:47b0:dc80 with SMTP id d9443c01a7336-2aeba48f0eamr57727825ad.11.1773383506399;
        Thu, 12 Mar 2026 23:31:46 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8453cdsm10353455ad.84.2026.03.12.23.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:31:45 -0700 (PDT)
Message-ID: <2178f79e-65da-4e97-aeaf-21da0af95dca@gmail.com>
Date: Fri, 13 Mar 2026 12:01:40 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
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
 <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
 <20260308-camouflaged-sage-warthog-fdbb7d@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260308-camouflaged-sage-warthog-fdbb7d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34722-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C33527E2C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 08-03-2026 14:53, Krzysztof Kozlowski wrote:
> On Sat, Mar 07, 2026 at 09:16:19AM +0000, Charan Pedumuru wrote:
>> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
>> to the generic OHCI schema.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../devicetree/bindings/usb/generic-ohci.yaml      | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> index 961cbf85eeb5..a8a94b9c1fee 100644
>> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> @@ -55,6 +55,7 @@ properties:
>>            - ti,ohci-omap3
>>        - items:
>>            - enum:
>> +              - atmel,at91rm9200-ohci
>>                - cavium,octeon-6335-ohci
>>                - nintendo,hollywood-usb-ohci
>>                - nxp,ohci-nxp
>> @@ -137,6 +138,16 @@ properties:
>>        The associated ISP1301 device. Necessary for the UDC controller for
>>        connecting to the USB physical layer.
>>  
>> +  atmel,vbus-gpio:
> 
> gpio is deprecated. All bindings use gpios. Also, pins do not use vendor
> prefixes.

It was already defined in the existing device tree and the same was defined in the text binding, I will remove these particular bindings from text file for each patch.

> 
> 
>> +    description: GPIO used to control or sense the USB VBUS power.
>> +    minItems: 1
>> +    maxItems: 3
> 
> Why is this flexible? There is only one VBUS, no? Which pin is it
> exactly on this device?

VBUS has 3 pins and will write the exact pin in the description.

> 
>> +
>> +  atmel,oc-gpio:
>> +    description: GPIO used to signal USB overcurrent condition.
>> +    minItems: 1
>> +    maxItems: 3
> 
> Same question here - how is the pin called in the schematics?

Okay.

> 
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -144,6 +155,28 @@ required:
>>  
>>  allOf:
>>    - $ref: usb-hcd.yaml
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: atmel,at91rm9200-ohci
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: ohci_clk
>> +            - const: hclk
>> +            - const: uhpck
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
> 
> There is already if:then:else covering clocks, so this makes multiple
> clauses being applied to same device. That's not really readable.
> Unfortunately that's a bit of a mess from existing binding. This can be
> solved by moving this to separate schema, especially that you want to
> add some specific properties to this device.
> 
>> +
>> +    else:
>> +      properties:
>> +        atmel,vbus-gpio: false
>> +        atmel,oc-gpio: false
>> +
>>    - if:
>>        not:
>>          properties:
>>
>> -- 
>> 2.53.0
>>

-- 
Best Regards,
Charan.


