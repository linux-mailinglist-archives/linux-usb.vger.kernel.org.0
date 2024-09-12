Return-Path: <linux-usb+bounces-14998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A8976895
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 14:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451681F243FE
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 12:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0AD1A0BFC;
	Thu, 12 Sep 2024 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILojuWBd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323E228F4
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142687; cv=none; b=SaVb5jgF6ADHmWzxP3j9HASRvrWF8qluJ5mCBpBe8BzOTy/bGaTL365ZTKN6rPQuuYPO17sCPrfnqwCXB5Xh7614pHn/rMJoWeYuBgTn2KzM0VZfmyupKrva3kBvnZgDYmbISObu2w2fg6S8V8lGAwIlGZNuH1GkMUBwhi6E5e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142687; c=relaxed/simple;
	bh=NwnE3W95bS3hXUPhWg/p4txwxyLmssAU5giMlmoeNbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4nCg5yOYRxTIVYfgsit84ZgaLONN+/u5TDiwh8xfWHlB/tNGRbGu/nbiQ9JywC/0INYYaWIMlDvCMKNcD9eJYarlWRTMQnLwsQTgyFoAezyNDVJzSWvo5Dkl1UIpVmlWgTUGPJHESMhg4zDN4ulseaMlJvrHX5MFCaFztLx2rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ILojuWBd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so1007581e87.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726142683; x=1726747483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=99YLwXE6aItdH2pRHCutxqOz/JyZAoPrueQNZ38iMsE=;
        b=ILojuWBd78osFB2DUcYt0tHyHpTlmpYwb//iVuwMbBviMD3QDHkMJMP2G3yLLzO4v7
         0ubyr0yr/7OGkX7XZtuiIVE+JBJnurITjUtDX0SY0N2oiRuwnR9dwmUa0nuO3Joh/SXR
         BW2BKQ0MHfD6TFmyIz+n8O3jd8Aj6dixacuYzTTCbgXq2WF+7T/d9q30kzsjINDrLoyu
         L+xeSpoYugLVrysx2vZzKZfTTdliN50aT3SYoVthgjjPoOjIiuBKniwIZHQ5uSuioHCu
         x28+eSFKi3lzeiQcvhIj+/svBi/gFodoB3A/25uSpQLXstLH7iSBJSYvFYE918S7MzU4
         Zj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726142683; x=1726747483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99YLwXE6aItdH2pRHCutxqOz/JyZAoPrueQNZ38iMsE=;
        b=gY7+FHVf9/ZNRVkcIAbroOHm0/NzV8iOFkpSDsnr6kgwP7QFVGjeXa6OTSkWSdZq07
         zo8UUmgDZeKKETDm2/JBBkEZfoB+TFRPvNliOZ+Lu+4hDBoqMwtTwaEs2Gzh7byONF3K
         WYQm/EVcXo/iHogURSRudA2KCditKKUrZhQr3i39vEmEz+3UNZwsVQqMl8BO5O5/w/EU
         1FNrjCiCDGyIJmOGeEaPAu1/l6F+t/xlfukIBZqQ+Y4k53UDdInADmzzN9rowp8JbApn
         ioyC5sMKRcPFzodqnngwMgpI4USAk5dVQAoQakuUEr5tNMFrHm+PmOGjJ2CILHba2LHH
         wudw==
X-Forwarded-Encrypted: i=1; AJvYcCVILCDyNmp+jKlZ30MnV58joGJORbDOYOeGzk5EpksMzNdeaonNcSRFROtB3q18ZtNZJY6MgaZdafw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT9yFDMVF8eHoQ7mmsVOaKhJS00pa6qj2ki49zzXzWHjLJJEeV
	LU6rpuYQJq8zIY8CFHvKDkT6D45f0RZGfIfUN9Ll0nCUPPPUWQa+EE+YWfQgd11N4q2AIpaxaeD
	G
X-Google-Smtp-Source: AGHT+IEOJskhmiF0u2Tx5eIQeH5wg1yCjy7iypMbX/TQZ6E7wux0TF/KBA0sPzz1yrjQ5oed13lzrg==
X-Received: by 2002:a05:6512:2210:b0:52e:9b2f:c313 with SMTP id 2adb3069b0e04-53678fc2620mr1601788e87.22.1726142682401;
        Thu, 12 Sep 2024 05:04:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f86fff0sm1885171e87.82.2024.09.12.05.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:04:42 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:04:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Bartosz Szpila <bszpila@google.com>, "Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, 
	linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] usb: typec: ucsi: Convert connector specific
 commands to bitmaps
Message-ID: <i3skktdyau23gesj7nznyob2ovwcutylxmz7chnlmjgwgbqwhk@zmwhd2akb2gs>
References: <20240903145342.3449969-1-heikki.krogerus@linux.intel.com>
 <20240903145342.3449969-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903145342.3449969-3-heikki.krogerus@linux.intel.com>

On Tue, Sep 03, 2024 at 05:53:42PM GMT, Heikki Krogerus wrote:
> This is hopefully a bit less hacky, but it still needs work.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/psy.c       |  28 ++---
>  drivers/usb/typec/ucsi/trace.h     |  28 ++---
>  drivers/usb/typec/ucsi/ucsi.c      | 108 ++++++++--------
>  drivers/usb/typec/ucsi/ucsi.h      | 195 ++++++++++++++++-------------
>  drivers/usb/typec/ucsi/ucsi_acpi.c |   7 +-
>  5 files changed, 192 insertions(+), 174 deletions(-)
> 
> +#define   UCSI_CONCAP_EXT_OPMODE_USB4_GEN2	DECLARE_BITFIELD(0x200, 14, 1)
> +#define   UCSI_CONCAP_EXT_OPMODE_EPR_SRC	DECLARE_BITFIELD(0x200, 15, 1)
> +#define   UCSI_CONCAP_EXT_OPMODE_EPR_SINK	DECLARE_BITFIELD(0x200, 16, 1)
> +#define   UCSI_CONCAP_EXT_OPMODE_USB4_GEN3	DECLARE_BITFIELD(0x200, 17, 1)
> +#define   UCSI_CONCAP_EXT_OPMODE_USB4_GEN4	DECLARE_BITFIELD(0x200, 18, 1)
> +#define UCSI_CONCAP_MISC			DECLARE_BITFIELD(0x200, 22, 4)
> +#define   UCSI_CONCAP_MISC_FW_UPDATE		DECLARE_BITFIELD(0x200, 22, 1)
> +#define   UCSI_CONCAP_MISC_SECURITY		DECLARE_BITFIELD(0x200, 23, 1)
> +#define UCSI_CONCAP_REV_CURR_PROT_SUPPORT	DECLARE_BITFIELD(0x200, 26, 1)
> +#define UCSI_CONCAP_PARTNER_PD_REVISION		DECLARE_BITFIELD(0x210, 27, 2)

I'd second the suggestion to use VER_something macros. Another option
might be to use something like DECLARE_BITFIELD_1_10 and
DECLARE_BITFIELD_2_00

> +#define bitfield_read(_map_, _field_, _ver_)				\
> +	({								\
> +		struct bitfield f = (_field_);				\
> +		WARN((_ver_) < f.version,				\
> +		     "Access to unsupported field.") ? 0 :		\
> +		bitmap_read((_map_), f.offset, f.size);			\
> +	})
> +
> +#define DECLARE_BITFIELD(_ver_, _offset_, _size_)			\
> +(struct bitfield) {							\
> +	.version = _ver_,						\
> +	.offset = _offset_,						\
> +	.size = _size_							\
> +}
> +
> +struct bitfield {
> +	const u16 version;
> +	const u8 offset;
> +	const u8 size;
> +};

I think these names are too generic. What about ucsi_bitfield /
UCSI_DECLARE_BITFIELD?

> +
> +/* Helpers to access cached command responses. */
> +#define UCSI_CONCAP(_con_, _field_)					\
> +	bitfield_read((_con_)->status, UCSI_CONCAP_##_field_, (_con_)->ucsi->version)
> +
> +#define UCSI_CONSTAT(_con_, _field_)					\
> +	bitfield_read((_con_)->status, UCSI_CONSTAT_##_field_, (_con_)->ucsi->version)
>  
>  /* -------------------------------------------------------------------------- */
>  
> @@ -433,8 +456,10 @@ struct ucsi_connector {
>  
>  	struct typec_capability typec_cap;
>  
> -	struct ucsi_connector_status status;
> -	struct ucsi_connector_capability cap;
> +	/* Cached command responses. */
> +	DECLARE_BITMAP(cap, UCSI_GET_CONNECTOR_CAPABILITY_SIZE);
> +	DECLARE_BITMAP(status, UCSI_GET_CONNECTOR_STATUS_SIZE);
> +
>  	struct power_supply *psy;
>  	struct power_supply_desc psy_desc;
>  	u32 rdo;
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 7a5dff8d9cc6..48ee9e4cac3b 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -143,7 +143,6 @@ static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
>  	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
>  			   UCSI_CONSTAT_PDOS_CHANGE;
>  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> -	struct ucsi_connector_status *status;
>  	int ret;
>  
>  	ret = ucsi_acpi_read_message_in(ucsi, val, val_len);
> @@ -152,11 +151,9 @@ static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
>  
>  	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_CONNECTOR_STATUS &&
>  	    ua->check_bogus_event) {
> -		status = (struct ucsi_connector_status *)val;
> -
>  		/* Clear the bogus change */
> -		if (status->change == bogus_change)
> -			status->change = 0;
> +		if (*(u16 *)val == bogus_change)
> +			*(u16 *)val = 0;
>  
>  		ua->check_bogus_event = false;
>  	}
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

