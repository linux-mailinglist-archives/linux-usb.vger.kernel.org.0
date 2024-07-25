Return-Path: <linux-usb+bounces-12408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65093BB60
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 06:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB25F1C219EC
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 04:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C0F18040;
	Thu, 25 Jul 2024 04:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C//5/SK5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807017722
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 04:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721880453; cv=none; b=OdTYN4SWAwho8MGAqkz6W5QgHC3GawShdLpvlOehRUssLMcEUI/0M/addEGp+Ab84IwsaNcXJKRW8MEPPvGfP2p/vW52Pgb5Y4P4PxppCq5pqsDe8hTVIDZd5cRKEpniQfsvYeTnoTnMe6ShEfUH7xcfsXGM8IBYtrHBgrflRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721880453; c=relaxed/simple;
	bh=tDv9Amv3Prjs4GP6blhpnjCEwe9xbzV1Nq1LBAafEQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIVYWAzrmh0Gs2fApKdGV2IcNembOZYQ0d6r7zcqmul/6qzl3CKv23LSi0G7azJWlmuJcDoy+e6s7Unjrnp50Glj9spNGOT5No9w+ZKzG73uKcOYlk5mYpFEwxqS8FB+WjqJeMQ+8FcVPq7ermOOpxuv1HBZURdgv0h6xVa3XxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C//5/SK5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f008aa351so503597e87.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 21:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721880450; x=1722485250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wg8KguZ400Lou+tqhNrOW9J9c6tYJhHWQvL5hPbaZB4=;
        b=C//5/SK5O942CyF3tCoIh41r8C1SA7io1IOG+E/7aJs2JNAqpLLfOtt4TqltaBqy5a
         GsAynDvwaww0Dg2nThSI6aCsg/txeUhAVK1Sb8osMV4vISpPkwHivJnBN8958ZGkAGhj
         1w1SNfppV63Hh5mJjxzKZdLzvUZqMz4759fEVL+h88YW5eWajjrePfh8/d/9eU73HHBM
         EJvLKGF4AJatFewMjf7suwup7bnEpxzXj7F5qyuTYYImcg0uE2uPk9SH9AzyEP5wk4na
         eK05eijPZmOrZ4B84FyX2MqTfOryIC4tESJIvx0BZD51DdRJdRv59GFqeccr7OXW0Pr1
         3N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721880450; x=1722485250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg8KguZ400Lou+tqhNrOW9J9c6tYJhHWQvL5hPbaZB4=;
        b=XVQ59U5SflsrokdOTxs0pI1BVOAo5ikzaxKBfUAkpj2ZDO5cJntzYvZULpKbFNlDy8
         li36jwh8aj4kBDa5QcJh/flJiWy8UmyUUJfD54+pH6k/ZsZmBTGAah/R1/EX20kxwgh2
         q7KRao5cD1OjkVMHZwEajxBY1x5UlFJVYK7KPehte87q0x18QsiA7fmrDKd5AR9cmyUL
         /qPCIHprvsBGnhQgYuzdFtFJ5hwTGz1diaq65d6BwI1bZSnYJRnOSBB/QfJ3dscCfkDO
         d8kBttsJjDxvBURDrllXNDOd3jgClfHQWREB3LK0+HJg+7TU1kzxgsBU4h4G+KbOcK3D
         Lb6g==
X-Forwarded-Encrypted: i=1; AJvYcCVFRyHCT0K2obzHiNBkVP6/xnmzAY6KCh5ijta8LpJYAsa0EtHm/5GvIhHDunT9I+7/4jd/t5H3GQ3ZKZkDdNSzjkfOCS5viKXJ
X-Gm-Message-State: AOJu0YwH1Coq3NFTCs1i7FPHDIw5K0FmrJF87o62ct3hoQ40bZfGtwWU
	fqxcsnxNCGGP4Fu2Q6ZigXuLE1BWNdaPGoCBmZbb8d0D4+wyZk+a4nsuO5bbMFI=
X-Google-Smtp-Source: AGHT+IFMbeszy8ijAPgdau73JqD2oKtivYn8r7aXUNCmhS73K/VW1TAayrYjkDzGxFoXMQRGSKOHAA==
X-Received: by 2002:a05:6512:238b:b0:52c:db06:ee60 with SMTP id 2adb3069b0e04-52fd6084195mr442998e87.41.1721880449894;
        Wed, 24 Jul 2024 21:07:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc42b4sm71680e87.12.2024.07.24.21.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:07:29 -0700 (PDT)
Date: Thu, 25 Jul 2024 07:07:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jameson Thies <jthies@google.com>, Sebastian Reichel <sre@kernel.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: typec: ucsi: Set sink path based on UCSI
 charge control
Message-ID: <5eloulbppelko7hwyppq4apkuqowe3yv5bd7rlipispetg6aqj@u3mzwubs6xxf>
References: <20240724201116.2094059-1-jthies@google.com>
 <20240724201116.2094059-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724201116.2094059-4-jthies@google.com>

On Wed, Jul 24, 2024 at 08:11:15PM GMT, Jameson Thies wrote:
> Add POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX as a property to the UCSI
> power supply driver. When set to a positive value, enable the
> connector's sink path. When set to a negative value, disable the
> connector's sink path.

[Also added power supply maintainers to cc]

This really looks like a hack. As a user I'd expect that if I set the
charging limit, it really gets applied. In other words, I'd expect to be
able to limit 60W PSY to provide just 15W by limiting the current. This
is not the case with this patch.

Please provide rational for this change, i.e. why using the existing
typec property isn't enough for your use case.

> 
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Changes in V2:
> - Added SET_SINK_PATH call when handling charge_control_limit_max
> update. Updated commit message.
> 
>  drivers/usb/typec/ucsi/psy.c  | 52 +++++++++++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c | 15 ++++++++++
>  drivers/usb/typec/ucsi/ucsi.h |  5 ++++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index d708f9eb1654..28265feb9d13 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -30,6 +30,7 @@ static enum power_supply_property ucsi_psy_props[] = {
>  	POWER_SUPPLY_PROP_CURRENT_NOW,
>  	POWER_SUPPLY_PROP_SCOPE,
>  	POWER_SUPPLY_PROP_STATUS,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
>  };
>  
>  static int ucsi_psy_get_scope(struct ucsi_connector *con,
> @@ -275,11 +276,60 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
>  		return ucsi_psy_get_scope(con, val);
>  	case POWER_SUPPLY_PROP_STATUS:
>  		return ucsi_psy_get_status(con, val);
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX:
> +		val->intval = 0;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ucsi_psy_set_charge_control_limit_max(struct ucsi_connector *con,
> +				 const union power_supply_propval *val)
> +{
> +	/*
> +	 * Writing a negative value to the charge control limit max implies the
> +	 * port should not accept charge. Disable the sink path for a negative
> +	 * charge control limit, and enable the sink path for a positive charge
> +	 * control limit. If the requested charge port is a source, update the
> +	 * power role.
> +	 */
> +	int ret;
> +	bool sink_path = false;
> +
> +	if (val->intval >= 0) {
> +		sink_path = true;
> +		if (!con->typec_cap.ops || !con->typec_cap.ops->pr_set)
> +			return -EINVAL;
> +
> +		ret = con->typec_cap.ops->pr_set(con->port, TYPEC_SINK);

Should there be a call to pr_set(TYPEC_SOURCE) if the value is negative?

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return ucsi_set_sink_path(con, sink_path);

You are calling SET_SINK_PATH uncoditionally, while this command was not
defined for UCSI 1.x. Also it is an error to call it when device is in
power source mode or if there is no partner connected.

Last, but not least, the property value survives between PSY reconnects
(which is expected), however after reconnecting the partner device, the
value won't be reprogrammed by the UCSI driver, resulting in the
inconsistency between the sysfs and actual system state.

> +}
> +
> +static int ucsi_psy_set_prop(struct power_supply *psy,
> +			     enum power_supply_property psp,
> +			     const union power_supply_propval *val)
> +{
> +	struct ucsi_connector *con = power_supply_get_drvdata(psy);
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX:
> +		return ucsi_psy_set_charge_control_limit_max(con, val);
>  	default:
>  		return -EINVAL;
>  	}
>  }
>  
> +static int ucsi_psy_prop_is_writeable(struct power_supply *psy,
> +			     enum power_supply_property psp)
> +{
> +	return psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX;
> +}
> +
>  static enum power_supply_usb_type ucsi_psy_usb_types[] = {
>  	POWER_SUPPLY_USB_TYPE_C,
>  	POWER_SUPPLY_USB_TYPE_PD,
> @@ -308,6 +358,8 @@ int ucsi_register_port_psy(struct ucsi_connector *con)
>  	con->psy_desc.properties = ucsi_psy_props;
>  	con->psy_desc.num_properties = ARRAY_SIZE(ucsi_psy_props);
>  	con->psy_desc.get_property = ucsi_psy_get_prop;
> +	con->psy_desc.set_property = ucsi_psy_set_prop;
> +	con->psy_desc.property_is_writeable = ucsi_psy_prop_is_writeable;
>  
>  	con->psy = power_supply_register(dev, &con->psy_desc, &psy_cfg);
>  
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index dcd3765cc1f5..02663fdebdd9 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1545,6 +1545,21 @@ static const struct typec_operations ucsi_ops = {
>  	.pr_set = ucsi_pr_swap
>  };
>  
> +int ucsi_set_sink_path(struct ucsi_connector *con, bool sink_path)
> +{
> +	struct ucsi *ucsi = con->ucsi;
> +	u64 command;
> +	int ret;
> +
> +	command = UCSI_SET_SINK_PATH | UCSI_CONNECTOR_NUMBER(con->num);
> +	command |= UCSI_SET_SINK_PATH_SINK_PATH(sink_path);
> +	ret = ucsi_send_command(ucsi, command, NULL, 0);
> +	if (ret < 0)
> +		dev_err(con->ucsi->dev, "SET_SINK_PATH failed (%d)\n", ret);
> +
> +	return ret;
> +}
> +
>  /* Caller must call fwnode_handle_put() after use */
>  static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
>  {
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 57129f3c0814..6a958eac5703 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -114,6 +114,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>  #define UCSI_GET_CONNECTOR_STATUS	0x12
>  #define UCSI_GET_ERROR_STATUS		0x13
>  #define UCSI_GET_PD_MESSAGE		0x15
> +#define UCSI_SET_SINK_PATH		0x1c
>  
>  #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
>  #define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
> @@ -187,6 +188,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>  #define   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY	4
>  #define   UCSI_GET_PD_MESSAGE_TYPE_REVISION	5
>  
> +/* SET_SINK_PATH command bits */
> +#define UCSI_SET_SINK_PATH_SINK_PATH(_r_)	(((_r_) ? 1 : 0) << 23)
> +
>  /* -------------------------------------------------------------------------- */
>  
>  /* Error information returned by PPM in response to GET_ERROR_STATUS command. */
> @@ -492,6 +496,7 @@ int ucsi_send_command(struct ucsi *ucsi, u64 command,
>  
>  void ucsi_altmode_update_active(struct ucsi_connector *con);
>  int ucsi_resume(struct ucsi *ucsi);
> +int ucsi_set_sink_path(struct ucsi_connector *con, bool sink_path);
>  
>  void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
>  int ucsi_sync_control_common(struct ucsi *ucsi, u64 command);
> -- 
> 2.45.2.1089.g2a221341d9-goog
> 

-- 
With best wishes
Dmitry

