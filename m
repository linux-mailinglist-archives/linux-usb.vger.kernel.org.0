Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABAC4230A87
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 14:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbgG1Moq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 08:44:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:4676 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729379AbgG1Moq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 08:44:46 -0400
IronPort-SDR: OIQ7ryX6Fcy1UrO8jrGibv9XvjW3UnbLzGk3OdJK3SDnGxeV8fXfSXpqw4KVdha9Yd9qOVGFXe
 OM3nq5FxBlKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="139230688"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="139230688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 05:44:45 -0700
IronPort-SDR: MEf77yHw7HfkqcXWAmXkMWxLuZ/s0Dx5Of/VuL80nIUorCT7tjs7DV77yRHVseSbimJQiWkpoM
 OjOsT9hLBHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="394319584"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Jul 2020 05:44:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jul 2020 15:44:42 +0300
Date:   Tue, 28 Jul 2020 15:44:42 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/6] usb: typec: tcpm: Add tcpm_queue_vdm_unlocked()
 helper
Message-ID: <20200728124442.GH883641@kuha.fi.intel.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724174702.61754-2-hdegoede@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 07:46:58PM +0200, Hans de Goede wrote:
> Various callers (all the typec_altmode_ops) take the port-lock just for
> the tcpm_queue_vdm() call.
> 
> Add a new tcpm_queue_vdm_unlocked() helper which takes the lock, so that
> its callers don't have to do this themselves.
> 
> This is a preparation patch for fixing an AB BA lock inversion between
> the tcpm code and some altmode drivers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Name the new helper tcpm_queue_vdm_unlocked() instead of renaming the
>   original function to this
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index fc6455a29c74..862c474b3ebd 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -961,6 +961,8 @@ static void tcpm_queue_message(struct tcpm_port *port,
>  static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  			   const u32 *data, int cnt)
>  {
> +	WARN_ON(!mutex_is_locked(&port->lock));
> +
>  	port->vdo_count = cnt + 1;
>  	port->vdo_data[0] = header;
>  	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
> @@ -971,6 +973,14 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
>  }
>  
> +static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
> +				    const u32 *data, int cnt)
> +{
> +	mutex_lock(&port->lock);
> +	tcpm_queue_vdm(port, header, data, cnt);
> +	mutex_unlock(&port->lock);
> +}
> +
>  static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
>  				  int cnt)
>  {
> @@ -1506,13 +1516,10 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  	u32 header;
>  
> -	mutex_lock(&port->lock);
>  	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
>  	header |= VDO_OPOS(altmode->mode);
>  
> -	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
> -	mutex_unlock(&port->lock);
> -
> +	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0);
>  	return 0;
>  }
>  
> @@ -1521,13 +1528,10 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  	u32 header;
>  
> -	mutex_lock(&port->lock);
>  	header = VDO(altmode->svid, 1, CMD_EXIT_MODE);
>  	header |= VDO_OPOS(altmode->mode);
>  
> -	tcpm_queue_vdm(port, header, NULL, 0);
> -	mutex_unlock(&port->lock);
> -
> +	tcpm_queue_vdm_unlocked(port, header, NULL, 0);
>  	return 0;
>  }
>  
> @@ -1536,10 +1540,7 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
>  {
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  
> -	mutex_lock(&port->lock);
> -	tcpm_queue_vdm(port, header, data, count - 1);
> -	mutex_unlock(&port->lock);
> -
> +	tcpm_queue_vdm_unlocked(port, header, data, count - 1);
>  	return 0;
>  }
>  
> -- 
> 2.26.2

thanks,

-- 
heikki
