Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5BE74CA54
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 05:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjGJDVr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 23:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjGJDVq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 23:21:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270B8EC
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 20:21:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B8E4C60DBA
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 03:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA58C433C7;
        Mon, 10 Jul 2023 03:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688959304;
        bh=a+E+J6RTpX0bNff4O6+9/0McvfY90yRpag00AUskB7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jZl1CBL7Abni4ymkFTU6+Mz/fHoJgKG3QwuDSZI5VV/Qmw+4DUoWzpEnvHdZraTUU
         kMn5j0TqkY3y86U9btjHb5QHY7MtPLmjjK6PsfX37co05LETtdGi8CjkVqmqt1c2FV
         eeAmKoYpZ9Qknt6hH0qtwhjcC+pGcmm08y70j+8wiSlxHqMngGSl2ooN2kcCSnGScw
         naZGQgJpKf0+ikOkoPEjwWfCjg+OWnH9wuPBdrCrCLWNSytYDgsiMkcqTCdw00hgxq
         nd2ldLiaM+oTqpX/Y8ZhXcdKvFilyIIcj9qB5afwounkeYmZJBWAGHgcAwT6X3LOI8
         jVNvLJqoIEpOw==
Date:   Mon, 10 Jul 2023 11:21:33 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, balbi@ti.com, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: Re: [PATCH 3/3] usb: phy: mxs: disconnect line when USB charger is
 attached
Message-ID: <20230710032133.GF2418446@nchen-desktop>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
 <20230627110353.1879477-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627110353.1879477-3-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-06-27 19:03:53, Xu Yang wrote:
> For mxs PHY, if there is a vbus but the bus is not enumerated, we need
> to force the dp/dm as SE0 from the controller side. If not, there is
> possible USB wakeup due to unstable dp/dm, since there is possible no
> pull on dp/dm, such as there is a USB charger on the port.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index f484c79efa6c..619411aab86c 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -395,6 +395,7 @@ static bool mxs_phy_is_otg_host(struct mxs_phy *mxs_phy)
>  static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
>  {
>  	bool vbus_is_on = false;
> +	enum usb_phy_events last_event = mxs_phy->phy.last_event;
>  
>  	/* If the SoCs don't need to disconnect line without vbus, quit */
>  	if (!(mxs_phy->data->flags & MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS))
> @@ -406,7 +407,8 @@ static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
>  
>  	vbus_is_on = mxs_phy_get_vbus_status(mxs_phy);
>  
> -	if (on && !vbus_is_on && !mxs_phy_is_otg_host(mxs_phy))
> +	if (on && ((!vbus_is_on && !mxs_phy_is_otg_host(mxs_phy))
> +		|| (last_event == USB_EVENT_VBUS)))
>  		__mxs_phy_disconnect_line(mxs_phy, true);
>  	else
>  		__mxs_phy_disconnect_line(mxs_phy, false);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
