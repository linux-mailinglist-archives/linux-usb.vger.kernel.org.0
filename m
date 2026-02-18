Return-Path: <linux-usb+bounces-33442-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CXeOZYblmkuaQIAu9opvQ
	(envelope-from <linux-usb+bounces-33442-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:05:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1D159535
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC3AC301DDA0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 20:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DBC34678C;
	Wed, 18 Feb 2026 20:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dRPrj7he"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7802F261C
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 20:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771445138; cv=none; b=JHQYUP24WJl+oboZ8Zo318ol+NUNBApAREAFF8oN5G0LbD2GoGYQlfcB+a6A/V6ylc8cvLuYqfFgK2sPCT5vai9kl40Ko8w30ZAqPU9b71C0lS3h9nBncZ7EJhLi7TzwSvNxwzVCY4PPAUpSd9OWoecDncakb5ur9dvW6MciU3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771445138; c=relaxed/simple;
	bh=Eb8WztYruLPtpbjUq44P2hChG8R4NOCFEJN+uEHJMMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=es+fC7hut2YKzaUITiUDmOy4YrjoKIBHAkmONYpIZ+ih2g9Ap5NVinV9Uw9PFiOBAqWwDhJSwyFTBoYyWSjSHDeCno7Is1WeuyL2Z8oBormAiRniRmAer/VibOX44PtWw5XgzNNCU0c5c1v7jtlucKnJKXX5hh6k6OYtEf1jyr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dRPrj7he; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b86671f87eso356360eec.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771445136; x=1772049936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruwMDgtbpwkbLzJMSDs2l3vNnZLc2ZiEeFBqv+MGVhg=;
        b=dRPrj7heC/vfUsmGojrAEh7xjifEi2K+5ikryz/EC9J7P9XlzGI3qouVczByYM1bGd
         yTSj+o7bCuk6WcccyIG3fu+Qvr8BYPYzEY/rp2tc9+LtVIELy3ewyj5gLQqx/ttugou2
         0kkowdferefjOvocOP+WvlEyCgQ7ThxJ6i/Oo7fBIJ8Kk3CEGvEeNe+x3TBwi5rl8XnR
         Ulepf87PwFOUUQTO3AB/y0T87WU81BSx+ioby/YFLsiSmLZE3n6NlzPUauHKHAnbKZSG
         RaKVr/l+aLWp/KiH4qiVdYH4EEZoqfLlmIZITWaC5hzCNUgWKyQZTPwjPzUU5gOJc6NV
         4hVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771445136; x=1772049936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruwMDgtbpwkbLzJMSDs2l3vNnZLc2ZiEeFBqv+MGVhg=;
        b=bJVGwKFJntgjkYMwwFKoWxnr0m95qDfA0Aq5f4yBdjzy7N4jGwE1/DITN9duji1kvl
         fsnx5FkQJmQUSqFPePYMFg/tFV2uB9ejXNTSQ7A/m4KaigdPa/GCSeTbu76AGMAgOJ8y
         igJxbF5Dbq0jF6TpL9b8egAKpuw6JwAcqgpIwL5WDUwGcOrdhGax1mIR9+wxMDQRU6c/
         DfWxSkLXa6eFzRfVL3i1ZqoFXHbyx+eBXRUMj4wptRCSieQFz0GvMt0P8nEOLVO/Vypt
         lZ6nT/W0jIbjdn4yCLMz3uBJjrA7eFQBFLJMORGDvl31ih2Wtv3SxYCd9aFld2jxKV2z
         1/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+i8+GddDOU7FsvK10kER3xgDpF5N4ZVs5S2lhJlvnsAMOI53nxboc2zjE/zGGTelkWBaWXY/ooaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqEzrrUnMpQ5Y+qJuyWAj/eJKGrLEm7ev+3PIrdaKzf24dqg/X
	286sE3n7LvG0H/YZt+8yAV3FMw5Ah7rQRAraVnvThGx+kHvzjHPLeb8I5n0ZzXJJtw==
X-Gm-Gg: AZuq6aJpOM/PfgP4LCzz9X19tv/8ZJikXHS3cAeNB+WM7Rwzqn8dGsWrU1FZLKnFpOz
	VS2V2WabhTTtYVjSfhfR25a+V62Xs2YWvfv73LyLLXcrPcwYlS36PMr3EBnYNIRIzOd1CUrdsn5
	P+bJIa5CX+tJHQDW9PV8QK5jZhtyEiTufvCVbQvDD/ySHDzWhzTw2qZi/YVDfZ04WQCFEJYvn8o
	k9mCXB5qD91c3xBGki4mEStUiMiF586hZfZwgVj1TWRy4/4yuVThHcF3huY3olwWN7psJCwf7Bn
	43rFv2ya0MRGHlTlrSPV++CSoVaeuwix0dc1CmPyHKzlasA6l89KrIDhdwybpsxTQW5ubtv2J36
	rU90w+XDqpsx4lda03qMmAHwrBVFY0/9h4ZoOubw1VslvvTEU0koMMu+eTPX+tAYOkBj8H7T6ie
	S0FjwzzMNNAFB1yPCFtySljdExr3w1SWQ7ttQ1Hk1AQ8KwzKvMQI2r3IUt0iIev+/yzSS01aq+c
	e4wcX1Eq7YTuW6zc/GJwOUO+A==
X-Received: by 2002:a05:7301:100e:b0:2ba:a04a:8353 with SMTP id 5a478bee46e88-2babc44eb66mr9413193eec.27.1771445135121;
        Wed, 18 Feb 2026 12:05:35 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c8f1:53bf:725c:563b? ([2a00:79e0:2e7c:8:c8f1:53bf:725c:563b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543e8dsm19410069eec.5.2026.02.18.12.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 12:05:34 -0800 (PST)
Message-ID: <e9a353aa-1194-4c87-b902-c533e52c264e@google.com>
Date: Wed, 18 Feb 2026 12:05:32 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
 <66dab64b-ca3e-4ae0-81d6-0500899757e5@gmail.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <66dab64b-ca3e-4ae0-81d6-0500899757e5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33442-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linuxfoundation.org,google.com,linux.intel.com,samsung.com,linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ACC1D159535
X-Rspamd-Action: no action


On 2/18/26 12:17 AM, Matti Vaittinen wrote:
> On 18/02/2026 03:45, Amit Sunil Dhamne wrote:
>>
>> On 2/16/26 5:58 AM, Matti Vaittinen wrote:
>>> On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>
> // snip
>
>>>> --- a/lib/linear_ranges.c
>>>> +++ b/lib/linear_ranges.c
>>>> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const 
>>>> struct linear_range *r,
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>>>>   +/**
>>>> + * linear_range_get_selector_high_array - return linear range 
>>>> selector for value
>>>> + * @r:        pointer to array of linear ranges where selector is 
>>>> looked from
>>>> + * @ranges:    amount of ranges to scan from array
>>>> + * @val:    value for which the selector is searched
>>>> + * @selector:    address where found selector value is updated
>>>> + * @found:    flag to indicate that given value was in the range
>>>> + *
>>>> + * Scan array of ranges for selector for which range value matches 
>>>> given
>>>> + * input value. Value is matching if it is equal or higher than 
>>>> given value
>>>> + * If given value is found to be in a range scanning is stopped 
>>>> and @found is
>>>> + * set true. If a range with values greater than given value is found
>>>> + * but the range min is being greater than given value, then the 
>>>> range's
>>>> + * lowest selector is updated to @selector and scanning is stopped.
>>>
>>> Is there a reason why the scanning is stopped here? What ensures 
>>> that the rest of the ranges wouldn't contain a better match?
>>>
>>> The logic is now different from the 
>>> linear_range_get_selector_low_array(), and I would like to 
>>> understand why? It'd be nice if these APIs were 'symmetric' to avoid 
>>> confusion. Hence, I would like to know rationale behind making them 
>>> different.
>>
>>
>> The rationale for this being asymmetric is to find the tightest upper 
>> bound for `value` < minimum value across the linear range array.
>>
>> To better illustrate this with an example. I have 2 entries in the 
>> linear range array [ [4, 8], [11, 15] ]. Let's assume I pass a value 
>> of "2".
>>
>> Based on my current approach, the call to get_selector_high() would 
>> successfully return with `found`=false and a selector value 
>> corresponding to "4".
>>
>> However, if I continued to search, I would end up the selector 
>> corresponding to "11". A selector corresponding to "4" is much 
>> closer/ tighter than "2".
>>
>> For values higher than the highest value in any range, this would 
>> keep iterating and end up returning an -EINVAL.
>>
>> For in range values this would work as expected.
>>
>> This implementation assumes that the linear ranges are provided in 
>> sorted order, an assumption that I believe already underlies the 
>> existing *_low_array() logic.
>
> Ah. I think ... I didn't think. :)
>
> It definitely makes sense to stop scanning if the range_min already 
> was greater than the given target value. Thanks for the patience and 
> for adding this missing piece :)
>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


Thanks for the review! :)


Regards,

Amit

>
>
> ---
> Matti Vaittinen
> Linux kernel developer at ROHM Semiconductors
> Oulu Finland
>
> ~~ When things go utterly wrong vim users can always type :help! ~~

