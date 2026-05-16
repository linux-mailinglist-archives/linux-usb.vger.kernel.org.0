Return-Path: <linux-usb+bounces-37530-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id L2SeGa3hB2qENAMAu9opvQ
	(envelope-from <linux-usb+bounces-37530-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 05:17:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFDC55A01E
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 05:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CDA330142B4
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 03:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD06F2701CB;
	Sat, 16 May 2026 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KZPWVOP4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0E01F1534
	for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778901414; cv=none; b=fMAV40SLqNQTyeocVssEjZHskY5R8tWVp/i8xppz49LcbYSVNkiLh2/wcas9ZY0Ji57pi4YJjdvxZaqcp2N+Yli/5n0sDTTCLazPwUmf142u0m8RXV+JR2dJGckHP5u9zlD2IKxLu+9ho2s4EfNu53SRQv3I4x7PyL8vc2pc5VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778901414; c=relaxed/simple;
	bh=Lc729Y0xn224/idzeEfk3/KfNdWuCMbif9brSHxshEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/V0FrZ9Dla2fRbIOCMto3EaPsSILae/OR82Qrrj+iX56y+wv77v62bBmiY29UrfDJ7Oza5meKqaBqQutDSMg2wCLdDJYLKp0ItcTOGfbfb+88iuw/XxueWBcvNI+YsPN1YBcOU+MiGY+EJRFXY9KMm75MKXdd2TSm5OJiABb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KZPWVOP4; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c3ea2ebf7so1076243d50.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 20:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778901412; x=1779506212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrJh0LBRhfhE6RUeOB54ZELwAnToFXLSRbXNOLZrn9E=;
        b=KZPWVOP4VSDw2nm1+DG8M6aUrS4q9b4Hg737MZ1uIBHdL3Rr1dowrV+cC0nYrvU8bG
         /5m6mrOn9xXbTz1d8aqxbcklSWHJElOdITaXDTMz5xkSeLknsa8OcCgvxtJVmDpUDqCB
         TaJkIbIxFo3XAx+3VarU18L18adpQ0Y1s2ULVpk3vEMqeMLeb1WN/PIRvgQXoDqwAFtV
         BufsYcmX0WoluqaiI5Scj8dK0dC9yH/7xJWB5lNmqI2+0sKYLrKtv/UFRkRR05OK3uVV
         llIhbgbgth3EV+EUcP/EUVdczR+xO/fpbf2+gNpPrKznNAqgoMWUFY1X5WjpvwUFxbNC
         NpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778901412; x=1779506212;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrJh0LBRhfhE6RUeOB54ZELwAnToFXLSRbXNOLZrn9E=;
        b=X0a0ioEKFvKJtrFJ7pW0m8rKFzj1QVEvQu8IjjbMkm7rDUIqOp9/eUsmtYPSY+no4V
         WoiIT5cSqzyuneMawHiEOAqViecOe7c21+JEVL7pSVYLNpk0ugfDEnUxCJ7F08t2KRQO
         ILAgXm9RJMGnYX19qPpGzqMiHw7wWMpvPWQ4fLdUo7JGHfs+h588hsJQsDzIlVSwJlHJ
         qpmo0qXqwMlP5k7KkPNlNcKgLn/yqut5A0QPSgYmRZ7rX7mKb9KkdP7SHHjEdxEPpEkt
         sv3roucWkt9C4Nz5nLv+Uud04W2TkEjbdpGQspK2CfXrOZquhxnXluFdmJXd+P3YZbqO
         D9xw==
X-Forwarded-Encrypted: i=1; AFNElJ+MHajoTDugCPbmA8WDMJqf2RAChkEEHNXZS7IChp8Fo+DGAau/2BGkdAH1VWi8L98nPjF9Jk/kfKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ8/vW/NDiPPshScA4TKPOUbhGKxA03V7Ff5JyCNHm2KyQe6k8
	T8AL6BvXYyPkNOxVlyYnepBjSXpGeqwk5BxErwHLzsX6wbSlgVh9dZQZIVwIzJfwaQ==
X-Gm-Gg: Acq92OGhzXup41ZWrrbYD1R6w/2QaeFtNbb4OWHhtjartZ8YR58vjlprQzf2xhKliKy
	PjUP+ehUQ7AVb9Sl0loK8GNOnnpuR3h2pEoj7ymcKbKb7m9Rfjsmbww7Z564xQV9qwi6s/MzygO
	LqIvQaRDFON3sadsxc9JViD3mfFtUxXJ0rZRlXYNkTpQMqkXECLwrdfh1gpYVTY74E/Fl7Ioxbz
	1ULZwNAgGdhWgJ6qDWnunCPqhGSBhSQGd8MotA2y6yYwUDEZOn2cGObOyGVVjE9/LKsGjv+nyP2
	KqOLTFnQ2PRF7ZesDPRh8X04WEItFNjR19tb3PTv7uz1sCcBcsvDiIzNmEGGpyOFkWngxXyksdq
	urwxjRryI9G0zZCc/GRtI9j7KQFHiXFZJfXwCI4gavERZUYDePDdR+GqMk7kmm8vLJNdRJ4JWpA
	uSG4FdELxz0uX4MDqlTd1pMCD0jropB1Zm/w7NmPEVcVjSFJBW9jIVbt33mGjWx6NzL6r/pDhEE
	zgbj6W9haACYk3hJmcU
X-Received: by 2002:a05:690e:4419:b0:65d:7e64:7edf with SMTP id 956f58d0204a3-65e228a63f1mr5041425d50.60.1778901411196;
        Fri, 15 May 2026 20:16:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:9ee1:b971:dc61:3e74? ([2600:1700:4570:89a0:9ee1:b971:dc61:3e74])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db0aa51sm3395322d50.12.2026.05.15.20.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 20:16:50 -0700 (PDT)
Message-ID: <21100c24-1499-48c9-b8cc-0e82cf931c59@google.com>
Date: Fri, 15 May 2026 20:16:48 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] power: Add power_supply_get_battery_all() to fetch
 battery psy handles
To: Hans de Goede <hansg@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260515-batt-status-v1-0-fed6b7d8cea7@google.com>
 <20260515-batt-status-v1-1-fed6b7d8cea7@google.com>
 <f34a38e9-c6bc-4ccb-9c9b-23288e09d734@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <f34a38e9-c6bc-4ccb-9c9b-23288e09d734@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AFFDC55A01E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37530-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Hans,

On 5/15/26 12:15 AM, Hans de Goede wrote:
> Hi,
>
> On 15-May-26 07:48, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add power_supply_get_battery_all() to allow drivers to obtain a list of
>> registered battery type power supply references in the system.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  drivers/power/supply/power_supply_core.c | 122 +++++++++++++++++++++++++++++++
>>  include/linux/power_supply.h             |   9 +++
>>  2 files changed, 131 insertions(+)
>>
>> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
>> index a446d3d086fc..697645426fb1 100644
>> --- a/drivers/power/supply/power_supply_core.c
>> +++ b/drivers/power/supply/power_supply_core.c
>> @@ -482,6 +482,128 @@ struct power_supply *power_supply_get_by_name(const char *name)
>>  }
>>  EXPORT_SYMBOL_GPL(power_supply_get_by_name);
>>  
>> +static int __power_supply_get_num_battery(struct power_supply *epsy, void *data)
>> +{
>> +	int *count = data;
>> +
>> +	if (epsy->desc->type == POWER_SUPPLY_TYPE_BATTERY)
>> +		(*count)++;
>> +
>> +	return 0;
>> +}
>> +
>> +static int power_supply_get_num_battery(struct device *dev)
>> +{
>> +	int ret, count = 0;
>> +
>> +	ret = power_supply_for_each_psy(&count, __power_supply_get_num_battery);
>> +
>> +	dev_dbg(dev, "%s: count: %d ret %d\n", __func__, count, ret);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +struct psy_get_supplies_data {
>> +	int cnt;
>> +	int size;
>> +	struct power_supply **psys;
>> +};
>> +
>> +static int __power_supply_populate_battery_array(struct power_supply *epsy,
>> +						 void *_data)
>> +{
>> +	struct psy_get_supplies_data *data = _data;
>> +
>> +	if (epsy->desc->type == POWER_SUPPLY_TYPE_BATTERY) {
>> +		if (data->size <= data->cnt)
>> +			return -EOVERFLOW;
>> +
>> +		get_device(&epsy->dev);
>> +		data->psys[data->cnt] = epsy;
>> +		atomic_inc(&epsy->use_cnt);
>> +		data->cnt++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int power_supply_populate_battery_array(struct device *dev, int size,
>> +					       struct power_supply **batteries)
>> +{
>> +	int ret, i;
>> +
>> +	struct psy_get_supplies_data data = {
>> +		.cnt = 0,
>> +		.size = size,
>> +		.psys = batteries,
>> +	};
>> +
>> +	ret = power_supply_for_each_psy(&data, __power_supply_populate_battery_array);
>> +
>> +	dev_dbg(dev, "%s Found %d batteries with array size %d ret %d\n",
>> +		__func__, data.cnt, data.size, ret);
>> +
>> +	if (ret < 0) {
>> +		for (i = 0; i < data.cnt; i++)
>> +			power_supply_put(batteries[i]);
>> +		return ret;
>> +	}
>> +
>> +	return data.cnt;
>> +}
>> +
>> +/**
>> + * power_supply_get_battery_all() - Searches for all battery type power supplies
>> + *				    and returns their references.
>> + * @dev: Pointer to device requesting the power supply refs.
>> + * @psys: Pointer to an array of power supply refs that will be filled by this
>> + *	  function.
>> + *
>> + * This function helps drivers get handles to all battery type power supplies.
>> + * If acquiring a ref to a power supply results in error, then the search for
>> + * battery type power supplies will abort and the acquired power supplies will
>> + * be "put".
>> + *
>> + * Return: Indicates the number of battery type power supplies returned on
>> + * success or the negative error code on failure.
>> + *
>> + * It's the responsibility of the caller to invoke power_supply_put() on the
>> + * individual psy refs and free the array returned by this function using kfree().
> Not a full review, just a quick remark: It seems to me that there should
> be some helper function e.g. :
>
> void power_supply_put_array(struct power_supply **psys, int count);
>
> Which can be called with the returned array + count to do this for the caller,
> rather then expecting all callers to open code this.

I see. I will add this as a new helper in the next revision.


Thanks,

Amit

>
> Regards,
>
> Hans
>
>
>> + */
>> +int __must_check power_supply_get_battery_all(struct device *dev,
>> +					      struct power_supply ***psys)
>> +{
>> +	int ret;
>> +
>> +	if (!psys)
>> +		return -EINVAL;
>> +
>> +	ret = power_supply_get_num_battery(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (!ret) {
>> +		*psys = NULL;
>> +		return 0;
>> +	}
>> +
>> +	*psys = kzalloc_objs(**psys, ret);
>> +	if (!*psys)
>> +		return -ENOMEM;
>> +
>> +	ret = power_supply_populate_battery_array(dev, ret, *psys);
>> +	if (ret <= 0) {
>> +		kfree(*psys);
>> +		*psys = NULL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(power_supply_get_battery_all);
>> +
>>  /**
>>   * power_supply_put() - Drop reference obtained with power_supply_get_by_name
>>   * @psy: Reference to put
>> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
>> index 7a5e4c3242a0..2467530a5740 100644
>> --- a/include/linux/power_supply.h
>> +++ b/include/linux/power_supply.h
>> @@ -806,11 +806,20 @@ extern int power_supply_reg_notifier(struct notifier_block *nb);
>>  extern void power_supply_unreg_notifier(struct notifier_block *nb);
>>  #if IS_ENABLED(CONFIG_POWER_SUPPLY)
>>  extern struct power_supply *power_supply_get_by_name(const char *name);
>> +extern int __must_check power_supply_get_battery_all(struct device *dev,
>> +						     struct power_supply ***psys);
>>  extern void power_supply_put(struct power_supply *psy);
>>  #else
>>  static inline void power_supply_put(struct power_supply *psy) {}
>>  static inline struct power_supply *power_supply_get_by_name(const char *name)
>>  { return NULL; }
>> +static inline int __must_check power_supply_get_battery_all(struct device *dev,
>> +							    struct power_supply ***psys)
>> +{
>> +	if (psys)
>> +		*psys = NULL;
>> +	return 0;
>> +}
>>  #endif
>>  extern struct power_supply *power_supply_get_by_reference(struct fwnode_handle *fwnode,
>>  							  const char *property);
>>

