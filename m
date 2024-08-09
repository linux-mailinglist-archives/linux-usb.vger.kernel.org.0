Return-Path: <linux-usb+bounces-13254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2D94C809
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 03:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76512284110
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 01:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC40D8F6B;
	Fri,  9 Aug 2024 01:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dxoq6RQ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAF12905;
	Fri,  9 Aug 2024 01:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723166796; cv=none; b=Uikal7Oz3LMfTo1SsPDl2w6xckaAkLKhBnXmogXcFa3LQH12FOJtKJrsSR1McefbBC+/edLgbusHBMUVLPlfNrAMDy7TyjRMdTohrlywUgjbenCvSLTkkysvWdHjTN5+7SmEv0hcyJBDzn4/lq+NYfWo8IFqVP3GG9/jRgc7lOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723166796; c=relaxed/simple;
	bh=t4Kxw+OVg7XockFwmHnqd3O4dZONmVYviHD+66OcYik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFkWTAHGB62TvrfirrkxwHpJrxVds0YCwnKB7efCdDPaJ4TulEIVaQVPGkB75RVQcx8eYVn7g52ZNI+G0PCW+0jXF7wejoHnocgmSor/R4qlH9jQfFA18PaddKi+9JYEU4DNPfXy5LPCtx2ynFkHM4W9fR71OPwYTnuNNesgJbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dxoq6RQ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B66C32782;
	Fri,  9 Aug 2024 01:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723166795;
	bh=t4Kxw+OVg7XockFwmHnqd3O4dZONmVYviHD+66OcYik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dxoq6RQ9C/ka5+gpSg523ncPJUeOb5YvXLj6yhC0K2bGFL8RRFUWDqdUc4sPDEN+Z
	 HM5IWV15KVS+ZmrDFgFEI+4xa3Moc0mQ9edZVahWNz8DZQ/KJtFQNJ6+wRM9wLcjXN
	 UWvPxzrrLMg/fb+YHFmR3mBPw1DKUdVZM9iVjIQBhKzk/U1h+T4k9/1AgLSkzVkrtf
	 lmxfnXlFkrjag6zOAEX8+fonRhZ87Wwn7aFT+raNjHJDGBu+NJz/4E/RsgzfyVsruV
	 XS9zj2JLsTM9ECf4+HVsylHNsFQxYFEiP++Nq/UFCT5tfxaHjzYe47dl2AnzaiUhpN
	 +6oQdoB71K1lg==
Date: Fri, 9 Aug 2024 09:26:25 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, herve.codina@bootlin.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 1/6] usb: phy: mxs: enable regulator phy-3p0 to
 improve signal qualilty
Message-ID: <20240809012625.GC2673490@nchen-desktop>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726113207.3393247-1-xu.yang_2@nxp.com>

On 24-07-26 19:32:02, Xu Yang wrote:
> Enable regulator 'phy-3p0' to pass eye diagram test since it improve signal
> qualilty.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>

> 
> ---
> Changes in v2:
>  - rewrite commit message
>  - use dev_err_probe() as suggested by Frank Li
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 920a32cd094d..d9d29f0b37de 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -18,6 +18,7 @@
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/iopoll.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define DRIVER_NAME "mxs_phy"
>  
> @@ -204,6 +205,7 @@ struct mxs_phy {
>  	int port_id;
>  	u32 tx_reg_set;
>  	u32 tx_reg_mask;
> +	struct regulator *phy_3p0;
>  };
>  
>  static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
> @@ -288,6 +290,16 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  	if (ret)
>  		goto disable_pll;
>  
> +	if (mxs_phy->phy_3p0) {
> +		ret = regulator_enable(mxs_phy->phy_3p0);
> +		if (ret) {
> +			dev_err(mxs_phy->phy.dev,
> +				"Failed to enable 3p0 regulator, ret=%d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
>  	/* Power up the PHY */
>  	writel(0, base + HW_USBPHY_PWD);
>  
> @@ -448,6 +460,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
>  	if (is_imx7ulp_phy(mxs_phy))
>  		mxs_phy_pll_enable(phy->io_priv, false);
>  
> +	if (mxs_phy->phy_3p0)
> +		regulator_disable(mxs_phy->phy_3p0);
> +
>  	clk_disable_unprepare(mxs_phy->clk);
>  }
>  
> @@ -789,6 +804,17 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  	mxs_phy->clk = clk;
>  	mxs_phy->data = of_device_get_match_data(&pdev->dev);
>  
> +	mxs_phy->phy_3p0 = devm_regulator_get(&pdev->dev, "phy-3p0");
> +	if (PTR_ERR(mxs_phy->phy_3p0) == -ENODEV)
> +		/* not exist */
> +		mxs_phy->phy_3p0 = NULL;
> +	else if (IS_ERR(mxs_phy->phy_3p0))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(mxs_phy->phy_3p0),
> +				"Getting regulator error\n");
> +
> +	if (mxs_phy->phy_3p0)
> +		regulator_set_voltage(mxs_phy->phy_3p0, 3200000, 3200000);
> +
>  	platform_set_drvdata(pdev, mxs_phy);
>  
>  	device_set_wakeup_capable(&pdev->dev, true);
> -- 
> 2.34.1
> 

