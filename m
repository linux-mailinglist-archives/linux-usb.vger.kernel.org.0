Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D975B39D873
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 11:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhFGJTH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 05:19:07 -0400
Received: from mga07.intel.com ([134.134.136.100]:45587 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230267AbhFGJS4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 05:18:56 -0400
IronPort-SDR: aNqx72PCpWcQeWrmf+ZElPIT4PQK2Z31Jp92Lvb570rtDvPRHt3mpZaYTL2gmLV1DTTTpJBNG7
 48w5N4XkpBRg==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="268445288"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="268445288"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 02:17:05 -0700
IronPort-SDR: sVs0lgDz6oq1ZoYc5c5ZwINsv4W2Kc+gebsEtvNQu//qPCUkyrikpEC/rjLJdcYignqvLbLQ0W
 JH4g0EzbUNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="551815317"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 07 Jun 2021 02:17:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Jun 2021 12:17:01 +0300
Date:   Mon, 7 Jun 2021 12:17:01 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: tcpm: cancel frs hrtimer when unregister
 tcpm port
Message-ID: <YL3kDTrlENicPuov@kuha.fi.intel.com>
References: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
 <1622627829-11070-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622627829-11070-2-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 02, 2021 at 05:57:08PM +0800, Li Jun wrote:
> Like the state_machine_timer, we should also cancel possible pending
> frs hrtimer when unregister tcpm port.
> 
> Fixes: 8dc4bd073663 ("usb: typec: tcpm: Add support for Sink Fast Role SWAP(FRS)")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index f47685e7923d..c7460df2119d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6328,6 +6328,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  {
>  	int i;
>  
> +	hrtimer_cancel(&port->enable_frs_timer);
>  	hrtimer_cancel(&port->vdm_state_machine_timer);
>  	hrtimer_cancel(&port->state_machine_timer);
>  
> -- 
> 2.25.1

-- 
heikki
