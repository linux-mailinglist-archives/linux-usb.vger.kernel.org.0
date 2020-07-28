Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FE9230B01
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 15:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbgG1NKR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 09:10:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:52623 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729421AbgG1NKR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 09:10:17 -0400
IronPort-SDR: 1fhjo2KBdNrScvoncbqZka3LL+165Sa7yH9K+3/KPgH/jSEWyq4dCOk7SJt0UiQcdTI49ccOwv
 PwG0V4ZMXuRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="150374365"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="150374365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 06:10:17 -0700
IronPort-SDR: 2eRHB5cFuuAodzPCmW+DTQ0IMPpAS9+hkBZXDHY8CpJlPahKorm7xNhqWxPxVXPNs5WFnoHazz
 8Sb7zKmyqEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="394325273"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Jul 2020 06:10:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jul 2020 16:10:14 +0300
Date:   Tue, 28 Jul 2020 16:10:14 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 6/6] usb: typec: tcpm: Add WARN_ON ensure we are not
 trying to send 2 VDM packets at the same time
Message-ID: <20200728131014.GL883641@kuha.fi.intel.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724174702.61754-6-hdegoede@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 07:47:02PM +0200, Hans de Goede wrote:
> The tcpm.c code for sending VDMs assumes that there will only be one VDM
> in flight at the time. The "queue" used by tcpm_queue_vdm is only 1 entry
> deep.
> 
> This assumes that the higher layers (tcpm state-machine and alt-mode
> drivers) ensure that queuing a new VDM before the old one has been
> completely send (or it timed out) add a WARN_ON to check for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Fix typo in commit-msg subject
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 9b26b57a0172..cc786d558f14 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -971,6 +971,9 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  {
>  	WARN_ON(!mutex_is_locked(&port->lock));
>  
> +	/* Make sure we are not still processing a previous VDM packet */
> +	WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +
>  	port->vdo_count = cnt + 1;
>  	port->vdo_data[0] = header;
>  	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
> -- 
> 2.26.2

thanks,

-- 
heikki
