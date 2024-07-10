Return-Path: <linux-usb+bounces-12090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A8892C81A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 03:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC929283F29
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 01:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9007F63D5;
	Wed, 10 Jul 2024 01:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+8iKhmv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B002AD5B
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 01:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720576276; cv=none; b=NCtu0iAanT6y9xx/7H3WX3dw2tFfPsT9fn3GpBC/PdqoRZUv/y3c87NefiG4RVpsY0guJhKImOmuVRWVUzH2R+diDstotlpXKBywBShcAj5DzmFl4jJnmv9C18B+rJhOZdIjJhZJu3LeBHj1pO6/UR9lqC9EPfDRjdzv/ZCyjqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720576276; c=relaxed/simple;
	bh=S5MSVQbv+g19cSV/AXKxKaFoKppPqLpQG80YEcJHHno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj4JumAK1xHR3pLZfa3G+X7oBil4B4PXowHLNwfD8oBgaqkwLTkHCW9QMz22tzfD8dEw/DP5qnuTymXThacaKJyqO2ZBqtB9gwMwk8J8j4xklCnj9uJcs+bMKfeJiVj4qDvigaDSFXpHRIXxqGL3Pf6qtYCRpZh3135CCdAVxU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+8iKhmv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ADAC3277B;
	Wed, 10 Jul 2024 01:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720576275;
	bh=S5MSVQbv+g19cSV/AXKxKaFoKppPqLpQG80YEcJHHno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+8iKhmvLBDeyC9l0p9Bu1q/KoCiGD2Xu/14DkfABrIMk3I6O1ESj1eMi/LSlsAln
	 DKr8/33c4oUadn9ErM8hoBKWko9WhfJr1giBdZNwUh+jK1ICvQ3ZG0xTpGrAvGqQPJ
	 ZmGvQfymVDyPV+L4Vuz2glXW9dCnnJB2mb5DjrrkvufA5bWR3oxB/YNAh7u0GTGo3Q
	 WmsJmoMvwdT/9eRmjoeBPFDflj2xrPkpzZqPLN6lNWgdtu3Jfez1z9VcqTuPBvajCH
	 Djttp/Bv7L9jx7/2reB7x2SOJTJjlIqemezmvJpyv6MOwykg7VGXvPMiJo23c0L7Nd
	 0ELo6TG8o99XA==
Date: Wed, 10 Jul 2024 09:51:08 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, thierry.reding@gmail.com,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] usb: chipidea: ci_hdrc_imx: Switch to
 RUNTIME/SYSTEM_SLEEP_PM_OPS()
Message-ID: <20240710015108.GB2914204@nchen-desktop>
References: <20240625231023.436403-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625231023.436403-1-festevam@gmail.com>

On 24-06-25 20:10:22, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
> RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index a17b6d619305..bdc04ce919f7 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -557,7 +557,7 @@ static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
>  	ci_hdrc_imx_remove(pdev);
>  }
>  
> -static int __maybe_unused imx_controller_suspend(struct device *dev,
> +static int imx_controller_suspend(struct device *dev,
>  						 pm_message_t msg)
>  {
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> @@ -582,7 +582,7 @@ static int __maybe_unused imx_controller_suspend(struct device *dev,
>  	return 0;
>  }
>  
> -static int __maybe_unused imx_controller_resume(struct device *dev,
> +static int imx_controller_resume(struct device *dev,
>  						pm_message_t msg)
>  {
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> @@ -618,7 +618,7 @@ static int __maybe_unused imx_controller_resume(struct device *dev,
>  	return ret;
>  }
>  
> -static int __maybe_unused ci_hdrc_imx_suspend(struct device *dev)
> +static int ci_hdrc_imx_suspend(struct device *dev)
>  {
>  	int ret;
>  
> @@ -636,7 +636,7 @@ static int __maybe_unused ci_hdrc_imx_suspend(struct device *dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused ci_hdrc_imx_resume(struct device *dev)
> +static int ci_hdrc_imx_resume(struct device *dev)
>  {
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
>  	int ret;
> @@ -652,7 +652,7 @@ static int __maybe_unused ci_hdrc_imx_resume(struct device *dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused ci_hdrc_imx_runtime_suspend(struct device *dev)
> +static int ci_hdrc_imx_runtime_suspend(struct device *dev)
>  {
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
>  
> @@ -664,15 +664,14 @@ static int __maybe_unused ci_hdrc_imx_runtime_suspend(struct device *dev)
>  	return imx_controller_suspend(dev, PMSG_AUTO_SUSPEND);
>  }
>  
> -static int __maybe_unused ci_hdrc_imx_runtime_resume(struct device *dev)
> +static int ci_hdrc_imx_runtime_resume(struct device *dev)
>  {
>  	return imx_controller_resume(dev, PMSG_AUTO_RESUME);
>  }
>  
>  static const struct dev_pm_ops ci_hdrc_imx_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(ci_hdrc_imx_suspend, ci_hdrc_imx_resume)
> -	SET_RUNTIME_PM_OPS(ci_hdrc_imx_runtime_suspend,
> -			ci_hdrc_imx_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(ci_hdrc_imx_suspend, ci_hdrc_imx_resume)
> +	RUNTIME_PM_OPS(ci_hdrc_imx_runtime_suspend, ci_hdrc_imx_runtime_resume, NULL)
>  };
>  static struct platform_driver ci_hdrc_imx_driver = {
>  	.probe = ci_hdrc_imx_probe,
> @@ -681,7 +680,7 @@ static struct platform_driver ci_hdrc_imx_driver = {
>  	.driver = {
>  		.name = "imx_usb",
>  		.of_match_table = ci_hdrc_imx_dt_ids,
> -		.pm = &ci_hdrc_imx_pm_ops,
> +		.pm = pm_ptr(&ci_hdrc_imx_pm_ops),
>  	 },
>  };
>  
> -- 
> 2.34.1
> 

