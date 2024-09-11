Return-Path: <linux-usb+bounces-14954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0959754FE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 16:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F4F8286355
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666CC19CC07;
	Wed, 11 Sep 2024 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pgxvgzn9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72972187543
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726063746; cv=none; b=j+5N5WFVmkeZocAEv3lzOi/elwgXGYa6G5LZVaKXDDhxDo2vLM58X9Oebod2VDAddXq2Bb5GMKJYr/P1IPfTW2Aek85V6sutWGsxGQA7a5oFJ95KQsD2aLiaaknV3jcH+j6KJEXwOQnlfFjaemr0qzDxolz2M7MYN0U1qCBIwGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726063746; c=relaxed/simple;
	bh=evFaezkn4AyvNNPXDfrCSs+D1haYqx6E/1tCDhVUDQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ+3d8GgBDXXpy+WsWXFdifMzPkl1Q841dISlFvO5LM2wqdYMeNcaV6xOSN8p8bv4bE42QkYk3ImKXLbuqE4DUqhNUufHV+mmuR1EB1ZFrFdxWUix67GJUeDq6xncBH/0HgK+ZgduNl72Pdh/JNDdO/4N3CUMW5coE3Hf1oYlEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pgxvgzn9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726063744; x=1757599744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=evFaezkn4AyvNNPXDfrCSs+D1haYqx6E/1tCDhVUDQ4=;
  b=Pgxvgzn90X/NJCdKI2huIF2katv12ZuvjghwLbxfFyJPUz1PMvrCxU8m
   3+mWIKz9YLWpN7r8ZXWcL/H81+tOvHYkUAjkDsFjw06OA/lMUBp/KMcoz
   mez5cJbJ1DXAgy2cCSrP0ZhJF9RqpR5myLlR0ULVQ5Rm0sVicXtSvxA5x
   YIAm9cTV//FJDoqx6MzHG45Y3MlZ9RsNluppFW8PSTyPwIyN2inCkfb84
   WyC2gw3EeVen4ymrH8g04ZbZ9jRdxR4iQPQNQWjUcmmvCdkTOnsGuc4Yt
   XTmw/OrE7owNl1moPGUsOmtjqRB2cvw3xiE/v7kZZxIqRXX78lsre/03h
   A==;
X-CSE-ConnectionGUID: CeTu1dnJS+6dqQuhB6mMMw==
X-CSE-MsgGUID: 1qxdF5yXSRaRXKH0e/iGGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25058918"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="25058918"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:09:03 -0700
X-CSE-ConnectionGUID: A3zKgBouQFS0j9IcofVs8A==
X-CSE-MsgGUID: dO+0SzonSqaqgkgkWoShPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72161403"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa003.jf.intel.com with SMTP; 11 Sep 2024 07:07:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Sep 2024 17:07:46 +0300
Date: Wed, 11 Sep 2024 17:07:46 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
Message-ID: <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-7-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101527.603452-7-ukaszb@chromium.org>

Hi,

On Tue, Sep 10, 2024 at 10:15:25AM +0000, Łukasz Bartosik wrote:
> Add netlink to ChromeOS UCSI driver to allow forwarding
> of UCSI messages to userspace for debugging and testing
> purposes.

Why does this need to be cros_ec specific?

> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                                   |  4 +-
>  drivers/usb/typec/ucsi/Makefile               |  4 +-
>  .../{cros_ec_ucsi.c => cros_ec_ucsi_main.c}   | 66 +++++++++++++-
>  drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c      | 87 +++++++++++++++++++
>  drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h      | 52 +++++++++++
>  5 files changed, 209 insertions(+), 4 deletions(-)
>  rename drivers/usb/typec/ucsi/{cros_ec_ucsi.c => cros_ec_ucsi_main.c} (79%)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d084f32208f0..2afb406a24ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5305,7 +5305,9 @@ M:	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>  M:	Łukasz Bartosik <ukaszb@chromium.org>
>  L:	chrome-platform@lists.linux.dev
>  S:	Maintained
> -F:	drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +F:	drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
> +F:	drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
> +F:	drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
>  F:	drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
>  
>  CHRONTEL CH7322 CEC DRIVER
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index be98a879104d..82d960394c39 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -21,5 +21,7 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
>  obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
>  obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
>  obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
> -obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
>  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
> +
> +obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
> +cros_ec_ucsi-y				:= cros_ec_ucsi_main.o cros_ec_ucsi_nl.o
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
> similarity index 79%
> rename from drivers/usb/typec/ucsi/cros_ec_ucsi.c
> rename to drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
> index 70185616ec86..008b61921278 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
> @@ -19,6 +19,7 @@
>  #define CREATE_TRACE_POINTS
>  #include "ucsi.h"
>  #include "cros_ec_ucsi_trace.h"
> +#include "cros_ec_ucsi_nl.h"
>  
>  /*
>   * Maximum size in bytes of a UCSI message between AP and EC
> @@ -43,6 +44,43 @@ struct cros_ucsi_data {
>  	unsigned long flags;
>  };
>  
> +/*
> + * When set to true the cros_ec_ucsi driver will forward all UCSI messages
> + * exchanged between OPM <-> PPM to userspace through netlink
> + */
> +static bool is_ap_sniffer_en;
> +
> +static ssize_t enable_ap_sniffer_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	return sprintf(buf, "%d\n", is_ap_sniffer_en);
> +}
> +
> +static ssize_t enable_ap_sniffer_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	u8 value;
> +
> +	if (kstrtou8(buf, 0, &value))
> +		return -EINVAL;
> +
> +	is_ap_sniffer_en = value ? 1 : 0;
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(enable_ap_sniffer);
> +
> +static struct attribute *cros_ec_ucsi_attrs[] = {
> +	&dev_attr_enable_ap_sniffer.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group cros_ec_ucsi_attrs_grp = {
> +	.attrs = cros_ec_ucsi_attrs,
> +};

Undocumented sysfs entry.

>  static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
>  			  size_t val_len)
>  {
> @@ -65,6 +103,9 @@ static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
>  		return ret;
>  	}
>  
> +	if (is_ap_sniffer_en)
> +		nl_cros_ec_bcast_msg(NL_CROS_EC_TO_PPM, NL_CROS_EC_RD, offset,
> +				     val, val_len);
>  	trace_cros_ec_opm_to_ppm_rd(offset, val, val_len);
>  	return 0;
>  }
> @@ -101,6 +142,9 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
>  		return ret;
>  	}
>  
> +	if (is_ap_sniffer_en)
> +		nl_cros_ec_bcast_msg(NL_CROS_EC_TO_PPM, NL_CROS_EC_WR,
> +				     req->offset, (u8 *) &cmd, sizeof(cmd));
>  	trace_cros_ec_opm_to_ppm_wr(req->offset, &cmd, sizeof(cmd));
>  	return 0;
>  }
> @@ -144,6 +188,8 @@ static void cros_ucsi_work(struct work_struct *work)
>  	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
>  	u32 cci;
>  
> +	if (is_ap_sniffer_en)
> +		nl_cros_ec_bcast_msg(NL_CROS_EC_TO_OPM, 0, 0, NULL, 0);
>  	trace_cros_ec_ppm_to_opm(0);
>  
>  	if (cros_ucsi_read_cci(udata->ucsi, &cci))
> @@ -229,13 +275,29 @@ static int cros_ucsi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ret = nl_cros_ec_register();
> +	if (ret) {
> +		dev_err(dev, "failed to register netlink: error=%d", ret);
> +		cros_ucsi_destroy(udata);
> +		return ret;
> +	}
> +
> +	ret = sysfs_create_group(&dev->kobj, &cros_ec_ucsi_attrs_grp);
> +	if (ret) {
> +		dev_err(dev, "failed to register sysfs group: error=%d", ret);
> +		cros_ucsi_destroy(udata);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> -static void cros_ucsi_remove(struct platform_device *dev)
> +static void cros_ucsi_remove(struct platform_device *pdev)
>  {
> -	struct cros_ucsi_data *udata = platform_get_drvdata(dev);
> +	struct cros_ucsi_data *udata = platform_get_drvdata(pdev);

Please merge that change into the patch 3/8.

> +	sysfs_remove_group(&pdev->dev.kobj, &cros_ec_ucsi_attrs_grp);
> +	nl_cros_ec_unregister();
>  	ucsi_unregister(udata->ucsi);
>  	cros_ucsi_destroy(udata);
>  }

thanks,

-- 
heikki

