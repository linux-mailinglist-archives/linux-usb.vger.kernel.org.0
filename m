Return-Path: <linux-usb+bounces-14701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9FE96D6F6
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 13:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C34F0B2184A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 11:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B9819938D;
	Thu,  5 Sep 2024 11:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rysf8soX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3119884A
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725535405; cv=none; b=nb+dEg8eqbaAxcH4tF8p91qKT3i2P7quW3de+Bgmtk51NirM5EFMTSfqQR/WMbpQouuCrWX2r5wiAF83xjtt3JzsDSsV3BYfZaknjCfMrIdob31YEu79EfvpD0qLM+20L6JA6DiJR9m+Pq96S9paJdy9+MpHpbVMWpR29vaiafY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725535405; c=relaxed/simple;
	bh=uzVm63Qqt3Tui1IbbhruevLE5CI9ytwBhLtMm8qzhag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4Di2G5SCoM0vr0g5IPC9Rzoxwq4DqvTn4j69jGM4xJxOAhPr6m9tcA2kYnUgAYZgzJ9sCDk4s3nwqqnOFObsyxa0+xftnnpBjhoaI9HzSTw49nKDzvuomSQKog/6eZlX7ldzvOGWW8jlAOgNxC9uxINMMgfqSgwfmffpb7DYvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rysf8soX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725535404; x=1757071404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uzVm63Qqt3Tui1IbbhruevLE5CI9ytwBhLtMm8qzhag=;
  b=Rysf8soXuuv9GrQMwlWtWpvY5qeiYqcPt10/FvClmEheAMOyYK1G4AEC
   TYVoPmyyQnYw9kkS0/69G1eTX783O/hp6zZHL8wdbzIJHhU8uRMX6ssYW
   D1t40oD3AsNTxnIA0n2mgQ39S11LqhgNdkDuFCt944r1at88JzKZASLGg
   P7SSov6R+9klsFQjPNgAUflVykkKXHEeDU6cQ6upZXe7NfOyqQTiLEn0W
   3wbXJQmHTI535NzP8mD7oWVq6TyzGJ6AZca/cEF/6NQ519q/NkQ7/F3+9
   wLZA9HTFrg9Zqz6Yy1UltX/Wb4XjaxKHuPvhlVKLpxElA0W2rFrHjm8sT
   Q==;
X-CSE-ConnectionGUID: 52sEose9RV+dGSnfzpD1bQ==
X-CSE-MsgGUID: cWK4QR0gTBm5KT9BxW7Cow==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34816128"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="34816128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 04:23:23 -0700
X-CSE-ConnectionGUID: oASWpxPsTRWZgEa/hPgv4w==
X-CSE-MsgGUID: 2L/stiQhSL2bBChkSJaD2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="70388810"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa005.jf.intel.com with SMTP; 05 Sep 2024 04:23:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 05 Sep 2024 14:23:18 +0300
Date: Thu, 5 Sep 2024 14:23:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v5 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <ZtmUptrsOvcRxiVa@kuha.fi.intel.com>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
 <20240903163033.3170815-4-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903163033.3170815-4-ukaszb@chromium.org>

On Tue, Sep 03, 2024 at 04:30:28PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 ++
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 278 ++++++++++++++++++++++++++
>  4 files changed, 299 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe83ba7194ea..8c030ea0b503 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5300,6 +5300,13 @@ L:	chrome-platform@lists.linux.dev
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
> index 000000000000..6b9dc05a4960
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * UCSI driver for ChromeOS EC
> + *
> + * Copyright 2024 Google LLC.
> + */
> +
> +#include <linux/container_of.h>
> +#include <linux/dev_printk.h>
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
> + * Maximum time in miliseconds the cros_ec_ucsi driver
> + * will wait for a response to a command or and ack.
> + */
> +#define WRITE_TMO_MS		5000
> +
> +struct cros_ucsi_data {
> +	struct device *dev;
> +	struct ucsi *ucsi;
> +
> +	struct cros_ec_device *ec;
> +	struct notifier_block nb;
> +	struct work_struct work;
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
> +	struct ec_params_ucsi_ppm_set *req;
> +	size_t req_len;
> +	int ret;
> +
> +	req_len = sizeof(struct ec_params_ucsi_ppm_set) + sizeof(cmd);
> +	req = kzalloc(req_len, GFP_KERNEL);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	req->offset = UCSI_CONTROL;
> +	memcpy(req->data, &cmd, sizeof(cmd));
> +	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> +			  req, req_len, NULL, 0);
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
> +	bool ack = UCSI_COMMAND(cmd) == UCSI_ACK_CC_CI;
> +	int ret;
> +
> +	if (ack)
> +		set_bit(ACK_PENDING, &udata->flags);
> +	else
> +		set_bit(COMMAND_PENDING, &udata->flags);
> +
> +	ret = cros_ucsi_async_control(ucsi, cmd);
> +	if (ret)
> +		goto out;
> +
> +	if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_MS))
> +		ret = -ETIMEDOUT;
> +
> +out:
> +	if (ack)
> +		clear_bit(ACK_PENDING, &udata->flags);
> +	else
> +		clear_bit(COMMAND_PENDING, &udata->flags);
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
> +	if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci)))
> +		return;
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	if (cci & UCSI_CCI_ACK_COMPLETE &&
> +	    test_and_clear_bit(ACK_PENDING, &udata->flags))
> +		complete(&udata->complete);
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> +	    test_and_clear_bit(COMMAND_PENDING, &udata->flags))
> +		complete(&udata->complete);
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
> +	cancel_work_sync(&udata->work);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cros_ucsi_resume(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	return ucsi_resume(udata->ucsi);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(cros_ucsi_pm_ops, cros_ucsi_suspend,
> +			 cros_ucsi_resume);
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
> 2.46.0.469.g59c65b2a67-goog

-- 
heikki

