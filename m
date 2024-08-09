Return-Path: <linux-usb+bounces-13257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6CC94C816
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 03:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8551C21F14
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 01:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78163C152;
	Fri,  9 Aug 2024 01:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgH7tSZW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA368801;
	Fri,  9 Aug 2024 01:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167412; cv=none; b=TVrSkdYuROcmJVujoZ7U8vjrdA7N32KZTntGTLmlDzWXOsp8Q1Jp67z0wQr5y6miV55USLWwW4oDGbY7VmxX1RvJMZ4deKeZc65uuDcyw5lmvObdLbxfmdXmOU9t4zUygTCawfh/+g8r5UBSjVXK4sY0tVKFc0NKP5bsDRFfWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167412; c=relaxed/simple;
	bh=xluVK0tHO9NNdylwkimcBkO3o8kPzPqVXhIbqDXILzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJL6jc8/Jclj8Dbk9vofutyRozTp3Rs4EtDDfOaBC7bJavpyIufAhLfley0Me3F/hkpZxvgcEi7LfLTcdxQHTAKEw0pPT7nEsrkbjqNem5ssnaZoWMSqMgrUKgK9eObZCGrA6M8YEWTM0tJAARe5V940AOwjDhG5olsjU69DKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgH7tSZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED2EC32782;
	Fri,  9 Aug 2024 01:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723167411;
	bh=xluVK0tHO9NNdylwkimcBkO3o8kPzPqVXhIbqDXILzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgH7tSZWD2XBgI51fyuFDm9ja8Fnpj6WGe42SVK5B+2PewUTLmn0Hk+CY7ZvKmuTY
	 u5ZzuAFGnFxDX5Cln8xO09AWl/Hd8qCOKISVf509sjkDCbwnHZKE3wglITFj3qy0AT
	 ifVdMQbQ/YRx4MXhNKR42O6NAX3lIEU5flNdiS0pZVRG2u4EOVbUNKn+gosedrvruy
	 Uzv9MXgq6Xxrm1uanay7P0lro3APD5myVC/Di0VesQ8H7hBaHI0Ue1waabDJex/Llt
	 dUAEOP9uEdPG5kmMlvNaXYTXcIIj10ZhUZF8Gf8D+8OyPS3l1SXasupnMi7dTO3opr
	 2cL8hzX/2vgJA==
Date: Fri, 9 Aug 2024 09:36:42 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, herve.codina@bootlin.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 2/6] usb: phy: mxs: keep USBPHY2's clk always on
Message-ID: <20240809013642.GF2673490@nchen-desktop>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726113207.3393247-2-xu.yang_2@nxp.com>

On 24-07-26 19:32:03, Xu Yang wrote:
> IP require keep USBPHY2's clk always on, so USBPHY2 (PLL7) power can be
> controlled by suspend signal. USB remote wakeup needs resume signal be
> sent out as soon as possible to match USB requirements.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>
> 
> ---
> Changes in v2:
>  - modify commit message
>  - remove hardware_control_phy2_clk
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index d9d29f0b37de..e172af75f602 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -150,6 +150,15 @@
>  #define MXS_PHY_TX_D_CAL_MIN			79
>  #define MXS_PHY_TX_D_CAL_MAX			119
>  
> +/*
> + * At imx6q/6sl/6sx, the PHY2's clock is controlled by hardware directly,
> + * eg, according to PHY's suspend status. In these PHYs, we only need to
> + * open the clock at the initialization and close it at its shutdown routine.
> + * These PHYs can send resume signal without software interfere if not
> + * gate clock.
> + */
> +#define MXS_PHY_HARDWARE_CONTROL_PHY2_CLK	BIT(4)
> +
>  struct mxs_phy_data {
>  	unsigned int flags;
>  };
> @@ -161,12 +170,14 @@ static const struct mxs_phy_data imx23_phy_data = {
>  static const struct mxs_phy_data imx6q_phy_data = {
>  	.flags = MXS_PHY_SENDING_SOF_TOO_FAST |
>  		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> -		MXS_PHY_NEED_IP_FIX,
> +		MXS_PHY_NEED_IP_FIX |
> +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
>  };
>  
>  static const struct mxs_phy_data imx6sl_phy_data = {
>  	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> -		MXS_PHY_NEED_IP_FIX,
> +		MXS_PHY_NEED_IP_FIX |
> +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
>  };
>  
>  static const struct mxs_phy_data vf610_phy_data = {
> @@ -175,7 +186,8 @@ static const struct mxs_phy_data vf610_phy_data = {
>  };
>  
>  static const struct mxs_phy_data imx6sx_phy_data = {
> -	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> +	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
>  };
>  
>  static const struct mxs_phy_data imx6ul_phy_data = {
> @@ -518,12 +530,19 @@ static int mxs_phy_suspend(struct usb_phy *x, int suspend)
>  		}
>  		writel(BM_USBPHY_CTRL_CLKGATE,
>  		       x->io_priv + HW_USBPHY_CTRL_SET);
> -		clk_disable_unprepare(mxs_phy->clk);
> +		if (!(mxs_phy->port_id == 1 &&
> +			(mxs_phy->data->flags &
> +				MXS_PHY_HARDWARE_CONTROL_PHY2_CLK)))
> +			clk_disable_unprepare(mxs_phy->clk);
>  	} else {
>  		mxs_phy_clock_switch_delay();
> -		ret = clk_prepare_enable(mxs_phy->clk);
> -		if (ret)
> -			return ret;
> +		if (!(mxs_phy->port_id == 1 &&
> +			(mxs_phy->data->flags &
> +				MXS_PHY_HARDWARE_CONTROL_PHY2_CLK))) {
> +			ret = clk_prepare_enable(mxs_phy->clk);
> +			if (ret)
> +				return ret;
> +		}
>  		writel(BM_USBPHY_CTRL_CLKGATE,
>  		       x->io_priv + HW_USBPHY_CTRL_CLR);
>  		writel(0, x->io_priv + HW_USBPHY_PWD);
> -- 
> 2.34.1
> 

