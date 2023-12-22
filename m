Return-Path: <linux-usb+bounces-4528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B1B81C747
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 10:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E3AD2836EF
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 09:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E18D53F;
	Fri, 22 Dec 2023 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lf/fhSRE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F5DDA3
	for <linux-usb@vger.kernel.org>; Fri, 22 Dec 2023 09:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8ABC433C8;
	Fri, 22 Dec 2023 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703237154;
	bh=g5PUJh8PTpL1tF5KnBnUHiv5E/OxLzfs943WX1/SB4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lf/fhSREOmAjxsgN0DJ/pc/Rv993BSoSWVyqANG+CWrn04wIWK5xCbezbTt582ya7
	 FIA2gpXA5busMe9LnhDH353CE5AAuYwo6nXKlrVADp+X4feql6a/X+uLDOu2ipEW+w
	 +r08Wk7nI1Ym7Lyxc1pDvCzgAPkQ11CdmegMyFecuLFbXgDUaJ6iYu1OAyaf1WqqU2
	 1Ispy4VLnaI1g4xQ+PKm/HYr1Lq+PvgV56v9cPzeQr2hVxluAFhQW4lXoN6/LK9xdE
	 O76Eb2VHccIhlHtjo+mOFfsSQQB9HS8OQ3x+gAztm3h7uXQJM/LfxL3Dn1wXfpZVG1
	 lAgIubdim1diw==
Date: Fri, 22 Dec 2023 17:25:42 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, luca.ceresoli@bootlin.com,
	jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] usb: chipidea: ci_hdrc_imx: add wakeup clock and
 keep it always on
Message-ID: <20231222092542.GC1951375@nchen-desktop>
References: <20231218061420.3460145-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218061420.3460145-1-xu.yang_2@nxp.com>

On 23-12-18 14:14:18, Xu Yang wrote:
> Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
> on without usb driver intervention. And some may need driver to handle
> this clock. For now only i.MX93 needs this wakeup clock. This patch will
> get wakeup clock and keep it always on to make controller work properly.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

> 
> ---
> Changes in v2:
>  - modify commit msg to make it clear
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index e28bb2f2612d..4330be8240ff 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -96,6 +96,7 @@ struct ci_hdrc_imx_data {
>  	struct usb_phy *phy;
>  	struct platform_device *ci_pdev;
>  	struct clk *clk;
> +	struct clk *clk_wakeup;
>  	struct imx_usbmisc_data *usbmisc_data;
>  	bool supports_runtime_pm;
>  	bool override_phy_control;
> @@ -199,7 +200,7 @@ static int imx_get_clks(struct device *dev)
>  
>  	data->clk_ipg = devm_clk_get(dev, "ipg");
>  	if (IS_ERR(data->clk_ipg)) {
> -		/* If the platform only needs one clocks */
> +		/* If the platform only needs one primary clock */
>  		data->clk = devm_clk_get(dev, NULL);
>  		if (IS_ERR(data->clk)) {
>  			ret = PTR_ERR(data->clk);
> @@ -208,6 +209,18 @@ static int imx_get_clks(struct device *dev)
>  				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
>  			return ret;
>  		}
> +		/* Get wakeup clock. Not all of the platforms need to
> +		 * handle this clock. So make it optional.
> +		 */
> +		data->clk_wakeup = devm_clk_get_optional(dev,
> +							 "usb_wakeup_clk");
> +		if (IS_ERR(data->clk_wakeup)) {
> +			ret = PTR_ERR(data->clk_wakeup);
> +			dev_err(dev,
> +				"Failed to get wakeup clk, err=%ld\n",
> +				PTR_ERR(data->clk_wakeup));
> +			return ret;
> +		}
>  		return ret;
>  	}
>  
> @@ -423,6 +436,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_hsic_regulator;
>  
> +	ret = clk_prepare_enable(data->clk_wakeup);
> +	if (ret)
> +		goto err_wakeup_clk;
> +
>  	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
>  	if (IS_ERR(data->phy)) {
>  		ret = PTR_ERR(data->phy);
> @@ -504,6 +521,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  disable_device:
>  	ci_hdrc_remove_device(data->ci_pdev);
>  err_clk:
> +	clk_disable_unprepare(data->clk_wakeup);
> +err_wakeup_clk:
>  	imx_disable_unprepare_clks(dev);
>  disable_hsic_regulator:
>  	if (data->hsic_pad_regulator)
> @@ -530,6 +549,7 @@ static void ci_hdrc_imx_remove(struct platform_device *pdev)
>  		usb_phy_shutdown(data->phy);
>  	if (data->ci_pdev) {
>  		imx_disable_unprepare_clks(&pdev->dev);
> +		clk_disable_unprepare(data->clk_wakeup);
>  		if (data->plat_data->flags & CI_HDRC_PMQOS)
>  			cpu_latency_qos_remove_request(&data->pm_qos_req);
>  		if (data->hsic_pad_regulator)
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

