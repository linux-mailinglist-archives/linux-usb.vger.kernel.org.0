Return-Path: <linux-usb+bounces-32306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE430D1BDE8
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 01:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF493302E320
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 00:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A0F223336;
	Wed, 14 Jan 2026 00:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aqqr0e1x"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B407B67E;
	Wed, 14 Jan 2026 00:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768351857; cv=none; b=OTb5bKzY0mxFENJPQe9XcbOK2o782hFkROQPOQIaRznovnVYjTTzgbkfX4i+w4mjhSVtuijo1alC2i+F+D4iCuG003CI+jxgo7RIjrTnWwYA1s1DuJ/teLtnkdeEVcXI3YKW13jPxA/EZs51JXMbHjpTSlImX88tq4POpOQGqjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768351857; c=relaxed/simple;
	bh=+4hoae6wCkSkzxItSPvkfqfjm0ujTzA0v4ghsxEfF+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhZ/sby7Rd7YylHMX8dM+zDgqNex09qonjcWIE+P+unj5p3sPrA98q9M7VwmJDc9hZgDm4i1MCR4bSYdmiBqe/mS2ssV7fAGzhPPva0rIfmwZJOiNx+N5p7a5VDwuhnxG7sEBKiPtQSlH64O0rW5YWVx0zqhXjt/JoJLgNxYuqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aqqr0e1x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67236C116C6;
	Wed, 14 Jan 2026 00:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768351857;
	bh=+4hoae6wCkSkzxItSPvkfqfjm0ujTzA0v4ghsxEfF+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aqqr0e1xICwOF3fuLxxhjPVYLGsxyHEM/JW9DbLtIZwh3nm3diO4PBgjuH01Ze7/h
	 ptMOH0YCux8hh2JJWA23nH+WrwK+qe2Bqr/INhbUXFsGzk1tyjb1195MsZS7xlhF+N
	 MG4tcJrU7q6dcNnSBH1xu56kmqEqJjReYygDFph/BNOQnXMT9DMyz5Urfk4/t0HNid
	 Iw/BnftztMBeCt3Qa1BFsSao91JaeD42u9spmujPfOVitG/PdrCbYQmOdNeCdgIic4
	 JJfjZ6ZUqQdhhulnaSOftNuuRmOUOWB70AG0UV7TZrsuV49Ms5SJNDf+q32pekT+wH
	 a6jBTZK5uWPtA==
Date: Wed, 14 Jan 2026 08:50:52 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2] usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for
 wakeup interrupt name
Message-ID: <20260114005052.GA2295746@nchen-desktop>
References: <20260112110408.3263954-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112110408.3263954-1-xu.yang_2@nxp.com>

On 26-01-12 19:04:08, Xu Yang wrote:
> Currently the wakeup and controller interrupt name are same. It's not
> easy to find the correct one in /proc/interrupt at the first glance.
> Rename the wakeup interrupt name for better distinction.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> Changs in v2:
>  - check return value
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d4ee9e16332f..56d2ba824a0b 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -385,6 +385,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
>  	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
> +	const char *irq_name;
>  
>  	imx_platform_flag = of_device_get_match_data(&pdev->dev);
>  
> @@ -525,10 +526,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  
>  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
>  	if (data->wakeup_irq > 0) {
> +		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
> +		if (!irq_name) {
> +			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			goto err_clk;
> +		}
> +
>  		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
>  						NULL, ci_wakeup_irq_handler,
>  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> -						pdata.name, data);
> +						irq_name, data);
>  		if (ret)
>  			goto err_clk;
>  	}
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

