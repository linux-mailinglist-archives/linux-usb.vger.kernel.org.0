Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB5D7551EFB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 16:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243140AbiFTOhI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 10:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242678AbiFTOgq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 10:36:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F35550B1F
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 06:51:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 01DF161529
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 13:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA80DC3411B;
        Mon, 20 Jun 2022 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655733102;
        bh=DRJU9x4aURkSCKx6/lYu3FzV7IlSvnq7XuNCJ83Xnb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=clw1kUHWsnaw5j1eAtToSOGmJLnaXfhawCvPNqAYW6yBLvYEXwnFuqOl67hbyRInW
         ldIKarS/e0wk4AqhX5ecfn9eDWvZjDgQ7NqMQn8fHnlVmOvXG4QKG2OLaDujIeEXtP
         s4+LFNBsQj4XVsUZxPuFUKexDZlcd0K0IKKHzpgD1w+T3izEq9lrDCJO3ratd/Fovb
         iPx62+B4epAT17Xhtw8BNBvPuKP0QWgBkFbE2i0+z/X4RZFcCec+5N7DOGuIiHIw64
         zkZgJ/7rA1WesqhzM7Lr+nJRZiGjPWNpXklqCc+l6d4o3jFPmfw4KUzQ0Xlmlka8+6
         jzB20zwYqa36Q==
Date:   Mon, 20 Jun 2022 21:51:36 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: chipidea: udc: implement get_frame
Message-ID: <20220620135136.GA1227419@Peter>
References: <20220616194459.2981519-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616194459.2981519-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-06-16 21:44:59, Michael Grzeschik wrote:
> The chipidea udc core is capable of reading the current frame index from
> hardware. This patch adds the get_frame callback to the driver.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci.h   |  1 +
>  drivers/usb/chipidea/core.c |  2 ++
>  drivers/usb/chipidea/udc.c  | 14 ++++++++++++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 99440baa6458ab..a4a3be04991099 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -49,6 +49,7 @@ enum ci_hw_regs {
>  	OP_USBCMD,
>  	OP_USBSTS,
>  	OP_USBINTR,
> +	OP_FRINDEX,
>  	OP_DEVICEADDR,
>  	OP_ENDPTLISTADDR,
>  	OP_TTCTRL,
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 5359b2a2e4d243..6330fa9117926a 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -53,6 +53,7 @@ static const u8 ci_regs_nolpm[] = {
>  	[OP_USBCMD]		= 0x00U,
>  	[OP_USBSTS]		= 0x04U,
>  	[OP_USBINTR]		= 0x08U,
> +	[OP_FRINDEX]		= 0x0CU,
>  	[OP_DEVICEADDR]		= 0x14U,
>  	[OP_ENDPTLISTADDR]	= 0x18U,
>  	[OP_TTCTRL]		= 0x1CU,
> @@ -78,6 +79,7 @@ static const u8 ci_regs_lpm[] = {
>  	[OP_USBCMD]		= 0x00U,
>  	[OP_USBSTS]		= 0x04U,
>  	[OP_USBINTR]		= 0x08U,
> +	[OP_FRINDEX]		= 0x0CU,
>  	[OP_DEVICEADDR]		= 0x14U,
>  	[OP_ENDPTLISTADDR]	= 0x18U,
>  	[OP_TTCTRL]		= 0x1CU,
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 15d211a8b3ac54..054e5077b39834 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1651,6 +1651,19 @@ static const struct usb_ep_ops usb_ep_ops = {
>  /******************************************************************************
>   * GADGET block
>   *****************************************************************************/
> +
> +static int ci_udc_get_frame(struct usb_gadget *_gadget)
> +{
> +	struct ci_hdrc *ci = container_of(_gadget, struct ci_hdrc, gadget);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&ci->lock, flags);
> +	ret = hw_read(ci, OP_FRINDEX, 0x3fff);
> +	spin_unlock_irqrestore(&ci->lock, flags);
> +	return ret >> 3;
> +}
> +
>  /*
>   * ci_hdrc_gadget_connect: caller makes sure gadget driver is binded
>   */
> @@ -1807,6 +1820,7 @@ static struct usb_ep *ci_udc_match_ep(struct usb_gadget *gadget,
>   * Check  "usb_gadget.h" for details
>   */
>  static const struct usb_gadget_ops usb_gadget_ops = {
> +	.get_frame	= ci_udc_get_frame,
>  	.vbus_session	= ci_udc_vbus_session,
>  	.wakeup		= ci_udc_wakeup,
>  	.set_selfpowered	= ci_udc_selfpowered,
> -- 
> 2.30.2
> 

-- 

Thanks,
Peter Chen

