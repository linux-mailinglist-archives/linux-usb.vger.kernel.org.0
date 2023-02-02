Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6714F687CD9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 13:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbjBBMGV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 07:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjBBMGU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 07:06:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1A789373
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 04:06:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 836D1B825B4
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 12:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9993AC433EF;
        Thu,  2 Feb 2023 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675339573;
        bh=pjfClUIU2/I7dyYhyrVy/IwHZIM1se5vVdT4UwutDHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zj6Zy/RqmrOUg/JlONvvEZumxPM66nVwraDJ+TzHhZkLAgWiOy8/46xta/wB2N0Px
         PXJ96h87m4yu6xfuQpGo3YDcOWfVuIijnIpIrcL7qoY8SHeQ+LkYRIIax3cTJx0cVo
         BhZ0HE9+qEoM14w0F0T7hdj5p1IGTNsq9eaZ0msM=
Date:   Thu, 2 Feb 2023 13:06:09 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Message-ID: <Y9unMSoqj4gWssq5@kroah.com>
References: <20230202111616.1484680-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202111616.1484680-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 02, 2023 at 07:16:16PM +0800, Xu Yang wrote:
> After soft reset has completed, an Explicit Contract negotiation occurs.
> The sink device will receive source capabilitys again. This will cause
> a duplicate source-capabilities file be created.
> 
> And the kernel will dump:
> sysfs: cannot create duplicate filename '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
> 
> This will unregister existing capabilities when received soft reset or is
> sending soft reset by sink.
> 
> Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a0d943d78580..d84649838082 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4570,6 +4570,8 @@ static void run_state_machine(struct tcpm_port *port)
>  	case SOFT_RESET:
>  		port->message_id = 0;
>  		port->rx_msgid = -1;
> +		/* remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
>  		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
>  		tcpm_ams_finish(port);
>  		if (port->pwr_role == TYPEC_SOURCE) {
> @@ -4589,6 +4591,8 @@ static void run_state_machine(struct tcpm_port *port)
>  	case SOFT_RESET_SEND:
>  		port->message_id = 0;
>  		port->rx_msgid = -1;
> +		/* remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
>  		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
>  			tcpm_set_state_cond(port, hard_reset_state(port), 0);
>  		else
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
