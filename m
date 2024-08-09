Return-Path: <linux-usb+bounces-13255-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D479B94C811
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 03:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E891C21E8D
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 01:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AC18F6B;
	Fri,  9 Aug 2024 01:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBc+/6Kq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CD46B5;
	Fri,  9 Aug 2024 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167215; cv=none; b=AvSVl6CO1mhfySWEBtdjuluPQwUJWeiONz/EMK/beydivvEC/a+bL+WhyJn/zmAvHJrpyViL2dRdw0RaGAu8jVgV+Ovay9/ejnzjgW1Zlet7hR9sMBENPNWz+401PQAgpo3dh8f2h+3xcl3WGa7BLUXRWKDNCWCPPZBu2A06/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167215; c=relaxed/simple;
	bh=jM04DU9PwiRiXmlRYkEKsDYtOW/V6HmVi1GnllNw9DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQtl3Yboxr3cGHFHQAwKtC1/MOoinUY49MRe4mmALFRPIlvzqY5Mv9k44Z5O0LYiPnjI1dIpVz2doL2osPF+r4akmelZK7mFKDQmisX06p8sruUlh5QSkqFZ2A4jTKV0FSVSIs9dCBg5LE2j+U5kVI1mpyoCUduE62wqTxiEaMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBc+/6Kq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CE6C32782;
	Fri,  9 Aug 2024 01:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723167215;
	bh=jM04DU9PwiRiXmlRYkEKsDYtOW/V6HmVi1GnllNw9DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBc+/6KqlqCmZu3H4y1PnTsBK9UuqqrSMUAOXcF310+tBWQ6Zcw1v6bel69bRi9c/
	 49VGLYjWggxVyvq/FzO2SToILVkFljvNPP5UopswrHma8bS07B//hM0ccEWwNkH2K6
	 fZp5Wd13KMle+6RWDavu3m5f2adELNuBPwvNET//Rn+AFZdPsOKZwFYfue+CZdYztz
	 HOhbYxPmumLDwsVlDsCyi13tdr90ANLN18ivJm6vN0d7ljDpk4j7UnMe0CQAppDRPW
	 +p1TYjddvg1CHlJq8aHeRpyEwRvBcf/extXBPG3Ewyg9azzl+3PNG2t1k+ajyflr4x
	 teEyNnQZxqmoQ==
Date: Fri, 9 Aug 2024 09:33:25 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, herve.codina@bootlin.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 5/6] usb: phy: mxs: enable weak 1p1 regulator for
 imx6ul during suspend
Message-ID: <20240809013325.GD2673490@nchen-desktop>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-5-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726113207.3393247-5-xu.yang_2@nxp.com>

On 24-07-26 19:32:06, Xu Yang wrote:
> 1p1 is off when the system enters suspend at i.MX6UL. It cause the PHY
> get wrong USB DP/DM value, then unexpected wakeup may occur if USB wakeup
> enabled. This will enable weak 1p1 during PHY suspend if vbus exist. So
> USB DP/DM is correct when system suspend.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - modify commit message
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index acaae22df3ba..cc4156c1b148 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -71,6 +71,9 @@
>  #define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
>  
>  /* Anatop Registers */
> +#define ANADIG_REG_1P1_SET			0x114
> +#define ANADIG_REG_1P1_CLR			0x118
> +
>  #define ANADIG_ANA_MISC0			0x150
>  #define ANADIG_ANA_MISC0_SET			0x154
>  #define ANADIG_ANA_MISC0_CLR			0x158
> @@ -123,6 +126,9 @@
>  
>  #define USB_PHY_VLLS_WAKEUP_EN			BIT(0)
>  
> +#define BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG	BIT(18)
> +#define BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP	BIT(19)
> +
>  #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
>  
>  /* Do disconnection between PHY and controller without vbus */
> @@ -196,7 +202,8 @@ static const struct mxs_phy_data imx6sx_phy_data = {
>  };
>  
>  static const struct mxs_phy_data imx6ul_phy_data = {
> -	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> +	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
>  };
>  
>  static const struct mxs_phy_data imx7ulp_phy_data = {
> @@ -241,6 +248,11 @@ static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
>  	return mxs_phy->data == &imx7ulp_phy_data;
>  }
>  
> +static inline bool is_imx6ul_phy(struct mxs_phy *mxs_phy)
> +{
> +	return mxs_phy->data == &imx6ul_phy_data;
> +}
> +
>  /*
>   * PHY needs some 32K cycles to switch from 32K clock to
>   * bus (such as AHB/AXI, etc) clock.
> @@ -884,18 +896,30 @@ static void mxs_phy_wakeup_enable(struct mxs_phy *mxs_phy, bool on)
>  
>  static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
>  {
> -	unsigned int reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
> +	unsigned int reg;
> +	u32 value;
>  
>  	/* If the SoCs don't have anatop, quit */
>  	if (!mxs_phy->regmap_anatop)
>  		return;
>  
> -	if (is_imx6q_phy(mxs_phy))
> +	if (is_imx6q_phy(mxs_phy)) {
> +		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
>  		regmap_write(mxs_phy->regmap_anatop, reg,
>  			BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG);
> -	else if (is_imx6sl_phy(mxs_phy))
> +	} else if (is_imx6sl_phy(mxs_phy)) {
> +		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
>  		regmap_write(mxs_phy->regmap_anatop,
>  			reg, BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG_SL);
> +	} else if (is_imx6ul_phy(mxs_phy)) {
> +		reg = on ? ANADIG_REG_1P1_SET : ANADIG_REG_1P1_CLR;
> +		value = BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG |
> +			BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP;
> +		if (mxs_phy_get_vbus_status(mxs_phy) && on)
> +			regmap_write(mxs_phy->regmap_anatop, reg, value);
> +		else if (!on)
> +			regmap_write(mxs_phy->regmap_anatop, reg, value);

Please check if vbus is not there but wakeup is enabled, and see the
behaviour is expected or not.

Peter
> +	}
>  }
>  
>  static int mxs_phy_system_suspend(struct device *dev)
> -- 
> 2.34.1
> 

