Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5BE74CA51
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 05:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjGJDTd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 23:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGJDTb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 23:19:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698BCF9
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 20:19:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E7DC960DCE
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 03:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6749C433C8;
        Mon, 10 Jul 2023 03:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688959169;
        bh=tLsaOWrynHHL4LhYdB/GLUGPi1qQypW+c8hrTq9vPN0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tJmUg4CaNXQ7SbeL1YVkWCHq5tzv2Y+gnjG9dVQhgmt9eJf9e12GPkmVafG4VxCh0
         /rsQSxF85SFJkpEBXCeLKaV5GsU/bBX0+/ezyJQmmfTn6oehX+qjcW3nG56OnTBlCj
         PoD/2FOkKG6qXPSZhVUcrY/zG3KuylipCe3l+LXEcrK0QVkdrZ0XjxCIeDCjCU04Xp
         bUfOmHZRwokJO5Mca6pquMCpXLEer7r93rLEVGjdwiQc1Zbaya0oWJYlm6hY01QwJi
         Z8GA+qlJ+SZn4MtACAGZ8qWVCd6HX95YyWHxK1UW9RhCrFIpHWvqWYPcdVEntYaFSW
         pwaQC98Yp1wIA==
Date:   Mon, 10 Jul 2023 11:19:18 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, balbi@ti.com, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: Re: [PATCH 1/3] usb: chipidea: add USB PHY event
Message-ID: <20230710031918.GD2418446@nchen-desktop>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627110353.1879477-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-06-27 19:03:51, Xu Yang wrote:
> Add USB PHY event for below situation:
> - usb role changed
> - vbus connect
> - vbus disconnect
> - gadget driver is enumerated
> 
> USB PHY driver can get the last event after above situation occurs
> and deal with different situations.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci.h  | 18 ++++++++++++++++--
>  drivers/usb/chipidea/udc.c | 10 ++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index f210b7489fd5..d262b9df7b3d 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -281,8 +281,19 @@ static inline int ci_role_start(struct ci_hdrc *ci, enum ci_role role)
>  		return -ENXIO;
>  
>  	ret = ci->roles[role]->start(ci);
> -	if (!ret)
> -		ci->role = role;
> +	if (ret)
> +		return ret;
> +
> +	ci->role = role;
> +
> +	if (ci->usb_phy) {
> +		if (role == CI_ROLE_HOST)
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_ID);
> +		else
> +			/* in device mode but vbus is invalid*/
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> +	}
> +
>  	return ret;
>  }
>  
> @@ -296,6 +307,9 @@ static inline void ci_role_stop(struct ci_hdrc *ci)
>  	ci->role = CI_ROLE_END;
>  
>  	ci->roles[role]->stop(ci);
> +
> +	if (ci->usb_phy)
> +		usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
>  }
>  
>  static inline enum usb_role ci_role_to_usb_role(struct ci_hdrc *ci)
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 54c09245ad05..d58355427eeb 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1718,6 +1718,13 @@ static int ci_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
>  		ret = ci->platdata->notify_event(ci,
>  				CI_HDRC_CONTROLLER_VBUS_EVENT);
>  
> +	if (ci->usb_phy) {
> +		if (is_active)
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_VBUS);
> +		else
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> +	}
> +
>  	if (ci->driver)
>  		ci_hdrc_gadget_connect(_gadget, is_active);
>  
> @@ -2034,6 +2041,9 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
>  		if (USBi_PCI & intr) {
>  			ci->gadget.speed = hw_port_is_high_speed(ci) ?
>  				USB_SPEED_HIGH : USB_SPEED_FULL;
> +			if (ci->usb_phy)
> +				usb_phy_set_event(ci->usb_phy,
> +					USB_EVENT_ENUMERATED);
>  			if (ci->suspended) {
>  				if (ci->driver->resume) {
>  					spin_unlock(&ci->lock);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
