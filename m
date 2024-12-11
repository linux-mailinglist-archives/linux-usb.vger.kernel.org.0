Return-Path: <linux-usb+bounces-18381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F39EC92D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 10:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9A44285DF1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 09:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438ED1A83E9;
	Wed, 11 Dec 2024 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxhXfprF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D08236F8A
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909624; cv=none; b=R6phuFhDTAOuYXAQbvK8uRAK6oF3VhZ4QPk00Yh1N9JbuAi4qURbo3H6XA77rCrEUqsfxcu8NFqknTfMXfFueatIqomhfKMLN6+57Kwl6WgSUaPXdZDIubpr8/YKnPO5T3PYi4eK+r/5ueOtM1TmHv5icfG5JkEu/+hyM2BqLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909624; c=relaxed/simple;
	bh=Dl8V0E+ocK33UovwYIf/+2i2ogc/HPt3++QsTHolJ/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkDlaKcWcwcoroWeuaGBTuD5+qP9V1/UNKMPY8jRIFRzMOUPBz05n5f//NdMl0Goe+eCbFu7h/EFERnsFdfX+ScWEc+gnvRRnJh77s6wTinGVZhu9JgB/2x2jRIcM+VmCs+xSMkJXYoa1lgMjMTgz44d9/6+y7km0Aw9BmnH70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxhXfprF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733909623; x=1765445623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Dl8V0E+ocK33UovwYIf/+2i2ogc/HPt3++QsTHolJ/w=;
  b=LxhXfprFZzY0XH6fPczmGnkk64M1FvKen4elfs4QqWQe02MyilVbuv0+
   wlODto/DiLTde5Gj6WIXSQYVje3lMvJ8DKF36Jau0tXySs+HMmul9BkP7
   pp5v0d+kZ09/MIifWG3ObU+XOgp+hbMLvY4L2OwDt0Gf7L2Mm2Wx7hViu
   6RRa6RvuEicCa5CDvSuhpRznzhHTHDGPNn4oTQaIR8ZNeQMkrWatMh0rR
   Xc2kitdTFhjAy1C2OeD2+w5C8KRijN83k+gCqL5P9hNmQmBQj8ToZ5dMx
   GKDoLdVpHfoDVMBan5ypyYD3zVvrOHoX2Ik6yvdIX35clkwPyGs8A1dD5
   g==;
X-CSE-ConnectionGUID: mHtyoJxGTgyX0+FxHZkA2g==
X-CSE-MsgGUID: Na+izSkbRF+8j203Y/hQcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37968923"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="37968923"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:33:42 -0800
X-CSE-ConnectionGUID: fYgA4BCKSteZCfNv1xbwFg==
X-CSE-MsgGUID: T1hZBiyuT1KlscAGY3X6Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="95443211"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa006.fm.intel.com with SMTP; 11 Dec 2024 01:33:38 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Dec 2024 11:33:37 +0200
Date: Wed, 11 Dec 2024 11:33:37 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v11 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <Z1lccVL5TA8n7ckx@kuha.fi.intel.com>
References: <20241210144527.1657888-1-ukaszb@chromium.org>
 <20241210144527.1657888-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210144527.1657888-3-ukaszb@chromium.org>

On Tue, Dec 10, 2024 at 02:45:27PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 +
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 337 ++++++++++++++++++++++++++
>  4 files changed, 358 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 17daa9ee9384..6d24db48421d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5454,6 +5454,13 @@ L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/watchdog/cros_ec_wdt.c
>  
> +CHROMEOS UCSI DRIVER
> +M:	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> +M:	Łukasz Bartosik <ukaszb@chromium.org>
> +L:	chrome-platform@lists.linux.dev
> +S:	Maintained
> +F:	drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +
>  CHRONTEL CH7322 CEC DRIVER
>  M:	Joe Tessler <jrt@google.com>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index 680e1b87b152..75559601fe8f 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -69,6 +69,19 @@ config UCSI_PMIC_GLINK
>  	  To compile the driver as a module, choose M here: the module will be
>  	  called ucsi_glink.
>  
> +config CROS_EC_UCSI
> +	tristate "UCSI Driver for ChromeOS EC"
> +	depends on MFD_CROS_EC_DEV
> +	depends on CROS_USBPD_NOTIFY
> +	depends on !EXTCON_TCSS_CROS_EC
> +	default MFD_CROS_EC_DEV
> +	help
> +	  This driver enables UCSI support for a ChromeOS EC. The EC is
> +	  expected to implement a PPM.
> +
> +	  To compile the driver as a module, choose M here: the module
> +	  will be called cros_ec_ucsi.
> +
>  config UCSI_LENOVO_YOGA_C630
>  	tristate "UCSI Interface Driver for Lenovo Yoga C630"
>  	depends on EC_LENOVO_YOGA_C630
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index aed41d23887b..be98a879104d 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -21,4 +21,5 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
>  obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
>  obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
>  obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
> +obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
>  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> new file mode 100644
> index 000000000000..55b7ccc3f4e1
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * UCSI driver for ChromeOS EC
> + *
> + * Copyright 2024 Google LLC.
> + */
> +
> +#include <linux/container_of.h>
> +#include <linux/dev_printk.h>
> +#include <linux/jiffies.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_usbpd_notify.h>
> +#include <linux/platform_data/cros_ec_proto.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/wait.h>
> +
> +#include "ucsi.h"
> +
> +/*
> + * Maximum size in bytes of a UCSI message between AP and EC
> + */
> +#define MAX_EC_DATA_SIZE	256
> +
> +/*
> + * Maximum time in milliseconds the cros_ec_ucsi driver
> + * will wait for a response to a command or and ack.
> + */
> +#define WRITE_TMO_MS		5000
> +
> +/* Number of times to attempt recovery from a write timeout before giving up. */
> +#define WRITE_TMO_CTR_MAX	5
> +
> +struct cros_ucsi_data {
> +	struct device *dev;
> +	struct ucsi *ucsi;
> +
> +	struct cros_ec_device *ec;
> +	struct notifier_block nb;
> +	struct work_struct work;
> +	struct delayed_work write_tmo;
> +	int tmo_counter;
> +
> +	struct completion complete;
> +	unsigned long flags;
> +};
> +
> +static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
> +			  size_t val_len)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	struct ec_params_ucsi_ppm_get req = {
> +		.offset = offset,
> +		.size = val_len,
> +	};
> +	int ret;
> +
> +	if (val_len > MAX_EC_DATA_SIZE) {
> +		dev_err(udata->dev, "Can't read %zu bytes. Too big.", val_len);
> +		return -EINVAL;
> +	}
> +
> +	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_GET,
> +			  &req, sizeof(req), val, val_len);
> +	if (ret < 0) {
> +		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_GET: error=%d", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int cros_ucsi_read_version(struct ucsi *ucsi, u16 *version)
> +{
> +	return cros_ucsi_read(ucsi, UCSI_VERSION, version, sizeof(*version));
> +}
> +
> +static int cros_ucsi_read_cci(struct ucsi *ucsi, u32 *cci)
> +{
> +	return cros_ucsi_read(ucsi, UCSI_CCI, cci, sizeof(*cci));
> +}
> +
> +static int cros_ucsi_read_message_in(struct ucsi *ucsi, void *val,
> +				     size_t val_len)
> +{
> +	return cros_ucsi_read(ucsi, UCSI_MESSAGE_IN, val, val_len);
> +}
> +
> +static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	u8 ec_buf[sizeof(struct ec_params_ucsi_ppm_set) + sizeof(cmd)];
> +	struct ec_params_ucsi_ppm_set *req = (struct ec_params_ucsi_ppm_set *) ec_buf;
> +	int ret;
> +
> +	req->offset = UCSI_CONTROL;
> +	memcpy(req->data, &cmd, sizeof(cmd));
> +	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> +			  req, sizeof(ec_buf), NULL, 0);
> +	if (ret < 0) {
> +		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_SET: error=%d", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	int ret;
> +
> +	ret = ucsi_sync_control_common(ucsi, cmd);
> +	switch (ret) {
> +	case -EBUSY:
> +		/* EC may return -EBUSY if CCI.busy is set.
> +		 * Convert this to a timeout.
> +		 */
> +	case -ETIMEDOUT:
> +		/* Schedule recovery attempt when we timeout
> +		 * or tried to send a command while still busy.
> +		 */
> +		cancel_delayed_work_sync(&udata->write_tmo);
> +		schedule_delayed_work(&udata->write_tmo,
> +				      msecs_to_jiffies(WRITE_TMO_MS));
> +		break;
> +	case 0:
> +		/* Successful write. Cancel any pending recovery work. */
> +		cancel_delayed_work_sync(&udata->write_tmo);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +struct ucsi_operations cros_ucsi_ops = {
> +	.read_version = cros_ucsi_read_version,
> +	.read_cci = cros_ucsi_read_cci,
> +	.read_message_in = cros_ucsi_read_message_in,
> +	.async_control = cros_ucsi_async_control,
> +	.sync_control = cros_ucsi_sync_control,
> +};
> +
> +static void cros_ucsi_work(struct work_struct *work)
> +{
> +	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
> +	u32 cci;
> +
> +	if (cros_ucsi_read_cci(udata->ucsi, &cci))
> +		return;
> +
> +	ucsi_notify_common(udata->ucsi, cci);
> +}
> +
> +static void cros_ucsi_write_timeout(struct work_struct *work)
> +{
> +	struct cros_ucsi_data *udata =
> +		container_of(work, struct cros_ucsi_data, write_tmo.work);
> +	u32 cci;
> +	u64 cmd;
> +
> +	if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
> +		dev_err(udata->dev,
> +			"Reading CCI failed; no write timeout recovery possible.");
> +		return;
> +	}
> +
> +	if (cci & UCSI_CCI_BUSY) {
> +		udata->tmo_counter++;
> +
> +		if (udata->tmo_counter <= WRITE_TMO_CTR_MAX)
> +			schedule_delayed_work(&udata->write_tmo,
> +					      msecs_to_jiffies(WRITE_TMO_MS));
> +		else
> +			dev_err(udata->dev,
> +				"PPM unresponsive - too many write timeouts.");
> +
> +		return;
> +	}
> +
> +	/* No longer busy means we can reset our timeout counter. */
> +	udata->tmo_counter = 0;
> +
> +	/* Need to ack previous command which may have timed out. */
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE) {
> +		cmd = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
> +		cros_ucsi_async_control(udata->ucsi, &cmd);
> +
> +		/* Check again after a few seconds that the system has
> +		 * recovered to make sure our async write above was successful.
> +		 */
> +		schedule_delayed_work(&udata->write_tmo,
> +				      msecs_to_jiffies(WRITE_TMO_MS));
> +		return;
> +	}
> +
> +	/* We recovered from a previous timeout. Treat this as a recovery from
> +	 * suspend and call resume.
> +	 */
> +	ucsi_resume(udata->ucsi);
> +}
> +
> +static int cros_ucsi_event(struct notifier_block *nb,
> +			   unsigned long host_event, void *_notify)
> +{
> +	struct cros_ucsi_data *udata = container_of(nb, struct cros_ucsi_data, nb);
> +
> +	if (!(host_event & PD_EVENT_PPM))
> +		return NOTIFY_OK;
> +
> +	dev_dbg(udata->dev, "UCSI notification received");
> +	flush_work(&udata->work);
> +	schedule_work(&udata->work);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
> +{
> +	cros_usbpd_unregister_notify(&udata->nb);
> +	cancel_delayed_work_sync(&udata->write_tmo);
> +	cancel_work_sync(&udata->work);
> +	ucsi_destroy(udata->ucsi);
> +}
> +
> +static int cros_ucsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
> +	struct cros_ucsi_data *udata;
> +	int ret;
> +
> +	udata = devm_kzalloc(dev, sizeof(*udata), GFP_KERNEL);
> +	if (!udata)
> +		return -ENOMEM;
> +
> +	udata->dev = dev;
> +
> +	udata->ec = ec_data->ec_dev;
> +	if (!udata->ec) {
> +		dev_err(dev, "couldn't find parent EC device");
> +		return -ENODEV;
> +	}
> +
> +	platform_set_drvdata(pdev, udata);
> +
> +	INIT_WORK(&udata->work, cros_ucsi_work);
> +	INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
> +	init_completion(&udata->complete);
> +
> +	udata->ucsi = ucsi_create(dev, &cros_ucsi_ops);
> +	if (IS_ERR(udata->ucsi)) {
> +		dev_err(dev, "failed to allocate UCSI instance");
> +		return PTR_ERR(udata->ucsi);
> +	}
> +
> +	ucsi_set_drvdata(udata->ucsi, udata);
> +
> +	udata->nb.notifier_call = cros_ucsi_event;
> +	ret = cros_usbpd_register_notify(&udata->nb);
> +	if (ret) {
> +		dev_err(dev, "failed to register notifier: error=%d", ret);
> +		ucsi_destroy(udata->ucsi);
> +		return ret;
> +	}
> +
> +	ret = ucsi_register(udata->ucsi);
> +	if (ret) {
> +		dev_err(dev, "failed to register UCSI: error=%d", ret);
> +		cros_ucsi_destroy(udata);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void cros_ucsi_remove(struct platform_device *dev)
> +{
> +	struct cros_ucsi_data *udata = platform_get_drvdata(dev);
> +
> +	ucsi_unregister(udata->ucsi);
> +	cros_ucsi_destroy(udata);
> +}
> +
> +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&udata->write_tmo);
> +	cancel_work_sync(&udata->work);
> +
> +	return 0;
> +}
> +
> +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	ucsi_resume(udata->ucsi);
> +}
> +
> +/*
> + * UCSI protocol is also used on ChromeOS platforms which reply on
> + * cros_ec_lpc.c driver for communication with embedded controller (EC).
> + * On such platforms communication with the EC is not available until
> + * the .complete() callback of the cros_ec_lpc driver is executed.
> + * For this reason we delay ucsi_resume() until the .complete() stage
> + * otherwise UCSI SET_NOTIFICATION_ENABLE command will fail and we won't
> + * receive any UCSI notifications from the EC where PPM is implemented.
> + */
> +static const struct dev_pm_ops cros_ucsi_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend = cros_ucsi_suspend,
> +	.complete = cros_ucsi_complete,
> +#endif
> +};
> +
> +static const struct platform_device_id cros_ucsi_id[] = {
> +	{ KBUILD_MODNAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> +
> +static struct platform_driver cros_ucsi_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.pm = &cros_ucsi_pm_ops,
> +	},
> +	.id_table = cros_ucsi_id,
> +	.probe = cros_ucsi_probe,
> +	.remove = cros_ucsi_remove,
> +};
> +
> +module_platform_driver(cros_ucsi_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> -- 
> 2.47.0.338.g60cca15819-goog

-- 
heikki

