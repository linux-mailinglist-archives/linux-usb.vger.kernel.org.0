Return-Path: <linux-usb+bounces-35820-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEJiHq/FzWmqhAYAu9opvQ
	(envelope-from <linux-usb+bounces-35820-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 03:26:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4438237A
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 03:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0E10305430F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 01:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EAC32860F;
	Thu,  2 Apr 2026 01:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pWvMSrP3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E5832570D
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 01:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775093161; cv=none; b=sGn8Afpl6rDfqtUpuM86ZjhN99Tq4rn7Pr/qXIrngArNbY3QhRR5gCTn2HgzwygLs4lCXm9FLka2YnoJhdVUuy/v5NJFcWS4j9cSnQBSua6bGdXLJoOI5InkDGZlV4gcCGYjwfJ1nDEw4EmY8Jhqkm9e61xrG03uruDjw3ROSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775093161; c=relaxed/simple;
	bh=evfYIKJkPHZ9+yUV/8inPLH60gyR9XmPjdvpEZbmVHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGgdj9vMzT/CuX5O6An48MlBpcdqi4gn02M2uHFgn+vizmTpUQXaoq7XdgXSvVW5kqv7XTpKdgt/xoAvZYk6dnL9EGMjSNyN6J9xKYpfFpYI8yOl6azhpvWBCJ7ZRyx39xcIHt1di+w+NH7kMDdbDQzvhwENbkLR+g4nXnqe39Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pWvMSrP3; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c5b3d8eab1so1118478eec.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 18:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775093159; x=1775697959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=;
        b=pWvMSrP3g3ebFOk9pjA+H3/BmMbMXn55mhxlpTneELsRD5dm9b3Z13QXPMg2wNxWJj
         peOALi5jY/t49jCgxJCk+Awr2EJypLlL+IuRnVWsUidtpceq7KW5crNXY51Rg15XzMXq
         ubwZ12FgnPQK8HJSLDyOfbblGV/s1rTXWnbNkkRusbXqqz7ozQXGIILiDH6LeyQAMCtR
         L2gj/QAR1elR9jjdD0Ow+6pdw/WC/MsdXUwIe4KpBjpixkgr6JQGK5mqjH65hzEZrrh1
         adc7CbKr1xMzgVqNgyjFULbvlFGSo0h38K2UYEmGZJpTThgOrVNwnefrb5r9pttNX0Re
         Fw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775093159; x=1775697959;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=;
        b=q7sOYMuCIIwHI6a0o22BBALL4rD8y7RA9QcU5rV91GkQFEqrr4oncoX4NNERa1A7oR
         RY/KBlv+P1v00Iy4WWfUAx64pTGWfylCcbjV3qPnmrsuXfbk85hkD9eiVp7ZJGr10ZRY
         Ag5fJusWCSnP8DsKYuIXML5TcMrK7pj57EpuXUs83yFdIvfWZHPSDriolO2691W2WErx
         /svKTG1lCsvAN/ZvcZ9QARhToPWazmQb+Hv4nHa3PTShVKktnu37IA/nepB1c96N/0BK
         cJ2NbeRUt+eJ3niuQUnN8FOW1rElwwKV/XvsdfspN4KQTZ5SIMniRIpRQRb/S4wYhfAd
         uZBw==
X-Forwarded-Encrypted: i=1; AJvYcCUW/RKFh7qpAkeCOvjzlYgQsbr98j6QGAXeLkltx27onYo/y+03rbC0OhuFvwqxmVbj9Z516yvTHVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTG4SP7fh5wI0L/+T5TzLWaBeUVhQ97+lOd/hmW9R4cl3q1sV
	bd+A8RkPiELKrjILRdlrOUEpBBvdsO5yo5zgmQdgaOEGvoc48l8oQJb/c3hgM9f5QQ==
X-Gm-Gg: ATEYQzwq0qX7r2Px4c0fESWZifn99sHr0UNCTNcvSjXblb+U8fpY4BL2obcZTBquRcM
	udwN8AK35IP0v+JecPvpEwFdmesmYM+VsU5bVIt97kIhWJ4dzRWJKdS73axY9ERyxooEa+qP3jF
	u311FveYm1xGRnH4nOcUL34Dp5wKVXyiQipK+edeV2X63C0cFEpPqhLYjm0BE05F34SySHbj4vh
	UFFBEkRUIHMFEgmhtwl9Sofmm+rp/w+ySVU2oNT14FRoHGc1YI/KjJI8bld6fvESwymOwbR9L4v
	iQ6sVMVjIxz6UHX4tIkCO4k/OOxil5pR2noBMJTEE3D2xewF3SEGTfPikoEii3hwjCbKFb68/vL
	DLG0jfimNJImrKsQ9R1Vlps4zKDAgsp7YNKQEOjWJ+qxngon08CS0HcvOh8PgERN3yjf9bHCKww
	CZn+UdOXcn1NwhTG9UxVHS6JhdngBlDJARSyqbKNrWM23Gp+FhIeGE9+MztrNu8lW50wxba1omM
	to6RZxIAERi3eo2EpsFdTjCsA==
X-Received: by 2002:a05:7301:fa0d:b0:2c1:6676:5ebd with SMTP id 5a478bee46e88-2c930e6b1fbmr3100327eec.10.1775093158301;
        Wed, 01 Apr 2026 18:25:58 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:9:862b:f392:67fb:ffb1? ([2a00:79e0:2e7c:9:862b:f392:67fb:ffb1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf1271asm1676362eec.26.2026.04.01.18.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 18:25:57 -0700 (PDT)
Message-ID: <dc670de4-2dae-4d5e-bf15-ac52c5a0868a@google.com>
Date: Wed, 1 Apr 2026 18:25:55 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/6] power: supply: max77759: add charger driver
To: Sebastian Reichel <sre@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-5-76f59233c369@google.com>
 <ac2jYUA2F5oQsA2g@venus>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <ac2jYUA2F5oQsA2g@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,linuxfoundation.org,google.com,gmail.com,linux-foundation.org,linux.intel.com,samsung.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35820-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AA4438237A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sebastian,

Thanks for the review!

On 4/1/26 4:17 PM, Sebastian Reichel wrote:
> Hi,
>
> On Tue, Mar 31, 2026 at 11:22:20PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> +/* Charge Termination Voltage Limits (in mV) */
>> +static const struct linear_range chg_cv_prm_ranges[] = {
>> +	LINEAR_RANGE(3800, 0x38, 0x39, 100),
>> +	LINEAR_RANGE(4000, 0x0, 0x32, 10),
>> +};
> Let me quote from include/linux/power_supply.h:
>
>  * All voltages, currents, charges, energies, time and temperatures in uV,
>  * µA, µAh, µWh, seconds and tenths of degree Celsius unless otherwise
>  * stated. It's driver's job to convert its raw values to units in which
>  * this class operates.
>
> What makes you think that CONSTANT_CHARGE_VOLTAGE_MAX is
> special?
>
> [...]

It was an oversight, I will fix it.


>
>> +static int max77759_charger_get_property(struct power_supply *psy,
>> +					 enum power_supply_property psp,
>> +					 union power_supply_propval *pval)
>> +{
>> +	struct max77759_charger *chg = power_supply_get_drvdata(psy);
>> +	int ret;
>> +
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_ONLINE:
>> +		ret = get_online(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_PRESENT:
>> +		ret = charger_input_valid(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_STATUS:
>> +		ret = get_status(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
>> +		ret = get_charge_type(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_HEALTH:
>> +		ret = get_health(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
>> +		ret = get_fast_charge_current(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
>> +		ret = get_float_voltage(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
>> +		ret = get_input_current_limit(chg);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	pval->intval = ret;
>> +	return ret < 0 ? ret : 0;
> As people like to use existing drivers as reference this definitely
> needs a comment, that none of the properties used by this driver
> support negative values. This is not a general thing as e.g. the
> CHARGE current may be negative depending on the battery being
> charged or discharged (OTG mode).

Ah okay, thanks for letting me know. I will add a comment.


As these patches are already in flight and part of usb-next of the usb
tree, I can send the suggested improvements as a separate patch, if that
works for you and Greg.


BR,

Amit

>
> Greetings,
>
> -- Sebastian

