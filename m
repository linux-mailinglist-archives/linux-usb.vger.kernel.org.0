Return-Path: <linux-usb+bounces-10680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310D8D3B30
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 17:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66F401C22221
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 15:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F78181CF7;
	Wed, 29 May 2024 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPLZa1jp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F1C219FC
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997306; cv=none; b=E/GHNIudhHP4ixy5RByW1RWFypW+moyEWVr+5jRnfVaKEYCsnHLiZtmHNYBvQopstIlxHs4HFVwU1ZXHXMV6PVJqsEe8TEmVfaT9ap7aCFVE8m0oehbp9yKvnmbChaeddeq3dM7m1UXmhs5XWbVMCPHPH7bcxFVz+nmj6QDPv1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997306; c=relaxed/simple;
	bh=6y1oCo4DKqnvTKrWAni22CK+MS7HQ51Og7J50Sv/9XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7q4nRDebwj5H658GbciR7uVsbPgfWpN3+ozucKyuzv3jqTD+xt44KQB5gVYl6pohT3MBLoORLL7SI3cVNA8K/xSK/8u5b7wVHq9D3XZxx5ZbdHZoEr4uLxq0DuljqmQvdvt/l8J1G6sax4PGOgdGmku14L2t2XkYpF9hIskgjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPLZa1jp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35af7bf408aso2120598f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716997303; x=1717602103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4HbbIwVhQ8OurjkPgt7eXPYfY1OZfSmqAUwwAgEnTI=;
        b=xPLZa1jpZnbDDLPJXbcxOcZnFG9NrtGT36cYfiBfCJ7RQMrRGjNdeLIXXpzeITYu5K
         d+VHBNzphr3I8toFvHS7jYFijG7fSxRFFlu52OhYk/OyM1GujpSZDF2LqQU1FfVv2060
         QmjI5ZbMdvei0svyl/xDbFvKCoCngyMq2JD+g55zRvVnn9tGptUy/A562k6qwCYy/7Ek
         X1+fC2omcAC6JOGosfdntSxbnJePpPm+8gXF9QVGPo5jgDh+98n3fXjg4CM2h9ROVWtb
         GuYBPLMCtWvj4y+haNIzbtpIYD4V9nMT/v5pUeGVLmlVvgO8AvAM06fQ6Cbru62/QVqx
         83Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716997303; x=1717602103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4HbbIwVhQ8OurjkPgt7eXPYfY1OZfSmqAUwwAgEnTI=;
        b=Lh7Er+pUDD/9MsCKDKLSEzx7Yqd5DqfrshXNVmXEpoaC/QCn2awgo0u0pxS4hO1zNU
         u/qIzP96IbBM6ycD2ymIzkW8xnf71gyK2jWawXad+4gG1WT9XBWlqKdFs2Mnpzc9sOBm
         4qm4sfmfI1/ldEfXR6nYEzHtrgXaZHAl6/rwpe6eq8PsIKUAoCg9IXMuudk739x5Ganj
         fAJeOwtg1wkt7y3TvI1kMdLkDQQ9Cnqam91SnCiyssJehbq022InEM31acf9kWLGObZp
         VYb9rhi6aweG6D0R2m2A+A2QOZDTv5l4o2fMONbPVUcctArLqpsEAOYGDc4wwsMAvynn
         1/xw==
X-Forwarded-Encrypted: i=1; AJvYcCV4MyUR8wK5+IE74vFnxVw2fY4zPIps0dQDnp0Agpn5803RuviKc8RZz5YOiiTS8h5n69ET46VA/MuuI06A0aHHku3Zvu1obL/V
X-Gm-Message-State: AOJu0Yw5/VoURs14XQC3bZqCt2nNNdabVTON1lhcumI0hUO95jAI7WMA
	CBNqpLFkeRj6P/nM7YSS5nEzkebjGgveOUd3Ce8NoDlGUWCe8COV67UzZvNOuXo=
X-Google-Smtp-Source: AGHT+IEpOVwItJgJAC/fiw+Mn/s+t+akmGAuN5LPgv1nurAMVATmXM94o+j9J0fb3nZmeMzmoJmpMw==
X-Received: by 2002:a5d:518a:0:b0:354:f4e6:f9cd with SMTP id ffacd0b85a97d-35526c34337mr12265772f8f.17.1716997302847;
        Wed, 29 May 2024 08:41:42 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c9303sm15266075f8f.88.2024.05.29.08.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:41:42 -0700 (PDT)
Message-ID: <afed0bee-de6e-4e86-8437-0518c616bd2c@linaro.org>
Date: Wed, 29 May 2024 16:41:40 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Nikita Travkin <nikita@trvn.ru>
References: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
 <20240528-yoga-ec-driver-v4-3-4fa8dfaae7b6@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240528-yoga-ec-driver-v4-3-4fa8dfaae7b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2024 21:44, Dmitry Baryshkov wrote:
> The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
> the onboard EC. Add glue driver to interface the platform's UCSI
> implementation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/ucsi/Kconfig          |   9 ++
>   drivers/usb/typec/ucsi/Makefile         |   1 +
>   drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 189 ++++++++++++++++++++++++++++++++
>   3 files changed, 199 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index bdcb1764cfae..680e1b87b152 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -69,4 +69,13 @@ config UCSI_PMIC_GLINK
>   	  To compile the driver as a module, choose M here: the module will be
>   	  called ucsi_glink.
>   
> +config UCSI_LENOVO_YOGA_C630
> +	tristate "UCSI Interface Driver for Lenovo Yoga C630"
> +	depends on EC_LENOVO_YOGA_C630
> +	help
> +	  This driver enables UCSI support on the Lenovo Yoga C630 laptop.
> +
> +	  To compile the driver as a module, choose M here: the module will be
> +	  called ucsi_yoga_c630.
> +
>   endif
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index b4679f94696b..aed41d23887b 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -21,3 +21,4 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
>   obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
>   obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
>   obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
> +obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> new file mode 100644
> index 000000000000..ca1ab5c81b87
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024, Linaro Ltd
> + * Authors:
> + *    Bjorn Andersson
> + *    Dmitry Baryshkov
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/lenovo-yoga-c630.h>
> +
> +#include "ucsi.h"
> +
> +struct yoga_c630_ucsi {
> +	struct yoga_c630_ec *ec;
> +	struct ucsi *ucsi;
> +	struct notifier_block nb;
> +	struct completion complete;
> +	unsigned long flags;
> +#define UCSI_C630_COMMAND_PENDING	0
> +#define UCSI_C630_ACK_PENDING		1
> +	u16 version;
> +};
> +
> +static  int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
> +				void *val, size_t val_len)
> +{
> +	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
> +	u8 buf[YOGA_C630_UCSI_READ_SIZE];
> +	int ret;
> +
> +	ret = yoga_c630_ec_ucsi_read(uec->ec, buf);
> +	if (ret)
> +		return ret;
> +
> +	if (offset == UCSI_VERSION) {
> +		memcpy(val, &uec->version, min(val_len, sizeof(uec->version)));
> +		return 0;
> +	}
> +
> +	if (offset == UCSI_CCI)
> +		memcpy(val, buf,
> +		       min(val_len, YOGA_C630_UCSI_CCI_SIZE));
> +	else if (offset == UCSI_MESSAGE_IN)
> +		memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
> +		       min(val_len, YOGA_C630_UCSI_DATA_SIZE));

For some reason I believe multi-lines like this, including function 
calls that are split over lines should be encapsulated with {}

else if(x) {
     memcpy(x,y,
            z);
}

If checkpatch doesn't complain about it feel free not to do that though.

> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static  int yoga_c630_ucsi_async_write(struct ucsi *ucsi, unsigned int offset,
> +				       const void *val, size_t val_len)
> +{
> +	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
> +
> +	if (offset != UCSI_CONTROL ||
> +	    val_len != YOGA_C630_UCSI_WRITE_SIZE)
> +		return -EINVAL;
> +
> +	return yoga_c630_ec_ucsi_write(uec->ec, val);
> +}
> +
> +static  int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
> +				      const void *val, size_t val_len)
> +{
> +	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
> +	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
> +	int ret;
> +
> +	if (ack)
> +		set_bit(UCSI_C630_ACK_PENDING, &uec->flags);
> +	else
> +		set_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
> +
> +	reinit_completion(&uec->complete);
> +
> +	ret = yoga_c630_ucsi_async_write(ucsi, offset, val, val_len);
> +	if (ret)
> +		goto out_clear_bit;
> +
> +	if (!wait_for_completion_timeout(&uec->complete, 5 * HZ))
> +		ret = -ETIMEDOUT;
> +
> +out_clear_bit:
> +	if (ack)
> +		clear_bit(UCSI_C630_ACK_PENDING, &uec->flags);
> +	else
> +		clear_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
> +
> +	return ret;
> +}
> +
> +const struct ucsi_operations yoga_c630_ucsi_ops = {
> +	.read = yoga_c630_ucsi_read,
> +	.sync_write = yoga_c630_ucsi_sync_write,
> +	.async_write = yoga_c630_ucsi_async_write,
> +};
> +
> +static int yoga_c630_ucsi_notify(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct yoga_c630_ucsi *uec = container_of(nb, struct yoga_c630_ucsi, nb);
> +	u32 cci;
> +	int ret;
> +
> +	if (action == LENOVO_EC_EVENT_USB || action == LENOVO_EC_EVENT_HPD) {
> +		ucsi_connector_change(uec->ucsi, 1);
> +		return NOTIFY_OK;
> +	}
> +
> +	if (action != LENOVO_EC_EVENT_UCSI)
> +		return NOTIFY_DONE;

Is this disjunction on action a good candidate for a switch(){}


> +
> +	ret = uec->ucsi->ops->read(uec->ucsi, UCSI_CCI, &cci, sizeof(cci));
> +	if (ret)
> +		return NOTIFY_DONE;
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(uec->ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	if (cci & UCSI_CCI_ACK_COMPLETE &&
> +	    test_bit(UCSI_C630_ACK_PENDING, &uec->flags))
> +		complete(&uec->complete);
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> +	    test_bit(UCSI_C630_COMMAND_PENDING, &uec->flags))
> +		complete(&uec->complete);

IMO these multi-line clauses should end up with a {} around the complete 
even though its not required.

Emphasis on the O.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

