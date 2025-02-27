Return-Path: <linux-usb+bounces-21121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E38B0A4738A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 04:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6DCD3B3B80
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 03:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2C4189F36;
	Thu, 27 Feb 2025 03:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPDpaTe6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DFB433C8;
	Thu, 27 Feb 2025 03:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740626732; cv=none; b=QEu1b8zbzA2YrFenismiV6KgyI7eN9or6QZCjL/dxiFhTWdEJG8nXv6qh3dACdcxQQN45zHv8LCXYKOAoGL2n5X9kiy2T8J0p+68PwLOizicttjO2dhSwgqKXKmXtiegx3SynWe2P2GXHBC7yrylMiKMbPnv09i6j8JWpWZvNUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740626732; c=relaxed/simple;
	bh=5a31LF99uBFZRKSYa+TaPtk16KCZeoZl+yAWQoqJOcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roPYNPdObkivyW3cYwHvoWGQuSlCLT8pP/bVEYLpyfgxaByCleA8+l4JCxAhRmB2rcpprH9FtEuMZGdrZLe24hxqoKfPVEZVuwV5SpgP8Ee+wkMywiY88ujmgoPfsTC+NHfezM4xaejtkbTpCdx+e6VLEWZ3PAYrDBISmOZ3ssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPDpaTe6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD6EC4CEDD;
	Thu, 27 Feb 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740626731;
	bh=5a31LF99uBFZRKSYa+TaPtk16KCZeoZl+yAWQoqJOcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPDpaTe6C2+aFhEdYMG5j3FWYV6/pcbHRWU4uVmuLTRwiqhs9v3OiQyadR40ninm9
	 MDtVke74KRTo0ZspG47w65/umh4xvgkGuDA5mgSZRfDhRZF7ssdYE5BWQyU/fzCsDn
	 str7YC7IM8JPLk1ftjoYzbwwRwlBFbgsWf30ZxdGeU9MCzcJRX8k0e1kTDB9WPtiy0
	 MDxNp+5czxYkbitZAAujISA7jbi5L7KCK6shGU6WTXBs19eejFxdrSNPU71ofp/VJ4
	 4uT1CuuQS+V3ItIF+CaQP5Zuw3ZvcmFCgDBVotWGg07GK6TgtKkLOR5utXSLOuXnMj
	 /ylEXREq4u/Yw==
Date: Thu, 27 Feb 2025 11:25:22 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 4/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <Z7_bInsND2BpyOdX@nchen-desktop>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
 <20250225053955.3781831-5-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225053955.3781831-5-xu.yang_2@nxp.com>

On 25-02-25 13:39:53, Xu Yang wrote:
> In previous imx platform, normal USB controller interrupt and wakeup
> interrupt are bound to one irq line. However, it changes on latest
> i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> This will add wakeup interrupt handling for i.MX95 to support various
> wakeup events.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Please fix the build error, and others are okay for me.

Peter
> ---
> Changes in v2:
>  - rename irq to wakeup_irq
>  - disable irq by default
>  - enable irq when suspend, disable irq when resume
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 1a7fc638213e..b36fc8c19748 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -98,6 +98,7 @@ struct ci_hdrc_imx_data {
>  	struct clk *clk;
>  	struct clk *clk_wakeup;
>  	struct imx_usbmisc_data *usbmisc_data;
> +	int wakeup_irq;
>  	bool supports_runtime_pm;
>  	bool override_phy_control;
>  	bool in_lpm;
> @@ -336,6 +337,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
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
> @@ -476,6 +487,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
>  		data->supports_runtime_pm = true;
>  
> +	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq > 0) {
> +		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> +				NULL, ci_wakeup_irq_handler,
> +				IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +				pdata.name, data);
> +		if (ret)
> +			goto err_clk;
> +	}
> +
>  	ret = imx_usbmisc_init(data->usbmisc_data);
>  	if (ret) {
>  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> @@ -584,6 +605,7 @@ static int imx_controller_suspend(struct device *dev,
>  	}
>  
>  	imx_disable_unprepare_clks(dev);
> +	enable_irq(data->wakeup_irq);
>  	if (data->plat_data->flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_remove_request(&data->pm_qos_req);
>  
> @@ -608,6 +630,9 @@ static int imx_controller_resume(struct device *dev,
>  	if (data->plat_data->flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
>  
> +	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
> +		disable_irq_nosync(data->wakeup_irq);
> +
>  	ret = imx_prepare_enable_clks(dev);
>  	if (ret)
>  		return ret;
> @@ -643,6 +668,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
>  		return ret;
>  
>  	pinctrl_pm_select_sleep_state(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(data->wakeup_irq);
> +
>  	return ret;
>  }
>  
> @@ -651,6 +680,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (device_may_wakeup(dev))
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

