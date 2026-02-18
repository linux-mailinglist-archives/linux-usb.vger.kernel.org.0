Return-Path: <linux-usb+bounces-33434-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LnqJZZ1lWlCRwIAu9opvQ
	(envelope-from <linux-usb+bounces-33434-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 09:17:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 592E6153F07
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 09:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D7593028358
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 08:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D893191BB;
	Wed, 18 Feb 2026 08:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTx7qOme"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB48E30CDA4
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402633; cv=none; b=FuUcHFqVyKFxU4dUV62ESQChvKwrtDXka0/LrIFYfypXq9cOZteEF3cjezu7Mtt/zftT1IQTOg1ZXW1qrSvBFFcKl+JDpJzXrwKCigI6h5afHeK61ZPl79OBPq8DkRPeTPP6rs1JVFlPUrmuNytR91WZBAi5u8WFphbAFxm0rj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402633; c=relaxed/simple;
	bh=9moeBSWAnG3dtSIbdW4ZnD0x20PyiAy3DOWv8ETJgx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDIM31MPFEcImUtc70aj5aZLhrucr+k+GWVPNBe/dM3tcKGEBTRHeXP2IBcXN84cpT6eO24a4kCA8EsjRDDfAKXamfyV/nqaPvqz2DnOtaEwgp4buThgagsZQRKostdNXBlf3ZYoKz7msFnr2vl4rKhwyQcnFm4BWc2bHANpZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTx7qOme; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso6269355e87.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 00:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771402629; x=1772007429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5r0xdr1WGpCeGTUqLANRfTri1dCqx5zok5lpbzySRko=;
        b=nTx7qOmeum236BXFrq/lI95npYcbZdRkmrsYpw6z44rQeeD2T//+MtGlF4miv5w2A3
         973XqBQSOtxZaws0YxAmu+XEEJNfeGXkBlZFU5Z+lKYprZhMNfCc/i0gIofqZCTjnUn/
         vVKH4KurYSpHbro3gpWg8JEiIu6tPOrKkEyhgu0fVuyXnNMQTtY8kYWz6F7X002VpCx0
         VI0Gq1zYb0an31wBKti3j8ihdTIBaDKT6QjtbmQjIBr8z4GPRYyxbPS6qdw/kdbxdOWb
         Xmwf48ZWRjNGLbJS23hhX4iX20jPRH8xdAg3+1VlzLeqSvVxnb/78oDeP5vADrvsirma
         BKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402629; x=1772007429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5r0xdr1WGpCeGTUqLANRfTri1dCqx5zok5lpbzySRko=;
        b=vg2RFtoY0jTD8l0TJKB63ZKkzm4dZJFrXj+UiMyd94uj9PosJjua4eaUHQNU3RDPb7
         VAoknwbwiO+eYvwqsV3X+IhwsGgIPyQG83DxJOKtrHjs3wQ/YZmYSAAn8C4xgxgeGbWv
         kckfG0G7xJyjLqRTTdcbrkF//+652u2yqpxn/Hi18p9vgeE5ZtopiKjxUaN3WN5WCO+5
         EoOgEDFJiGs61WAp60L38htXXMO0sGlnCrQgx5oIT+/OpWzBqk2a5VHemi3+kRU9AfvT
         Fb9Xlu26kOcrmsS8lkHfZ2/InK/iBIHyetJX8HY7OixY0vk8VcKvjPvdgl6DOchZ/NGX
         QzhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkOdVmqvEdzrrgj7OdBOiPqZS4g7ffO3C6Ugqs1JXAXsFzXHksIZk8CZTLfC1DvZIPL7Nf19SVQzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCIILixZQpqqq7cFrcnWnUQT8+dWPGECVJg7JG6bdz79SmzyF
	+/c9i26s4TwqZ+P/Be8w/3rJxbZhohvr9Vi0xHv/SUn3CWDjA0TCwF1K
X-Gm-Gg: AZuq6aI6NVbhWnYR0drbD/N6qrIjcyH1d9XiWTHSQYB7mmuIg/kU4qJJb1jFx+T1m4O
	wsdhcYoPI9p1gAKY+h08KDvkKMsG+vDuKd2/JgFx3mXbyNrAwWj4Pt4TMnC0XwVf4KHyCI/GbJk
	DJpmWxMFyfWbN7f32oI0rItMw+vh5uajUo5zKCNfBtzDL7sFI3XCt4aRrhRqwq1LiuNEEXIzdGS
	OYDZplN/L3gGGp9Y1ciF1wQOBPaaKRIqpvruSI5wTXSMd4uqgTrgDN/JFYxk39kNbQoLfxbQ/ji
	VWzpW1px+jXhYTmm1LqyCi9koAOnSKgfyDeCOjI+JdjcnckArTVa5MAXsugE9AlwdGOsNvQM/xw
	JPdbmnWCiq0XKSvkqg3XzDX6jIzYCDpYdRqya2FkIZrorx76B3/rpsBmoEtmrAt1a4mueOvZs2J
	/L1LDVgwnRyl1w3zQQ3eOjQ1TnqwZ3f/8j50o4FatT6AaHPszPu8O9pfVw6XT7K3WdZL4Qg4sIg
	s+rAurJO0XHr/OvhSA=
X-Received: by 2002:a05:6512:1150:b0:59e:6c24:3f91 with SMTP id 2adb3069b0e04-59f83bbcd19mr369556e87.34.1771402628519;
        Wed, 18 Feb 2026 00:17:08 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56867fsm4391846e87.24.2026.02.18.00.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 00:17:07 -0800 (PST)
Message-ID: <66dab64b-ca3e-4ae0-81d6-0500899757e5@gmail.com>
Date: Wed, 18 Feb 2026 10:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
 <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
 <5d889f66-7697-4a39-beed-33ace693a1ef@gmail.com>
 <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33434-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 592E6153F07
X-Rspamd-Action: no action

On 18/02/2026 03:45, Amit Sunil Dhamne wrote:
> 
> On 2/16/26 5:58 AM, Matti Vaittinen wrote:
>> On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
>>> From: Amit Sunil Dhamne <amitsd@google.com>

// snip

>>> --- a/lib/linear_ranges.c
>>> +++ b/lib/linear_ranges.c
>>> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct 
>>> linear_range *r,
>>>   }
>>>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>>>   +/**
>>> + * linear_range_get_selector_high_array - return linear range 
>>> selector for value
>>> + * @r:        pointer to array of linear ranges where selector is 
>>> looked from
>>> + * @ranges:    amount of ranges to scan from array
>>> + * @val:    value for which the selector is searched
>>> + * @selector:    address where found selector value is updated
>>> + * @found:    flag to indicate that given value was in the range
>>> + *
>>> + * Scan array of ranges for selector for which range value matches 
>>> given
>>> + * input value. Value is matching if it is equal or higher than 
>>> given value
>>> + * If given value is found to be in a range scanning is stopped and 
>>> @found is
>>> + * set true. If a range with values greater than given value is found
>>> + * but the range min is being greater than given value, then the 
>>> range's
>>> + * lowest selector is updated to @selector and scanning is stopped.
>>
>> Is there a reason why the scanning is stopped here? What ensures that 
>> the rest of the ranges wouldn't contain a better match?
>>
>> The logic is now different from the 
>> linear_range_get_selector_low_array(), and I would like to understand 
>> why? It'd be nice if these APIs were 'symmetric' to avoid confusion. 
>> Hence, I would like to know rationale behind making them different.
> 
> 
> The rationale for this being asymmetric is to find the tightest upper 
> bound for `value` < minimum value across the linear range array.
> 
> To better illustrate this with an example. I have 2 entries in the 
> linear range array [ [4, 8], [11, 15] ]. Let's assume I pass a value of 
> "2".
> 
> Based on my current approach, the call to get_selector_high() would 
> successfully return with `found`=false and a selector value 
> corresponding to "4".
> 
> However, if I continued to search, I would end up the selector 
> corresponding to "11". A selector corresponding to "4" is much closer/ 
> tighter than "2".
> 
> For values higher than the highest value in any range, this would keep 
> iterating and end up returning an -EINVAL.
> 
> For in range values this would work as expected.
> 
> This implementation assumes that the linear ranges are provided in 
> sorted order, an assumption that I believe already underlies the 
> existing *_low_array() logic.

Ah. I think ... I didn't think. :)

It definitely makes sense to stop scanning if the range_min already was 
greater than the given target value. Thanks for the patience and for 
adding this missing piece :)

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

