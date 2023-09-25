Return-Path: <linux-usb+bounces-561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4397AD737
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 13:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 7239B281424
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 11:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD92019BB2;
	Mon, 25 Sep 2023 11:48:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302D6FD9
	for <linux-usb@vger.kernel.org>; Mon, 25 Sep 2023 11:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD65C433C7;
	Mon, 25 Sep 2023 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695642479;
	bh=ayg5LSBYCOKl5a+6j88Yxa0oPYcMm7YpRHXlMokcXvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X01+Zj2ZMU+MKGstqxrUpscxFHm/e4CYLScXBUrDNhleoVE9Z7mMQqJqbSBVXDQdl
	 OvmKv7rV+dlq+NLgUSzkq6yh3l8Uv2td1Lh0OSLPVIyd/r2gK4Gx6MoMYAj6iwOgyw
	 mBnQzn1u8/b77rpZyHOLpy5OzRN3cqfNj1tJFPYQw/8LaxFCZEY2yydkLfHnk0B56y
	 5E1B3iQv3gJJ2m2EUCWLw/AXMY4NE0cPJoIlU20c4tkSBTL+Xo+vLEDX4WJiD1Xwhp
	 DApOd1l8cHANQTlNMmEjKqa/bvVHx5WR5e3IL2cT8ICqXHw4X6yUd0gfnBD6rZzSJ5
	 prYRLeMEw7lgg==
Date: Mon, 25 Sep 2023 19:47:48 +0800
From: Peter Chen <peter.chen@kernel.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: chipidea: tegra: Consistently use
 dev_err_probe()
Message-ID: <20230925114748.GB2070044@nchen-desktop>
References: <cover.1695497666.git.mirq-linux@rere.qmqm.pl>
 <a1d8233f153bdd9f18661f33497dcff95bf217fc.1695497666.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1d8233f153bdd9f18661f33497dcff95bf217fc.1695497666.git.mirq-linux@rere.qmqm.pl>

On 23-09-23 21:41:56, Michał Mirosław wrote:
> Convert all error exits from probe() to dev_err_probe().
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> index 8e78bf643e25..2cc305803217 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -293,14 +293,12 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  	usb->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
>  	if (IS_ERR(usb->phy))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(usb->phy),
> -				     "failed to get PHY\n");
> +				     "failed to get PHY");
>  
>  	usb->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(usb->clk)) {
> -		err = PTR_ERR(usb->clk);
> -		dev_err(&pdev->dev, "failed to get clock: %d\n", err);
> -		return err;
> -	}
> +	if (IS_ERR(usb->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(usb->clk),
> +				     "failed to get clock");
>  
>  	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
>  	if (err)
> @@ -316,7 +314,7 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  
>  	err = tegra_usb_reset_controller(&pdev->dev);
>  	if (err) {
> -		dev_err(&pdev->dev, "failed to reset controller: %d\n", err);
> +		dev_err_probe(&pdev->dev, err, "failed to reset controller");
>  		goto fail_power_off;
>  	}
>  
> @@ -347,8 +345,8 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
>  				      pdev->num_resources, &usb->data);
>  	if (IS_ERR(usb->dev)) {
> -		err = PTR_ERR(usb->dev);
> -		dev_err(&pdev->dev, "failed to add HDRC device: %d\n", err);
> +		err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> +				    "failed to add HDRC device");
>  		goto phy_shutdown;
>  	}
>  
> -- 
> 2.39.2
> 

-- 

Thanks,
Peter Chen

