Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035D574CA3E
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 05:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjGJDNm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 23:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGJDNk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 23:13:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8E7132;
        Sun,  9 Jul 2023 20:13:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6F8D60DC0;
        Mon, 10 Jul 2023 03:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BACC433C7;
        Mon, 10 Jul 2023 03:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688958784;
        bh=aEGtz0laJNBLEIODsSf+JXX87wxCatUd2MIB3qau09E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ap3Jjan4FgA/71ggeMOodcvNupFivyk2o4vwlvHzmtQy36hbr8+qDa5lvz0JgRCmG
         //xfR+25IJrnmQkCXFNZLTorJLFV6Syaf2tlcG0kBJ/HUnETlAKNLa+OIiyxhCzeDx
         wqn9T06Egonp/wxaHncYGZKwdnSmPQKEGL5Mc4X7OBMK+tOml90EoCO8DmaPr50nSz
         kSOQKHHI9txahd2t8bqSHW351n8oKHJaFAVRm6+gE0fLXdtiIhClGo9LiHb1IU+VU9
         DiTHLDtL6W85SL391NZ9QUvLusOWJEbbHYVMX1p1nx3LxPf7IIKzMK9y+btAD6u+Tk
         LIRdLg3ERJI1Q==
Date:   Mon, 10 Jul 2023 11:12:54 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, conor+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 3/3] usb: chipidea: imx: add one fsl picophy parameter
 tuning implementation
Message-ID: <20230710031254.GB2418446@nchen-desktop>
References: <20230627112126.1882666-1-xu.yang_2@nxp.com>
 <20230627112126.1882666-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627112126.1882666-3-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-06-27 19:21:26, Xu Yang wrote:
> In some cases, the user may need to tune the rise/fall time of the
> high-speed transmitter waveform for USB Certification. This will add
> a parameter for this purpose. The value will be fetched from dtb and
> finally written to the register.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> Changes in v2:
>  - rename parameter name
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 3 +++
>  drivers/usb/chipidea/ci_hdrc_imx.h | 1 +
>  drivers/usb/chipidea/usbmisc_imx.c | 9 +++++++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 873539f9a2c0..159509c5fe58 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -181,6 +181,9 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
>  	if (of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
>  			&data->dc_vol_level_adjust))
>  		data->dc_vol_level_adjust = -1;
> +	if (of_property_read_u32(np, "fsl,picophy-rise-fall-time-adjust",
> +			&data->rise_fall_time_adjust))
> +		data->rise_fall_time_adjust = -1;
>  
>  	return data;
>  }
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
> index 7135b9a5d913..88b8da79d518 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.h
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.h
> @@ -28,6 +28,7 @@ struct imx_usbmisc_data {
>  	enum usb_dr_mode available_role; /* runtime usb dr mode */
>  	int emp_curr_control;
>  	int dc_vol_level_adjust;
> +	int rise_fall_time_adjust;
>  };
>  
>  int imx_usbmisc_init(struct imx_usbmisc_data *data);
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 1c7932f22218..56570100ffb8 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -130,6 +130,8 @@
>  #define MX7D_USB_OTG_PHY_CFG1		0x30
>  #define TXPREEMPAMPTUNE0_BIT		28
>  #define TXPREEMPAMPTUNE0_MASK		(3 << 28)
> +#define TXRISETUNE0_BIT			24
> +#define TXRISETUNE0_MASK		(3 << 24)
>  #define TXVREFTUNE0_BIT			20
>  #define TXVREFTUNE0_MASK		(0xf << 20)
>  
> @@ -673,6 +675,13 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
>  			reg |= (data->dc_vol_level_adjust << TXVREFTUNE0_BIT);
>  		}
>  
> +		if (data->rise_fall_time_adjust >= 0 &&
> +			data->rise_fall_time_adjust <=
> +			(TXRISETUNE0_MASK >> TXRISETUNE0_BIT)) {
> +			reg &= ~TXRISETUNE0_MASK;
> +			reg |= (data->rise_fall_time_adjust << TXRISETUNE0_BIT);
> +		}
> +
>  		writel(reg, usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
>  	}
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
