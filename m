Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF07660CDD3
	for <lists+linux-usb@lfdr.de>; Tue, 25 Oct 2022 15:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiJYNra (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 09:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbiJYNr2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 09:47:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDD3188101
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 06:47:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AFB4C61962
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 13:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF666C433D6;
        Tue, 25 Oct 2022 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666705647;
        bh=KAujW5/kUa8lYhYhAqrTohXrDzQap/jEIgg5FM4qiVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T23wQgDkoOBQu471gXA66dg8uzAYyhDL/zyYJvD9ZJoUls57Yu6TGsgX9nzIne6g0
         Qx9SSTJeNxMZv1VhQbY7KYuURHh2Qsa4+hctR4IJF8+CTYHdKYh8jJ4kyw2aTtOGSN
         e7elQ0OiUmOrlyOHS9Ji/zHEYarUgUmR55nNtcR7sC7XbpDyh2Z9Q1vomgn1XpPQ60
         GbK7P9POBWzL21zfnrzC9t13Cvee8YHCIs8D+FGXFy9A7EtkZ+2hZ8yx5+5buIscgZ
         JCDybgFITl2p8PrxxxcSmrO4rNCiU7Z5+aK+r8rOVCpAQbLuPoPgU4SLK5LPtYMvrl
         oMDfqiKPxEW8g==
Date:   Tue, 25 Oct 2022 14:47:22 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     peter.chen@kernel.org, jun.li@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 1/8] usb: chipidea: core: add controller resume
 support when controller is powered off
Message-ID: <Y1fo6v9Wm0HBdE67@spud>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
 <20221013151442.3262951-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151442.3262951-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 13, 2022 at 11:14:35PM +0800, Xu Yang wrote:
> For some SoCs, the controler's power will be off during the system
> suspend, and it needs some recovery operation to let the system back
> to workable. We add this support in this patch.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes since v1:
> - add static modifer for ci_handle_power_lost().
> ---
>  drivers/usb/chipidea/core.c | 80 ++++++++++++++++++++++++++++---------
>  drivers/usb/chipidea/otg.c  |  2 +-
>  drivers/usb/chipidea/otg.h  |  1 +
>  3 files changed, 63 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index ae90fee75a32..80267b973c26 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -637,6 +637,49 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
>  	return 0;
>  }
>  
> +static enum ci_role ci_get_role(struct ci_hdrc *ci)
> +{
> +	enum ci_role role;
> +
> +	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
> +		if (ci->is_otg) {
> +			role = ci_otg_role(ci);
> +			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> +		} else {
> +			/*
> +			 * If the controller is not OTG capable, but support
> +			 * role switch, the defalt role is gadget, and the
> +			 * user can switch it through debugfs.
> +			 */
> +			role = CI_ROLE_GADGET;
> +		}
> +	} else {
> +		role = ci->roles[CI_ROLE_HOST] ? CI_ROLE_HOST
> +					: CI_ROLE_GADGET;
> +	}
> +
> +	return role;
> +}
> +
> +static void ci_handle_power_lost(struct ci_hdrc *ci)

Hey,

This appears to have landed in -next and is breaking allmodconfig for
RISC-V:
../drivers/usb/chipidea/core.c:664:13: error: 'ci_handle_power_lost' defined but not used [-Werror=unused-function]
  664 | static void ci_handle_power_lost(struct ci_hdrc *ci)
      |             ^~~~~~~~~~~~~~~~~~~~
  CC [M]  drivers/media/i2c/mt9t001.o
  CC [M]  drivers/net/ethernet/davicom/dm9051.o
  CC [M]  drivers/input/touchscreen/ti_am335x_tsc.o
  CC [M]  drivers/watchdog/wdt_pci.o
cc1: all warnings being treated as errors
make[5]: *** [../scripts/Makefile.build:250: drivers/usb/chipidea/core.o] Error 1
make[4]: *** [../scripts/Makefile.build:500: drivers/usb/chipidea] Error 2
make[3]: *** [../scripts/Makefile.build:500: drivers/usb] Error 2
make[3]: *** Waiting for unfinished jobs....

The only user seems to be wrapped in an #ifdef CONFIG_PM_SLEEP, and
while I haven't had the chance to investigate further yet that's
probably where I'd start looking.
Apologies if it's been reported, I had a quick look on lore but didn't
see anything.

Thanks,
Conor.

> +{
> +	enum ci_role role;
> +
> +	disable_irq_nosync(ci->irq);
> +	if (!ci_otg_is_fsm_mode(ci)) {
> +		role = ci_get_role(ci);
> +
> +		if (ci->role != role) {
> +			ci_handle_id_switch(ci);
> +		} else if (role == CI_ROLE_GADGET) {
> +			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
> +				usb_gadget_vbus_connect(&ci->gadget);
> +		}
> +	}
> +
> +	enable_irq(ci->irq);
> +}
> +
>  static struct usb_role_switch_desc ci_role_switch = {
>  	.set = ci_usb_role_switch_set,
>  	.get = ci_usb_role_switch_get,
> @@ -1134,25 +1177,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
> -		if (ci->is_otg) {
> -			ci->role = ci_otg_role(ci);
> -			/* Enable ID change irq */
> -			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> -		} else {
> -			/*
> -			 * If the controller is not OTG capable, but support
> -			 * role switch, the defalt role is gadget, and the
> -			 * user can switch it through debugfs.
> -			 */
> -			ci->role = CI_ROLE_GADGET;
> -		}
> -	} else {
> -		ci->role = ci->roles[CI_ROLE_HOST]
> -			? CI_ROLE_HOST
> -			: CI_ROLE_GADGET;
> -	}
> -
> +	ci->role = ci_get_role(ci);
>  	if (!ci_otg_is_fsm_mode(ci)) {
>  		/* only update vbus status for peripheral */
>  		if (ci->role == CI_ROLE_GADGET) {
> @@ -1374,8 +1399,16 @@ static int ci_suspend(struct device *dev)
>  static int ci_resume(struct device *dev)
>  {
>  	struct ci_hdrc *ci = dev_get_drvdata(dev);
> +	bool power_lost;
>  	int ret;
>  
> +	/* Since ASYNCLISTADDR (host mode) and ENDPTLISTADDR (device
> +	 * mode) share the same register address. We can check if
> +	 * controller resume from power lost based on this address
> +	 * due to this register will be reset after power lost.
> +	 */
> +	power_lost = !hw_read(ci, OP_ENDPTLISTADDR, ~0);
> +
>  	if (device_may_wakeup(dev))
>  		disable_irq_wake(ci->irq);
>  
> @@ -1383,6 +1416,15 @@ static int ci_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	if (power_lost) {
> +		/* shutdown and re-init for phy */
> +		ci_usb_phy_exit(ci);
> +		ci_usb_phy_init(ci);
> +	}
> +
> +	if (power_lost)
> +		ci_handle_power_lost(ci);
> +
>  	if (ci->supports_runtime_pm) {
>  		pm_runtime_disable(dev);
>  		pm_runtime_set_active(dev);
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 7b53274ef966..622c3b68aa1e 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -165,7 +165,7 @@ static int hw_wait_vbus_lower_bsv(struct ci_hdrc *ci)
>  	return 0;
>  }
>  
> -static void ci_handle_id_switch(struct ci_hdrc *ci)
> +void ci_handle_id_switch(struct ci_hdrc *ci)
>  {
>  	enum ci_role role = ci_otg_role(ci);
>  
> diff --git a/drivers/usb/chipidea/otg.h b/drivers/usb/chipidea/otg.h
> index 5e7a6e571dd2..87629b81e03e 100644
> --- a/drivers/usb/chipidea/otg.h
> +++ b/drivers/usb/chipidea/otg.h
> @@ -14,6 +14,7 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci);
>  void ci_hdrc_otg_destroy(struct ci_hdrc *ci);
>  enum ci_role ci_otg_role(struct ci_hdrc *ci);
>  void ci_handle_vbus_change(struct ci_hdrc *ci);
> +void ci_handle_id_switch(struct ci_hdrc *ci);
>  static inline void ci_otg_queue_work(struct ci_hdrc *ci)
>  {
>  	disable_irq_nosync(ci->irq);
> -- 
> 2.34.1
> 
> 
