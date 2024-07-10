Return-Path: <linux-usb+bounces-12091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90A92C81B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 03:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C14283E99
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 01:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C9D6FBF;
	Wed, 10 Jul 2024 01:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDwdgZ3O"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC98BE7
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 01:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720576326; cv=none; b=ACQ/aYpmYUs5ZL2lwyIjtfk91rEE6LEHSb11UXNiewyuec1lezSN9cTl0zNS6C17+HF7/C+6j55wIIC52YdiUTIm2TagdxSyiCV+Phzp8PagpRFmpXH3ctV/0QpvEPOTt3FKjGItt3sJr98e/UFyIxFuDOZFVyFt2XNvFRGPU9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720576326; c=relaxed/simple;
	bh=fZqgXe3h5o5kEU/DH3pPNdiHnTItb9e8yGtiBAKdTDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhsSfIi3bfP0HJ1g8xzNOr0PV6D50et8eTvU3aRV3rmHmlYQc1FuVCslAYDfz+BiWfteb2yMLT7/kvsuxabJmq41AnuuDtIhir28UOxRr8abkEC81jBWiuscxAmLIoCB2wq0q9m9Nc/GRV/uXZD+6UZoaNxDn0sK3cyLI7V+cQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDwdgZ3O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA191C3277B;
	Wed, 10 Jul 2024 01:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720576326;
	bh=fZqgXe3h5o5kEU/DH3pPNdiHnTItb9e8yGtiBAKdTDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDwdgZ3OcrP6wYwMWGsk1m4KZPEto3iN5FYEt9yQ5a57ubmPn3neB8sxJUpq70tmP
	 94+vEO4N3+3+FuH/TDiymOEQ+uVQPi/6Saodolz+YbgoxXts6bf/qkSNVGEwYEKegP
	 GCuUAHYuAFPUk87RpZWwVXAD6Usfwt/njcFY/wNey627J/yBPwk/eydcwNjRpEbmmx
	 NZcRCeycmIpGJqRm0qfo/n6qOC7RDlfWQvoaFKc9JEOA7OL9dPNYD3BYOCXE4nysHs
	 NZlTW5L1ZOD+fVT9fVnh/6VmbfG4T3PKsxTgEXbx4NciKXWEFG58UkMU7dr7LaeCKU
	 D5vmWOPQu9dpw==
Date: Wed, 10 Jul 2024 09:51:58 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, thierry.reding@gmail.com,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] usb: chipidea: ci_hdrc_tegra: Switch to
 RUNTIME_PM_OPS()
Message-ID: <20240710015158.GC2914204@nchen-desktop>
References: <20240625231023.436403-1-festevam@gmail.com>
 <20240625231023.436403-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625231023.436403-2-festevam@gmail.com>

On 24-06-25 20:10:23, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_RUNTIME_PM_OPS() with its modern RUNTIME_PM_OPS()
> alternative.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS allows the compiler
> to evaluate if the runtime suspend/resume() functions are used at build
> time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> index 2cc305803217..9538d425f0a0 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -372,7 +372,7 @@ static void tegra_usb_remove(struct platform_device *pdev)
>  	pm_runtime_force_suspend(&pdev->dev);
>  }
>  
> -static int __maybe_unused tegra_usb_runtime_resume(struct device *dev)
> +static int tegra_usb_runtime_resume(struct device *dev)
>  {
>  	struct tegra_usb *usb = dev_get_drvdata(dev);
>  	int err;
> @@ -386,7 +386,7 @@ static int __maybe_unused tegra_usb_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused tegra_usb_runtime_suspend(struct device *dev)
> +static int tegra_usb_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_usb *usb = dev_get_drvdata(dev);
>  
> @@ -396,15 +396,14 @@ static int __maybe_unused tegra_usb_runtime_suspend(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops tegra_usb_pm = {
> -	SET_RUNTIME_PM_OPS(tegra_usb_runtime_suspend, tegra_usb_runtime_resume,
> -			   NULL)
> +	RUNTIME_PM_OPS(tegra_usb_runtime_suspend, tegra_usb_runtime_resume, NULL)
>  };
>  
>  static struct platform_driver tegra_usb_driver = {
>  	.driver = {
>  		.name = "tegra-usb",
>  		.of_match_table = tegra_usb_of_match,
> -		.pm = &tegra_usb_pm,
> +		.pm = pm_ptr(&tegra_usb_pm),
>  	},
>  	.probe = tegra_usb_probe,
>  	.remove_new = tegra_usb_remove,
> -- 
> 2.34.1
> 

