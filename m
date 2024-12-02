Return-Path: <linux-usb+bounces-18001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9E9E0313
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 14:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F469288CD5
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 13:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B3920370A;
	Mon,  2 Dec 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqOyLJJf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F31FF619
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733145357; cv=none; b=gPkKRf8D42O5Sdd1bX9EvEyNwPybQGK5Aqz2OqUT/aURBKFpLUF1oXkqR2MObrm8FOZR5KHbHkWAjIzJJbJplX1ToA5MO+HWdDor3Gk76LtLrggoHedhbuNIOs9lzWNnKPNTyqG2G/DdSoI68FL24Oj3GjBaSI52zIh1eiOWVnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733145357; c=relaxed/simple;
	bh=WU6ck+0Qy9yHkhsozKkaNL/acN445LpT3mXeqjSFazM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4YhTj2mfnpBgVVSDk4WfG7lhomIcWojur03c05UIZb2YedTUWqtBD0SMn7vk58zoFhn07P9PSWNCwiA83QYWT3YaqrWpRpbwODEixf/XmYcyP6QJ4Y3VP+eKLryF5/rG04XUwWoqPJWWfmUTQLx/1RIAPJrBTLmj2CABu3Sj2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqOyLJJf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733145356; x=1764681356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WU6ck+0Qy9yHkhsozKkaNL/acN445LpT3mXeqjSFazM=;
  b=TqOyLJJfV3nsegEiyEpqsN1CGrpKEJqqihRDyMNNRMbIaEc0pexjpApQ
   3OD6LAMIBnu8OFKS6LDINZJgm5ZSwRM9gmQNAQg/8uL68SzDkKZnJSxqJ
   P+KCCdzKIDCcvVj0DJB+1j6BYaQUq9Pa9XKQrWPt+DEoqybh7DBEeIXWz
   Trx7ErndOdYdUH9K1z/KBbjVme8PVUrlurxfP128K02RLLqlkdBYmCjYd
   Qz+5yJFfTQ2OkJyFGexhN43IgKpOA1PQJS//O6VM/vCubQudQOggXZqo/
   Weg6TB/uh36GfGYfMR5GLA63HnGjqZ5UGnlHE3VwrnBj/a91DsbWo6ieP
   A==;
X-CSE-ConnectionGUID: mH3pY52YTWCHWWuoZ54gVg==
X-CSE-MsgGUID: fjLVwQfaQsm1XAtvK5+d6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32664707"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="32664707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 05:15:46 -0800
X-CSE-ConnectionGUID: oxnEocpLQFyh6BMqs+2tYg==
X-CSE-MsgGUID: Es7aOygbQ3CHSz6Ly/3Yhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="97535258"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa005.fm.intel.com with SMTP; 02 Dec 2024 05:15:42 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 02 Dec 2024 15:15:42 +0200
Date: Mon, 2 Dec 2024 15:15:41 +0200
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
Subject: Re: [PATCH v8 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <Z02y_Zm1XOePjy_j@kuha.fi.intel.com>
References: <20241128232035.1525978-1-ukaszb@chromium.org>
 <20241128232035.1525978-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128232035.1525978-3-ukaszb@chromium.org>

On Thu, Nov 28, 2024 at 11:20:34PM +0000, Łukasz Bartosik wrote:
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
>  drivers/usb/typec/ucsi/Kconfig        |  13 ++
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 252 ++++++++++++++++++++++++++
>  4 files changed, 273 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b878ddc99f94..b0542223579a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5389,6 +5389,13 @@ L:	chrome-platform@lists.linux.dev
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
> index 000000000000..c588d9a57643
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -0,0 +1,252 @@
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
> + * Maximum time in milliseconds the cros_ec_ucsi driver
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
> +struct ucsi_operations cros_ucsi_ops = {
> +	.read_version = cros_ucsi_read_version,
> +	.read_cci = cros_ucsi_read_cci,
> +	.read_message_in = cros_ucsi_read_message_in,
> +	.async_control = cros_ucsi_async_control,
> +	.sync_control = ucsi_sync_control_common,
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

