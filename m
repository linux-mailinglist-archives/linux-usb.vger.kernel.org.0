Return-Path: <linux-usb+bounces-12406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F293BB3D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 05:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6769A285072
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 03:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C28617550;
	Thu, 25 Jul 2024 03:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arYavAvZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D20F1170F
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 03:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721878268; cv=none; b=Pcduy4j+cqO00Q2GGxxOzHF+NxMV7wFDi07cNQZyFg/6zFUIRfCiFok2dqdQlIxHul/cSEDvRvIdLUjsMpY4H6t0J3J6jiKTThB39eOOqN9lTk9ihwKSsOy2buPwfcXpuBpBG+rEgEItG2/hO5/qRIBqjzNH6KvYhkODBD/TW1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721878268; c=relaxed/simple;
	bh=d4Md/pmd9aAH6BP2SJNyitKaq4lM6GrSPXh+qAunH6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUoq0HBDwFd7et2KpOk7Z+9xxAH8J0NMPy40hh0WaDQHgm1LleofE60e+mueuVvHSfSoHB+duvvgCM8Yguf1GCJL0L0SJNA9FHJigEF7hudAZuwIbGu9OKQPKdvdfmU/U7j4kxAsP3NrANsYcxNK4Fq+adsb26WmfB7ORQ+kcwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arYavAvZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so521692e87.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 20:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721878262; x=1722483062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yhbT1eQ9YPVhIQslZbZZbHdi4UGZ5NhIA5kAWua5Lkg=;
        b=arYavAvZnL/vVCTWS9TvqTL7SyHo2HJYo6xsUwOy57I7cahOBK9sH0XNh3ugN74ufY
         ucz3wjoaOlUEnAlmcA6ykMKwzBoIVG/YKHCAz6hNmIG4qMrnQp4Eu8W5gyCDOVVlCbd9
         CH55OYeC/2A05N8akgPn/PvANCrx4O1aT7q1YiZT/l/2CsO/tWeVYoEe3FLC3d7Gpupb
         obW4Z+USMDXZT6SLnWf9Qhtq/YSWpaHZHuhBBewJovTwZv5arHA5JUwzx19BA7gvMA/G
         4I9qj12ekLW+8nbf2CY028lAzMyaTJt0+ebt6Fqt8MZ5Br90WZxEs/z+TjSfzi2LgV+p
         +kIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721878262; x=1722483062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhbT1eQ9YPVhIQslZbZZbHdi4UGZ5NhIA5kAWua5Lkg=;
        b=bOXbiqKerGt6BhaByMgUEFDicGmVCoIGbTLFP/uhHw6mAccUxAtijyfTMz1bN5GceM
         k/klVHA+jSChAkRZlv1lTU/zr1uVzbXdS3hMbmH7inJbB3k44T7nDkANB6EUO8a+hK9u
         u60wSUehWt2hFe4RrNbvVMgIFMKzRAn8JwWfsVwdoSzq1ysGr3GksvAhVmrqouFli4sJ
         uAz5eZzKtIhCQH7/i1z1iOFPDU2SCAkMU0bIGrOzPmXpoy365AsnvzDLlqVryaghKR6U
         ljo2ZfmEocjJ3YfsXdk585cPd7Roeh+GP5Z0MJsOkf1givefIextfDBxPhR0OLyVIxTY
         oRLg==
X-Forwarded-Encrypted: i=1; AJvYcCX++B+gV06yCeWu7a93gKKIi2jQ/Ji6zji8R0/ghahQcZxszVm9M3rBtIFZ4cjZpW+IickO3vkpo2tBOItm3zEHkCsh1JYcSBBj
X-Gm-Message-State: AOJu0YxkJ9I3J/dlHlP8JTEvWZYegaJfT9mAv5aJTNqUzgoGTZiLxzsG
	Ea4Js/FeS9l08P6yT4lp3P5MazkvskmiTgPSfbiqxr6v17rA5MJsTk57Kyn/WPs=
X-Google-Smtp-Source: AGHT+IFjMhfs1uKv8o8eDUmQrRbd/e1o4QszP3+4qeKeaqccHoFSZFfQnx4HsVLlt3eN+89oHv6Bbg==
X-Received: by 2002:a19:f70d:0:b0:52c:e0fb:92c0 with SMTP id 2adb3069b0e04-52fd60439a8mr261657e87.34.1721878262339;
        Wed, 24 Jul 2024 20:31:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c08248sm63127e87.125.2024.07.24.20.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 20:31:01 -0700 (PDT)
Date: Thu, 25 Jul 2024 06:31:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jameson Thies <jthies@google.com>, Sebastian Reichel <sre@kernel.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Add status to UCSI power supply
 driver
Message-ID: <tzljywuym6jsh5q5iuc7rrtq564d3ffl3e4ltuii7xzkd6cf7d@2nmj5qkusbkt>
References: <20240724201116.2094059-1-jthies@google.com>
 <20240724201116.2094059-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724201116.2094059-2-jthies@google.com>

On Wed, Jul 24, 2024 at 08:11:13PM GMT, Jameson Thies wrote:
> Add status to UCSI power supply driver properties based on the port's
> connection and power direction states.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Please CC Power Supply maintainers for this patchset (added to cc).

At least per the Documentation/ABI/testing/sysfs-class-power, the status
property applies to batteries, while UCSI psy device is a charger. This
is logical, as there might be multiple reasons why the battery is not
being charging even when the supply is online.

> ---
> Changes in V2:
> - None.
> 
>  drivers/usb/typec/ucsi/psy.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index e623d80e177c..d0b52cee41d2 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -29,6 +29,7 @@ static enum power_supply_property ucsi_psy_props[] = {
>  	POWER_SUPPLY_PROP_CURRENT_MAX,
>  	POWER_SUPPLY_PROP_CURRENT_NOW,
>  	POWER_SUPPLY_PROP_SCOPE,
> +	POWER_SUPPLY_PROP_STATUS,
>  };
>  
>  static int ucsi_psy_get_scope(struct ucsi_connector *con,
> @@ -51,6 +52,20 @@ static int ucsi_psy_get_scope(struct ucsi_connector *con,
>  	return 0;
>  }
>  
> +static int ucsi_psy_get_status(struct ucsi_connector *con,
> +			       union power_supply_propval *val)
> +{
> +	val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
> +	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> +		if ((con->status.flags & UCSI_CONSTAT_PWR_DIR) == TYPEC_SINK)
> +			val->intval = POWER_SUPPLY_STATUS_CHARGING;
> +		else
> +			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ucsi_psy_get_online(struct ucsi_connector *con,
>  			       union power_supply_propval *val)
>  {
> @@ -249,6 +264,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
>  		return ucsi_psy_get_current_now(con, val);
>  	case POWER_SUPPLY_PROP_SCOPE:
>  		return ucsi_psy_get_scope(con, val);
> +	case POWER_SUPPLY_PROP_STATUS:
> +		return ucsi_psy_get_status(con, val);
>  	default:
>  		return -EINVAL;
>  	}
> -- 
> 2.45.2.1089.g2a221341d9-goog
> 

-- 
With best wishes
Dmitry

