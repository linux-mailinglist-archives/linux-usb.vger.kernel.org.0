Return-Path: <linux-usb+bounces-21122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54469A4738B
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 04:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FCFC1891C67
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 03:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB55918787A;
	Thu, 27 Feb 2025 03:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4xnQy6/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4F433C8;
	Thu, 27 Feb 2025 03:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740626787; cv=none; b=gBJWUVkJvHv+5hXVdouXl3KG8Yr0TU1jBGHZFgxDhbFzc/Wd0KVPeKVqNWeCfjk/yRIuPy7FaZBLO3bEQEKyKbbaOs4CDE3jTr62qK/Pw7Ij6lDWiK/oxT8rpFE3LHgajwHfArlkMBswG4CcBCbkhW6CjhWOAjpfXEdxiX699ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740626787; c=relaxed/simple;
	bh=Mxz/8sxAHbPEe+NnTpYCcWMD0hMQw5x5yH+ds+Ae7O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5yIwWGR5zi7SEQB0iODeQ8I0EKofI3iSzSuWGmmkqPH8MvzyDT/qROoZYDdlqbd+pn+kxoUvUp12ms8Sm9LrNm3Mx7dgCCTqqdJtM/o/otOUuJLlFQjNZd/NZiiDuFuAOMFbXqwifCqTXleQz5iVlLs5B1hlGCit0j5ic+FW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4xnQy6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9813C4CEDD;
	Thu, 27 Feb 2025 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740626786;
	bh=Mxz/8sxAHbPEe+NnTpYCcWMD0hMQw5x5yH+ds+Ae7O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4xnQy6/F3QLdKDH4y2GkbBrzNk7h3NjytH7uvkecD/ODyVCU13O1FONMYk8M5ykZ
	 ze+g9E7WfoxxwbUWeRJxcxoPwcL5UFUp+G4ZBFV2sHOA+3WnX9OMv9I2sqPimJBl2p
	 idCcRm0NCYNvlcKCaRmTvMB2Y/xN0TSOc4I1rJDRTuXUy30Pb4W1aVYVJhKxlM/k8D
	 ItcCvlUwk2bSICWwPj4Js3FxAwd++aPVJg1wZ7NCJo+QluVzeNekeH6TYc9n4KuoLQ
	 xVituYjNHRmkiS2JDbQBrPr0Dgb2V6owIzp0OsdwX862yTHsgUlPMbNKHEN+bGdQEZ
	 Wv+RJPk/AQa8A==
Date: Thu, 27 Feb 2025 11:26:20 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] usb: chipidea: imx: fix some typo
Message-ID: <Z7_bXCCgrCxhYZgu@nchen-desktop>
References: <20250225062843.3930041-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225062843.3930041-1-xu.yang_2@nxp.com>

On 25-02-25 14:28:43, Xu Yang wrote:
> bootlader -> bootloader
> set_wakeup failed -> hsic_set_clk failed
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index f933fc70be66..4dc0bac8cde3 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -457,7 +457,7 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_data *data)
>  		else if (data->oc_pol_configured)
>  			reg &= ~MX6_BM_OVER_CUR_POLARITY;
>  	}
> -	/* If the polarity is not set keep it as setup by the bootlader */
> +	/* If the polarity is not set keep it as setup by the bootloader */
>  	if (data->pwr_pol == 1)
>  		reg |= MX6_BM_PWR_POLARITY;
>  	writel(reg, usbmisc->base + data->index * 4);
> @@ -662,7 +662,7 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
>  		else if (data->oc_pol_configured)
>  			reg &= ~MX6_BM_OVER_CUR_POLARITY;
>  	}
> -	/* If the polarity is not set keep it as setup by the bootlader */
> +	/* If the polarity is not set keep it as setup by the bootloader */
>  	if (data->pwr_pol == 1)
>  		reg |= MX6_BM_PWR_POLARITY;
>  	writel(reg, usbmisc->base);
> @@ -956,7 +956,7 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
>  		else if (data->oc_pol_configured)
>  			reg &= ~MX6_BM_OVER_CUR_POLARITY;
>  	}
> -	/* If the polarity is not set keep it as setup by the bootlader */
> +	/* If the polarity is not set keep it as setup by the bootloader */
>  	if (data->pwr_pol == 1)
>  		reg |= MX6_BM_PWR_POLARITY;
>  
> @@ -1280,7 +1280,7 @@ int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
>  	if (usbmisc->ops->hsic_set_clk && data->hsic)
>  		ret = usbmisc->ops->hsic_set_clk(data, false);
>  	if (ret) {
> -		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
> +		dev_err(data->dev, "hsic_set_clk failed, ret=%d\n", ret);
>  		return ret;
>  	}
>  
> @@ -1319,7 +1319,7 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
>  	if (usbmisc->ops->hsic_set_clk && data->hsic)
>  		ret = usbmisc->ops->hsic_set_clk(data, true);
>  	if (ret) {
> -		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
> +		dev_err(data->dev, "hsic_set_clk failed, ret=%d\n", ret);
>  		goto hsic_set_clk_fail;
>  	}
>  
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

