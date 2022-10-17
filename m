Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1846004AF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 03:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiJQBHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 21:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJQBHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 21:07:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7AE2BE37
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 18:07:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C9167B80B37
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 01:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BC9C433D6;
        Mon, 17 Oct 2022 01:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665968828;
        bh=wIPS9auMWnF83NCUl2NycGf1UU0lmIIU4bK8RSjqBQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ErlilTrnkonooWFYF6I1zvQGgk99Gu2o/3+2lvz9x+pBYtfNxM5ZMbyL/GYQCmz67
         pQOpeiechmU/4WIX0UAR8nQXtmDsZnNjxRvH78uLd/z/45QLaez1LNdB61NBvvj1xV
         CSocseHL4eBXXa1UkZ6WySYfmb55LXNz5JUOPFAkA58tKxJrV9hatAQXvok5NJ/ygz
         v8sm4RYb5KW+cRdmG8g0DeLhgVPaCvnksrPm3MrCqnLJ+VN1PX+4TJD05rrhEyC90c
         IamHYyKJ+KxtMULb3UHczL04jpgshlsjDYqN/rkg/aemPAiNsQJqnWYqM758iXx7xQ
         DMbsYrdV6IXkw==
Date:   Mon, 17 Oct 2022 09:07:03 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     jun.li@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 4/8] usb: chipidea: udc: add suspend/resume support
 for device controller
Message-ID: <20221017010703.GG12701@nchen-desktop>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
 <20221013151442.3262951-5-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151442.3262951-5-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-10-13 23:14:38, Xu Yang wrote:
> The controller's power may be powered off during system suspend. This
> will add suspend/resume support when the controller suffers power lost.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
> Changes since v1:
> - wrap suspend/resume functions with CONFIG_PM_SLEEP.
> ---
>  drivers/usb/chipidea/udc.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 8c3e3a635ac2..54c09245ad05 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2181,6 +2181,34 @@ static void udc_id_switch_for_host(struct ci_hdrc *ci)
>  				     ci->platdata->pins_default);
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static void udc_suspend(struct ci_hdrc *ci)
> +{
> +	/*
> +	 * Set OP_ENDPTLISTADDR to be non-zero for
> +	 * checking if controller resume from power lost
> +	 * in non-host mode.
> +	 */
> +	if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
> +		hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
> +}
> +
> +static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> +{
> +	if (power_lost) {
> +		if (ci->is_otg)
> +			hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
> +					OTGSC_BSVIS | OTGSC_BSVIE);
> +		if (ci->vbus_active)
> +			usb_gadget_vbus_disconnect(&ci->gadget);
> +	}
> +
> +	/* Restore value 0 if it was set for power lost check */
> +	if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0xFFFFFFFF)
> +		hw_write(ci, OP_ENDPTLISTADDR, ~0, 0);
> +}
> +#endif
> +
>  /**
>   * ci_hdrc_gadget_init - initialize device related bits
>   * @ci: the controller
> @@ -2201,6 +2229,10 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
>  
>  	rdrv->start	= udc_id_switch_for_device;
>  	rdrv->stop	= udc_id_switch_for_host;
> +#ifdef CONFIG_PM_SLEEP
> +	rdrv->suspend	= udc_suspend;
> +	rdrv->resume	= udc_resume;
> +#endif
>  	rdrv->irq	= udc_irq;
>  	rdrv->name	= "gadget";
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
