Return-Path: <linux-usb+bounces-17390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5D9C2AC2
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2024 07:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1DF52832FA
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2024 06:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A491411C8;
	Sat,  9 Nov 2024 06:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CoVi5wjd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEE0CA6B
	for <linux-usb@vger.kernel.org>; Sat,  9 Nov 2024 06:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731134480; cv=none; b=LS0m89t3Pcjxf3tyv8XHiSAk2oJYXlmSRhELdh+LydN3BNMBQ7ezvfyLmiNbeQy1m1xUonDUHm5GmFP5mVFbw+wIlpUSXnp68OaOooaymw0XVb1LkYdiZwOgMbLzKEqbGfBXKD+F/bDsTPi4fMVFHKRXwZNXo3bXyg0eftIIfk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731134480; c=relaxed/simple;
	bh=b/pYJB7ff1VOHxnQqKgR1eAwihT9fLrrs3wRLF85ocg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIqvIYzqm8DE+gTLEQ0Xg82OPv/n/2xiOawol9Bd+4uW3IRDU/0UfV/nsC4BJFFWjiBbrjjCiIp7LvPmi29XjSU2Zhxdof1hNuA9PzbN+C5/8FYhl7Kla3fgv9Nqii3txPP1PWUTQjalxVG4VZWoMf9FbEdkKuyTzjCvv+AkWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CoVi5wjd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53d8c44476cso201847e87.0
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2024 22:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731134475; x=1731739275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CWQ5mBVFWFsy+kB+NSDCfBo5RSCH1U3/SXkD0DVPa5w=;
        b=CoVi5wjdz1pfs8GpizItBQNDQApU/YcV15rGVRw/jijukPm8ERXuFcV1KIFDUEdUud
         n2h2GDYdF1S3QulYVf3DgtLEbQM4kHhN7i/aXhU0auvhAapaELdCf8UcRmAe6kIbECt7
         brpVZhO0Bo6bJcda8tbpNm4SlT5VBRrK9cVWuoI2n9seW5rUk3ez0JY4aUtBwycNHmbb
         UprOkLcelCsteUtrqqRIMdQdPnPoQSklq1Q0NIKAKt84wu5P0FsmI3Nau2PNQwMTUZyl
         ztxZkohKKVIXVBeH5N/7Gh0klLdIuNUN0mgHapcdGVgvf7XrfzsZLEea6aCUDRHpmE3m
         h8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731134475; x=1731739275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWQ5mBVFWFsy+kB+NSDCfBo5RSCH1U3/SXkD0DVPa5w=;
        b=mA1Y3dzz9Ws3RVxfBm7xCHFfcSqbHyDGBnS4MKP/B1ipnRJqALcBJvDz31gdE5V/OJ
         Lm7MI+irk5XtROyqhrYjTilRK9gvclKpG0/f3++4VKb0MaaLTWTXPKu+xtKt76s1UN7O
         LpI6XlBijWGbX67aMUDtkFwhExiac4wUrE8P6yiMDR7rS43EfxcKI7hfjZ2w4UZc++Er
         Gi9e0MlTUKUi2wFGZaRyPqm53buP25NkDykvyFPz5pJrtFS/LuGbkDaoSbyubKC9lTco
         66wBQYkhUAdqeglpG+oUPkeLfcH2TJD5a35DRmt6ZDYuPInr/Ztph9F7Nm4jkapA1MwI
         naGg==
X-Forwarded-Encrypted: i=1; AJvYcCVUZVralD1hVSehqTk49IxnaMuzCsBA2aiUOJcgl+RYVuK9HlS1a5CmrcHS8qzUgr58JuBLbwgguMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/PRr0Ub08PbosCQ7kkOhi8jkAh/C8XI8kOzp21xNEKV3nraCw
	f6cDj1N5b3XDkdvZ9aScq7JkVtbA5XKCW0AJYsRo/LwauFVkmVpgG1NXN+N/XX4=
X-Google-Smtp-Source: AGHT+IFpqQudCAMbUbKCGbMohOnVCQLlVCh7IkfcMv+rur4EeV0Icisq02nGodSZId4auTEzLub3qQ==
X-Received: by 2002:a2e:9fc9:0:b0:2fb:5c20:43e0 with SMTP id 38308e7fff4ca-2ff2024449fmr28510501fa.15.1731134475209;
        Fri, 08 Nov 2024 22:41:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179a5f72sm9426311fa.93.2024.11.08.22.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 22:41:14 -0800 (PST)
Date: Sat, 9 Nov 2024 08:41:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev, jthies@google.com, 
	akuchynski@google.com, pmalani@chromium.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] platform/chrome: cros_ec_typec: Thunderbolt
 support
Message-ID: <zbtwtfywopvuh5b6skzxf53if7s7lxf53x6uxqnenpe3mipsdg@zdk7wfp7mqbg>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
 <20241107112955.v3.6.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107112955.v3.6.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>

On Thu, Nov 07, 2024 at 11:29:59AM -0800, Abhishek Pandit-Subedi wrote:
> Add support for entering and exiting Thunderbolt alt-mode using AP
> driven alt-mode.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
> Changes in v3:
> - Fix usage of TBT sid and mode.
> - Removed unused vdm operations during altmode registration
> 
> Changes in v2:
> - Refactored thunderbolt support into cros_typec_altmode.c
> 
>  drivers/platform/chrome/Makefile             |  3 +
>  drivers/platform/chrome/cros_ec_typec.c      | 23 +++---
>  drivers/platform/chrome/cros_typec_altmode.c | 85 ++++++++++++++++++++
>  drivers/platform/chrome/cros_typec_altmode.h | 14 ++++
>  4 files changed, 114 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index 2f90d4db8099..b9b1281de063 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -21,6 +21,9 @@ cros-ec-typec-objs			:= cros_ec_typec.o cros_typec_vdm.o
>  ifneq ($(CONFIG_TYPEC_DP_ALTMODE),)
>  	cros-ec-typec-objs		+= cros_typec_altmode.o
>  endif
> +ifneq ($(CONFIG_TYPEC_TBT_ALTMODE),)
> +	cros-ec-typec-objs		+= cros_typec_altmode.o
> +endif

Doesn't this also result in the object file being included twice and
thus in a duplicate symbols declaration?

>  obj-$(CONFIG_CROS_EC_TYPEC)		+= cros-ec-typec.o
>  
>  obj-$(CONFIG_CROS_EC_LPC)		+= cros_ec_lpcs.o
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 3a6f5f2717b9..558b618df63c 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -302,18 +302,19 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>  
>  	/*
>  	 * Register TBT compatibility alt mode. The EC will not enter the mode
> -	 * if it doesn't support it, so it's safe to register it unconditionally
> -	 * here for now.
> +	 * if it doesn't support it and it will not enter automatically by
> +	 * design so we can use the |ap_driven_altmode| feature to check if we
> +	 * should register it.
>  	 */
> -	memset(&desc, 0, sizeof(desc));
> -	desc.svid = USB_TYPEC_TBT_SID;
> -	desc.mode = TYPEC_ANY_MODE;
> -	amode = typec_port_register_altmode(port->port, &desc);
> -	if (IS_ERR(amode))
> -		return PTR_ERR(amode);
> -	port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
> -	typec_altmode_set_drvdata(amode, port);
> -	amode->ops = &port_amode_ops;
> +	if (typec->ap_driven_altmode) {
> +		memset(&desc, 0, sizeof(desc));
> +		desc.svid = USB_TYPEC_TBT_SID;
> +		desc.mode = TBT_MODE;
> +		amode = cros_typec_register_thunderbolt(port, &desc);
> +		if (IS_ERR(amode))
> +			return PTR_ERR(amode);
> +		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
> +	}
>  
>  	port->state.alt = NULL;
>  	port->state.mode = TYPEC_STATE_USB;
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> index 3598b8a6ceee..9cf2cef6c277 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.c
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -8,6 +8,7 @@
>  #include "cros_ec_typec.h"
>  
>  #include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_tbt.h>
>  #include <linux/usb/pd_vdo.h>
>  
>  #include "cros_typec_altmode.h"
> @@ -67,6 +68,8 @@ static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
>  
>  	if (data->sid == USB_TYPEC_DP_SID)
>  		req.mode_to_enter = CROS_EC_ALTMODE_DP;
> +	else if (data->sid == USB_TYPEC_TBT_SID)
> +		req.mode_to_enter = CROS_EC_ALTMODE_TBT;
>  	else
>  		return -EOPNOTSUPP;
>  
> @@ -196,6 +199,53 @@ static int cros_typec_displayport_vdm(struct typec_altmode *alt, u32 header,
>  	return 0;
>  }
>  
> +static int cros_typec_thunderbolt_vdm(struct typec_altmode *alt, u32 header,
> +				      const u32 *data, int count)
> +{
> +	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
> +
> +	int cmd_type = PD_VDO_CMDT(header);
> +	int cmd = PD_VDO_CMD(header);
> +	int svdm_version;

I suppose that with the current approach this misses the ap_mode_entry
check. If it gets moved to cros_typec_altmode_vdm(), then it should be
okay.

> +
> +	svdm_version = typec_altmode_get_svdm_version(alt);
> +	if (svdm_version < 0)
> +		return svdm_version;
> +
> +	switch (cmd_type) {
> +	case CMDT_INIT:
> +		if (PD_VDO_SVDM_VER(header) < svdm_version) {
> +			typec_partner_set_svdm_version(adata->port->partner,
> +						       PD_VDO_SVDM_VER(header));
> +			svdm_version = PD_VDO_SVDM_VER(header);
> +		}
> +
> +		adata->header = VDO(adata->sid, 1, svdm_version, cmd);
> +		adata->header |= VDO_OPOS(adata->mode);
> +
> +		switch (cmd) {
> +		case CMD_ENTER_MODE:
> +			/* Don't respond to the enter mode vdm because it
> +			 * triggers mux configuration. This is handled directly
> +			 * by the cros_ec_typec driver so the Thunderbolt driver
> +			 * doesn't need to be involved.
> +			 */
> +			break;
> +		default:
> +			adata->header |= VDO_CMDT(CMDT_RSP_ACK);
> +			schedule_work(&adata->work);
> +			break;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +
>  static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
>  				      const u32 *data, int count)
>  {
> @@ -204,6 +254,9 @@ static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
>  	if (adata->sid == USB_TYPEC_DP_SID)
>  		return cros_typec_displayport_vdm(alt, header, data, count);
>  
> +	if (adata->sid == USB_TYPEC_TBT_SID)
> +		return cros_typec_thunderbolt_vdm(alt, header, data, count);
> +
>  	return -EINVAL;
>  }
>  
> @@ -273,3 +326,35 @@ cros_typec_register_displayport(struct cros_typec_port *port,
>  	return alt;
>  }
>  #endif
> +
> +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc)
> +{
> +	struct typec_altmode *alt;
> +	struct cros_typec_altmode_data *data;
> +
> +	alt = typec_port_register_altmode(port->port, desc);
> +	if (IS_ERR(alt))
> +		return alt;
> +
> +	data = devm_kzalloc(&alt->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		typec_unregister_altmode(alt);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	INIT_WORK(&data->work, cros_typec_altmode_work);
> +	data->alt = alt;
> +	data->port = port;
> +	data->ap_mode_entry = true;
> +	data->sid = desc->svid;
> +	data->mode = desc->mode;
> +
> +	typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> +	typec_altmode_set_drvdata(alt, data);
> +
> +	return alt;
> +}
> +#endif
> diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
> index c6f8fb02c99c..810b553ddcd8 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.h
> +++ b/drivers/platform/chrome/cros_typec_altmode.h
> @@ -31,4 +31,18 @@ static inline int cros_typec_displayport_status_update(struct typec_altmode *alt
>  	return 0;
>  }
>  #endif
> +
> +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc);
> +#else
> +static inline struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc)
> +{
> +	return typec_port_register_altmode(port->port, desc);
> +}
> +#endif
> +
>  #endif /* __CROS_TYPEC_ALTMODE_H__ */
> -- 
> 2.47.0.277.g8800431eea-goog
> 

-- 
With best wishes
Dmitry

