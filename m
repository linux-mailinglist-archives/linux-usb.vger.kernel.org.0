Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432D813BAA8
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 09:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgAOIBv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 03:01:51 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38079 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgAOIBv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 03:01:51 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so16652434wmc.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 00:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LqGaezBmjqo1I3iqgzWcout33RhA0cLHgVioPXtlKd4=;
        b=TvDS04c4VdOECsl00gF0Bv6+U2ZHSIdozA3JRwRtpSqC/bv+uM9qW7Wuhgj5dV6yR+
         KNUQ9gSe0rLjDk64dpSUp37KeTF5AuFk4t7gK63EJN01UDgt1fE3685VFSmQm5kaGhv1
         XMNAj7GHBTp1bGJ1vpL41X10pmmq1xv09rFI0fKXq7IeLvvjG0pTg1shWmS/6r3Rm5Cx
         RKdUJLXJr2MAkBI5OAjmqx+uSxv+A48RV4oXWW9oOhL5+ffNaBzZA7f/Y0j3LNs3GL19
         ThWZtIX1dhDA18wjoUc8x/8iAFmAITtr91SWB2AQIm9IWJEr9USk81M1qK5vx67Oh4rZ
         JW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LqGaezBmjqo1I3iqgzWcout33RhA0cLHgVioPXtlKd4=;
        b=aItGZgn440h0LA2iJsDCXMNtJlcPzBcbyKrUK9C38BcvJLHdR6bqHNULwU1k/Gtcdh
         IQbIuN75MzluNtkyI+DPRCO4fBOMzpu/x9iFi10mraGbT0NWel+a38Y1K+shSMjGbn/T
         jNtjJoj4L1eR/zFKeWK2mfy0DK7AVh4pfzr+viEqI4Z8N/3Vebd7ygm7SUlQ2ZNG+EP+
         wB9B6ZYdZRGu+zn3fHMvs+stxSGx2Bzd1Z0xMRqgQNhWpIsRSiXpJLqJBPy+EOvDGQOH
         GjrqhC84DFxZ0dG17yXB6BG1SoH0wBv83Fl2zK1KanR4dVosp3JKjlhJpeKWJZ+5ZqP+
         h7zw==
X-Gm-Message-State: APjAAAWka3PLhadCupPHEpY9s9WYA0R07huULjBOoiHXGOT6qTCaAHnF
        9ArQle5kOl2WnRxU/9yE+LLQ3Q==
X-Google-Smtp-Source: APXvYqzrj/IVZkkvSCDE8i0Wj87kZF8tJojhg+NQAlJXlmypQIV1dS8AgnJnYPXM91mw9maNWCqeSA==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr33322177wmb.137.1579075307994;
        Wed, 15 Jan 2020 00:01:47 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r15sm22123624wmh.21.2020.01.15.00.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 00:01:47 -0800 (PST)
Subject: Re: [PATCH v5 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
To:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Yue Wang <yue.wang@amlogic.com>, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-4-git-send-email-hanjie.lin@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <69cb2df5-92d0-03a8-aaa8-d9c98909a11e@baylibre.com>
Date:   Wed, 15 Jan 2020 09:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578634957-54826-4-git-send-email-hanjie.lin@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/01/2020 06:42, Hanjie Lin wrote:
> This adds support for the USB2 PHY found in the Amlogic A1 SoC Family.
> 
> It supports host mode only.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  drivers/phy/amlogic/phy-meson-g12a-usb2.c | 85 +++++++++++++++++++++----------
>  1 file changed, 59 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> index 9065ffc..33296f8 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> @@ -146,11 +146,17 @@
>  #define RESET_COMPLETE_TIME					1000
>  #define PLL_RESET_COMPLETE_TIME					100
>  
> +enum meson_soc_id {
> +	MESON_SOC_G12A  = 0,
> +	MESON_SOC_A1,
> +};
> +
>  struct phy_meson_g12a_usb2_priv {
>  	struct device		*dev;
>  	struct regmap		*regmap;
>  	struct clk		*clk;
>  	struct reset_control	*reset;
> +	int                     soc_id;
>  };
>  
>  static const struct regmap_config phy_meson_g12a_usb2_regmap_conf = {
> @@ -164,6 +170,7 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>  {
>  	struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
>  	int ret;
> +	unsigned int value;
>  
>  	ret = reset_control_reset(priv->reset);
>  	if (ret)
> @@ -192,18 +199,22 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>  		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT2, 2) |
>  		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT1, 9));
>  
> -	regmap_write(priv->regmap, PHY_CTRL_R18,
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
> -		     PHY_CTRL_R18_MPLL_ACG_RANGE);
> +	value = FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
> +		FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
> +		PHY_CTRL_R18_MPLL_ACG_RANGE;
> +
> +	if (priv->soc_id == MESON_SOC_A1)
> +		value |= PHY_CTRL_R18_MPLL_DCO_CLK_SEL;
> +
> +	regmap_write(priv->regmap, PHY_CTRL_R18, value);
>  
>  	udelay(PLL_RESET_COMPLETE_TIME);
>  
> @@ -227,13 +238,24 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>  		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
>  		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0));
>  
> -	regmap_write(priv->regmap, PHY_CTRL_R4,
> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
> -		     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
> -		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
> -		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
> +	if (priv->soc_id == MESON_SOC_G12A)
> +		regmap_write(priv->regmap, PHY_CTRL_R4,
> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
> +			     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
> +			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
> +			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
> +	else if (priv->soc_id == MESON_SOC_A1) {
> +		regmap_write(priv->regmap, PHY_CTRL_R21,
> +			     PHY_CTRL_R21_USB2_CAL_ACK_EN |
> +			     PHY_CTRL_R21_USB2_TX_STRG_PD |
> +			     FIELD_PREP(PHY_CTRL_R21_USB2_OTG_ACA_TRIM_1_0, 2));
> +
> +		/* Analog Settings */
> +		regmap_write(priv->regmap, PHY_CTRL_R13,
> +			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
> +	}
>  
>  	/* Tuning Disconnect Threshold */
>  	regmap_write(priv->regmap, PHY_CTRL_R3,
> @@ -241,11 +263,13 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>  		     FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1) |
>  		     FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3));
>  
> -	/* Analog Settings */
> -	regmap_write(priv->regmap, PHY_CTRL_R14, 0);
> -	regmap_write(priv->regmap, PHY_CTRL_R13,
> -		     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
> -		     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
> +	if (priv->soc_id == MESON_SOC_G12A) {
> +		/* Analog Settings */
> +		regmap_write(priv->regmap, PHY_CTRL_R14, 0);
> +		regmap_write(priv->regmap, PHY_CTRL_R13,
> +			     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
> +			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
> +	}
>  
>  	return 0;
>  }
> @@ -286,6 +310,8 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> +	priv->soc_id = (enum meson_soc_id)of_device_get_match_data(&pdev->dev);
> +
>  	priv->regmap = devm_regmap_init_mmio(dev, base,
>  					     &phy_meson_g12a_usb2_regmap_conf);
>  	if (IS_ERR(priv->regmap))
> @@ -321,8 +347,15 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id phy_meson_g12a_usb2_of_match[] = {
> -	{ .compatible = "amlogic,g12a-usb2-phy", },
> -	{ },
> +	{
> +		.compatible = "amlogic,g12a-usb2-phy",
> +		.data = (void *)MESON_SOC_G12A,
> +	},
> +	{
> +		.compatible = "amlogic,a1-usb2-phy",
> +		.data = (void *)MESON_SOC_A1,
> +	},
> +	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, phy_meson_g12a_usb2_of_match);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
