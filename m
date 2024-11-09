Return-Path: <linux-usb+bounces-17388-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 807769C2A9C
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2024 07:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A359C1C23612
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2024 06:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1B513C9A9;
	Sat,  9 Nov 2024 06:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RoDe08tY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75C13D886
	for <linux-usb@vger.kernel.org>; Sat,  9 Nov 2024 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731133312; cv=none; b=WotxAz9+Q1J1TCBItKIeO+KwhJXc4mJAaxEzADLgmQxkdEsD6dgLhEXt1YeJPTVCa3+0aGgTWMlJNfggnb3XuygrazsE4NEBhiwE8t5mTL4gsbx+x72OhAIbzOlzaaWe9F6Klu8SgREKxSkcFf1IGd5vk0dVjfUb3IecRiJz/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731133312; c=relaxed/simple;
	bh=HI+hbcJQBSvnaHLJhWHBS5bJkF1jTrdjHZo5jkT8kmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyxjtOdf6TUfefMYW0zuL3QKN+462XVORWnyQL7TrmdRkauFiG4efmPZrep9qFu/qxeRhrRt++jfJhmTMeuI5bfMKw9M6e3AmgRAg9/i2tGyN2Qrt/o/A9Fm1bnwR0PKIM1C/oxBUMjh4+OHgyV5Dd7P68B7LJqogbTED8BExS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RoDe08tY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e13375d3so3481393e87.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2024 22:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731133308; x=1731738108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J06Gj0IdVPQbgBEpHNwQw4A4l8wwx40wfYwurfCo7PE=;
        b=RoDe08tYYP3LlxlNjUlix9jqxtfdN95oQi8G7IQIiSbW/ZImGNzQwlUCe3cdt2ZeuW
         /t9WJUVQpmOCoEHaWtfKGXO4tnbOGxyIJXs980zLVM6ni7rKWcQNmMVNJzPi/pPMFfq3
         w1dFZWtKCKQp36+oIdTxTu5m3LCZZUXA6LGo8ZIVQeWaOVa5Eb5oID89MXKGUc+W5e1c
         5IsYaqpXAU5qoknLtp2Dex/kzCoQxMydnfu9ZMRBD2IHe8ijHsJSlywrUldv0x4/e9p6
         gnS3jc4XPzo8DkG49epX+reavGbeyEL+jmCu9zadjK4I5mhQhy+aVpS/zRcqZby/zAyy
         wrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731133308; x=1731738108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J06Gj0IdVPQbgBEpHNwQw4A4l8wwx40wfYwurfCo7PE=;
        b=sjttO0eyqbQE1SwfVQu2P64DqxAvXnVBdHENHYuvnQ5yTHPOln3qw2+p21uiyla/i8
         4fmy+FiL6jzaXlcvvfKwL5uzSzuswzhGE81f1wxnLHu8Y/2ZAHLx4HmD7D1zlbeXpeQZ
         MaN80CgJSv5iJXE7NCkuvTQDSyxOnEi9EDeleQtporP+799wpMXd2bvmChUQfLt3qSV0
         Ivf9awl4V9kbZgBRE1Qm3VTqitDEmS8Z4n7Dqj25Vbsq5aSWXdK6EySdUZIHCuY04Wh2
         fFQ7XlUwcwskd+j+xZ/eNvlgvBvkPOsG3SQjcX9wgLuO2g6X00+4947pYQfRsNeSOc05
         05Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUKPi2C72bkQK7qb9PXV/QV2v1aAUoD9uRd13mPD1vnCkv6K1NQ1OvIQmKK1OuNR1UtNuAc0fANPuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuKEbISzwz2Pt+mtJNGSaV5lueXG+tARInlTFRnStaXSbL/5z9
	LcHuRj2jp2ZvGitEYE0h+zelN2D3Eh7UcMv6OXLKMI9KHsmPry7nkN+11x+KkzE=
X-Google-Smtp-Source: AGHT+IHMK6iVsQkGq91M3NfW5TipNRi9xILsR/Cu5hol20QnWTM3oKF0X3VA7NB7y3wwzcYDJBGkEw==
X-Received: by 2002:a05:6512:3f16:b0:539:d9e2:9d15 with SMTP id 2adb3069b0e04-53d8623fffcmr2746510e87.29.1731133308377;
        Fri, 08 Nov 2024 22:21:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826ae98csm860007e87.232.2024.11.08.22.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 22:21:46 -0800 (PST)
Date: Sat, 9 Nov 2024 08:21:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev, jthies@google.com, 
	akuchynski@google.com, pmalani@chromium.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] usb: typec: Add driver for Thunderbolt 3
 Alternate Mode
Message-ID: <iywsqdf2lzrd2fs3ipw4aykjjliirei556kuyr22a24ht6r74x@bwprbwk26prs>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
 <20241107112955.v3.2.I3080b036e8de0b9957c57c1c3059db7149c5e549@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107112955.v3.2.I3080b036e8de0b9957c57c1c3059db7149c5e549@changeid>

On Thu, Nov 07, 2024 at 11:29:55AM -0800, Abhishek Pandit-Subedi wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Thunderbolt 3 Alternate Mode entry flow is described in
> USB Type-C Specification Release 2.0.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
> Changes:
> * Delay cable + plug checks so that the module doesn't fail to probe
>   if cable + plug information isn't available by the time the partner
>   altmode is registered.
> * Remove unncessary brace after if (IS_ERR(plug))
> 
> The rest of this patch should be the same as Heikki's original RFC.
> 
> 
> Changes in v3:
> - Revert rename of TYPEC_TBT_MODE
> - Remove mode from typec_device_id
> 
> Changes in v2:
> - Use <linux/usb/typec_tbt.h> and add missing TBT_CABLE_ROUNDED
> - Pass struct typec_thunderbolt_data to typec_altmode_notify
> - Rename TYPEC_TBT_MODE to USB_TYPEC_TBT_MODE
> - Use USB_TYPEC_TBT_SID and USB_TYPEC_TBT_MODE for device id
> - Change module license to GPL due to checkpatch warning
> 
>  drivers/usb/typec/altmodes/Kconfig       |   9 +
>  drivers/usb/typec/altmodes/Makefile      |   2 +
>  drivers/usb/typec/altmodes/thunderbolt.c | 308 +++++++++++++++++++++++
>  include/linux/usb/typec_tbt.h            |   1 +
>  4 files changed, 320 insertions(+)
>  create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c
> 
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> index 1a6b5e872b0d..7867fa7c405d 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -23,4 +23,13 @@ config TYPEC_NVIDIA_ALTMODE
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called typec_nvidia.
>  
> +config TYPEC_TBT_ALTMODE
> +	tristate "Thunderbolt3 Alternate Mode driver"
> +	help
> +	  Select this option if you have Thunderbolt3 hardware on your
> +	  system.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called typec_thunderbolt.
> +
>  endmenu
> diff --git a/drivers/usb/typec/altmodes/Makefile b/drivers/usb/typec/altmodes/Makefile
> index 45717548b396..508a68351bd2 100644
> --- a/drivers/usb/typec/altmodes/Makefile
> +++ b/drivers/usb/typec/altmodes/Makefile
> @@ -4,3 +4,5 @@ obj-$(CONFIG_TYPEC_DP_ALTMODE)		+= typec_displayport.o
>  typec_displayport-y			:= displayport.o
>  obj-$(CONFIG_TYPEC_NVIDIA_ALTMODE)	+= typec_nvidia.o
>  typec_nvidia-y				:= nvidia.o
> +obj-$(CONFIG_TYPEC_TBT_ALTMODE)		+= typec_thunderbolt.o
> +typec_thunderbolt-y			:= thunderbolt.o
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
> new file mode 100644
> index 000000000000..a945b9d35a1d
> --- /dev/null
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * USB Typec-C Thuderbolt3 Alternate Mode driver
> + *
> + * Copyright (C) 2019 Intel Corporation
> + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/mutex.h>
> +#include <linux/module.h>
> +#include <linux/usb/pd_vdo.h>
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_tbt.h>
> +
> +enum tbt_state {
> +	TBT_STATE_IDLE,
> +	TBT_STATE_SOP_P_ENTER,
> +	TBT_STATE_SOP_PP_ENTER,
> +	TBT_STATE_ENTER,
> +	TBT_STATE_EXIT,
> +	TBT_STATE_SOP_PP_EXIT,
> +	TBT_STATE_SOP_P_EXIT
> +};
> +
> +struct tbt_altmode {
> +	enum tbt_state state;
> +	struct typec_cable *cable;
> +	struct typec_altmode *alt;
> +	struct typec_altmode *plug[2];
> +	u32 enter_vdo;
> +
> +	struct work_struct work;
> +	struct mutex lock; /* device lock */
> +};
> +
> +static bool tbt_ready(struct typec_altmode *alt);
> +
> +static int tbt_enter_mode(struct tbt_altmode *tbt)
> +{
> +	struct typec_altmode *plug = tbt->plug[TYPEC_PLUG_SOP_P];
> +	u32 vdo;
> +
> +	vdo = tbt->alt->vdo & (TBT_VENDOR_SPECIFIC_B0 | TBT_VENDOR_SPECIFIC_B1);
> +	vdo |= tbt->alt->vdo & TBT_INTEL_SPECIFIC_B0;
> +	vdo |= TBT_MODE;
> +
> +	if (plug) {
> +		if (typec_cable_is_active(tbt->cable))
> +			vdo |= TBT_ENTER_MODE_ACTIVE_CABLE;
> +
> +		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_SPEED(plug->vdo));
> +		vdo |= plug->vdo & TBT_CABLE_ROUNDED;
> +		vdo |= plug->vdo & TBT_CABLE_OPTICAL;
> +		vdo |= plug->vdo & TBT_CABLE_RETIMER;
> +		vdo |= plug->vdo & TBT_CABLE_LINK_TRAINING;
> +	} else {
> +		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_USB3_PASSIVE);
> +	}
> +
> +	tbt->enter_vdo = vdo;
> +	return typec_altmode_enter(tbt->alt, &vdo);
> +}
> +
> +static void tbt_altmode_work(struct work_struct *work)
> +{
> +	struct tbt_altmode *tbt = container_of(work, struct tbt_altmode, work);
> +	int ret;
> +
> +	mutex_lock(&tbt->lock);
> +
> +	switch (tbt->state) {
> +	case TBT_STATE_SOP_P_ENTER:
> +		ret = typec_altmode_enter(tbt->plug[TYPEC_PLUG_SOP_P], NULL);

typec_cable_altmode_enter() ?

> +		if (ret)
> +			dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_P]->dev,
> +				"failed to enter mode (%d)\n", ret);
> +		break;
> +	case TBT_STATE_SOP_PP_ENTER:
> +		ret = typec_altmode_enter(tbt->plug[TYPEC_PLUG_SOP_PP], NULL);

typec_cable_altmode_enter() ?

> +		if (ret)
> +			dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_PP]->dev,
> +				"failed to enter mode (%d)\n", ret);
> +		break;
> +	case TBT_STATE_ENTER:
> +		ret = tbt_enter_mode(tbt);
> +		if (ret)
> +			dev_dbg(&tbt->alt->dev, "failed to enter mode (%d)\n",
> +				ret);
> +		break;
> +	case TBT_STATE_EXIT:
> +		typec_altmode_exit(tbt->alt);
> +		break;
> +	case TBT_STATE_SOP_PP_EXIT:
> +		typec_altmode_exit(tbt->plug[TYPEC_PLUG_SOP_PP]);
> +		break;
> +	case TBT_STATE_SOP_P_EXIT:
> +		typec_altmode_exit(tbt->plug[TYPEC_PLUG_SOP_P]);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	tbt->state = TBT_STATE_IDLE;
> +
> +	mutex_unlock(&tbt->lock);
> +}
> +
> +static int tbt_altmode_vdm(struct typec_altmode *alt,
> +			   const u32 hdr, const u32 *vdo, int count)
> +{
> +	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
> +	int cmd_type = PD_VDO_CMDT(hdr);
> +	int cmd = PD_VDO_CMD(hdr);
> +
> +	mutex_lock(&tbt->lock);
> +
> +	if (tbt->state != TBT_STATE_IDLE) {
> +		mutex_unlock(&tbt->lock);
> +		return -EBUSY;
> +	}
> +
> +	switch (cmd_type) {
> +	case CMDT_RSP_ACK:
> +		switch (cmd) {
> +		case CMD_ENTER_MODE:
> +			/*
> +			 * Following the order describeded in USB Type-C Spec
> +			 * R2.0 Section 6.7.3.
> +			 */
> +			if (alt == tbt->plug[TYPEC_PLUG_SOP_P]) {
> +				if (tbt->plug[TYPEC_PLUG_SOP_PP])
> +					tbt->state = TBT_STATE_SOP_PP_ENTER;
> +				else
> +					tbt->state = TBT_STATE_ENTER;
> +			} else if (alt == tbt->plug[TYPEC_PLUG_SOP_PP]) {
> +				tbt->state = TBT_STATE_ENTER;
> +			} else {
> +				struct typec_thunderbolt_data data;
> +
> +				data.device_mode = tbt->alt->vdo;
> +				data.cable_mode =
> +					tbt->plug[TYPEC_PLUG_SOP_P] ?
> +						tbt->plug[TYPEC_PLUG_SOP_P]
> +							->vdo :

I'd say, please move the -> vdo to the previous line, otherwise it's a
bit unreadable.

> +						0;
> +				data.enter_vdo = tbt->enter_vdo;
> +
> +				typec_altmode_notify(alt, TYPEC_STATE_MODAL, &data);
> +			}
> +			break;
> +		case CMD_EXIT_MODE:
> +			if (alt == tbt->alt) {
> +				if (tbt->plug[TYPEC_PLUG_SOP_PP])
> +					tbt->state = TBT_STATE_SOP_PP_EXIT;
> +				else if (tbt->plug[TYPEC_PLUG_SOP_P])
> +					tbt->state = TBT_STATE_SOP_P_EXIT;
> +			} else if (alt == tbt->plug[TYPEC_PLUG_SOP_PP]) {
> +				tbt->state = TBT_STATE_SOP_P_EXIT;
> +			}
> +			break;
> +		}
> +		break;
> +	case CMDT_RSP_NAK:
> +		switch (cmd) {
> +		case CMD_ENTER_MODE:
> +			dev_warn(&alt->dev, "Enter Mode refused\n");
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (tbt->state != TBT_STATE_IDLE)
> +		schedule_work(&tbt->work);
> +
> +	mutex_unlock(&tbt->lock);
> +
> +	return 0;
> +}
> +
> +static int tbt_altmode_activate(struct typec_altmode *alt, int activate)
> +{
> +	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
> +	int ret;
> +
> +	mutex_lock(&tbt->lock);
> +
> +	if (!tbt_ready(alt))
> +		return -ENODEV;
> +
> +	/* Preventing the user space from entering/exiting the cable alt mode */
> +	if (alt != tbt->alt)
> +		ret = -EPERM;
> +	else if (activate)
> +		ret = tbt_enter_mode(tbt);
> +	else
> +		ret = typec_altmode_exit(alt);
> +
> +	mutex_unlock(&tbt->lock);
> +
> +	return ret;
> +}
> +
> +static const struct typec_altmode_ops tbt_altmode_ops = {
> +	.vdm		= tbt_altmode_vdm,
> +	.activate	= tbt_altmode_activate
> +};
> +
> +static int tbt_altmode_probe(struct typec_altmode *alt)
> +{
> +	struct tbt_altmode *tbt;
> +
> +	tbt = devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
> +	if (!tbt)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&tbt->work, tbt_altmode_work);
> +	mutex_init(&tbt->lock);
> +	tbt->alt = alt;
> +
> +	alt->desc = "Thunderbolt3";
> +	typec_altmode_set_drvdata(alt, tbt);
> +	typec_altmode_set_ops(alt, &tbt_altmode_ops);
> +
> +	if (tbt_ready(alt)) {
> +		if (tbt->plug[TYPEC_PLUG_SOP_PP])
> +			tbt->state = TBT_STATE_SOP_PP_ENTER;
> +		else if (tbt->plug[TYPEC_PLUG_SOP_P])
> +			tbt->state = TBT_STATE_SOP_P_ENTER;
> +		else
> +			tbt->state = TBT_STATE_ENTER;
> +		schedule_work(&tbt->work);
> +	}
> +
> +	return 0;
> +}
> +
> +static void tbt_altmode_remove(struct typec_altmode *alt)
> +{
> +	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
> +
> +	for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
> +		if (tbt->plug[i])
> +			typec_altmode_put_plug(tbt->plug[i]);
> +	}
> +
> +	if (tbt->cable)
> +		typec_cable_put(tbt->cable);
> +}
> +
> +static bool tbt_ready(struct typec_altmode *alt)
> +{
> +	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
> +	struct typec_altmode *plug;
> +
> +	if (tbt->cable)
> +		return true;
> +
> +	/* Thundebolt 3 requires a cable with eMarker */
> +	tbt->cable = typec_cable_get(typec_altmode2port(tbt->alt));
> +	if (!tbt->cable)
> +		return false;
> +
> +	/* We accept systems without SOP' or SOP''. This means the port altmode
> +	 * driver will be responsible for properly ordering entry/exit.
> +	 */
> +	for (int i = 0; i < TYPEC_PLUG_SOP_PP + 1; i++) {
> +		plug = typec_altmode_get_plug(tbt->alt, i);
> +		if (IS_ERR(plug))
> +			continue;
> +
> +		if (!plug || plug->svid != USB_TYPEC_VENDOR_INTEL)

!= USB_TYPEC_TBT_SID

> +			break;
> +
> +		plug->desc = "Thunderbolt3";
> +		plug->ops = &tbt_altmode_ops;

Should this be plug->cable_ops ?

> +		typec_altmode_set_drvdata(plug, tbt);
> +
> +		tbt->plug[i] = plug;
> +	}
> +
> +	return true;
> +}
> +
> +static const struct typec_device_id tbt_typec_id[] = {
> +	{ USB_TYPEC_TBT_SID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(typec, tbt_typec_id);
> +
> +static struct typec_altmode_driver tbt_altmode_driver = {
> +	.id_table = tbt_typec_id,
> +	.probe = tbt_altmode_probe,
> +	.remove = tbt_altmode_remove,
> +	.driver = {
> +		.name = "typec-thunderbolt",
> +		.owner = THIS_MODULE,

Should not be necessary, it is set by __typec_altmode_register_driver()

> +	}
> +};
> +module_typec_altmode_driver(tbt_altmode_driver);
> +
> +MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Thunderbolt3 USB Type-C Alternate Mode");
> diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
> index fa97d7e00f5c..55dcea12082c 100644
> --- a/include/linux/usb/typec_tbt.h
> +++ b/include/linux/usb/typec_tbt.h
> @@ -44,6 +44,7 @@ struct typec_thunderbolt_data {
>  
>  #define   TBT_GEN3_NON_ROUNDED                 0
>  #define   TBT_GEN3_GEN4_ROUNDED_NON_ROUNDED    1
> +#define TBT_CABLE_ROUNDED		BIT(19)
>  #define TBT_CABLE_OPTICAL		BIT(21)
>  #define TBT_CABLE_RETIMER		BIT(22)
>  #define TBT_CABLE_LINK_TRAINING		BIT(23)
> -- 
> 2.47.0.277.g8800431eea-goog
> 

-- 
With best wishes
Dmitry

