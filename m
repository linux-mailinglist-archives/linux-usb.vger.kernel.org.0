Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD696004AD
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 03:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiJQBGg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 21:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiJQBGf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 21:06:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06B62C11D
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 18:06:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A50A8B80D31
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 01:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AE3C433D6;
        Mon, 17 Oct 2022 01:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665968792;
        bh=o5t3FtycdEoxuOcZ6gISpPNx5/U9GDKIAyF/4W5qWzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WpgqjWxlDeK9d+0HubvErSjIatI3fM5b4Yv7OBbO+JI+9uVauxCLRsJuiH5cRG00u
         h6ZUm2LXFkz3g84eyDMhDtpvGsvfPLxQK1jcsbZO5AHMmyndu/mY03WWz6atDL+OFK
         kyE7LCor9AJ0BKaPww6nYiSkaIE4o9zvBaAR2rF66+S17Ryxn8h1WA4e2Zz1THoHlF
         ivCy7ycFOVmpVQiEHn37ObN97cDjh55AHVG2DECGv9quSjU0hNETlITbj92uuLtj8i
         hQc8x8FKjDvr1whz3nqRZK4su5Kx/edWDrXgr8z1oqabx8uT1VFkRzn8f/1u6j9IlH
         JgYmJSqzJTuTA==
Date:   Mon, 17 Oct 2022 09:06:27 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     jun.li@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 3/8] usb: chipidea: host: add suspend/resume support
 for host controller
Message-ID: <20221017010627.GF12701@nchen-desktop>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
 <20221013151442.3262951-4-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151442.3262951-4-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-10-13 23:14:37, Xu Yang wrote:
> The controller's power may be powered off during system suspend. This
> will add suspend/resume support when the controller suffers power lost.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes since v1:
> - wrap suspend/resume functions with CONFIG_PM_SLEEP.
> ---
>  drivers/usb/chipidea/host.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index bc3634a54c6b..ebe7400243b1 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -459,6 +459,18 @@ static void ci_hdrc_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
>  	ci_hdrc_free_dma_aligned_buffer(urb);
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static void ci_hdrc_host_suspend(struct ci_hdrc *ci)
> +{
> +	ehci_suspend(ci->hcd, device_may_wakeup(ci->dev));
> +}
> +
> +static void ci_hdrc_host_resume(struct ci_hdrc *ci, bool power_lost)
> +{
> +	ehci_resume(ci->hcd, power_lost);
> +}
> +#endif
> +

This code seems doesn't the same with the code at source.codeaurora.org,
please make sure it could work for all platforms.

Peter

>  int ci_hdrc_host_init(struct ci_hdrc *ci)
>  {
>  	struct ci_role_driver *rdrv;
> @@ -472,6 +484,10 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
>  
>  	rdrv->start	= host_start;
>  	rdrv->stop	= host_stop;
> +#ifdef CONFIG_PM_SLEEP
> +	rdrv->suspend	= ci_hdrc_host_suspend;
> +	rdrv->resume	= ci_hdrc_host_resume;
> +#endif
>  	rdrv->irq	= host_irq;
>  	rdrv->name	= "host";
>  	ci->roles[CI_ROLE_HOST] = rdrv;
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
