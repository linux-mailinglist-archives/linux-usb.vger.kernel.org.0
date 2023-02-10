Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6476B691A59
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 09:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbjBJIv6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 03:51:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjBJIv4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 03:51:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533072310B
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 00:51:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C576B819FF
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 08:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E48C433D2;
        Fri, 10 Feb 2023 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676019112;
        bh=pfgbWjkFK1mgUz1QuuWRK/O1mo8JlviZmKYugkLWa18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ueAv5VOuGWpJ2RknL7PoMZ4XDZBvCd2OYFra0a/qsC2U+lHINIlad2rQxJGwRbsMo
         80mWmA1XyE3RUgLtKBmPAXVHCHidCrZG3K5xZWnyXPGSGPqT0jiwaPI60SQnvb0k0c
         5ZX8uowVEzcMFgZ537dC3Hve+4M1CDCEzZgcZEBb8oPaLzUBTVQhKzBf9X5Swf1N23
         64nY3AyOTesVRSKN6nsxC5LgCKQ4X/FrT24j/SeatqDJp/9NP7eBlf9ToppQhc0eJ1
         k1M4e1MA0ISIkiJoOFr8hYIfBdTH/vVRfH1l5saZAglGvgm7WkUX/6oTYMeleDIngm
         VQwVl4W/UJTSg==
Date:   Fri, 10 Feb 2023 16:51:40 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] usb: chipidea: ci_hdrc_imx: use dev_err_probe
Message-ID: <20230210085140.GB1991028@nchen-desktop>
References: <20230130094151.95174-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130094151.95174-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-01-30 10:41:51, Alexander Stein wrote:
> Add error message if finding USB PHY fails or is deferred.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 0dc482542d85..2eeccf4ec9d6 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -413,15 +413,19 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
>  	if (IS_ERR(data->phy)) {
>  		ret = PTR_ERR(data->phy);
> -		if (ret != -ENODEV)
> +		if (ret != -ENODEV) {
> +			dev_err_probe(dev, ret, "Failed to parse fsl,usbphy\n");
>  			goto err_clk;
> +		}
>  		data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
>  		if (IS_ERR(data->phy)) {
>  			ret = PTR_ERR(data->phy);
> -			if (ret == -ENODEV)
> +			if (ret == -ENODEV) {
>  				data->phy = NULL;
> -			else
> +			} else {
> +				dev_err_probe(dev, ret, "Failed to parse phys\n");
>  				goto err_clk;
> +			}
>  		}
>  	}
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
