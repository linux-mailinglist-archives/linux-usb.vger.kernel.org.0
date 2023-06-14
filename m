Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F385F7305E1
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 19:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236920AbjFNRS0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jun 2023 13:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbjFNRSQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jun 2023 13:18:16 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1800B2713
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 10:18:13 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso10418168a12.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686763091; x=1689355091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8E7alXFnYsjNnpR3eeRhfbBudzEGWslVHCnpWP7s+Ps=;
        b=KCw9rCdMRs4kJjHk8mRBUZdS42UXu+0EDm58vQmdK8+4FSUI7VIPjUh5+p721T9S0c
         wYy1GIWwJXJ+kJTz4JfBR4iSBmWH+Jcc0cJsYS3Xwx9LOynHq8yIyHr9klHtl8F+4ASo
         zURXuMf5IvpRb1njMo1OFhjf9yWyUz75QLQga5iRH1Ow78VjlBXu0y0fAm2XA800KUVF
         m71MHUlFOCaR+hZW3Y6H/4g761u6643fjYN7Z+vFVpH8k7HTIBNAC2jgUaNIzHdZDs5S
         npKpR4a0K4yksS18cbcPampxntv8dpt/xBTD0UwZwOp+OfNx/pHfLURf5U6ECrkgN5xf
         SgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686763091; x=1689355091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8E7alXFnYsjNnpR3eeRhfbBudzEGWslVHCnpWP7s+Ps=;
        b=fI1CaoLzcjnWaCOq9pZfudBiWXIdMUpTK2CU4ILxoRPquRZ6sxPklkxOmiwAxzySjs
         awaaoOLH0KOqS6L8evnbuDFR+8qfcFIcS33KKfzZ8pIlwnx53Uxmx6ozwhawOGLcv2td
         1NZYTv0X3u1KJlgAdEU1mpnVFqIYjqanOOB8MZw2nnNZM8dwFMwhnm87zU/XWTnDDim7
         fp5DgiSRIAF3ZKhV5BkkKXz+3aYEog6hUkT4xBvz4XuKcTZJ0kTeOUvMnKpCUrplSLRJ
         B0Pu4O/6Wj8b5e5adysse3BECucyU3u+Ri3FO0SMgkdxDL3xfYUiLadVO2aIkQDszemX
         9xIQ==
X-Gm-Message-State: AC+VfDxPO/G2H/lshY2ULaRBfdSyQPPj6raPD/V1Qb/Rcj+FKEiq943J
        wQMHdaY9yIJHioFXIOfxR6s1HA==
X-Google-Smtp-Source: ACHHUZ75e4yY8YF/k+wmJTVdekC0yLpMAEC0vuUyrJXPr0t0Ni9R0Ob8GwayNhixL4qkK6ErxbLDAg==
X-Received: by 2002:a17:907:94ca:b0:96a:52e:5379 with SMTP id dn10-20020a17090794ca00b0096a052e5379mr14942952ejc.63.1686763091507;
        Wed, 14 Jun 2023 10:18:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r2-20020a170906548200b0096f5b48fe43sm8149752ejo.47.2023.06.14.10.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 10:18:11 -0700 (PDT)
Message-ID: <8fdcd38e-7b4b-6016-2014-5d5de05c2267@linaro.org>
Date:   Wed, 14 Jun 2023 19:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] usb: phy: mxs: add DT bindings to hold data line
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, jun.li@nxp.com
Cc:     Frank.Li@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20230614111548.1815146-1-xu.yang_2@nxp.com>
 <20230614111548.1815146-2-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230614111548.1815146-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/06/2023 13:15, Xu Yang wrote:
> Whether the data line is disconnected when vbus is not present is related
> to whether the platform data set MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS
> flag. This will provide a override from dts node if the user want to hold
> the data line when vbus is not present.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index e1a2b2ea098b..036bb58a3a71 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -199,7 +199,7 @@ MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
>  struct mxs_phy {
>  	struct usb_phy phy;
>  	struct clk *clk;
> -	const struct mxs_phy_data *data;
> +	struct mxs_phy_data *data;
>  	struct regmap *regmap_anatop;
>  	int port_id;
>  	u32 tx_reg_set;
> @@ -774,6 +774,11 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  		mxs_phy->tx_reg_set  |= GM_USBPHY_TX_D_CAL(val);
>  	}
>  
> +	mxs_phy->data = (struct mxs_phy_data *)of_device_get_match_data(&pdev->dev);
> +
> +	if (of_property_present(np, "fsl,hold-line-without-vbus"))
> +		mxs_phy->data->flags &= ~MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS;

How did you test it? What type of memory are you modifying?

Best regards,
Krzysztof

