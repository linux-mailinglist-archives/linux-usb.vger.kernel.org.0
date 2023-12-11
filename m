Return-Path: <linux-usb+bounces-3958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776F80C267
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 08:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24727B208C5
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 07:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D747E20B06;
	Mon, 11 Dec 2023 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fubGD19R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D93A208A2;
	Mon, 11 Dec 2023 07:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D9FC433C8;
	Mon, 11 Dec 2023 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702281206;
	bh=V8JRc6Ds9R+nfWjTNmn6P57m/pgKhuSAd3+p3IiUTT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fubGD19Rqj07XtqVgVZ6xm8zGDYR07xLruxRhpoH5eLvvyRCAy1xkVpGg1149abmV
	 AjJ15TJVSbNY0hc56DN2vB1wbdkNy+74/e0KrBFBOARyWBtokCrEJfYDzD5j5sv60P
	 63w1MiZyTaHPxJ+93eNNz4AuiP6zbZX5Nct8nHTc=
Date: Mon, 11 Dec 2023 08:53:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xinhu Wu <xinhu.wu@unisoc.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	xinhuwu.unisoc@gmail.com, zhiyong.liu@unisoc.com,
	peak.yang@unisoc.com, teng.zhang1@unisoc.com, bruce.chen@unisoc.com,
	surong.pang@unisoc.com, xingxing.luo@unisoc.com
Subject: Re: [PATCH V2 1/2] usb: typec: Support sprd_pmic_typec driver
Message-ID: <2023121122-jelly-password-6eac@gregkh>
References: <20231211074120.27958-1-xinhu.wu@unisoc.com>
 <20231211074120.27958-2-xinhu.wu@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211074120.27958-2-xinhu.wu@unisoc.com>

On Mon, Dec 11, 2023 at 03:41:19PM +0800, Xinhu Wu wrote:
> +config TYPEC_SPRD_PMIC
> +	tristate "SPRD Serials PMICs Typec Controller"
> +	help
> +	  Say Y or M here if your system has a SPRD PMIC Type-C port controller.
> +
> +	  If you choose to build this driver as a dynamically linked module, the
> +	  module will be called sprd_pmic_typec.ko.
> +	  SPRD_PMIC_TYPEC notify usb, phy, charger, and analog audio to proceed
> +	  with work

I do not understand these last two lines, are you sure they are correct?

> +
> +

Nit, only one blank line is needed here.


> +static irqreturn_t sprd_pmic_typec_interrupt(int irq, void *data)
> +{
> +	struct sprd_pmic_typec *sc = data;
> +	u32 event;
> +	int ret;
> +
> +	dev_info(sc->dev, "%s enter line %d\n", __func__, __LINE__);

debugging information?  Please remove.

> +	ret = regmap_read(sc->regmap, sc->base + SC27XX_INT_MASK, &event);
> +	if (ret)
> +		return ret;
> +
> +	event &= sc->var_data->event_mask;
> +
> +	ret = regmap_read(sc->regmap, sc->base + SC27XX_STATUS, &sc->state);
> +	if (ret)
> +		goto clear_ints;
> +
> +	sc->state &= sc->var_data->state_mask;
> +
> +	if (event & SC27XX_ATTACH_INT) {
> +		ret = sprd_pmic_typec_connect(sc, sc->state);
> +		if (ret)
> +			dev_warn(sc->dev, "failed to register partner\n");
> +	} else if (event & SC27XX_DETACH_INT) {
> +		sprd_pmic_typec_disconnect(sc, sc->state);
> +	}
> +
> +clear_ints:
> +	regmap_write(sc->regmap, sc->base + sc->var_data->int_clr, event);
> +
> +	dev_info(sc->dev, "now works as DRP and is in %d state, event %d\n",
> +		sc->state, event);

When drivers work properly, they are quiet, please never spam the kernel
log for normal operations.

> +static ssize_t
> +sprd_pmic_typec_cc_polarity_role_show(struct device *dev, struct device_attribute *attr,
> +		char *buf)
> +{
> +	struct sprd_pmic_typec *sc = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, 5, "%s\n", sprd_pmic_typec_cc_polarity_roles[sc->cc_polarity]);

sysfs_emit() please.

> +}
> +static DEVICE_ATTR_RO(sprd_pmic_typec_cc_polarity_role);

Where is this new sysfs file documented?

> +	ret = sysfs_create_groups(&sc->dev->kobj, sprd_pmic_typec_groups);

You just raced with userspace and lost, and better yet:

> +	if (ret < 0)
> +		dev_err(sc->dev, "failed to create cc_polarity %d\n", ret);

You do not even clean up properly here.

Please use the default groups for the driver and it should work just
fine.

> +	ret = sprd_pmic_typec_set_rtrim(sc);
> +	if (ret < 0) {
> +		dev_err(sc->dev, "failed to set typec rtrim %d\n", ret);
> +		goto error;
> +	}
> +
> +	ret = devm_request_threaded_irq(sc->dev, sc->irq, NULL,
> +					sprd_pmic_typec_interrupt,
> +					IRQF_EARLY_RESUME | IRQF_ONESHOT,
> +					dev_name(sc->dev), sc);

Are you sure you can use devm_() here?

> +static int sprd_pmic_typec_remove(struct platform_device *pdev)
> +{
> +	struct sprd_pmic_typec *sc = platform_get_drvdata(pdev);
> +
> +	sysfs_remove_groups(&sc->dev->kobj, sprd_pmic_typec_groups);

Again, should not be needed if you use the default groups of the
platform driver.

thanks,

greg k-h

