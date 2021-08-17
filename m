Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689EF3EEA9B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 12:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235611AbhHQKI2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 06:08:28 -0400
Received: from mga12.intel.com ([192.55.52.136]:54886 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234593AbhHQKI0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Aug 2021 06:08:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="195618724"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="195618724"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 03:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="593300047"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 17 Aug 2021 03:07:51 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 17 Aug 2021 13:07:50 +0300
Date:   Tue, 17 Aug 2021 13:07:50 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH regression fix] usb: typec: tcpm: Fix VDMs sometimes not
 being forwarded to alt-mode drivers
Message-ID: <YRuKdmzggen2Vu0K@kuha.fi.intel.com>
References: <20210816154632.381968-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816154632.381968-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 16, 2021 at 05:46:32PM +0200, Hans de Goede wrote:
> Commit a20dcf53ea98 ("usb: typec: tcpm: Respond Not_Supported if no
> snk_vdo"), stops tcpm_pd_data_request() calling tcpm_handle_vdm_request()
> when port->nr_snk_vdo is not set. But the VDM might be intended for an
> altmode-driver, in which case nr_snk_vdo does not matter.
> 
> This change breaks the forwarding of connector hotplug (HPD) events
> for displayport altmode on devices which don't set nr_snk_vdo.
> 
> tcpm_pd_data_request() is the only caller of tcpm_handle_vdm_request(),
> so we can move the nr_snk_vdo check to inside it, at which point we
> have already looked up the altmode device so we can check for this too.
> 
> Doing this check here also ensures that vdm_state gets set to
> VDM_STATE_DONE if it was VDM_STATE_BUSY, even if we end up with
> responding with PD_MSG_CTRL_NOT_SUPP later.
> 
> Note that tcpm_handle_vdm_request() was already sending
> PD_MSG_CTRL_NOT_SUPP in some circumstances, after moving the nr_snk_vdo
> check the same error-path is now taken when that check fails. So that
> we have only one error-path for this and not two. Replace the
> tcpm_queue_message(PD_MSG_CTRL_NOT_SUPP) used by the existing error-path
> with the more robust tcpm_pd_handle_msg() from the (now removed) second
> error-path.
> 
> Cc: Kyle Tso <kyletso@google.com>
> Fixes: a20dcf53ea98 ("usb: typec: tcpm: Respond Not_Supported if no snk_vdo")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index b9bb63d749ec..f4079b5cb26d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1737,6 +1737,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  	return rlen;
>  }
>  
> +static void tcpm_pd_handle_msg(struct tcpm_port *port,
> +			       enum pd_msg_request message,
> +			       enum tcpm_ams ams);
> +
>  static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  				    const __le32 *payload, int cnt)
>  {
> @@ -1764,11 +1768,11 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  		port->vdm_state = VDM_STATE_DONE;
>  	}
>  
> -	if (PD_VDO_SVDM(p[0])) {
> +	if (PD_VDO_SVDM(p[0]) && (adev || tcpm_vdm_ams(port) || port->nr_snk_vdo)) {
>  		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
>  	} else {
>  		if (port->negotiated_rev >= PD_REV30)
> -			tcpm_queue_message(port, PD_MSG_CTRL_NOT_SUPP);
> +			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
>  	}
>  
>  	/*
> @@ -2471,10 +2475,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
>  					   NONE_AMS);
>  		break;
>  	case PD_DATA_VENDOR_DEF:
> -		if (tcpm_vdm_ams(port) || port->nr_snk_vdo)
> -			tcpm_handle_vdm_request(port, msg->payload, cnt);
> -		else if (port->negotiated_rev > PD_REV20)
> -			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> +		tcpm_handle_vdm_request(port, msg->payload, cnt);
>  		break;
>  	case PD_DATA_BIST:
>  		port->bist_request = le32_to_cpu(msg->payload[0]);
> -- 
> 2.31.1

-- 
heikki
