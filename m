Return-Path: <linux-usb+bounces-34169-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIYoCpLNq2lDhAEAu9opvQ
	(envelope-from <linux-usb+bounces-34169-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 08:02:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D122A8A9
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 08:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 815723037150
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 07:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD1521ADC7;
	Sat,  7 Mar 2026 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9yhUIpv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F6E25E469
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772866930; cv=none; b=j2grRkW9wjxRzAht9BkdFtxdyUf2rLW5QksNc7xIyINBtZ1+t6Wr6dHt1ZMsDjtiy2+2eikD5rxerb1OzyF4RAmpBx4iipU+iRaXELHZn4/Vt6oNCHSWOkpDUsTwYJt0vqwAmtAHMHRNdN5QI5ydDkaQSZm2D+fb0EmmPPzq8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772866930; c=relaxed/simple;
	bh=I4aG21w8NYsExrZfV6YkqZnUHz24ePl/PsRMgEGabIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEaW8d5QdOSdYm3RVzHH5XSs2laGalWjsNG+A7FOTS6kyazbA7Rh0CGDngBBWYKfNIZSXBopjDm79upwIczAWQcU0oRWMdIbVhKF9VlcCjDXSReQ7cutk1Q4sSpuFcXiSX7TywTW9M0NVK+vjUHPlDZXbrPI37bY0KobUOWJU64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9yhUIpv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae41544dcfso77787565ad.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2026 23:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772866928; x=1773471728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kh2DkldBCZcuhkrQEQ5HtmK6HQyMLyLxXOGQNeopz2M=;
        b=P9yhUIpvV7niV2EReNKsow7fEtWnmYoj5IPC++W4TpoxkLZwifpbQw5uT4Kfsgw/lI
         9jjJ8sp0STLo5qUVY2pbkvvHU7TERb63bN9dSoaeyp6aroUM7HFo7eaZLatNGikxXrvY
         sCLLIzthWQAN2RafqyFKLdwXW+5ChWoA0majKXkeI1tqt0Isk083Imf0zDG7pX6O0jSK
         jGsg2wmOD54OIOYBPO9Vs7yh3Ou7jO7r+wpgm+mwU1CcVpmPnf/bZDzD+inGCrcuaDvP
         37X1IWHwQbsPpOtJWCLyssKWjypX7tRA4qSpctKpBAhL3OD0/dBdyhxita8xc20LPaDZ
         DqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772866928; x=1773471728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh2DkldBCZcuhkrQEQ5HtmK6HQyMLyLxXOGQNeopz2M=;
        b=n6s92cbFBEhJ1N7AH1DlymTKhqdL7n/BC2twnf+Ri7MNi60GAV5HAMbEAWszXBbYZj
         KDx1p2U92imX7/Q8RBprIrzvldhCM1BPbmI8DbUnEIs9hCADjWMDLlCvIV8yaeTWDReq
         XIhwE0bO5hqhFDFB43pcJBoRI2jyKJXNMNsrD6XV1XlekA0dU82evmJDpKmS+zpYVKaf
         qNMvZG9TRRdrWepkoFWZVGCNA0nwG4zj66KAJACnsBKNVnrskAFkaDILrdw4unQBXa4Z
         0XUh+RcfPhXK9bvVJMIgLy3LoM1p4iWCLybNcSXGshHyAe52Wg1PP6uuJUko7qmzbfOe
         osig==
X-Forwarded-Encrypted: i=1; AJvYcCV+LIAoz6ZXDkzTTTrswewbxF44XI0qohQeZCzpdiVK+bWCFV4JfaJrcAuYdRHKFeksBIh2sGCesBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJg2VtMhbmG4JxMGKj2nktQYqf8uKPlRX2RmriysojZ3CbbYCt
	RsyHtTD2RbAjJcVRb1bR2omU9LVBcYsqkYRPWo5i0JTWZg21abGIN+Gj
X-Gm-Gg: ATEYQzwhJJONBnXGi75odiuzeSvXE76d0KEF6E6LX3w9aN/C+BtgTm5IKO5xOvibbML
	jncjssx6p7z50Nn1N8U+Hs8EEDHpZnHdsPR/Z2JKo5QbfkDuxNbXE3W32fAffqc4Hbx8gCDzCWD
	71hbSHOb89leC/7IA4CSlUBndgtS5vnOpL8OzdIbjGrxh9+wlFo3IR1eThPqMndyaVEc8qVKJVM
	l7uKuz6IZ3fwjt9QmNHeVscEA+DhDjst/WNEuqTpW+24os+3hgNfzHrY7yCfh4xSnCrMnYJSuxT
	kQEaUUEA38j/K+0t3WZXsyq1Q1s/cFBtGDM5YpX06HaCTUMhdaUvBtf+A1Ama18lokrpDVaJPqj
	o7wIg+hfWmn3LMqtx3fWkD1Atk59u1y0Iec0woweq/TWcqHsvZaiN48jHC3z3tFiepIrCynG93k
	3w8OKl7UJ2xwcfUUjnCPe4OsQkSrLouEbPWGorv4UEZHye
X-Received: by 2002:a17:902:d2d0:b0:2a9:451d:a69 with SMTP id d9443c01a7336-2ae823677famr45582915ad.10.1772866928475;
        Fri, 06 Mar 2026 23:02:08 -0800 (PST)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm54633905ad.92.2026.03.06.23.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 23:02:07 -0800 (PST)
Message-ID: <2ba9bca7-e71c-4371-89f0-15295781b147@gmail.com>
Date: Sat, 7 Mar 2026 12:32:00 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
 <20260306004533.GA870954-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260306004533.GA870954-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7A9D122A8A9
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
	TAGGED_FROM(0.00)[bounces-34169-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 06-03-2026 06:15, Rob Herring wrote:
> On Tue, Feb 24, 2026 at 01:12:58PM +0000, Charan Pedumuru wrote:
>> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
>> to the generic OHCI schema.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../devicetree/bindings/usb/generic-ohci.yaml      | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> index 961cbf85eeb5..ab8a49142386 100644
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
>> +    description: GPIO used to control or sense the USB VBUS power.
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  atmel,oc-gpio:
>> +    description: GPIO used to signal USB overcurrent condition.
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -144,6 +155,22 @@ required:
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
>        else:
>          properties:
>            atmel,vbus-gpio: false
>            atmel,oc-gpio: false

Sure, I will add it.

> 
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


