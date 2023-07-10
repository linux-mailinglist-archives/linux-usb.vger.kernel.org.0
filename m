Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C66674CA52
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 05:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjGJDUS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 23:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjGJDUR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 23:20:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94845EC
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 20:20:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32CF460B56
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 03:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2EDC433C9;
        Mon, 10 Jul 2023 03:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688959215;
        bh=Z7HmmEKgux8vl0J4vWidS86aXPCHDCaU/isjhoLKX8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fuv0i1T7kU36Lu/KfX5zn0eBK6htE0kQ43cZMJdfAEsCDnM0zzcVOjJKeP/AbuwEq
         nxeR/YdnSC9hW3VR9KgfBRQ19iG1azr5brOC7+Bv5XU+wO32SFlDf0/RpMzmDrP58f
         99IgL1vqlemSL/Qzd3plS+wD5WPWtE1aa/yzWlbMPx45XyKcfFViwHhY4b0XR4fOcn
         nIjGACAmjn2c3fGI7KKBCCrBujc6bJBMG5Snru73dNZvudC64tFBSwNs54j7HzvNld
         3b244gQK7oK1FBYtFtKpuxs3FpiWUAidp25S2ECDlDQH3ETUmewLH7FV8dHxroRNQl
         voxoIqmeTZ/Bg==
Date:   Mon, 10 Jul 2023 11:20:04 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, balbi@ti.com, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: Re: [PATCH 2/3] usb: phy: mxs: fix getting wrong state with
 mxs_phy_is_otg_host()
Message-ID: <20230710032004.GE2418446@nchen-desktop>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
 <20230627110353.1879477-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627110353.1879477-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-06-27 19:03:52, Xu Yang wrote:
> The function mxs_phy_is_otg_host() will return true if OTG_ID_VALUE is
> 0 at USBPHY_CTRL register. However, OTG_ID_VALUE will not reflect the real
> state if the ID pin is float, such as Host-only or Type-C cases. The value
> of OTG_ID_VALUE is always 1 which means device mode.
> This patch will fix the issue by judging the current mode based on
> last_event. The controller will update last_event in time.
> 
> Fixes: 7b09e67639d6 ("usb: phy: mxs: refine mxs_phy_disconnect_line")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 036bb58a3a71..f484c79efa6c 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -388,14 +388,8 @@ static void __mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool disconnect)
>  
>  static bool mxs_phy_is_otg_host(struct mxs_phy *mxs_phy)
>  {
> -	void __iomem *base = mxs_phy->phy.io_priv;
> -	u32 phyctrl = readl(base + HW_USBPHY_CTRL);
> -
> -	if (IS_ENABLED(CONFIG_USB_OTG) &&
> -			!(phyctrl & BM_USBPHY_CTRL_OTG_ID_VALUE))
> -		return true;
> -
> -	return false;
> +	return IS_ENABLED(CONFIG_USB_OTG) &&
> +		mxs_phy->phy.last_event == USB_EVENT_ID;
>  }
>  
>  static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
