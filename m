Return-Path: <linux-usb+bounces-25564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBDEAFBF80
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 02:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE5167B14EF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 00:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4201DD9AC;
	Tue,  8 Jul 2025 00:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tXLshjWi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813631C6FF6
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 00:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751936015; cv=none; b=g8O7/FtmPK/B08CHP13xaWIJrFpRn1HffBdvt8dG75uidM5IpY75AwRK9LG6i+uiGLCv7/yYRWlsFBc+gEoLCg5nAYk4pQMvRpakfhT0yVz3WU6twP9RU29evPuPyeoCyB9MW+peuEBbTy/uHWgvhu/7lkECwsf2ZgkJi/bChn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751936015; c=relaxed/simple;
	bh=Lv2uYuP0uhaX+2KsikPWXcVb5tuYue4RCSSa3gj999Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpcEi3ooh++5ixhYfRXIc2PSBcKKdinv61AaIyiCQajzIuNcw7fkqHx364+Jy07Ocdd9NvFVyMCSl9lqPUbv+iTt2lXlDVmpIpAVJkXJscHPSWurQ9ot2ilKIioWM0nSfvd3XopF/qkPtyurpxqHRB2YvLLzZ1Qp0AzBe0juLuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tXLshjWi; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso3757830a12.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 17:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751936013; x=1752540813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U13eZc0zieh3AbPtNGZ8TUxyosjfaQ6szmOCMhohSY8=;
        b=tXLshjWiAgy5f+gp/WqGYqhEZla8vNFRwYPyjLTxA307RcHyc56/AGe7VdGFrg+elR
         18Y58Y+wJYkTkLimBO59TxHjCC4ibfjxHGV8ISdE7EwOg7Tbp58DYohhnPns6BErAIZV
         CdDl8i3/FIBb4AJXlf1ovQFqDkEFPpApgPVvthX4wwKwsgHyCYoZZUeqZSHrCF94psTz
         0pbxUT4FWdOjTuqI3mYj43r6Fk/I/9U3g7F5GtWwtPOXBDWCTKDxNpWkluo90UR9EhEB
         G6deGLNe8z99pCtkMAHmQPHtsyRU+53Y0DmuntpNfag0yDH7n4wngvgobA6gyIPMSjWm
         eNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751936013; x=1752540813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U13eZc0zieh3AbPtNGZ8TUxyosjfaQ6szmOCMhohSY8=;
        b=MCZIVmUAHabVNL5RQkFTc9RLZlayfbief+GjZlf4JtEgT48VgShiI9F0mKuiqc/eER
         Soqovg38dUeMzhqIkX84reI0hKDEF10LglLrzQGS4GF/4mCRWyP+gkYRB1knH0xF3UNc
         O1WH7DuGrfWsQV5AWXyyMQxZ13DFNssES1yh+hT1v1fzuiwa9UIoSINOl1HEsvVeyvI6
         ih1AToQ/n6nv286n3HxK8zMuIC37648hYmfkvkL5QylcknBQ5BP4XuPtrc9eaKXDTMY7
         KMY0uIog9dBYUFFar15gjnes4DJm8IkGNiTdJ9sbRTzmR2fTxH3TTqVVqObKNOBn2n/p
         CHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFnom+EUN0gdaUxjHMJ+HKLJ75Zu+CnU6o2sdlJ1LqacSXYcPbtT0RiRulb2oEohJOy5wHdynaJ1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CGV21wJr1lvRqN+NS7lsXkeDyzkt9UwIkz7D9jMmjU2ptdus
	7qMn6+1YKjP/orXVzilz+SUuVbzvGmtBznt/GI6iAWn241tZL9b1T0vMHjzEG4Lkog==
X-Gm-Gg: ASbGncvmcK6tc/lo5GptrTeiR6dcN4pD6VndRlhP+wY5mNY/oIIrty6c9/0qaJWA9O3
	/dwR5IyJWppPp9WI75+cd09SbW1Nvj/nhCDnOAnjbo2vQJyqpAFLVXLBzwU3EoWeb7XWAlC6bCG
	ehiInBfQ9Wa0N3xLO3mekb/gKR2BguatDPUQUAUF2ivezW1EX3l4rGqke9carunYM59cKW3B3O5
	W8FUTlvpJ2uxlzNeVsa2Uq6w5oGGh5rvfP6CVsBF6zV19K5kqwad3GXBwheq7z8pFjkASXli4jC
	cyLLuQnz+Ft7684kdokffoRta8HleGVuc0h9UjA/1zwqC2NVp+RmOgrO+T3wN5wM3qLiVzs9n38
	fgS+03AtCR8nWsPUXa4WstH60ND+FbajH4tfe0OtixWl7Ad93x+4eFxUZSJ4d
X-Google-Smtp-Source: AGHT+IFjMQjjOffzmNOZ8P3WylPz+SMLrNx6Urqmr9Ai+/+EfNPOK6NyOHFuFGHPVrX19c044f0U+Q==
X-Received: by 2002:a05:6a21:3289:b0:206:a9bd:a3a3 with SMTP id adf61e73a8af0-22b4449b08cmr1787853637.24.1751936012395;
        Mon, 07 Jul 2025 17:53:32 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:990d:1c2a:935c:f693? ([2a00:79e0:2e14:7:990d:1c2a:935c:f693])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359e125sm10567514b3a.13.2025.07.07.17.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 17:53:31 -0700 (PDT)
Message-ID: <b6bfc569-159d-4249-821d-cb6ffab17000@google.com>
Date: Mon, 7 Jul 2025 17:53:30 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] power: supply: core: add helper to get power
 supply given a fwnode
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@kernel.org>, Kyle Tso <kyletso@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250507-batt_ops-v2-0-8d06130bffe6@google.com>
 <20250507-batt_ops-v2-2-8d06130bffe6@google.com>
 <djqmdlnsftquum3wayigqryzfy7xkn67uj4pfk3wugxl3lx3wr@y26ydci57iwi>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <djqmdlnsftquum3wayigqryzfy7xkn67uj4pfk3wugxl3lx3wr@y26ydci57iwi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 6/23/25 2:21 PM, Sebastian Reichel wrote:
> Hi,
>
> On Wed, May 07, 2025 at 06:00:23PM -0700, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add a helper function power_supply_get_by_fwnode() to retrieve
>> power_supply given a valid fwnode reference.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   drivers/power/supply/power_supply_core.c | 30 ++++++++++++++++++++++++++++++
>>   include/linux/power_supply.h             |  3 +++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
>> index 76c340b38015af0a67a0d91305e6242a8646bf53..ef6ba22b837b0b9463f9a3065425e2720f40b9eb 100644
>> --- a/drivers/power/supply/power_supply_core.c
>> +++ b/drivers/power/supply/power_supply_core.c
>> @@ -496,6 +496,36 @@ struct power_supply *power_supply_get_by_name(const char *name)
>>   }
>>   EXPORT_SYMBOL_GPL(power_supply_get_by_name);
>>   
>> +static int power_supply_match_device_by_fwnode(struct device *dev, const void *data)
>> +{
>> +	return dev->parent && dev_fwnode(dev->parent) == data;
>> +}
> This already exists as power_supply_match_device_fwnode().

Thanks for your review! I will update in the next revision


>
>> +
>> +/**
>> + * power_supply_get_by_fwnode() - Search for power supply given a fwnode ref.
>> + * @fwnode: fwnode reference
>> + *
>> + * If power supply was found, it increases reference count for the internal
>> + * power supply's device. The user should power_supply_put() after use.
>> + *
>> + * Return: Reference to power_supply node matching the fwnode on success or
>> + * NULL on failure.
>> + */
>> +struct power_supply *power_supply_get_by_fwnode(struct fwnode_handle *fwnode)
>> +{
>> +	struct power_supply *psy = NULL;
>> +	struct device *dev = class_find_device(&power_supply_class, NULL, fwnode,
>> +					       power_supply_match_device_by_fwnode);
>> +
>> +	if (dev) {
>> +		psy = dev_get_drvdata(dev);
>> +		atomic_inc(&psy->use_cnt);
>> +	}
>> +
>> +	return psy;
>> +}
>> +EXPORT_SYMBOL_GPL(power_supply_get_by_fwnode);
> And this is a 50% of power_supply_get_by_reference(), so the
> function should be updated to use power_supply_get_by_fwnode().

Agreed.


Thanks,

Amit


>
> Greetings,
>
> -- Sebastian
>
>>   /**
>>    * power_supply_put() - Drop reference obtained with power_supply_get_by_name
>>    * @psy: Reference to put
>> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
>> index 6ed53b292162469d7b357734d5589bff18a201d0..a35b08bd368e9305554e1a608dc8e526983cfa12 100644
>> --- a/include/linux/power_supply.h
>> +++ b/include/linux/power_supply.h
>> @@ -801,10 +801,13 @@ extern void power_supply_unreg_notifier(struct notifier_block *nb);
>>   #if IS_ENABLED(CONFIG_POWER_SUPPLY)
>>   extern struct power_supply *power_supply_get_by_name(const char *name);
>>   extern void power_supply_put(struct power_supply *psy);
>> +extern struct power_supply *power_supply_get_by_fwnode(struct fwnode_handle *fwnode);
>>   #else
>>   static inline void power_supply_put(struct power_supply *psy) {}
>>   static inline struct power_supply *power_supply_get_by_name(const char *name)
>>   { return NULL; }
>> +static inline struct power_supply *power_supply_get_by_fwnode(struct fwnode_handle *fwnode)
>> +{ return NULL; }
>>   #endif
>>   #ifdef CONFIG_OF
>>   extern struct power_supply *power_supply_get_by_phandle(struct device_node *np,
>>
>> -- 
>> 2.49.0.987.g0cc8ee98dc-goog
>>
>>

