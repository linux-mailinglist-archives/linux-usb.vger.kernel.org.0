Return-Path: <linux-usb+bounces-21816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CDA63D0F
	for <lists+linux-usb@lfdr.de>; Mon, 17 Mar 2025 04:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A053516B838
	for <lists+linux-usb@lfdr.de>; Mon, 17 Mar 2025 03:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8651D2080C0;
	Mon, 17 Mar 2025 03:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAMvJ+7D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70C322B;
	Mon, 17 Mar 2025 03:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742182015; cv=none; b=kTB9rquL1cT7TXVejUcs2R32LwUCzx6/gtbGXzUC08zJDrLQv0Nh3AlCa6bl7HUEk4MR1ZBchBHP4ok2lLVg1tGK1+fhjJMToNQpY5PMAnvkiLmUH1fexJ8rJJ/foYCDThKj01Ncu2LmkZ6q4EloPSUPLAvjoMjatQSSzbYuTk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742182015; c=relaxed/simple;
	bh=MntX4WXhD7Rn4lRpUTgk9hO7WmibdssDRP6V2g/nfq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il5yS3pPfXY1yrKmHGEHORdd+XCcublZ5FJr3Gxr9qWUojHxllw/oOe6Md8LbnmrJaQs6oRV7MQZ9TmZNMNA1l+3PLKJHMv5yFtuWkoQ8BsxIQog7Lq5IR/psne36n2n9qmBsWLRPYqLlL6Z9GH/aJhWlia1NZNeDwm77J4vaxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAMvJ+7D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1847BC4CEDD;
	Mon, 17 Mar 2025 03:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742182014;
	bh=MntX4WXhD7Rn4lRpUTgk9hO7WmibdssDRP6V2g/nfq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAMvJ+7DYqO43upWJujNjVcF+gOkFRup/ERksXvyq1UUurhX4jq57SNhcFCSuIt7h
	 Nh5fVVF3amiQTRaExNxbrHDNZOw72iRHAMxkgVPZIX0ZjEaCpziK6TcW4dS7T9r16V
	 5wCtrn0wk1xUwdjiiEU1IoF88mK0v8XNYFwIhTAmPiZLH9oWjY1Pe2IL/bOiDjE35b
	 vNvbpoD/84xqChjC2jhOiXRxR6sGdQLFJC2f7Ze0W30d7lDP0fBwfEuQIyeQAnQyL+
	 RgDBT2y6dtmP4xOpuaCrBpswox50B30W7aYsLZDmoFGw0b+cEtKcjam2R+KgmHxGHS
	 TQoSHv+Nb68Sg==
Date: Mon, 17 Mar 2025 11:26:45 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250317032645.GD218167@nchen-desktop>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
 <20250312082700.260260-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312082700.260260-4-xu.yang_2@nxp.com>

On 25-03-12 16:26:57, Xu Yang wrote:
> In previous imx platform, normal USB controller interrupt and wakeup
> interrupt are bound to one irq line. However, it changes on latest
> i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> This will add wakeup interrupt handling for i.MX95 to support various
> wakeup events.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
> Changes in v5:
>  - remove warning
>  - add wakeup_irq checking
> Changes in v4:
>  - warning if no irq provided for imx95
> Changes in v3:
>  - include <linux/irq.h> to fix possible build issue
> Changes in v2:
>  - rename irq to wakeup_irq
>  - disable irq by default
>  - enable irq when suspend, disable irq when resume
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 37 ++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 1a7fc638213e..c34298ccc399 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/module.h>
> +#include <linux/irq.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> @@ -98,6 +99,7 @@ struct ci_hdrc_imx_data {
>  	struct clk *clk;
>  	struct clk *clk_wakeup;
>  	struct imx_usbmisc_data *usbmisc_data;
> +	int wakeup_irq;
>  	bool supports_runtime_pm;
>  	bool override_phy_control;
>  	bool in_lpm;
> @@ -336,6 +338,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
>  	return ret;
>  }
>  
> +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> +{
> +	struct ci_hdrc_imx_data *imx_data = data;
> +
> +	disable_irq_nosync(irq);
> +	pm_runtime_resume(&imx_data->ci_pdev->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  {
>  	struct ci_hdrc_imx_data *data;
> @@ -476,6 +488,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
>  		data->supports_runtime_pm = true;
>  
> +	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq > 0) {
> +		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> +						NULL, ci_wakeup_irq_handler,
> +						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +						pdata.name, data);
> +		if (ret)
> +			goto err_clk;
> +	}
> +
>  	ret = imx_usbmisc_init(data->usbmisc_data);
>  	if (ret) {
>  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> @@ -584,6 +606,10 @@ static int imx_controller_suspend(struct device *dev,
>  	}
>  
>  	imx_disable_unprepare_clks(dev);
> +
> +	if (data->wakeup_irq > 0)
> +		enable_irq(data->wakeup_irq);
> +
>  	if (data->plat_data->flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_remove_request(&data->pm_qos_req);
>  
> @@ -608,6 +634,10 @@ static int imx_controller_resume(struct device *dev,
>  	if (data->plat_data->flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
>  
> +	if (data->wakeup_irq > 0 &&
> +	    !irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
> +		disable_irq_nosync(data->wakeup_irq);
> +
>  	ret = imx_prepare_enable_clks(dev);
>  	if (ret)
>  		return ret;
> @@ -643,6 +673,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
>  		return ret;
>  
>  	pinctrl_pm_select_sleep_state(dev);
> +
> +	if (data->wakeup_irq > 0 && device_may_wakeup(dev))
> +		enable_irq_wake(data->wakeup_irq);
> +
>  	return ret;
>  }
>  
> @@ -651,6 +685,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (data->wakeup_irq > 0 && device_may_wakeup(dev))
> +		disable_irq_wake(data->wakeup_irq);
> +
>  	pinctrl_pm_select_default_state(dev);
>  	ret = imx_controller_resume(dev, PMSG_RESUME);
>  	if (!ret && data->supports_runtime_pm) {
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

