Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB35B74CA26
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 05:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjGJDEC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 23:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjGJDEA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 23:04:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB749EC;
        Sun,  9 Jul 2023 20:03:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D91260DB9;
        Mon, 10 Jul 2023 03:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D94C433C7;
        Mon, 10 Jul 2023 03:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688958238;
        bh=C9GFMgBwqQVO5SrK5/7V16POvQxhD5YTHRriWmbhJaA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PwvxkTZ9TooT0jBnwDmhpD8IVi6qjiovqQftr2f7lvJs2nWp+iF769/SPWfFCmiRY
         HZ+rzUcAczUcbbryLmFLToocFkZHOECpqsqzZAG45tEFGkCpooh8buUu2hmutTSfSk
         pmgKtrfg0dlXwluk/nq+FOhNtzwUTUdL236gY8KfmvlvXTk9RT1UiWSVw/qcwVM/wS
         IHXXW85UnMRGNCRCMxgWzzV1SThp1b+RYwSlOhRlxmRV6ozhLbwo3D+urNrAsM+omq
         LFTzhsXs2sndbVX7GKxFrI/U870q6FT6Li7hdxKrPosTlrhFlgBNFrl5KaNqV0Ld6A
         OnuM4fjNoaExg==
Date:   Mon, 10 Jul 2023 11:03:47 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, conor+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: chipidea: imx: improve logic if
 samsung,picophy-* parameter is 0
Message-ID: <20230710030347.GA2418446@nchen-desktop>
References: <20230627112126.1882666-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627112126.1882666-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-06-27 19:21:24, Xu Yang wrote:
> In current driver, the value of tuning parameter will not take effect
> if samsung,picophy-* is assigned as 0. Because 0 is also a valid value
> acccording to the description of USB_PHY_CFG1 register, this will improve
> the logic to let it work.
> 
> Fixes: 58a3cefb3840 ("usb: chipidea: imx: add two samsung picophy parameters tuning implementation")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

> 
> ---
> Changes in v2:
>  - no change
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 10 ++++++----
>  drivers/usb/chipidea/usbmisc_imx.c |  6 ++++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 336ef6dd8e7d..873539f9a2c0 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -175,10 +175,12 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
>  	if (of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI)
>  		data->ulpi = 1;
>  
> -	of_property_read_u32(np, "samsung,picophy-pre-emp-curr-control",
> -			&data->emp_curr_control);
> -	of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
> -			&data->dc_vol_level_adjust);
> +	if (of_property_read_u32(np, "samsung,picophy-pre-emp-curr-control",
> +			&data->emp_curr_control))
> +		data->emp_curr_control = -1;
> +	if (of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
> +			&data->dc_vol_level_adjust))
> +		data->dc_vol_level_adjust = -1;
>  
>  	return data;
>  }
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 9ee9621e2ccc..1c7932f22218 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -659,13 +659,15 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
>  			usbmisc->base + MX7D_USBNC_USB_CTRL2);
>  		/* PHY tuning for signal quality */
>  		reg = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
> -		if (data->emp_curr_control && data->emp_curr_control <=
> +		if (data->emp_curr_control >= 0 &&
> +			data->emp_curr_control <=
>  			(TXPREEMPAMPTUNE0_MASK >> TXPREEMPAMPTUNE0_BIT)) {
>  			reg &= ~TXPREEMPAMPTUNE0_MASK;
>  			reg |= (data->emp_curr_control << TXPREEMPAMPTUNE0_BIT);
>  		}
>  
> -		if (data->dc_vol_level_adjust && data->dc_vol_level_adjust <=
> +		if (data->dc_vol_level_adjust >= 0 &&
> +			data->dc_vol_level_adjust <=
>  			(TXVREFTUNE0_MASK >> TXVREFTUNE0_BIT)) {
>  			reg &= ~TXVREFTUNE0_MASK;
>  			reg |= (data->dc_vol_level_adjust << TXVREFTUNE0_BIT);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
