Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F29230A81
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 14:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbgG1Mnb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 08:43:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:13406 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729500AbgG1Mnb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 08:43:31 -0400
IronPort-SDR: n419UShGnhX7rMW8/zOtOJAIziu1r7H4Jnh0VhNWDaKzEegD/BQbX9EaiJ/wPhJogXU3H94T7l
 jHzI8d0Q7XFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="151185169"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="151185169"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 05:43:31 -0700
IronPort-SDR: pNduRMB7VSgbcI6t7nR59L+FhLzJJJo9SlKBBS/oel7lULZsI/ewYVcAsgpqWBLqb2gG24IESn
 mU3G2BXDsWYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="394319410"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Jul 2020 05:43:28 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jul 2020 15:43:28 +0300
Date:   Tue, 28 Jul 2020 15:43:28 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/6] usb: typec: tcpm: Move
 mod_delayed_work(&port->vdm_state_machine) call into tcpm_queue_vdm()
Message-ID: <20200728124328.GG883641@kuha.fi.intel.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724174702.61754-1-hdegoede@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 07:46:57PM +0200, Hans de Goede wrote:
> All callers of tcpm_queue_vdm() immediately follow the tcpm_queue_vdm()
> vdm call with a:
> 
> 	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
> 
> Call, fold this into tcpm_queue_vdm() itself.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index b4a66e6bf68c..fc6455a29c74 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -967,6 +967,8 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  	/* Set ready, vdm state machine will actually send */
>  	port->vdm_retries = 0;
>  	port->vdm_state = VDM_STATE_READY;
> +
> +	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
>  }
>  
>  static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
> @@ -1246,10 +1248,8 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	if (PD_VDO_SVDM(p0))
>  		rlen = tcpm_pd_svdm(port, payload, cnt, response);
>  
> -	if (rlen > 0) {
> +	if (rlen > 0)
>  		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
> -		mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
> -	}
>  }
>  
>  static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
> @@ -1264,8 +1264,6 @@ static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
>  	header = VDO(vid, ((vid & USB_SID_PD) == USB_SID_PD) ?
>  			1 : (PD_VDO_CMD(cmd) <= CMD_ATTENTION), cmd);
>  	tcpm_queue_vdm(port, header, data, count);
> -
> -	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
>  }
>  
>  static unsigned int vdm_ready_timeout(u32 vdm_hdr)
> @@ -1513,7 +1511,6 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
>  	header |= VDO_OPOS(altmode->mode);
>  
>  	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
> -	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
>  	mutex_unlock(&port->lock);
>  
>  	return 0;
> @@ -1529,7 +1526,6 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
>  	header |= VDO_OPOS(altmode->mode);
>  
>  	tcpm_queue_vdm(port, header, NULL, 0);
> -	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
>  	mutex_unlock(&port->lock);
>  
>  	return 0;
> @@ -1542,7 +1538,6 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
>  
>  	mutex_lock(&port->lock);
>  	tcpm_queue_vdm(port, header, data, count - 1);
> -	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
>  	mutex_unlock(&port->lock);
>  
>  	return 0;
> -- 
> 2.26.2

thanks,

-- 
heikki
