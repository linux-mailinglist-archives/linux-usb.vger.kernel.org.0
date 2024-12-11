Return-Path: <linux-usb+bounces-18322-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E8A9EBFCF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0CA41884060
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02733D81;
	Wed, 11 Dec 2024 00:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="blfncYmk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0104EC4
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733875731; cv=none; b=sRFR2mdbvN0UPzOkUOGpj8kzUOJW3/rKxVdRe1/RUcBIDD75J2o1aXHz9+Y/n4+935mGT0E4JRNOVePkaGMeyaF+mhP5oHRfMh15XJVepr1BC+O8PBWAUdqIG0TtYqpu+HnZ6ZGTCedvYLnutO6ot0snVdg39RWVjjSNQ1Lv25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733875731; c=relaxed/simple;
	bh=ygJB9lByFuI4OE5ggxZziKAI9HhvAlHHWo/+PZZGPsw=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Otqac8AzhOAsL/KPs2zKDLxh1cgfaSYASAwKJp7e3llWV2fiV7m27hJ9+yaFyPS2QQMiR/z8DjZ5Hpo4b1n+XdY8Juh5gY5d12Co5aok3XGT1MnMMiiVCvdhLAUU6nELnb5r/SLNI/jYMOUzaB8b0UlS1bJFI7Tsx0xZpYDOP8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=blfncYmk; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4676859b911so21115691cf.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 16:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733875727; x=1734480527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InR1oI0aD+sPto4GQzNqXe18JFI0oG3qcs+AISuN/sY=;
        b=blfncYmkLqSZN+ikTn5zyfMC2UGj/YVFqeCOXGdOxGZz75hvRMHus1xqf81K7A4tGT
         KeJb7WTIg+Mf89VETfydJpZ4CwEv3jh1hG+8uNWi7pibpNBg+qoi/0/t4cRNGi5GhXFP
         wa3N/As/4GBBiw7M0mgnrgQnpOrNyuUVjr3Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733875727; x=1734480527;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InR1oI0aD+sPto4GQzNqXe18JFI0oG3qcs+AISuN/sY=;
        b=rjIUHejDoVRB33sjyrWZVdoxIOfMirypN6H8K6VIS8W9E2QFRGjhpdox0hpj10UIsP
         Y1UAGGHq7WZqM+ynxo0zdfAKHSex9NdnKo6PPuhquAHVQlCeJUPvWx9TWjsZgxgXl9jt
         fGtu62eaVBgNC/GjC1dW2lW5rjTov+CHc2p0UTvN9v0jCaHnmB/kh9FQkpp5owAPKCuG
         fYRmiYEcxG3O9OGieLzPUclZnRZaLM30HVTUnOxkxwgKTgHUJFEn3K5tXl8wG2oyyEGM
         qrLJCeS2YLEphI8Ad0NRlIE+9zcd/rxtItfC2JpAhpFE/03Mb8mVJ1JuwHAONtVD0CU+
         I99w==
X-Forwarded-Encrypted: i=1; AJvYcCUdvc8i2P9PEeX/1YV7vWwbWD2/cJPsv3Dr6f+n+RJRndS9dOgbMU2L3jEAW7BhM++n7xnx23QhnGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YztC9l8a94yXWBkX1EY+Cun/kT5ro2W/Qzb1VzsyYH7QD7q+rNU
	2Q6v3woHK8UCJjSUQDZLOXouIBkES4UrnXG+QFSB8YJhfK1tWXF6wbTZhNhLyB6z3/IE0QXtmdv
	jA1ybeNk4I/YIGHYfYWOF+e2bYugWxsm+GaFo
X-Gm-Gg: ASbGncsNNT36hpM2Lx7axqbkhQOVO3dQSjOqu9iWm9RE+63v8FHCCqMpOG+n3i5Hn8y
	npDueW/ztCiBjyvY2wESP0BBFPSaDSXBUlNPYg0OanQ5UH/B7a0e8/Luz0L2OjGo=
X-Google-Smtp-Source: AGHT+IFWkOjv1mYJIaAxfQCOqZy5Pz1YiEIn47/fn9NT2M8g5tgWs9SW51OBu9aOn7+LCL2dJhg8YVt8sCdgezMgaPU=
X-Received: by 2002:ac8:5947:0:b0:467:6092:8414 with SMTP id
 d75a77b69052e-467891befcfmr21798581cf.0.1733875726913; Tue, 10 Dec 2024
 16:08:46 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Dec 2024 16:08:46 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241206153813.v4.5.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org> <20241206153813.v4.5.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 10 Dec 2024 16:08:46 -0800
Message-ID: <CAE-0n513GoDKW7mA_rjCLsgZZFq=CEb5S8WLYr2rskq8fJW9LA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] platform/chrome: cros_ec_typec: Displayport support
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev, 
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	tzungbi@kernel.org
Cc: akuchynski@google.com, pmalani@chromium.org, jthies@google.com, 
	dmitry.baryshkov@linaro.org, badhri@google.com, rdbabiera@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhishek Pandit-Subedi (2024-12-06 15:38:16)
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index e3eabe5e42ac..0f3bc335f583 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -18,6 +18,7 @@
>
>  #include "cros_ec_typec.h"
>  #include "cros_typec_vdm.h"
> +#include "cros_typec_altmode.h"
>
>  #define DRV_NAME "cros-ec-typec"
>
> @@ -290,15 +291,15 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>         struct typec_altmode *amode;
>
>         /* All PD capable CrOS devices are assumed to support DP altmode. */
> +       memset(&desc, 0, sizeof(desc));
>         desc.svid = USB_TYPEC_DP_SID;
>         desc.mode = USB_TYPEC_DP_MODE;
>         desc.vdo = DP_PORT_VDO;
> -       amode = typec_port_register_altmode(port->port, &desc);
> +       amode = cros_typec_register_displayport(port, &desc,
> +                                               typec->ap_driven_altmode);
>         if (IS_ERR(amode))
>                 return PTR_ERR(amode);
>         port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
> -       typec_altmode_set_drvdata(amode, port);
> -       amode->ops = &port_amode_ops;
>
>         /*
>          * Register TBT compatibility alt mode. The EC will not enter the mode
> @@ -575,6 +576,10 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
>         if (!ret)
>                 ret = typec_mux_set(port->mux, &port->state);
>
> +       if (!ret)
> +               cros_typec_displayport_status_update(port->state.alt,

Should we forward the return value from here?

> +                                                    port->state.data);
> +
>         return ret;
>  }
>
> @@ -1254,6 +1259,8 @@ static int cros_typec_probe(struct platform_device *pdev)
>
>         typec->typec_cmd_supported = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_CMD);
>         typec->needs_mux_ack = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK);
> +       typec->ap_driven_altmode = cros_ec_check_features(
> +               ec_dev, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
>
>         ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_PORTS, NULL, 0,
>                           &resp, sizeof(resp));
> diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
> index deda180a646f..9fd5342bb0ad 100644
> --- a/drivers/platform/chrome/cros_ec_typec.h
> +++ b/drivers/platform/chrome/cros_ec_typec.h
> @@ -39,6 +39,7 @@ struct cros_typec_data {
>         struct work_struct port_work;
>         bool typec_cmd_supported;
>         bool needs_mux_ack;
> +       bool ap_driven_altmode;

Do we need to stash this? Can we cros_ec_check_features() in
cros_typec_init_ports() and pass the bool to
cros_typec_register_port_altmodes() instead to save a struct member?

>  };
>
>  /* Per port data. */
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> new file mode 100644
> index 000000000000..bb7c7ad2ff6e
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Alt-mode implementation on ChromeOS EC.
> + *
> + * Copyright 2024 Google LLC
> + * Author: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> + */
> +#include "cros_ec_typec.h"
> +
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/pd_vdo.h>

Please include workqueue.h, mutex.h, etc. for things used in this file.

> +
> +#include "cros_typec_altmode.h"
> +
> +struct cros_typec_altmode_data {
> +       struct work_struct work;
> +       struct cros_typec_port *port;
> +       struct typec_altmode *alt;
> +       bool ap_mode_entry;

The UCSI driver (drivers/usb/typec/ucsi/displayport.c) calls this
'override', can it be named the same thing? I also see that the UCSI
driver has two bools, 'override' and 'initialized', which seems to be to
support a DP_CMD_CONFIGURE that will respond with an ACK and then the
next DP_CMD_CONFIGURE will call ucsi_altmode_update_active() to set the
altmode as active. Maybe the same method can be followed here so that on
older chromebooks where EC is in control of mode entry we can emulate
entering the mode?

> +
> +       struct mutex lock;
> +       u32 header;
> +       u32 *vdo_data;
> +       u8 vdo_size;
> +
> +       u16 sid;
> +       u8 mode;
> +};
> +
> +struct cros_typec_dp_data {
> +       struct cros_typec_altmode_data adata;
> +       struct typec_displayport_data data;
> +       bool configured;
> +       bool pending_status_update;
> +};
> +
> +static void cros_typec_altmode_work(struct work_struct *work)
> +{
> +       struct cros_typec_altmode_data *data =
> +               container_of(work, struct cros_typec_altmode_data, work);
> +
> +       mutex_lock(&data->lock);
> +
> +       if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
> +                             data->vdo_size))
> +               dev_err(&data->alt->dev, "VDM 0x%x failed", data->header);

These printks need newlines.

               dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->header);

> +
> +       data->header = 0;
> +       data->vdo_data = NULL;
> +       data->vdo_size = 0;
> +
> +       mutex_unlock(&data->lock);
> +}
> +
> +static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
> +{
> +       struct cros_typec_altmode_data *data = typec_altmode_get_drvdata(alt);
> +       struct ec_params_typec_control req = {
> +               .port = data->port->port_num,
> +               .command = TYPEC_CONTROL_COMMAND_ENTER_MODE,
> +       };
> +       int svdm_version;
> +       int ret;
> +
> +       if (!data->ap_mode_entry) {
> +               dev_warn(&alt->dev,
> +                        "EC does not support AP driven mode entry\n");

Like this one.

> +               return -EOPNOTSUPP;
> +       }
> +
> +       if (data->sid == USB_TYPEC_DP_SID)
> +               req.mode_to_enter = CROS_EC_ALTMODE_DP;
> +       else
> +               return -EOPNOTSUPP;
> +
> +       ret = cros_ec_cmd(data->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,

Do we plan to delete drivers/platform/chrome/cros_typec_vdm.c file at
some point? I ask because 'port_amode_ops' becomes unused after this
series.

> +                         &req, sizeof(req), NULL, 0);
> +       if (ret < 0)
> +               return ret;
> +
> +       svdm_version = typec_altmode_get_svdm_version(alt);
> +       if (svdm_version < 0)
> +               return svdm_version;
> +
> +       mutex_lock(&data->lock);
> +
> +       data->header = VDO(data->sid, 1, svdm_version, CMD_ENTER_MODE);
> +       data->header |= VDO_OPOS(data->mode);
> +       data->header |= VDO_CMDT(CMDT_RSP_ACK);
> +       data->vdo_data = NULL;
> +       data->vdo_size = 1;
> +       schedule_work(&data->work);
> +
> +       mutex_unlock(&data->lock);
> +       return ret;
> +}
> +
> +static int cros_typec_altmode_exit(struct typec_altmode *alt)
> +{
> +       struct cros_typec_altmode_data *data = typec_altmode_get_drvdata(alt);
> +       struct ec_params_typec_control req = {
> +               .port = data->port->port_num,
> +               .command = TYPEC_CONTROL_COMMAND_EXIT_MODES,
> +       };
> +       int svdm_version;
> +       int ret;
> +
> +       if (!data->ap_mode_entry) {
> +               dev_warn(&alt->dev,
> +                        "EC does not support AP driven mode exit\n");
> +               return -EOPNOTSUPP;
> +       }
> +
> +       ret = cros_ec_cmd(data->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
> +                         &req, sizeof(req), NULL, 0);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       svdm_version = typec_altmode_get_svdm_version(alt);
> +       if (svdm_version < 0)
> +               return svdm_version;
> +
> +       mutex_lock(&data->lock);
> +
> +       data->header = VDO(data->sid, 1, svdm_version, CMD_EXIT_MODE);
> +       data->header |= VDO_OPOS(data->mode);
> +       data->header |= VDO_CMDT(CMDT_RSP_ACK);
> +       data->vdo_data = NULL;
> +       data->vdo_size = 1;
> +       schedule_work(&data->work);
> +
> +       mutex_unlock(&data->lock);
> +       return ret;
> +}
> +
> +static int cros_typec_displayport_vdm(struct typec_altmode *alt, u32 header,
> +                                     const u32 *data, int count)
> +{
> +       struct cros_typec_dp_data *dp_data = typec_altmode_get_drvdata(alt);
> +       struct cros_typec_altmode_data *adata = &dp_data->adata;
> +
> +
> +       int cmd_type = PD_VDO_CMDT(header);
> +       int cmd = PD_VDO_CMD(header);
> +       int svdm_version;
> +
> +       svdm_version = typec_altmode_get_svdm_version(alt);
> +       if (svdm_version < 0)
> +               return svdm_version;
> +
> +       mutex_lock(&adata->lock);
> +
> +       switch (cmd_type) {
> +       case CMDT_INIT:
> +               if (PD_VDO_SVDM_VER(header) < svdm_version) {
> +                       typec_partner_set_svdm_version(adata->port->partner,
> +                                                      PD_VDO_SVDM_VER(header));
> +                       svdm_version = PD_VDO_SVDM_VER(header);
> +               }
> +
> +               adata->header = VDO(adata->sid, 1, svdm_version, cmd);
> +               adata->header |= VDO_OPOS(adata->mode);
> +
> +               /*
> +                * DP_CMD_CONFIGURE: We can't actually do anything with the
> +                * provided VDO yet so just send back an ACK.
> +                *
> +                * DP_CMD_STATUS_UPDATE: We wait for Mux changes to send
> +                * DPStatus Acks.
> +                */
> +               switch (cmd) {
> +               case DP_CMD_CONFIGURE:
> +                       dp_data->data.conf = *data;
> +                       adata->header |= VDO_CMDT(CMDT_RSP_ACK);
> +                       dp_data->configured = true;
> +                       schedule_work(&adata->work);
> +                       break;
> +               case DP_CMD_STATUS_UPDATE:
> +                       dp_data->pending_status_update = true;
> +                       break;
> +               default:
> +                       adata->header |= VDO_CMDT(CMDT_RSP_ACK);
> +                       schedule_work(&adata->work);
> +                       break;
> +               }
> +
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       mutex_unlock(&adata->lock);
> +       return 0;
> +}
> +
> +static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
> +                                     const u32 *data, int count)
> +{
> +       struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
> +
> +       if (!adata->ap_mode_entry)
> +               return -EOPNOTSUPP;
> +
> +       if (adata->sid == USB_TYPEC_DP_SID)
> +               return cros_typec_displayport_vdm(alt, header, data, count);
> +
> +       return -EINVAL;
> +}
> +
> +static const struct typec_altmode_ops cros_typec_altmode_ops = {
> +       .enter = cros_typec_altmode_enter,
> +       .exit = cros_typec_altmode_exit,
> +       .vdm = cros_typec_altmode_vdm,
> +};
> +
> +#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
> +int cros_typec_displayport_status_update(struct typec_altmode *altmode,
> +                                        struct typec_displayport_data *data)
> +{
> +       struct cros_typec_dp_data *dp_data =
> +               typec_altmode_get_drvdata(altmode);
> +       struct cros_typec_altmode_data *adata = &dp_data->adata;
> +
> +       if (!dp_data->pending_status_update) {
> +               dev_dbg(&altmode->dev,
> +                       "Got DPStatus without a pending request");
> +               return 0;
> +       }
> +
> +       if (dp_data->configured && dp_data->data.conf != data->conf)
> +               dev_dbg(&altmode->dev,
> +                       "DP Conf doesn't match. Requested 0x%04x, Actual 0x%04x",
> +                       dp_data->data.conf, data->conf);
> +
> +       mutex_lock(&adata->lock);
> +
> +       dp_data->data = *data;
> +       dp_data->pending_status_update = false;
> +       adata->header |= VDO_CMDT(CMDT_RSP_ACK);
> +       adata->vdo_data = &dp_data->data.status;
> +       adata->vdo_size = 2;
> +       schedule_work(&adata->work);
> +
> +       mutex_unlock(&adata->lock);
> +
> +       return 0;
> +}
> +
> +struct typec_altmode *
> +cros_typec_register_displayport(struct cros_typec_port *port,
> +                               struct typec_altmode_desc *desc,
> +                               bool ap_mode_entry)
> +{
> +       struct typec_altmode *alt;
> +       struct cros_typec_altmode_data *data;

Can you name it 'adata' consistently? That makes it easy to search for
'adata' in this file and know it's always talking about a struct
cros_typec_altmode_data type of data.

> +
> +       alt = typec_port_register_altmode(port->port, desc);
> +       if (IS_ERR(alt))
> +               return alt;
> +
> +       data = devm_kzalloc(&alt->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data) {
> +               typec_unregister_altmode(alt);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       INIT_WORK(&data->work, cros_typec_altmode_work);
> +       mutex_init(&data->lock);
> +       data->alt = alt;
> +       data->port = port;
> +       data->ap_mode_entry = ap_mode_entry;
> +       data->sid = desc->svid;
> +       data->mode = desc->mode;
> +
> +       typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> +       typec_altmode_set_drvdata(alt, data);
> +
> +       return alt;
> +}
> +#endif
> diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
> new file mode 100644
> index 000000000000..c6f8fb02c99c
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_altmode.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __CROS_TYPEC_ALTMODE_H__
> +#define __CROS_TYPEC_ALTMODE_H__

#include <linux/kconfig.h> for IS_ENABLED()
#include <linux/usb/typec.h> for typec_port_register_altmode()

> +
> +struct cros_typec_port;
> +struct typec_altmode;
> +struct typec_altmode_desc;
> +struct typec_displayport_data;
> +
> +#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_displayport(struct cros_typec_port *port,
> +                               struct typec_altmode_desc *desc,
> +                               bool ap_mode_entry);
> +
> +int cros_typec_displayport_status_update(struct typec_altmode *altmode,
> +                                        struct typec_displayport_data *data);
> +#else
> +static inline struct typec_altmode *
> +cros_typec_register_displayport(struct cros_typec_port *port,
> +                               struct typec_altmode_desc *desc,
> +                               bool ap_mode_entry)
> +{
> +       return typec_port_register_altmode(port->port, desc);
> +}

