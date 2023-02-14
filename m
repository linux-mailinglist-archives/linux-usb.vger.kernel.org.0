Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361F8696289
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 12:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjBNLjA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 06:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjBNLi7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 06:38:59 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3B52331E
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 03:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676374738; x=1707910738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MXT6KZgEkWqr7ncCVeSe4paLzWHFQEOLcE2i4A7omOc=;
  b=aB8jArN1VbtPCkxfm6Vo+h24UttUya+Mceu4aQ1+99aSMxQdlrWuylz9
   ZrjsihZu62lB/0RwMEQHE/1Gj5LDOB9k2zZWFs7J7S71RDoy14nzWEgkZ
   Q7BigbuGT8PmElwr64wtNbeb2H/wyjD9R7FDS9yRDzMDsOR7wsZVkjDJN
   0Q0lwG0v7Lt/ViJwnIssaRrXl+1tdMSwAogj9bvgiRnij3335G5IAkKKC
   d8RFpVzecXGhjtgYA3p7uG/nWdKaCXBFVbutavOVZ4O4h0sjP9cujR0Jb
   aP+LXPxFoZ+vyW5rLnq5I40hJFCeEGOQprcrgmSGkAdbRUV3YE7d5yTp6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333276735"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="333276735"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 03:38:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811993966"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="811993966"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 14 Feb 2023 03:38:55 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 14 Feb 2023 13:38:54 +0200
Date:   Tue, 14 Feb 2023 13:38:54 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v3] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Message-ID: <Y+tyzhyb+PGhTJpx@kuha.fi.intel.com>
References: <20230214065635.972698-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214065635.972698-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 14, 2023 at 02:56:35PM +0800, Xu Yang wrote:
> The kernel will dump in the below cases:
> sysfs: cannot create duplicate filename
> '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
> 
> 1. After soft reset has completed, an Explicit Contract negotiation occurs.
> The sink device will receive source capabilitys again. This will cause
> a duplicate source-capabilities file be created.
> 2. Power swap twice on a device that is initailly sink role.
> 
> This will unregister existing capabilities when above cases occurs.
> 
> Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: unregister existing capabilities on specific cases
> v3: add changelog and modify commit message
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a0d943d78580..7d8c53d96c3b 100644
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
> @@ -4718,6 +4722,8 @@ static void run_state_machine(struct tcpm_port *port)
>  		tcpm_set_state(port, SNK_STARTUP, 0);
>  		break;
>  	case PR_SWAP_SNK_SRC_SINK_OFF:
> +		/* will be source, remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
>  		/*
>  		 * Prevent vbus discharge circuit from turning on during PR_SWAP
>  		 * as this is not a disconnect.
> -- 
> 2.34.1

-- 
heikki
