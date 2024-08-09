Return-Path: <linux-usb+bounces-13256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19194C814
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 03:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6860D1F23967
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 01:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A078F6B;
	Fri,  9 Aug 2024 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqL85Yk3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761D12E4D;
	Fri,  9 Aug 2024 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167307; cv=none; b=JJZD2/roEz+wHgidT4oigyElWi34heE2eXzKNMA65+E/2WTOsF9mkb4vFpYcyBGEWJalwe25eG9zdMPLiSmp8QbpJKqGiF4AhnMcNjokMKnUSW025Dh9zmWj+B+SrrgGaNH/isIM0/QzdkQUt8m2C53dYYhKW0KqGGiRDgkuN1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167307; c=relaxed/simple;
	bh=LFEgXJKSyt4qNIs+K9NqPr2CeVGDWds1sfYfazW1BTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZtqBZ75B9aaIYUbfW9mmidNlrx7tVVE8r3BAfiy3N20rJgcalWPuA9jQlUA3vqzTkCvX95o3FnkacobgOaKOFkGcPy3Ws4LmyErpIeBKd6TmnkCSux4nsc9Uuqtc//fhbrEg9sGr08kax9llDIzrghQ7/8AJkO45CDBlq4HAW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqL85Yk3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965C2C32782;
	Fri,  9 Aug 2024 01:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723167306;
	bh=LFEgXJKSyt4qNIs+K9NqPr2CeVGDWds1sfYfazW1BTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqL85Yk3ejYMz8Cra0kodYqHmbn4RRx2NUY3Xg8grpIYaLBIRb3xadrdtF1VfTwD8
	 +eMEm8zqkzE8umViToR2Whe/HGGN/M5s84rlPR3TZjsTRc7JdtvSheqLIc0pPiArRk
	 edFvIyBpLm1qfJr2uwE6d6aOKqytpYA7gsrnG8F2QSVPYWaT4TEljz3Wkgbo19mJWJ
	 lao+Qdf4mB0dXFbNRM+QU3Bzv5kZpYkIwdQk7MtacSBCI4IJ6I7VMFAJoUOEXCvfS2
	 VOCnPr7J/VUGeb5kSrIkPebKTuZ+vMIpbG6c9tqR7t24jQBHYMLuGTwwAbFAGX0VNW
	 96H1UN1ZKgBrw==
Date: Fri, 9 Aug 2024 09:34:58 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, herve.codina@bootlin.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 4/6] usb: phy: mxs: add wakeup enable for imx7ulp
Message-ID: <20240809013458.GE2673490@nchen-desktop>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726113207.3393247-4-xu.yang_2@nxp.com>

On 24-07-26 19:32:05, Xu Yang wrote:
> This wakeup setting can enable USB wakeup function even the
> controller's power is lost, and both A7 and M4 are in VLLS mode.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>
> 
> ---
> Changes in v2:
>  - no changes
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 41 +++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index e172af75f602..acaae22df3ba 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -118,6 +118,11 @@
>  #define BM_ANADIG_USB2_MISC_RX_VPIN_FS		BIT(29)
>  #define BM_ANADIG_USB2_MISC_RX_VMIN_FS		BIT(28)
>  
> +/* System Integration Module (SIM) Registers */
> +#define SIM_GPR1				0x30
> +
> +#define USB_PHY_VLLS_WAKEUP_EN			BIT(0)
> +
>  #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
>  
>  /* Do disconnection between PHY and controller without vbus */
> @@ -214,6 +219,7 @@ struct mxs_phy {
>  	struct clk *clk;
>  	const struct mxs_phy_data *data;
>  	struct regmap *regmap_anatop;
> +	struct regmap *regmap_sim;
>  	int port_id;
>  	u32 tx_reg_set;
>  	u32 tx_reg_mask;
> @@ -772,6 +778,17 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/* Currently, only imx7ulp has SIM module */
> +	if (of_get_property(np, "nxp,sim", NULL)) {
> +		mxs_phy->regmap_sim = syscon_regmap_lookup_by_phandle
> +			(np, "nxp,sim");
> +		if (IS_ERR(mxs_phy->regmap_sim)) {
> +			dev_dbg(&pdev->dev,
> +				"failed to find regmap for sim\n");
> +			return PTR_ERR(mxs_phy->regmap_sim);
> +		}
> +	}
> +
>  	/* Precompute which bits of the TX register are to be updated, if any */
>  	if (!of_property_read_u32(np, "fsl,tx-cal-45-dn-ohms", &val) &&
>  	    val >= MXS_PHY_TX_CAL45_MIN && val <= MXS_PHY_TX_CAL45_MAX) {
> @@ -849,6 +866,22 @@ static void mxs_phy_remove(struct platform_device *pdev)
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> +static void mxs_phy_wakeup_enable(struct mxs_phy *mxs_phy, bool on)
> +{
> +	u32 mask = USB_PHY_VLLS_WAKEUP_EN;
> +
> +	/* If the SoCs don't have SIM, quit */
> +	if (!mxs_phy->regmap_sim)
> +		return;
> +
> +	if (on) {
> +		regmap_update_bits(mxs_phy->regmap_sim, SIM_GPR1, mask, mask);
> +		udelay(500);
> +	} else {
> +		regmap_update_bits(mxs_phy->regmap_sim, SIM_GPR1, mask, 0);
> +	}
> +}
> +
>  static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
>  {
>  	unsigned int reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
> @@ -869,8 +902,10 @@ static int mxs_phy_system_suspend(struct device *dev)
>  {
>  	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
>  
> -	if (device_may_wakeup(dev))
> +	if (device_may_wakeup(dev)) {
>  		mxs_phy_enable_ldo_in_suspend(mxs_phy, true);
> +		mxs_phy_wakeup_enable(mxs_phy, true);
> +	}
>  
>  	return 0;
>  }
> @@ -879,8 +914,10 @@ static int mxs_phy_system_resume(struct device *dev)
>  {
>  	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
>  
> -	if (device_may_wakeup(dev))
> +	if (device_may_wakeup(dev)) {
>  		mxs_phy_enable_ldo_in_suspend(mxs_phy, false);
> +		mxs_phy_wakeup_enable(mxs_phy, false);
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 

