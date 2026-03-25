Return-Path: <linux-usb+bounces-35466-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKNOHUBAxGk+xwQAu9opvQ
	(envelope-from <linux-usb+bounces-35466-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 21:06:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1832B900
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 21:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8453530275F8
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 20:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B2F363C49;
	Wed, 25 Mar 2026 20:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M75p2Lwm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A93329C7C
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 20:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469182; cv=none; b=Hv1SbRup72yawZJ8UGhOMOeOzUg1cymw49OnpE+sCFihhaXH8mSiy7prAVQ+1sBZZx4YcOI27lSITm4EFsxUoSrsID1sA7vAwxI3DSHRhlduMUYY6crYbf+4z750FeXXqm/2B0eHeJocw5t+Zdenkb5zM1cqmIDPsK2408MU23U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469182; c=relaxed/simple;
	bh=VaZb8EC0HyB9njxGMFlCsQ7lehiZDB027a0U6Tf/jMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6oCcyR5L+dQiq06CkneM8KL7sI0ed6KHWcdtZUaWHn0PkZakBoI3e+3h5+lKV2zMVR/MSk9wQBQXQzFqkzmSALGfxkYGTZrL7L3VFrJ53b/bmYPsI2+YIrs+5MdfjQuyLlu2vooUEXBJWU3DPv4fAjbtOp0B+DpYgv1BP2szgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M75p2Lwm; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c11c43aca0so145191eec.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774469178; x=1775073978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYs0N76tYfCcM5LVQXVnLx1Cd3lbi2ymgwe34/d1KfU=;
        b=M75p2LwmGC2yE6Ev/cJoTRivOI8gXnonZCw2odIts7chrHFnIJnzkO7ZaZRvAslwug
         NNwndp0/by6N7jTxGkwZ5JBYCaimcSth4H+t/Lrl/Q4b7FEuY1Bc8vBGpKF1YjlEZykY
         i7PhicMXPv4z8WjuocSi/ZHpdrzGAxJnn2ZhErmdwxoBQF31u+ymI9DFJi1uAQCsomfq
         6NszrOj15PYBZZt6VLPl5gFlKNN2xfvXAJf+C7WTiZYOSMEzXQBR69N1G3CujlTwwLAZ
         Dd/4kRjIU4Az+GtvC4X1h59oFkeCRPGNFroM7e2J782UC12aDfg9qm9IYm/i/J6GgiJi
         851w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469178; x=1775073978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYs0N76tYfCcM5LVQXVnLx1Cd3lbi2ymgwe34/d1KfU=;
        b=mELmPKk6SgvHgPtt5VUMIdIYm9LVSRVcVbEkpsblfznEOYjgKANKe9l2pDaAobJkpo
         OZL0EunP9+bUtMxi7Ul0rOTQ66wL4zxTpgfdASKWqTilLn3j/7auYZkEjDfOYw33Viwb
         2DnyOM57I4DqnteXM8beAmihRCIsAEy339m8LsFACZDIJGsgSpDvxSrpoIYJx/MKFlNH
         h4KyGBwdhulGqFVyWUXdia3Xntj9Agdcr4DrlyR7JOylD8dGthLl4bkO9CVYrR9dsNBw
         VqfF5py1YCcYGjoGZ0lE3kY06OSDUFIJE8t+mUwc5iEBSnMH7NUPo62PCZu+zZRJVONJ
         sbzA==
X-Forwarded-Encrypted: i=1; AJvYcCX6MRliXxk8OkHMHQ092Wqpv417v98zBZdhTT3KczkwqS4qyfc7Uj8N3ZZvLC3IiCp7y2ydBdVAw3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0qcgzuDSFogreDe+WGYfqHI/dcCzUQwkfuHl3ZrGAMsUPlKtM
	qgPxfp/ldA6+/A7WaGnjVDmENXvwrW05rvSjzirLJbpZWo0LM1CoIkBtbH/g7L/5nQ==
X-Gm-Gg: ATEYQzyhJZBd1sv49Xxy8yRNEt5IMxp75RIEAtpyC2+YWwdZ08yRcr8Zc4YDf6sYaTJ
	ANFNwy5htsezOFH9muNcH6Bw0NtXNgcvSSY2BoF8fWXBAL53DAMRRrw/jc+ILDRkf6NUZoX/0U9
	4VMDykqoH8wt0Tp/kpX0cUd/mQzl7ZjQ0jFOtYAqvQSXeAeI79imXKjfLbNSYRulUAyJNt5k9rC
	PfEK6efODgK4l9hC86FdTI4EeaxPo7P5/pH0YDsVFZV0vfjWeC+o82BHWz/CqB5mKGman3fTV/f
	e5p1+V5M1tASiDmb4n73jDjRyWCODi2EyX/VdStYNzlwQtte0CJTQY4j7MiHMhcxK4IqBTB5uVL
	0mxvgBA57MKquY7ggLQfCsUs+zQvBO+2Lem3XF/dYvlKGWlKbiIcmCVnaLLvZVp/Ifwm02RIJcQ
	2OKZJYqvxDn+SI8KexrgXw5JKXlnbgbizApj9hiYYxaaYIIIboX/iPUr885RfYnzaXw/SzildWV
	s7ymREyT4T4IFhEiQNjXemXNg==
X-Received: by 2002:a05:7300:e790:b0:2be:1f56:ed2a with SMTP id 5a478bee46e88-2c15bddba72mr2570232eec.16.1774469177832;
        Wed, 25 Mar 2026 13:06:17 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:e936:31c5:12be:a407? ([2a00:79e0:2e7c:8:e936:31c5:12be:a407])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9ceb0sm539807eec.19.2026.03.25.13.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 13:06:17 -0700 (PDT)
Message-ID: <51a60b2d-1461-46a8-8ed4-4622b9f19124@google.com>
Date: Wed, 25 Mar 2026 13:06:12 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 3/6] mfd: max77759: add register bitmasks and
 modify irq configs for charger
To: Lee Jones <lee@kernel.org>,
 Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260314-max77759-charger-v8-0-226ca5f8c7d2@google.com>
 <20260314-max77759-charger-v8-3-226ca5f8c7d2@google.com>
 <20260325151004.GD1141718@google.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260325151004.GD1141718@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,linuxfoundation.org,google.com,linux.intel.com,samsung.com,gmail.com,linux-foundation.org,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35466-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,amitsd.google.com,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AE1832B900
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lee,

Thanks for the review!

On 3/25/26 8:10 AM, Lee Jones wrote:
> On Sat, 14 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:
>
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add register bitmasks for charger function.
>>
>> In addition split the charger IRQs further such that each bit represents
>> an IRQ downstream of charger regmap irq chip. In addition populate the
>> ack_base to offload irq ack to the regmap irq chip framework.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>> ---
>>   drivers/mfd/max77759.c       |  91 ++++++++++++++++++++--
>>   include/linux/mfd/max77759.h | 176 ++++++++++++++++++++++++++++++++++++-------
>>   2 files changed, 230 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
>> index a7efe233ec8c..288746f675b8 100644
>> --- a/drivers/mfd/max77759.c
>> +++ b/drivers/mfd/max77759.c
>> @@ -201,8 +201,24 @@ static const struct regmap_config max77759_regmap_config_charger = {
>>    *         - SYSUVLO_INT
>>    *         - FSHIP_NOT_RD
>>    *     - CHGR_INT: charger
>> - *       - CHG_INT
>> - *       - CHG_INT2
>> + *       - INT1
>> + *         - AICL
>> + *         - CHGIN
>> + *         - WCIN
>> + *         - CHG
>> + *         - BAT
>> + *         - INLIM
>> + *         - THM2
>> + *         - BYP
>> + *       - INT2
>> + *         - INSEL
>> + *         - SYS_UVLO1
>> + *         - SYS_UVLO2
>> + *         - BAT_OILO
>> + *         - CHG_STA_CC
>> + *         - CHG_STA_CV
>> + *         - CHG_STA_TO
>> + *         - CHG_STA_DONE
>>    */
>>   enum {
>>   	MAX77759_INT_MAXQ,
>> @@ -256,8 +286,38 @@ static const struct regmap_irq max77759_topsys_irqs[] = {
>>   };
>>   
>>   static const struct regmap_irq max77759_chgr_irqs[] = {
>> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
>> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT1_AICL, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_AICL),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT1_CHGIN, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_CHGIN),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT1_WCIN, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_WCIN),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT1_CHG, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_CHG),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT1_BAT, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_BAT),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT1_INLIM, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_INLIM),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT1_THM2, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_THM2),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT1_BYP, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_BYP),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT2_INSEL, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_INSEL),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT2_SYS_UVLO1, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_SYS_UVLO1),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT2_SYS_UVLO2, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_SYS_UVLO2),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT2_BAT_OILO, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_BAT_OILO),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT2_CHG_STA_CC, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT2_CHG_STA_CV, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT2_CHG_STA_TO, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO),
>> +	REGMAP_IRQ_REG(MAX77759_CHGR_INT2_CHG_STA_DONE, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE),
>>   };
>>   
>>   static const struct regmap_irq_chip max77759_pmic_irq_chip = {
>> @@ -302,6 +362,7 @@ static const struct regmap_irq_chip max77759_chrg_irq_chip = {
> Minor nit: The new code in this patch consistently uses "chgr" as the prefix
> for charger-related names. To improve consistency, how about we rename this
> struct to `max77759_chgr_irq_chip`?

Sure I can rename it for the goal of maintaining consistency.


>
>>   	.domain_suffix = "CHGR",
>>   	.status_base = MAX77759_CHGR_REG_CHG_INT,
>>   	.mask_base = MAX77759_CHGR_REG_CHG_INT_MASK,
>> +	.ack_base = MAX77759_CHGR_REG_CHG_INT,
>>   	.num_regs = 2,
>>   	.irqs = max77759_chgr_irqs,
>>   	.num_irqs = ARRAY_SIZE(max77759_chgr_irqs),
>> @@ -325,8 +386,22 @@ static const struct resource max77759_gpio_resources[] = {
>>   };
>>   
>>   static const struct resource max77759_charger_resources[] = {
>> -	DEFINE_RES_IRQ_NAMED(MAX77759_CHARGER_INT_1, "INT1"),
>> -	DEFINE_RES_IRQ_NAMED(MAX77759_CHARGER_INT_2, "INT2"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT1_AICL,         "AICL"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT1_CHGIN,        "CHGIN"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT1_WCIN,         "WCIN"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT1_CHG,          "CHG"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT1_BAT,          "BAT"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT1_INLIM,        "INLIM"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT1_THM2,         "THM2"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT1_BYP,          "BYP"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT2_INSEL,        "INSEL"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT2_SYS_UVLO1,    "SYS_UVLO1"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT2_SYS_UVLO2,    "SYS_UVLO2"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT2_BAT_OILO,     "BAT_OILO"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT2_CHG_STA_CC,   "CHG_STA_CC"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT2_CHG_STA_CV,   "CHG_STA_CV"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT2_CHG_STA_TO,   "CHG_STA_TO"),
>> +	DEFINE_RES_IRQ_NAMED(MAX77759_CHGR_INT2_CHG_STA_DONE, "CHG_STA_DONE"),
>>   };
>>   
>>   static const struct mfd_cell max77759_cells[] = {
>> diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
>> index c6face34e385..fd5aea21ab2e 100644
>> --- a/include/linux/mfd/max77759.h
>> +++ b/include/linux/mfd/max77759.h
>> @@ -59,35 +59,65 @@
>>   #define MAX77759_MAXQ_REG_AP_DATAIN0            0xb1
>>   #define MAX77759_MAXQ_REG_UIC_SWRST             0xe0
>>   
>> -#define MAX77759_CHGR_REG_CHG_INT               0xb0
>> -#define MAX77759_CHGR_REG_CHG_INT2              0xb1
>> -#define MAX77759_CHGR_REG_CHG_INT_MASK          0xb2
>> -#define MAX77759_CHGR_REG_CHG_INT2_MASK         0xb3
>> -#define MAX77759_CHGR_REG_CHG_INT_OK            0xb4
>> -#define MAX77759_CHGR_REG_CHG_DETAILS_00        0xb5
>> -#define MAX77759_CHGR_REG_CHG_DETAILS_01        0xb6
>> -#define MAX77759_CHGR_REG_CHG_DETAILS_02        0xb7
>> -#define MAX77759_CHGR_REG_CHG_DETAILS_03        0xb8
>> -#define MAX77759_CHGR_REG_CHG_CNFG_00           0xb9
>> -#define MAX77759_CHGR_REG_CHG_CNFG_01           0xba
>> -#define MAX77759_CHGR_REG_CHG_CNFG_02           0xbb
>> -#define MAX77759_CHGR_REG_CHG_CNFG_03           0xbc
>> -#define MAX77759_CHGR_REG_CHG_CNFG_04           0xbd
>> -#define MAX77759_CHGR_REG_CHG_CNFG_05           0xbe
>> -#define MAX77759_CHGR_REG_CHG_CNFG_06           0xbf
>> -#define MAX77759_CHGR_REG_CHG_CNFG_07           0xc0
>> -#define MAX77759_CHGR_REG_CHG_CNFG_08           0xc1
>> -#define MAX77759_CHGR_REG_CHG_CNFG_09           0xc2
>> -#define MAX77759_CHGR_REG_CHG_CNFG_10           0xc3
>> -#define MAX77759_CHGR_REG_CHG_CNFG_11           0xc4
>> -#define MAX77759_CHGR_REG_CHG_CNFG_12           0xc5
>> -#define MAX77759_CHGR_REG_CHG_CNFG_13           0xc6
>> -#define MAX77759_CHGR_REG_CHG_CNFG_14           0xc7
>> -#define MAX77759_CHGR_REG_CHG_CNFG_15           0xc8
>> -#define MAX77759_CHGR_REG_CHG_CNFG_16           0xc9
>> -#define MAX77759_CHGR_REG_CHG_CNFG_17           0xca
>> -#define MAX77759_CHGR_REG_CHG_CNFG_18           0xcb
>> -#define MAX77759_CHGR_REG_CHG_CNFG_19           0xcc
>> +#define MAX77759_CHGR_REG_CHG_INT                      0xb0
>> +#define   MAX77759_CHGR_REG_CHG_INT_AICL               BIT(7)
>> +#define   MAX77759_CHGR_REG_CHG_INT_CHGIN              BIT(6)
>> +#define   MAX77759_CHGR_REG_CHG_INT_WCIN               BIT(5)
>> +#define   MAX77759_CHGR_REG_CHG_INT_CHG                BIT(4)
>> +#define   MAX77759_CHGR_REG_CHG_INT_BAT                BIT(3)
>> +#define   MAX77759_CHGR_REG_CHG_INT_INLIM              BIT(2)
>> +#define   MAX77759_CHGR_REG_CHG_INT_THM2               BIT(1)
>> +#define   MAX77759_CHGR_REG_CHG_INT_BYP                BIT(0)
>> +#define MAX77759_CHGR_REG_CHG_INT2                     0xb1
>> +#define   MAX77759_CHGR_REG_CHG_INT2_INSEL             BIT(7)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_SYS_UVLO1         BIT(6)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_SYS_UVLO2         BIT(5)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_BAT_OILO          BIT(4)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC        BIT(3)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV        BIT(2)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO        BIT(1)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE      BIT(0)
>> +#define MAX77759_CHGR_REG_CHG_INT_MASK                 0xb2
>> +#define MAX77759_CHGR_REG_CHG_INT2_MASK                0xb3
>> +#define MAX77759_CHGR_REG_CHG_INT_OK                   0xb4
>> +#define MAX77759_CHGR_REG_CHG_DETAILS_00               0xb5
>> +#define   MAX77759_CHGR_REG_CHG_DETAILS_00_CHGIN_DTLS  GENMASK(6, 5)
>> +#define MAX77759_CHGR_REG_CHG_DETAILS_01               0xb6
>> +#define   MAX77759_CHGR_REG_CHG_DETAILS_01_BAT_DTLS    GENMASK(6, 4)
>> +#define   MAX77759_CHGR_REG_CHG_DETAILS_01_CHG_DTLS    GENMASK(3, 0)
>> +#define MAX77759_CHGR_REG_CHG_DETAILS_02               0xb7
>> +#define   MAX77759_CHGR_REG_CHG_DETAILS_02_CHGIN_STS   BIT(5)
>> +#define MAX77759_CHGR_REG_CHG_DETAILS_03               0xb8
>> +#define MAX77759_CHGR_REG_CHG_CNFG_00                  0xb9
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_00_MODE           GENMASK(3, 0)
>> +#define MAX77759_CHGR_REG_CHG_CNFG_01                  0xba
>> +#define MAX77759_CHGR_REG_CHG_CNFG_02                  0xbb
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_02_CHGCC          GENMASK(5, 0)
>> +#define MAX77759_CHGR_REG_CHG_CNFG_03                  0xbc
>> +#define MAX77759_CHGR_REG_CHG_CNFG_04                  0xbd
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_04_CHG_CV_PRM     GENMASK(5, 0)
>> +#define MAX77759_CHGR_REG_CHG_CNFG_05                  0xbe
>> +#define MAX77759_CHGR_REG_CHG_CNFG_06                  0xbf
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_06_CHGPROT        GENMASK(3, 2)
>> +#define MAX77759_CHGR_REG_CHG_CNFG_07                  0xc0
>> +#define MAX77759_CHGR_REG_CHG_CNFG_08                  0xc1
>> +#define MAX77759_CHGR_REG_CHG_CNFG_09                  0xc2
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM     GENMASK(6, 0)
>> +#define MAX77759_CHGR_REG_CHG_CNFG_10                  0xc3
>> +#define MAX77759_CHGR_REG_CHG_CNFG_11                  0xc4
>> +#define MAX77759_CHGR_REG_CHG_CNFG_12                  0xc5
>> +/* Wireless Charging input channel select */
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_12_WCINSEL        BIT(6)
>> +/* CHGIN/USB input channel select */
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_12_CHGINSEL       BIT(5)
>> +#define MAX77759_CHGR_REG_CHG_CNFG_13                  0xc6
>> +#define MAX77759_CHGR_REG_CHG_CNFG_14                  0xc7
>> +#define MAX77759_CHGR_REG_CHG_CNFG_15                  0xc8
>> +#define MAX77759_CHGR_REG_CHG_CNFG_16                  0xc9
>> +#define MAX77759_CHGR_REG_CHG_CNFG_17                  0xca
>> +#define MAX77759_CHGR_REG_CHG_CNFG_18                  0xcb
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_18_WDTEN          BIT(0)
>> +#define MAX77759_CHGR_REG_CHG_CNFG_19                  0xcc
>>   
>>   /* MaxQ opcodes for max77759_maxq_command() */
>>   #define MAX77759_MAXQ_OPCODE_MAXLENGTH (MAX77759_MAXQ_REG_AP_DATAOUT32 - \
>> @@ -101,6 +131,94 @@
>>   #define MAX77759_MAXQ_OPCODE_USER_SPACE_READ     0x81
>>   #define MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE    0x82
>>   
>> +/*
>> + * Charger Input Status
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE:
>> + *     Charger input voltage (Vchgin) < Under Voltage Threshold (Vuvlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE: Vchgin > Vuvlo and
>> + *     Vchgin < (Battery Voltage (Vbatt) + system voltage (Vsys))
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE:
>> + *     Vchgin > Over Voltage threshold (Vovlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID:
>> + *     Vchgin > Vuvlo, Vchgin < Vovlo and Vchgin > (Vsys + Vbatt)
>> + */
>> +enum max77759_chgr_chgin_dtls_status {
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID,
>> +};
>> +
>> +/*
>> + * Battery Details
>> + * @MAX77759_CHGR_BAT_DTLS_NO_BATT_CHG_SUSP:
>> + *     No battery and the charger suspended
>> + * @MAX77759_CHGR_BAT_DTLS_DEAD_BATTERY: Vbatt < Vtrickle
>> + * @MAX77759_CHGR_BAT_DTLS_BAT_CHG_TIMER_FAULT:
>> + *     Charging suspended due to timer fault
>> + * @MAX77759_CHGR_BAT_DTLS_BAT_OKAY:
>> + *     Battery okay and Vbatt > Min Sys Voltage (Vsysmin)
>> + * @MAX77759_CHGR_BAT_DTLS_BAT_UNDERVOLTAGE:
>> + *     Battery is okay. Vtrickle < Vbatt < Vsysmin
>> + * @MAX77759_CHGR_BAT_DTLS_BAT_OVERVOLTAGE:
>> + *     Battery voltage > Overvoltage threshold
>> + * @MAX77759_CHGR_BAT_DTLS_BAT_OVERCURRENT:
>> + *     Battery current exceeds overcurrent threshold
>> + * @MAX77759_CHGR_BAT_DTLS_BAT_ONLY_MODE:
>> + *     Battery only mode and battery level not available
>> + */
>> +enum max77759_chgr_bat_dtls_states {
>> +	MAX77759_CHGR_BAT_DTLS_NO_BATT_CHG_SUSP,
>> +	MAX77759_CHGR_BAT_DTLS_DEAD_BATTERY,
>> +	MAX77759_CHGR_BAT_DTLS_BAT_CHG_TIMER_FAULT,
>> +	MAX77759_CHGR_BAT_DTLS_BAT_OKAY,
>> +	MAX77759_CHGR_BAT_DTLS_BAT_UNDERVOLTAGE,
>> +	MAX77759_CHGR_BAT_DTLS_BAT_OVERVOLTAGE,
>> +	MAX77759_CHGR_BAT_DTLS_BAT_OVERCURRENT,
>> +	MAX77759_CHGR_BAT_DTLS_BAT_ONLY_MODE,
>> +};
>> +
>> +/*
>> + * Charger Details
>> + * @MAX77759_CHGR_CHG_DTLS_PREQUAL: Charger in prequalification mode
>> + * @MAX77759_CHGR_CHG_DTLS_CC:      Charger in fast charge const curr mode
>> + * @MAX77759_CHGR_CHG_DTLS_CV:      Charger in fast charge const voltage mode
>> + * @MAX77759_CHGR_CHG_DTLS_TO:      Charger is in top off mode
>> + * @MAX77759_CHGR_CHG_DTLS_DONE:    Charger is done
>> + * @MAX77759_CHGR_CHG_DTLS_RSVD_1:  Reserved
>> + * @MAX77759_CHGR_CHG_DTLS_TIMER_FAULT:   Charger is in timer fault mode
>> + * @MAX77759_CHGR_CHG_DTLS_SUSP_BATT_THM:
>> + *     Charger is suspended as bettery removal detected
> Typo here, s/bettery/battery/.

Will fix.


>
>> + * @MAX77759_CHGR_CHG_DTLS_OFF:
>> + *     Charger is off. Input invalid or charger disabled
>> + * @MAX77759_CHGR_CHG_DTLS_RSVD_2:  Reserved
>> + * @MAX77759_CHGR_CHG_DTLS_RSVD_3:  Reserved
>> + * @MAX77759_CHGR_CHG_DTLS_OFF_WDOG_TIMER:
>> + *     Charger is off as watchdog timer expired
>> + * @MAX77759_CHGR_CHG_DTLS_SUSP_JEITA:    Charger is in JEITA control mode
>> + */
>> +enum max77759_chgr_chg_dtls_states {
> Just a small style suggestion, could you please align the descriptions in this
> kerneldoc block? It improves readability. Using a consistent number of spaces
> or tabs after the colon helps.
>
> Feel free to use up to 100-chars if it improves readability.

I will try to align the descriptions for enumerators inside each enum. 
Since I can use 100 chars I can try to fit the descriptions in a single 
line for this and  `enum max77759_chgr_bat_dtls_states` as well. Hope 
that's okay?


BR,

Amit


