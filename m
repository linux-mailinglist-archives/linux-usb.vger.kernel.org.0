Return-Path: <linux-usb+bounces-34723-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPpJJF2zs2lYZwAAu9opvQ
	(envelope-from <linux-usb+bounces-34723-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:49:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAD527E510
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15153305888C
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 06:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0A7315D5D;
	Fri, 13 Mar 2026 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpayoPPO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95D32D0F5
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773383702; cv=none; b=Pmse+j0fPfGofoASQvem4+0i4l63GtHNCmVQ+YIP8cNopwcoIlDW+wl1q+c2+pks6ZBb88BQB/pZFYuQVXdRHf+UpCkkaaftz1o1LV5OYZeWW13MnQX60H6Hs57BavmeSmCRrpwQw4cw83OUbVo1OqC9KLQ43b6YM11I7spo/tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773383702; c=relaxed/simple;
	bh=2va6sdFJPKAQtWF5TqnT8UQlob2M5LdSHIMSGn7Lebs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LG3oXzGs26QKTTdqwgHHsrXGYAzdn6CghA7ckoVR/zbWzP74w1F9CFFOIvWVG9WQHjT33kvCSj2EiP1s1Tda3GMYxOrtx/+eivFZHh0anq/6qnlJ2BQ+bAkkSayt4LgwSPrZpk7yYUUuKmQ+20AC+0I8GkqCDDnk84rv9XU0N/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpayoPPO; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a18b65515so1034102a91.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773383697; x=1773988497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/jr7J8T+jhR53vKzR5OkWAl9M6wmaMQ89KXNhbZ4Ss=;
        b=lpayoPPOOx738SrNj+BPEAgr+tiK/8+9oMqvPyM3dygMMrZr6f8ny/Crc87s2VDraY
         C3S76x3E3GgSGUjyWBTX7unRH3zMegOhb2a1SrLFRedahaL/tx2JWV8AD+CapjsjQLbK
         m1je4BTxsSB5w092HCgg6hFla9b09NFsGEs6WjdEVcIZD+SN5AjwDboSM5Uze7KgM2W5
         2Jr+0Y0tPUi5tGJHu/QchSOp4eo4GKzSuO6M9wLI51krbrJfS1pFCN/JANV8jolYWKDC
         z49tMhrKS/1WJlfgqPnkHZinx0HdKaSbxyWrQvKALPDW6is4YCJkbJ7NYDSQ4+3P5iqD
         V0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383697; x=1773988497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/jr7J8T+jhR53vKzR5OkWAl9M6wmaMQ89KXNhbZ4Ss=;
        b=hNjD2DflwMCT8geU4kxWK7fkyAi8GBoqr3pc7IJ8fyWpXwJT3xszUotdy3JodlP7bE
         nhMnjvVjmvXKVmKdV/r9cU1x4tKhYwb8IsFoaqHo+SUYBuWV6hM0IsXYniU7Gon0KSE7
         rVXL0dRFG9dy8BkSA4z2r+SKMR5bYPI1urYMx/ARODovI2gEqoUcV+jzfRbO39tzzuh6
         6AdN7RL23NoSAkS5WlfuBF271qFxB27a6qBZR56aHb0geRMdU49+MSeqTYpd7YUnJAJv
         vRdge9fjE1RrOXlUsCkeF75sNmbt3GD/gnBLP0eDPILTMVkYEWH3jU48Lop/QHuF5Wkv
         QQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIL7oPH1/7aIbVi4ea4VQZlcgeNpd0f1M3JcC6yBBVOjGtIp58Rxva336cvZkWc89mm/EtZaOwWR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwEZEPw02IYa0Z+zZDUGr3r1+xoyDWEGsxX1SjZVttyRGCpcZn
	QmIfo5CKg8Vc5pR7OjZxFL/gxZ0Zn0GAbvYOQIM4UgsXRfXBNrnZwK8lQMhKLA==
X-Gm-Gg: ATEYQzxHyrgH8zhgJiyaVGMV3+QB93LbPXzVhOhm4kWKh9hJGI0s5whBcQ36633235z
	0MbpPp67COEuqzhgXLW8LV+5XHqtOFtIATkDEjA5tundnzBy5KGb8/rbFGrhring+zxa3I05mD3
	kRVKaDU+VHpkOpmt6BMDRbnJuZ0//uGdrjRB8XyZEEBUQjgBvdmQSRNjVF+m3ngGgszfShuydhw
	Yzr1XSHzGEMvVhQiP8dXksnKdPo96eA9UxLyXAp/6MzXRj9eUcLH3qF2vzDvL6u57/53lk96iGd
	nEx1gYhBnXR+XH+lZbkEE10d0v0oIVaYGJTW11ecpybIkxMAPCf/D6B/veF1qFaw5genma2iwPk
	EoQO/LT5YTMJsIPTqlAnNdQyQiCwVrb438Bqswo4H564Rv4Lvs9CiJgH/36VHi9BOdW7+lgQtjH
	5vt7unDV5T8KC9VkbwzKfcNUZQNV4Tuv/T4js9/G0Ou9OwBsFuMb7rYpU=
X-Received: by 2002:a17:90b:5185:b0:359:8ed3:8a65 with SMTP id 98e67ed59e1d1-35a22113798mr1985658a91.34.1773383697493;
        Thu, 12 Mar 2026 23:34:57 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a07f0a365sm6999155a91.13.2026.03.12.23.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:34:57 -0700 (PDT)
Message-ID: <648da83c-79c5-4936-939d-690e7af1f95e@gmail.com>
Date: Fri, 13 Mar 2026 12:04:52 +0530
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
 <1d49a4f4-8694-470f-82e2-6021772fc821@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <1d49a4f4-8694-470f-82e2-6021772fc821@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34723-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 8DAD527E510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 08-03-2026 14:58, Krzysztof Kozlowski wrote:
> On 08/03/2026 10:23, Krzysztof Kozlowski wrote:
>> On Sat, Mar 07, 2026 at 09:16:19AM +0000, Charan Pedumuru wrote:
>>> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
>>> to the generic OHCI schema.
>>>
>>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> 
> Also:
> 
> A nit, subject: drop second/last, redundant "binding support". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> And you cannot add support for bindings. The DT schema or some kernel
> Makefile gave that support, not this file.

Okay, I will change that.

> 
> 
>>> ---
>>>  .../devicetree/bindings/usb/generic-ohci.yaml      | 33 ++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> index 961cbf85eeb5..a8a94b9c1fee 100644
>>> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> @@ -55,6 +55,7 @@ properties:
>>>            - ti,ohci-omap3
>>>        - items:
>>>            - enum:
>>> +              - atmel,at91rm9200-ohci
>>>                - cavium,octeon-6335-ohci
>>>                - nintendo,hollywood-usb-ohci
>>>                - nxp,ohci-nxp
>>> @@ -137,6 +138,16 @@ properties:
>>>        The associated ISP1301 device. Necessary for the UDC controller for
>>>        connecting to the USB physical layer.
>>>  
>>> +  atmel,vbus-gpio:
>>
>> gpio is deprecated. All bindings use gpios. Also, pins do not use vendor
>> prefixes.
>>
>>
>>> +    description: GPIO used to control or sense the USB VBUS power.
>>> +    minItems: 1
>>> +    maxItems: 3
>>
>> Why is this flexible? There is only one VBUS, no? Which pin is it
>> exactly on this device?
>>
>>> +
>>> +  atmel,oc-gpio:
>>> +    description: GPIO used to signal USB overcurrent condition.
>>> +    minItems: 1
>>> +    maxItems: 3
>>
>> Same question here - how is the pin called in the schematics?
>>
>>> +
>>>  required:
>>>    - compatible
>>>    - reg
>>> @@ -144,6 +155,28 @@ required:
>>>  
>>>  allOf:
>>>    - $ref: usb-hcd.yaml
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: atmel,at91rm9200-ohci
>>> +    then:
>>> +      properties:
>>> +        clock-names:
>>> +          items:
>>> +            - const: ohci_clk
>>> +            - const: hclk
>>> +            - const: uhpck
>>> +
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>>
>> There is already if:then:else covering clocks, so this makes multiple
>> clauses being applied to same device. That's not really readable.
>> Unfortunately that's a bit of a mess from existing binding. This can be
>> solved by moving this to separate schema, especially that you want to
>> add some specific properties to this device.
> 
> I guess Rob was fine with this, so let's keep it in this file.

Yes, it should be defined here as the fallback compatible is already defined in this existing YAML.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Charan.


