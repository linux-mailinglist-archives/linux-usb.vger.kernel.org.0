Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBCD69E165
	for <lists+linux-usb@lfdr.de>; Tue, 21 Feb 2023 14:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbjBUNgg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Feb 2023 08:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232845AbjBUNgf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Feb 2023 08:36:35 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E612333C
        for <linux-usb@vger.kernel.org>; Tue, 21 Feb 2023 05:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676986595; x=1708522595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wFqBdefN5Zzku82yk+lK8fJ9iWXw8g6iH67cO3L7gwo=;
  b=DIPd/5YPw1M4sLaHErPnKRM9JKqRgKzNCcmAdZw1YJZOuy+vfasu7uOy
   AX2zaeJ3Qk9aYYL25L+OI7NyKx9kKdpmJjTiOnIvZS84pcszuxCmazapM
   lNeTQFAnhQE3meKbTuh3GUph74X8CTu5dYxRUdHdMrvaLE7ZEDmROmS5z
   EuNLD5E3mfePCtbTjyZrynOWfAB9yHVwZwmnQWYzF62s4eLKXe3Zg8Nmb
   MYGDgOzZmalSkKpVfXKoqTyZYrMQ/pkyoHFY6I+JrnH3i2NSsdhD8SGov
   dXYwK45sMUiGi7kTJHmxrxBLkak29WX+7sAPVBXSL+KrbCvc22dJKaCox
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320762179"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="320762179"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:36:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814507645"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814507645"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Feb 2023 05:36:10 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Feb 2023 15:36:09 +0200
Date:   Tue, 21 Feb 2023 15:36:09 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v4] usb: typec: tcpm: fix create duplicate
 source-capabilities file
Message-ID: <Y/TIyTA1y6+Zs8aw@kuha.fi.intel.com>
References: <20230215054951.238394-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215054951.238394-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 15, 2023 at 01:49:51PM +0800, Xu Yang wrote:
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
> changelogs:
> v2: unregister existing capabilities on specific cases
> v3: add changelog and modify commit message
> v4: reset port->partner_source_caps to NULL
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a0d943d78580..7f39cb9b3429 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4570,6 +4570,9 @@ static void run_state_machine(struct tcpm_port *port)
>  	case SOFT_RESET:
>  		port->message_id = 0;
>  		port->rx_msgid = -1;
> +		/* remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
> +		port->partner_source_caps = NULL;
>  		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
>  		tcpm_ams_finish(port);
>  		if (port->pwr_role == TYPEC_SOURCE) {
> @@ -4589,6 +4592,9 @@ static void run_state_machine(struct tcpm_port *port)
>  	case SOFT_RESET_SEND:
>  		port->message_id = 0;
>  		port->rx_msgid = -1;
> +		/* remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
> +		port->partner_source_caps = NULL;
>  		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
>  			tcpm_set_state_cond(port, hard_reset_state(port), 0);
>  		else
> @@ -4718,6 +4724,9 @@ static void run_state_machine(struct tcpm_port *port)
>  		tcpm_set_state(port, SNK_STARTUP, 0);
>  		break;
>  	case PR_SWAP_SNK_SRC_SINK_OFF:
> +		/* will be source, remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
> +		port->partner_source_caps = NULL;
>  		/*
>  		 * Prevent vbus discharge circuit from turning on during PR_SWAP
>  		 * as this is not a disconnect.
> -- 
> 2.34.1

-- 
heikki
