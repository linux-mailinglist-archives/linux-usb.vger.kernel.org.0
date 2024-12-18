Return-Path: <linux-usb+bounces-18606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 031889F5C25
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 02:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FB6016586D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 01:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97233595E;
	Wed, 18 Dec 2024 01:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y0cVCCjy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DFF35952
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 01:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734484615; cv=none; b=E/0VjpoKJUtinM1J3F5VLnH4sX2UkvtIA6OV/CvWrWVnp4f1BjJUkQo3MBKvPRpFZq8hsazswdtwOa5+bt7O7ZkTz+Qxq4kmXPezhoXLIbtnka6SA0STm4Hyfr3HDuAAE+ah8EJs1q4hPmr0aq1nRiMOI9Io3GB/w1otdutlHW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734484615; c=relaxed/simple;
	bh=aJ+jKfs8vOkx5Gsw61RenhEFgwAHCYAz6byzGMuMsmg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5enVoLU604RF+Xu6uzR+wAVA4lkd5/ouJdLj3zvYQb5n6ZWc7YD7DGe7IuBLwWugqsLYDKeSPwlw1KDizb913VTZNSZNsL4fafGUp70DBUepR36ZXKiKmfY4DLf7pXYYA4oj/J29xI0gJAEZCQyKNn3JblgbzMZnZq4ZI8JFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y0cVCCjy; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46772a0f85bso52058101cf.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 17:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734484612; x=1735089412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pceT12MgPX5LYeNYoGKuH+9kRM2/umAtaQqiUzTvSW0=;
        b=Y0cVCCjyI0Er8qVyWY9Uvv42kEWVuOKElmqtq3ao7qfx21d7RvCCq6FT27Jnx3eOZA
         t1Pbx9zyXcx4HrcHusPQoInIpA7SypJ8u09OswM+zdk3jHhTSJoYNnTh8pYxPHbdwfu8
         MsC7fbQfrAwn+5x4kzOaiLjY+HF6nC9htPrqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734484612; x=1735089412;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pceT12MgPX5LYeNYoGKuH+9kRM2/umAtaQqiUzTvSW0=;
        b=Ldt7o2WHauXGLoCzRGrEQ0syYacK1jKJgoVpuDYYtxIYc+lsM76LMbhDFyxcAP99z6
         Omo00mlR7fSG4pkwqSZTK2/e5jDgA8KMu3eFqDsvkKEwlG8BlqTGwF1m9gBzgpywO/Cj
         vd7t4Enuq0NEcXjbORrKkYyFhkW0c/TVUQQB3EzbwdpeWKKjGfF3yWA9/20kn1gN8Cuw
         GdrsNTNEuYyd0QVzVQbOsrIhsdi/Mk5eZ8v53BlCUSIRlKNXJeVQMTJFBDdgd6wTRC1n
         Qo3nNeoUG32h+/UC6KwRAEBUTgbO7g1rGaX4s5Fp0U8pg2FDiEfYjtPioYk3jS2amMmj
         quOw==
X-Forwarded-Encrypted: i=1; AJvYcCWpgS6HljFWGe2rgy3dP8gY50F/n+sK7e3wersP/lWNponMNlx/eBCkxMCmVnhoRFi7aFWEYbZJ2fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2ucXRd2dUA0WvK3LbLZUxgK7le+vlOetJiSAhbTfCJPXHOMj
	/f7X3oatE8hdvamznB4hf9oXSzBI+p9Eee+lz7KC/IudM6rWIwUSuiGjr0NzThAwNX55rWFh969
	4kitfmQqkLmdclTMkJA5Q1Jdh7GLp8/SfTgQH
X-Gm-Gg: ASbGnctt/dQjgUHNShp/7klCOhX105f579BojOPfzH74Enbgwtdf1h/4WgSjWdjL6OC
	LPmkEjFNvEnVxp6dgo26X/ZTQgSzkWYLGIgr3Of8Pz+IHHXTGXf9DTQIk1nsfsH44aw==
X-Google-Smtp-Source: AGHT+IH0sag0Q8DdRb4YIYS5LquPPnmmZcz9FS1OqVkQ8B6udk4bdQhF22/vJ82rq6mCziYWZgvqWq+BtlhyvIOSsmY=
X-Received: by 2002:ac8:7c4d:0:b0:467:8378:9e8 with SMTP id
 d75a77b69052e-46908de32d9mr17129991cf.17.1734484612535; Tue, 17 Dec 2024
 17:16:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Dec 2024 20:16:52 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241213153543.v5.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
References: <20241213233552.451927-1-abhishekpandit@chromium.org> <20241213153543.v5.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 17 Dec 2024 20:16:52 -0500
Message-ID: <CAE-0n52Y-t0TEuGS25GQsctCLC8FTm6A5tfQb3XLbwh2G5W_MA@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] platform/chrome: cros_ec_typec: Displayport support
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev, 
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	tzungbi@kernel.org
Cc: akuchynski@google.com, pmalani@chromium.org, badhri@google.com, 
	rdbabiera@google.com, dmitry.baryshkov@linaro.org, jthies@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhishek Pandit-Subedi (2024-12-13 15:35:47)
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index fb8335458a22..1a5a484563cc 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -19,7 +19,11 @@ obj-$(CONFIG_CROS_EC_SPI)            += cros_ec_spi.o
>  obj-$(CONFIG_CROS_EC_UART)             += cros_ec_uart.o
>  cros_ec_lpcs-objs                      := cros_ec_lpc.o cros_ec_lpc_mec.o
>  cros-ec-typec-objs                     := cros_ec_typec.o cros_typec_vdm.o
> +ifneq ($(CONFIG_CROS_EC_TYPEC_ALTMODES),)
> +       cros-ec-typec-objs              += cros_typec_altmode.o
> +endif

Can this be simplified by collapsing the config in because it is a bool?

	cros-ec-typec-y					:= cros_ec_typec.o cros_typec_vdm.o
	cros-ec-typec-$(CONFIG_CROS_EC_TYPEC_ALTMODES)	+= cros_typec_altmode.o

>  obj-$(CONFIG_CROS_EC_TYPEC)            += cros-ec-typec.o
> +
>  obj-$(CONFIG_CROS_EC_LPC)              += cros_ec_lpcs.o
>  obj-$(CONFIG_CROS_EC_PROTO)            += cros_ec_proto.o cros_ec_trace.o
>  obj-$(CONFIG_CROS_KBD_LED_BACKLIGHT)   += cros_kbd_led_backlight.o
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> new file mode 100644
> index 000000000000..6e736168ccc3
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Alt-mode implementation on ChromeOS EC.
> + *
> + * Copyright 2024 Google LLC
> + * Author: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> + */
> +#include "cros_ec_typec.h"

Please include this after linux headers.

> +
> +#include <linux/mutex.h>
> +#include <linux/workqueue.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/pd_vdo.h>
> +
> +#include "cros_typec_altmode.h"
> +

[...]
> +
> +static int cros_typec_displayport_vdm(struct typec_altmode *alt, u32 header,
> +                                     const u32 *data, int count)
> +{
> +       struct cros_typec_dp_data *dp_data = typec_altmode_get_drvdata(alt);
> +       struct cros_typec_altmode_data *adata = &dp_data->adata;
> +
> +

Nitpick: Remove extra newlines.

> +       int cmd_type = PD_VDO_CMDT(header);
> +       int cmd = PD_VDO_CMD(header);
> +       int svdm_version;
> +
> +       svdm_version = typec_altmode_get_svdm_version(alt);
> +       if (svdm_version < 0)
> +               return svdm_version;
> +

