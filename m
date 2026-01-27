Return-Path: <linux-usb+bounces-32760-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JS9DCYQeGnqngEAu9opvQ
	(envelope-from <linux-usb+bounces-32760-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 02:08:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCFC8EA00
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 02:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2321A3025D2B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 01:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A77121D3CA;
	Tue, 27 Jan 2026 01:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YSOrMhnw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD18207A20
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 01:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476091; cv=none; b=AwDkP2MjAyrANV4X8Cx8FMYx7yRu7Vp2jDT/amiH87C82txxoTjcqom3lCBctSOBmcn3ds9xgHaKCg+M8Dg0z5VLwpdrXpwJQHJc4zEGn9cfsjszwSeDt0tts7BOhBu2FSOGPxCzkCLGxn1HdYa0/Qsbi+gz6aI+c/7vHa0WWMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476091; c=relaxed/simple;
	bh=kTC8SpEnQvbvmgYcHhwJO/QuVdlOgR21+GrsFAyhgvM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=neFrVW6X6+4dnFN0JeGhxQDo6HilB5zGoooOfA08eqnRG4xnEgyeEZuU1Pb641UiXvixmtLa12zH+1e6dAoR7a5h+7Vam0AmFXjxihn9kAftpxVFslimwGGfno52Dq443+5jSTz58ahBnL3XoYQ2/mEL29cuPuhsra3tdr1gCbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YSOrMhnw; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1233b953bebso12808626c88.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 17:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769476088; x=1770080888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NuNdTfBRKHbZs0pq9qEm16VabkampCsi8zuWM9+u4LA=;
        b=YSOrMhnw4E/BMO/EfyPvtiWjYKOormU/OGz9KOUfIljwdqArjfVmepH1wYXTmhvqzK
         QGKAiPmNdeswBnYxsGFy/os+cNnzSXIzUqtWDeoFqFV3fqpVjgOuvGZTlWgW70+41GtQ
         UulE/eEZGSINWSqN+dzjgKhsGQX1WCQ94KpdY3+FUZWU4xtrhECii/xgD4YdZJJ8+fMU
         jB6guD0AodBjKhbL0D6DEkN2vRLqg3sA8/3CWU6bOlthzWYTLteR9MmnGeKiYWETvmLq
         FwKyHLTiwqLPDyyulXS+vibPzK9WkCsEpkpDVJuX+pP0l8gE4cAzHwXthzvdQ3foWJzH
         TC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476088; x=1770080888;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuNdTfBRKHbZs0pq9qEm16VabkampCsi8zuWM9+u4LA=;
        b=IkdkVbrZGUidM6NsAjkSVkgalMmGZ7K//mn4r57aN+WBQ8vexQN22mFRWvEcwOVKp4
         /t9NgKPaD0KzxhTej67eaqOz8nNbqjZxJmob5dGH9PO373dNFoxxqcDfcAFZX2dj3w3F
         alNCPLH2e6IoMLQF3Wrc4WVd74iEoHQguKOLJqFeuPueY110ZBE0dRZcHOoC2Wr2zycP
         yMwzhRP3oVFRgnMP4uLh02uaWHNUF6qxl4rboNmcRK1yJsrR+W6Vo1Fr5/ESV3311i6o
         xtcHHgM+tRkmfZ1PAh4M9BiUDlpoVEnZcMlVtN7ojoKZ6+VQR+ReibhRUmyNmTuXjDal
         OYuA==
X-Forwarded-Encrypted: i=1; AJvYcCVPCV3wGeKeRQEs679ycmRlIy8mUFitxudSEnd0558J/Um3uyuJ+AApGjnCiClQy0GG1tRX4D0zvAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK2sfzas9GjbRk3uZWmqIByspNj2wHBOTRmtKnentys+x7AMB+
	sVRwX8AFg1scDB/VUk1eTcz4gG1Rr9bPijANRqNZjhPizCBdhtj/bR5GEjo1nHW+WQ==
X-Gm-Gg: AZuq6aKb9po/wqpVDFH5/Y02cHsHZjZ4/gi1S2ZWRJlmRZt5kFqn5Mjfd8W1dRzJVyh
	lMdOnkGZuUOl71ftfkIoiwoxQ8YTI/t+Gx4Z/cm9iTaV1D5jK4vqWYhkyVfUNh3G1Fzpw+SbB93
	cDz0fTmqus4apSdcTmKndJKLGrPqI9rW5ezqRcvTngBYTInJj7lmB571q4SAUGUm4D0CR9YBo6f
	Ew877mhg2YhMhzW7rJOpph1yMYYHTxRTItVYwM0GBxP9A3FQwFjczb0knxsxBsWzhpVmC7NYyZ4
	KtKVRUom6MEkdAMkJWTqw2wzpZ+w4SvphnlWmJe8XDb8o6ir3N0+xEK8rtZo+3Ap7RgONXFGOE6
	KNr7utOIclXJV18/QlMA2iV3MRtY9DWhTBtoKNwSWuHhqFcwlmMUAwU7qhwVUcsBc2cs6JmIm95
	YmfGkSBoA7Po0fQWDm+iaARD5r0ETdNC4RX3xtH0wUUq96BeJDkpjBUrUeRtCgKx/VbE1c+U/xy
	G1PgPPRWC+fcA==
X-Received: by 2002:a05:7022:2485:b0:119:e56b:c73d with SMTP id a92af1059eb24-124a006801fmr22088c88.2.1769476087269;
        Mon, 26 Jan 2026 17:08:07 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:8902:a6ab:edb7:522b? ([2a00:79e0:2e7c:8:8902:a6ab:edb7:522b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d91c52bsm22164484c88.6.2026.01.26.17.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 17:08:06 -0800 (PST)
Message-ID: <ff8d1c62-3bb3-4026-b69e-db26e939aa28@google.com>
Date: Mon, 26 Jan 2026 17:08:04 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] power: supply: max77759: add charger driver
From: Amit Sunil Dhamne <amitsd@google.com>
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
References: <20260121-max77759-charger-v4-0-694234c8ded1@google.com>
 <20260121-max77759-charger-v4-4-694234c8ded1@google.com>
 <71d816c5ed4ee2d13ec63b8fd4acd49f4e418284.camel@linaro.org>
 <bf3bd5f7-28e1-4fe3-afca-34f12b2cede8@google.com>
Content-Language: en-US
In-Reply-To: <bf3bd5f7-28e1-4fe3-afca-34f12b2cede8@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32760-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dowhile0.org:email]
X-Rspamd-Queue-Id: 9CCFC8EA00
X-Rspamd-Action: no action

Hi Andre',

On 1/22/26 4:07 PM, Amit Sunil Dhamne wrote:
> Hi Andre',
>
> On 1/22/26 4:47 AM, André Draszik wrote:
>> Hi Amit,
>>
>> Thanks for your patches, just a few minor comments below.
>
> Thanks for your feedback!
>
>
>>
>> On Wed, 2026-01-21 at 00:59 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>
>>> Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
>>> Li+/LiPoly dual input switch mode charger. While the device can support
>>> USB & wireless charger inputs, this implementation only supports USB
>>> input. This implementation supports both buck and boost modes.
>>>
>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>> ---
>>>   MAINTAINERS                             |   6 +
>>>   drivers/power/supply/Kconfig            |  11 +
>>>   drivers/power/supply/Makefile           |   1 +
>>>   drivers/power/supply/max77759_charger.c | 737 
>>> ++++++++++++++++++++++++++++++++
>>>   4 files changed, 755 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 
>>> 0d044a58cbfe0f2b97f3682a86708e1ece108e9f..38354964a85c34611b1b54e20651b360f3b9c11e 
>>> 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -15546,6 +15546,12 @@ F:    drivers/mfd/max77759.c
>>>   F:    drivers/nvmem/max77759-nvmem.c
>>>   F:    include/linux/mfd/max77759.h
>>>   +MAXIM MAX77759 BATTERY CHARGER DRIVER
>>> +M:    Amit Sunil Dhamne <amitsd@google.com>
>>> +L:    linux-kernel@vger.kernel.org
>>> +S:    Maintained
>>> +F:    drivers/power/supply/max77759_charger.c
>>> +
>>>   MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>>>   M:    Javier Martinez Canillas <javier@dowhile0.org>
>>>   L:    linux-kernel@vger.kernel.org
>>> diff --git a/drivers/power/supply/Kconfig 
>>> b/drivers/power/supply/Kconfig
>>> index 
>>> 92f9f7aae92f249aa165e68dbcd4cebb569286ea..3a2cdb95c98e44324151ac2b86d740ae2923ee77 
>>> 100644
>>> --- a/drivers/power/supply/Kconfig
>>> +++ b/drivers/power/supply/Kconfig
>>> @@ -631,6 +631,17 @@ config CHARGER_MAX77705
>>>       help
>>>         Say Y to enable support for the Maxim MAX77705 battery charger.
>>>   +config CHARGER_MAX77759
>>> +    tristate "Maxim MAX77759 battery charger driver"
>>> +    depends on MFD_MAX77759 && REGULATOR
>>> +    default MFD_MAX77759
>>> +    help
>>> +      Say M or Y here to enable the MAX77759 battery charger. MAX77759
>>> +      charger is a function of the MAX77759 PMIC. This is a dual input
>>> +      switch-mode charger. This driver supports buck and OTG boost 
>>> modes.
>>> +
>>> +      If built as a module, it will be called max77759_charger.
>>> +
>>>   config CHARGER_MAX77976
>>>       tristate "Maxim MAX77976 battery charger driver"
>>>       depends on I2C
>>> diff --git a/drivers/power/supply/Makefile 
>>> b/drivers/power/supply/Makefile
>>> index 
>>> 4b79d5abc49a7fd1e37a26d0c89f94d9fe3a916f..6af905875ad5e3b393a7030405355b9a975870f6 
>>> 100644
>>> --- a/drivers/power/supply/Makefile
>>> +++ b/drivers/power/supply/Makefile
>>> @@ -128,3 +128,4 @@ obj-$(CONFIG_CHARGER_SURFACE)    += 
>>> surface_charger.o
>>>   obj-$(CONFIG_BATTERY_UG3105)    += ug3105_battery.o
>>>   obj-$(CONFIG_CHARGER_QCOM_SMB2)    += qcom_smbx.o
>>>   obj-$(CONFIG_FUEL_GAUGE_MM8013)    += mm8013.o
>>> +obj-$(CONFIG_CHARGER_MAX77759)    += max77759_charger.o
>>> diff --git a/drivers/power/supply/max77759_charger.c 
>>> b/drivers/power/supply/max77759_charger.c
>>> new file mode 100644
>>> index 
>>> 0000000000000000000000000000000000000000..34b5ea0967eb7b4716e81ee1a55227ac872493b0
>>> --- /dev/null
>>> +++ b/drivers/power/supply/max77759_charger.c
>>> @@ -0,0 +1,737 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * max77759_charger.c - Battery charger driver for MAX77759 charger 
>>> device.
>>> + *
>>> + * Copyright 2025 Google LLC.
>>> + */
>>> +
>>> +#include <linux/bitfield.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/device.h>
>>> +#include <linux/devm-helpers.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/irq.h>
>>> +#include <linux/math64.h>
>>> +#include <linux/mfd/max77759.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/power_supply.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/regulator/driver.h>
>>> +#include <linux/string_choices.h>
>>> +
>>> +/* Default values for Fast Charge Current & Float Voltage */
>>> +#define CHG_CC_DEFAULT_UA            2266770
>>> +#define CHG_FV_DEFAULT_MV            4300
>>> +
>>> +#define FOREACH_IRQ(S)            \
>>> +    S(AICL),            \
>>> +    S(CHGIN),            \
>>> +    S(CHG),                \
>>> +    S(INLIM),            \
>>> +    S(BAT_OILO),            \
>>> +    S(CHG_STA_CC),            \
>>> +    S(CHG_STA_CV),            \
>>> +    S(CHG_STA_TO),            \
>>> +    S(CHG_STA_DONE)
>>> +
>>> +#define GENERATE_ENUM(e)        e
>>> +#define GENERATE_STRING(s)        #s
>>> +
>>> +enum {
>>> +    FOREACH_IRQ(GENERATE_ENUM)
>>> +};
>>> +
>>> +static const char *const chgr_irqs_str[] = {
>>> +    FOREACH_IRQ(GENERATE_STRING)
>>> +};
>>> +
>>> +#define NUM_IRQS            ARRAY_SIZE(chgr_irqs_str)
>>> +
>>> +struct max77759_charger {
>>> +    struct device *dev;
>>> +    struct regmap *regmap;
>>> +    struct power_supply *psy;
>>> +    struct regulator_dev *chgin_otg_rdev;
>>> +    struct notifier_block nb;
>>> +    struct power_supply *tcpm_psy;
>>> +    struct work_struct psy_work;
>>> +    int irqs[NUM_IRQS];
>>> +    struct mutex lock; /* protects the state below */
>>> +    enum max77759_chgr_mode mode;
>>> +};
>>> +
>>> +static inline int regval_to_val(int reg, int reg_offset, int step, 
>>> int minval)
>>> +{
>>> +    return ((reg - reg_offset) * step) + minval;
>>> +}
>>> +
>>> +static inline int val_to_regval(int val, int minval, int step, int 
>>> reg_offset)
>>> +{
>>> +    s64 dividend;
>>> +
>>> +    if (unlikely(step == 0))
>>> +        return reg_offset;
>> Does it really make an impact on performance to specify unlikely? 
>> Also, I seem to
>> remember that the if branch is treated as unlikely anyway, but can't 
>> find any hard
>> evidence on that right now.
>
> I was hoping it's performance improving even if negligible, though I 
> don't have evidence to support either arguments. In any case, I kept 
> it for readability.
>
>
>>
>>> +
>>> +    dividend = (s64)val - minval;
>>> +    return DIV_S64_ROUND_CLOSEST(dividend, step) + reg_offset;
>>> +}
>> For these two functions above, have you considered using the APIs from
>> include/linux/linear_range.h instead of duplicating in this driver? The
>> implementations of the above match linear_range_get_value() and
>> linear_range_get_selector_low() quite nicely.
>
> I think it looks useful, will check it out.
>
>
>>> +
>>> +static inline int unlock_prot_regs(struct max77759_charger *chg, 
>>> bool unlock)
>>> +{
>>> +    return regmap_update_bits(chg->regmap, 
>>> MAX77759_CHGR_REG_CHG_CNFG_06,
>>> +                  MAX77759_CHGR_REG_CHG_CNFG_06_CHGPROT, unlock
>>> +                  ? MAX77759_CHGR_REG_CHG_CNFG_06_CHGPROT : 0);
>>> +}
>>> +
>> [...]
>>
>>> +static irqreturn_t irq_handler(int irq, void *data)
>>> +{
>>> +    struct max77759_charger *chg = data;
>>> +    struct device *dev = chg->dev;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < NUM_IRQS && chg->irqs[i] != irq; i++)
>>> +        ;
>>> +
>>> +    if (i == NUM_IRQS) {
>>> +        dev_err(dev, "Unable to handle irq=%d", irq);
>>> +        return IRQ_NONE;
>>> +    } else if (i == BAT_OILO) {
>>> +        dev_warn(dev, "Battery over-current threshold crossed");
>>> +    }
>> Generally, no 'else' is required after return.
>
> I will refactor it in the next rev.
>
>
>>> +
>>> +    power_supply_changed(chg->psy);
>>> +    return IRQ_HANDLED;
>>> +}
>>> +
>> [...]
>>
>>> +static void psy_work_item(struct work_struct *work)
>>> +{
>>> +    struct max77759_charger *chg =
>>> +        container_of(work, struct max77759_charger, psy_work);
>>> +    union power_supply_propval current_limit, online;
>>> +    int ret;
>>> +
>>> +    ret = power_supply_get_property(chg->tcpm_psy,
>>> +                    POWER_SUPPLY_PROP_CURRENT_MAX,
>>> +                    &current_limit);
>>> +    if (ret) {
>>> +        dev_err(chg->dev,
>>> +            "Failed to get CURRENT_MAX psy property, ret=%d",
>>> +            ret);
>>> +        return;
>>> +    }
>>> +
>>> +    ret = power_supply_get_property(chg->tcpm_psy, 
>>> POWER_SUPPLY_PROP_ONLINE,
>>> +                    &online);
>>> +    if (ret) {
>>> +        dev_err(chg->dev,
>>> +            "Failed to get ONLINE psy property, ret=%d",
>>> +            ret);
>>> +        return;
>>> +    }
>>> +
>>> +    if (online.intval && current_limit.intval) {
>>> +        ret = set_input_current_limit(chg, current_limit.intval);
>>> +        if (ret)
>>> +            dev_err(chg->dev,
>>> +                "Unable to set current limit, ret=%d", ret);
>>> +
>>> +        charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON);
>>> +    } else {
>>> +        charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
>>> +    }
>> For all the possible errors in this function, should the driver try a 
>> bit
>> harder, even if unlikely to occur?
>
> Maybe we can do this:
>
> On failure of either of the power_supply_get_property() calls or 
> set_input_current_limit(), we should first turn off the charger (as 
> that's the safest choice) and reschedule this work for a certain 
> number of times (maybe 3). Obviously, if we recover from this state, 
> we reset the error limit and don't reschedule this work anymore. Do 
> you concur?
>
>
>> What if the current limit needed to be
>> reduced, e.g. due to thermal or any other reasons?
>
> This specific piece of code is for setting current limit that is 
> driven by USB Type-C subsystem. If the Type-C subsystem re-negotiates 
> a PD contract this piece of code will re-run as this subsystem will be 
> re-notified by TCPM. For cases where we need to cap the current limit 
> due to thermal management, that's a hardware driven feature. It is 
> enabled by enabling JEITA management. That's not in the scope atm.
>
>
>>
>> Could rescheduling the work be something to consider?
>>
> Responded in the previous comment.. 


Following up on this comment, in case you missed it :)


Thanks,

Amit


