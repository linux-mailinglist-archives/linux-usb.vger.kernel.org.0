Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235BC762B21
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 08:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjGZGIk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 02:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjGZGIc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 02:08:32 -0400
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95416F5
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 23:08:27 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
        by mail11.truemail.it (Postfix) with ESMTPA id B909F20731;
        Wed, 26 Jul 2023 08:08:22 +0200 (CEST)
Date:   Wed, 26 Jul 2023 08:08:18 +0200
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     peter.chen@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, balbi@ti.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 2/3] usb: phy: mxs: fix getting wrong state with
 mxs_phy_is_otg_host()
Message-ID: <ZMC4UgtuGvWnpc8i@francesco-nb.int.toradex.com>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
 <20230627110353.1879477-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627110353.1879477-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 27, 2023 at 07:03:52PM +0800, Xu Yang wrote:
> The function mxs_phy_is_otg_host() will return true if OTG_ID_VALUE is
> 0 at USBPHY_CTRL register. However, OTG_ID_VALUE will not reflect the real
> state if the ID pin is float, such as Host-only or Type-C cases. The value
> of OTG_ID_VALUE is always 1 which means device mode.
> This patch will fix the issue by judging the current mode based on
> last_event. The controller will update last_event in time.
> 
> Fixes: 7b09e67639d6 ("usb: phy: mxs: refine mxs_phy_disconnect_line")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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

The logic here is not working when CONFIG_USB_OTG, should we always
return true when !IS_ENABLED(CONFIG_USB_OTG) ?

so something like 

if (!IS_ENABLED(CONFIG_USB_OTG))
	return true;

return mxs_phy->phy.last_event == USB_EVENT_ID;


?
