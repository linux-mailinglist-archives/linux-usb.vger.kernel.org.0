Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9681A60049C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 02:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiJQA4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 20:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJQA4w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 20:56:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B853E74B
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 17:56:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A109B60EB3
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 00:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E3AC433D6;
        Mon, 17 Oct 2022 00:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665968211;
        bh=TuHsZRLzoMVmavb4hnOV0xehPkB8FonFgOi16vrL5FY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LMrrV8Cdrp80e9FYAquxrjKGXada+27+C+aIzqVG2j/sb0PJfZuR8ODWMnV9q5M86
         G152UJ+SNFVx8YwggBgqdHJ2n4NGY0d7NiufDOcI05ShpLDC2OVDK4yDJiqH3YQ9rh
         kAPJFVQzm5l47WjOr6NzDbyO6MPeOJwUtFBw9nPkGqDTJtNI8Jp1n8jba1bLB3gW7c
         LMTdjup2o48Hz3pGmDoQTm1WjupbkBskiR0j4xK+ciKbCFuTQfnlGxKn4efhZmW6H3
         u7nt3nk5K36XYJQNA6zjkWbMjjvuxXa/quhbUEwE8BDP5PwgNXEUSfxvm2Y3XCi23D
         rQcDUhHHTIPSg==
Date:   Mon, 17 Oct 2022 08:56:46 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     jun.li@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 1/8] usb: chipidea: core: add controller resume
 support when controller is powered off
Message-ID: <20221017005646.GD12701@nchen-desktop>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
 <20221013151442.3262951-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151442.3262951-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-10-13 23:14:35, Xu Yang wrote:
> For some SoCs, the controler's power will be off during the system
> suspend, and it needs some recovery operation to let the system back
> to workable. We add this support in this patch.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

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

-- 

Thanks,
Peter Chen
