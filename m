Return-Path: <linux-usb+bounces-30930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D41CAC87A5A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 02:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3AD4034EAEB
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 01:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FFC2F616F;
	Wed, 26 Nov 2025 01:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rnt+13fF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE8425A62E
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 01:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764119406; cv=none; b=Q3mSX0Eg5GlxzN9IAaH/TdBALd+dE5audr3CZlWAgA1tlKUrjVV5MUrPP7E35W1YH4XnlN9cxW4fZU/lZsB0ixNMw6AIq4wSEH1JMXPkMQpuxykIN2j+PNtUVJ/66KEzeE8rsExDRufPqZkjTCriyelpFal+sNVkqgDF7Tej2x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764119406; c=relaxed/simple;
	bh=7JSwRjVY7+7OLgODPV18aJxzmBQ1LQ3WuDOx/jYCwjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dj7pPpYIGe37PNPXABA6J0Nw78JD6wfqOZ964FSaQjVaruApNRQG4FkDTXyI1c4I7u1kf+VNevSQdQZc3M8bGHwG4m0V+kEns0ueJkGsZfFdG7/9nptLGV/58OTQBAYQ5hmf0sth11lvj3DbN+xggKudAtgYHiZ0OtTNU8rz16Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rnt+13fF; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso3800396a12.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 17:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764119404; x=1764724204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uKMid7mHBul9Q0TO4PibzdXQbMZDvFms1DpBKwMu7E=;
        b=Rnt+13fFsiKLzZKnKTL/CDDH9IlQ6Bj4Y8PTu//eYViO1Yk/zM+D5jczKbeImv9gjf
         y+/SnAc+ujtVM3ml0911k/dLeTMNQ5uALS4+QysceMpOGEVRaDBub813FDrIpkp82DTT
         sR17sH9FnlMKkKFDSDKVXFKWu5mhhVBwcE6tl5Lnj43g5nVX225MRSkqiAW3jjw6tb0b
         cWmJW4xamFANzQPNYMN/l1g86EMhBHlkl7KRDxuUTIm9SID3LDbWudSFUNMN7n26M8Bn
         dWa7Dgi+JJwYz1kCnBqgj5Crp+ar9qqWkcD210bcrQSLzSQHDADfnbmUj+Kj1dNhaEDM
         T77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764119404; x=1764724204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uKMid7mHBul9Q0TO4PibzdXQbMZDvFms1DpBKwMu7E=;
        b=dXRKcQ6f5KCxmlUR3rOuYUaL1IogswRxlWwcKprQXMJuf8OqapbubYNEWzK49QHJE5
         XkVt4mq0ecYCp2GkofEMstDj2j9amX6x7jmpU04Mn99U1Vo9J7onHEzIe/pHuTAfywla
         /ipRCnYMoGr9A7FuPIfxgWZRuDi2QbccC5pX51YGWDtuBw6EGhfN0qILHMFPS+cagOeW
         rO2ZuzQyW1opvX1h9kTeHlSdSVtnW9m18t1aVNFPa/sm2pygvhrbguyb7gHX6jzQhl3g
         uPuFP7zPRgZ2gov2jVsYgi005GXwDA9pAzr//KDJ+GXWku8N8uZ/8OE4UBgnwOXbI+ng
         XOjw==
X-Forwarded-Encrypted: i=1; AJvYcCXq6Tzpy1JkR9+dcOdvW86N3StiZdAVPKGY/Rp1P/VlLFD4mMk35YYMVp4UBQAMx0V4dsuV96N2vRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5IF2MmaSkt0wzV9AvxsqIwYsNErP7nFCAHFvhb6fZ+w4Gmwnx
	zJjLPdOTxaMwFryL9hwlqo1TTjJpSwog0nSe6dSbVRkDOsLe1RFWYYTTKL0lom5EwQ==
X-Gm-Gg: ASbGncu8lgWjJOz1Osc5h8ogZh5WCQavNYAS5W9aXcf6Vcn1/o2BtxbaDw30L3eSJ0l
	koAD9IlmX9tKfGq0Ak2ohfJgWi/XoOzGpHubbe5gODBxH0SMTdaEbsbPd0FR8ITZEZMFFi3sOZW
	KuntxMSTEjMs89avBZmAjZ6+K6clKdIIdvv5oSQS8k7pX3ALN94rDrGuSzM4XwwV694zEQtWc2P
	vvs6J2XV9P/8Ktoo51Svnz77h5hCR+5VqKU0+DSjKNO2zRNQtjdnkpq+QBxcQW3f96vRC0ideMp
	v/I23YySmAq6IbirqwH2WGeLudtM7LhsT5QwjnL5b8EzyRDkgi3KJZA58Brw12oJ00VDwtBlqKa
	orPzGj7j1vtJdu5otOqP5hfK86xxxIIy1U9RK+a3UjDjPgUlIV2OnMVllsui6Ut7conw8oPSqPc
	qfxbpYLdXFRmG7b9+OaGvy2U4LgxMKgngTvCS66YR0cA3T4RissbVkf6ZA/jJjOXKncyyGAmBG2
	UFSXJezDB7UHQ==
X-Google-Smtp-Source: AGHT+IFsz/ljJrcpzA2pBF+IG/pUKgJQ17kleGBABcAzWrEfAKNQP91IPN/fvXc4LjZFpbtSbbWOBg==
X-Received: by 2002:a05:7022:ec16:b0:119:e56b:91da with SMTP id a92af1059eb24-11c9d811990mr11140572c88.11.1764119402831;
        Tue, 25 Nov 2025 17:10:02 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11cc631c236sm17216416c88.7.2025.11.25.17.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 17:10:02 -0800 (PST)
Message-ID: <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
Date: Tue, 25 Nov 2025 17:10:01 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi André,

On 11/23/25 10:21 PM, André Draszik wrote:
> Hi Amit,
>
> Thanks for your patches to enable the charger!

Ack!


>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Define specific bit-level masks for charger's registers and modify the
>> irq mask for charger irq_chip. Also, configure the max77759 interrupt
>> lines as active low to all interrupt registrations to ensure the
>> interrupt controllers are configured with the correct trigger type.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   drivers/mfd/max77759.c       | 24 +++++++++++++++++-------
>>   include/linux/mfd/max77759.h |  9 +++++++++
>>   2 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
>> index 6cf6306c4a3b..5fe22884f362 100644
>> --- a/drivers/mfd/max77759.c
>> +++ b/drivers/mfd/max77759.c
>> @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_irqs[] = {
>>   };
>>   
>>   static const struct regmap_irq max77759_chgr_irqs[] = {
>> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
>> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
>> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_AICL |
>> +		       MAX77759_CHGR_REG_CHG_INT_CHGIN |
>> +		       MAX77759_CHGR_REG_CHG_INT_CHG |
>> +		       MAX77759_CHGR_REG_CHG_INT_INLIM),
>> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_BAT_OILO |
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC |
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV |
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO |
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE),
>>   };
>>   
>>   static const struct regmap_irq_chip max77759_pmic_irq_chip = {
>> @@ -486,8 +495,8 @@ static int max77759_add_chained_irq_chip(struct device *dev,
>>   				     "failed to get parent vIRQ(%d) for chip %s\n",
>>   				     pirq, chip->name);
>>   
>> -	ret = devm_regmap_add_irq_chip(dev, regmap, irq,
>> -				       IRQF_ONESHOT | IRQF_SHARED, 0, chip,
>> +	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT |
>> +				       IRQF_SHARED | IRQF_TRIGGER_LOW, 0, chip,
>>   				       data);
> Please correct me if I'm wrong, but I don't think this makes sense for a
> chained IRQ in this case. What problem does this change fix?

While this patch was meant only for modifying the interrupt mask, I 
added this for consistency because the main SoC -> PMIC line is active 
low. However, I agree it is not strictly necessary here. I will drop it 
in the next revision.


>
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to add %s IRQ chip\n",
>> @@ -519,8 +528,9 @@ static int max77759_add_chained_maxq(struct i2c_client *client,
>>   
>>   	ret = devm_request_threaded_irq(&client->dev, apcmdres_irq,
>>   					NULL, apcmdres_irq_handler,
>> -					IRQF_ONESHOT | IRQF_SHARED,
>> -					dev_name(&client->dev), max77759);
>> +					IRQF_ONESHOT | IRQF_SHARED |
>> +					IRQF_TRIGGER_LOW, dev_name(&client->dev),
>> +					max77759);
> dito.

Agreed, will drop.


>
>>   	if (ret)
>>   		return dev_err_probe(&client->dev, ret,
>>   				     "MAX77759_MAXQ_INT_APCMDRESI failed\n");
>> @@ -633,7 +643,7 @@ static int max77759_probe(struct i2c_client *client)
>>   		return dev_err_probe(&client->dev, -EINVAL,
>>   				     "invalid IRQ: %d\n", client->irq);
>>   
>> -	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
>> +	irq_flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW;
> I don't believe IRQF_TRIGGER_LOW should be added here, as this is board-specific.
> The polarity is meant to be set via DT (and the only current user of this driver
> does so).

You are correct. Since I am already retrieving the trigger type from DT 
via irqd_get_trigger_type() below, I will drop this change.


>>   	irq_flags |= irqd_get_trigger_type(irq_data);
> That's what gets us the config from DT.
>
>>   
>>   	ret = devm_regmap_add_irq_chip(&client->dev, max77759->regmap_top,
>> diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
>> index c6face34e385..0ef29a48deec 100644
>> --- a/include/linux/mfd/max77759.h
>> +++ b/include/linux/mfd/max77759.h
>> @@ -62,7 +62,16 @@
>>   #define MAX77759_CHGR_REG_CHG_INT               0xb0
>>   #define MAX77759_CHGR_REG_CHG_INT2              0xb1
>>   #define MAX77759_CHGR_REG_CHG_INT_MASK          0xb2
>> +#define MAX77759_CHGR_REG_CHG_INT_AICL          BIT(7)
>> +#define MAX77759_CHGR_REG_CHG_INT_CHGIN         BIT(6)
>> +#define MAX77759_CHGR_REG_CHG_INT_CHG           BIT(4)
>> +#define MAX77759_CHGR_REG_CHG_INT_INLIM         BIT(2)
>>   #define MAX77759_CHGR_REG_CHG_INT2_MASK         0xb3
>> +#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO     BIT(4)
>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC   BIT(3)
>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV   BIT(2)
>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO   BIT(1)
>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)
> Even if wireless out of scope, it'd still be nice to add macros for
> the remaining bits to make this complete and avoid having to update
> these again in case wireless support gets added in the future.

I would prefer to only define the macros I am currently using to keep 
the review focused, unless you consider this a strict requirement.


>
> Also, would be nice to keep existing style and indent the bits from
> the registers (see existing bit definitions in this file a few lines
> further up).
> Finally, can you add the bits below the respective register (0xb0 / 0xb1)
> please, to keep suffix meaningful, and to follow existing style for cases
> like this (see MAX77759_MAXQ_REG_UIC_INT1).

I will fix the indentation and ordering in the next revision.

Regarding bit definitions: In [PATCH 5/6], the max77759_charger.c driver 
defines bits for the register addresses defined in this file. Currently, 
those macros are only used locally by the max77759 charger driver. Would 
you prefer I move those definitions to this header file as well?

BR,

Amit


>
>
> Cheers,
> Andre'

