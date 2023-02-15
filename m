Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1525E697DAD
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 14:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjBONmM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 08:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjBONmK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 08:42:10 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE3C2C664
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 05:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676468530; x=1708004530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4BiPYl2HFOQtccpiriPVMLkfJvW2WUhJ2iLeYSmDiVs=;
  b=kJXNgGnWfQedgJsig3Er3nKCjUBBr3JMEKKbm5w30gw52qh8bkEcRfsa
   oyNsMYmXm36r/B/j4yLPQSZTirfQjYDqC5l9Oi+OR9zDljkPYoZrrk7at
   RckEl8zswe8g8W1FDeIflqN0VuO6kd76ephuNO3oREhg4P93NZ7oULgu+
   ykD6dIEo76UZpAXH1H/GPMh9cPJQr73giQ+BYBKdAfGzVE6bi9sfJQ7BF
   P7UoCqM6t/yNmn6ExZmoW0pNNLdyCqIC0/muEeV13B9c9IWh4qgoUes+8
   TSVdkoOMVTBVZ08rcqamAQv4usrkYRAmRSlLK4hdRFr3R8ugiL8Ksg8q/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="332734619"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="332734619"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 05:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812450013"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="812450013"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 15 Feb 2023 05:42:02 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 15 Feb 2023 15:42:02 +0200
Date:   Wed, 15 Feb 2023 15:42:02 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: fix warning when handle
 discover_identity message
Message-ID: <Y+zhKhCMeJ654XtE@kuha.fi.intel.com>
References: <20230215113136.2838773-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215113136.2838773-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Feb 15, 2023 at 07:31:36PM +0800, Xu Yang wrote:
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 7f39cb9b3429..914bbaf4e25e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1445,10 +1445,19 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
>  static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  			   const u32 *data, int cnt)
>  {
> +	u32 vdo_hdr = port->vdo_data[0];
> +
>  	WARN_ON(!mutex_is_locked(&port->lock));
>  
> -	/* Make sure we are not still processing a previous VDM packet */
> -	WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +	/* If is sending discover_identity, handle received message firstly */
> +	if (PD_VDO_SVDM(vdo_hdr) &&
> +		PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {

One line is enough.

> +		port->send_discover = true;
> +		mod_send_discover_delayed_work(port,
> +					SEND_DISCOVER_RETRY_MS);

Ditto.

> +	} else
> +		/* Make sure we are not still processing a previous VDM packet */
> +		WARN_ON(port->vdm_state > VDM_STATE_DONE);

You need braces around the else statement in this case.

>  
>  	port->vdo_count = cnt + 1;
>  	port->vdo_data[0] = header;
> @@ -1950,9 +1959,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
>  				if (res == 0)
>  					port->send_discover = false;
> -				else if (res == -EAGAIN)
> +				else if (res == -EAGAIN) {
> +					port->vdo_data[0] = 0;
>  					mod_send_discover_delayed_work(port,
>  								       SEND_DISCOVER_RETRY_MS);
> +				}
>  				break;
>  			case CMD_DISCOVER_SVID:
>  				res = tcpm_ams_start(port, DISCOVER_SVIDS);
> @@ -2035,6 +2046,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  			unsigned long timeout;
>  
>  			port->vdm_retries = 0;
> +			port->vdo_data[0] = 0;
>  			port->vdm_state = VDM_STATE_BUSY;
>  			timeout = vdm_ready_timeout(vdo_hdr);
>  			mod_vdm_delayed_work(port, timeout);

thanks,

-- 
heikki
