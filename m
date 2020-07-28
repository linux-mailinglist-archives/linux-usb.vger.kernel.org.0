Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0316F230AF6
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 15:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729676AbgG1NIr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 09:08:47 -0400
Received: from mga07.intel.com ([134.134.136.100]:50501 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729044AbgG1NIq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 09:08:46 -0400
IronPort-SDR: wjmrIxg18sXOrKDO+UWFstcHy8THIbhfz2PaU0I1e/C/Lh/0ZRjXpvpr9FBxc6GJ2qIQGlhuJV
 ALsg1580Qgdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215725937"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="215725937"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 06:08:46 -0700
IronPort-SDR: F0S45vH/ogMN7VE3l4eOjxUkN5mNvDc81JISd+B3iRdSZxadln2kiazP3hwi4VCfZ7LP+Dzdnq
 i3xd38hrI+Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="394324820"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Jul 2020 06:08:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jul 2020 16:08:43 +0300
Date:   Tue, 28 Jul 2020 16:08:43 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/6] usb: typec: tcpm: Fix AB BA lock inversion
 between tcpm code and the alt-mode drivers
Message-ID: <20200728130843.GK883641@kuha.fi.intel.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724174702.61754-5-hdegoede@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 07:47:01PM +0200, Hans de Goede wrote:
> When we receive a PD data packet which ends up being for the alt-mode
> driver we have the following lock order:
> 
> 1. tcpm_pd_rx_handler take the tcpm-port lock
> 2. We call into the alt-mode driver which takes the alt-mode's lock
> 
> And when the alt-mode driver initiates communication we have the following
> lock order:
> 
> 3. alt-mode driver takes the alt-mode's lock
> 4. alt-mode driver calls tcpm_altmode_enter which takes the tcpm-port lock
> 
> This is a classic AB BA lock inversion issue.
> 
> With the refactoring of tcpm_handle_vdm_request() done before this patch,
> we don't rely on, or need to make changes to the tcpm-port data by the
> time we make call 2. from above. All data to be passed to the alt-mode
> driver sits on our stack at this point, and thus does not need locking.
> 
> So after the refactoring we can simply fix this by releasing the
> tcpm-port lock before calling into the alt-mode driver.
> 
> This fixes the following lockdep warning:
> 
> [  191.454238] ======================================================
> [  191.454240] WARNING: possible circular locking dependency detected
> [  191.454244] 5.8.0-rc5+ #1 Not tainted
> [  191.454246] ------------------------------------------------------
> [  191.454248] kworker/u8:5/794 is trying to acquire lock:
> [  191.454251] ffff9bac8e30d4a8 (&dp->lock){+.+.}-{3:3}, at: dp_altmode_vdm+0x30/0xf0 [typec_displayport]
> [  191.454263]
>                but task is already holding lock:
> [  191.454264] ffff9bac9dc240a0 (&port->lock#2){+.+.}-{3:3}, at: tcpm_pd_rx_handler+0x43/0x12c0 [tcpm]
> [  191.454273]
>                which lock already depends on the new lock.
> 
> [  191.454275]
>                the existing dependency chain (in reverse order) is:
> [  191.454277]
>                -> #1 (&port->lock#2){+.+.}-{3:3}:
> [  191.454286]        __mutex_lock+0x7b/0x820
> [  191.454290]        tcpm_altmode_enter+0x23/0x90 [tcpm]
> [  191.454293]        dp_altmode_work+0xca/0xe0 [typec_displayport]
> [  191.454299]        process_one_work+0x23f/0x570
> [  191.454302]        worker_thread+0x55/0x3c0
> [  191.454305]        kthread+0x138/0x160
> [  191.454309]        ret_from_fork+0x22/0x30
> [  191.454311]
>                -> #0 (&dp->lock){+.+.}-{3:3}:
> [  191.454317]        __lock_acquire+0x1241/0x2090
> [  191.454320]        lock_acquire+0xa4/0x3d0
> [  191.454323]        __mutex_lock+0x7b/0x820
> [  191.454326]        dp_altmode_vdm+0x30/0xf0 [typec_displayport]
> [  191.454330]        tcpm_pd_rx_handler+0x11ae/0x12c0 [tcpm]
> [  191.454333]        process_one_work+0x23f/0x570
> [  191.454336]        worker_thread+0x55/0x3c0
> [  191.454338]        kthread+0x138/0x160
> [  191.454341]        ret_from_fork+0x22/0x30
> [  191.454343]
>                other info that might help us debug this:
> 
> [  191.454345]  Possible unsafe locking scenario:
> 
> [  191.454347]        CPU0                    CPU1
> [  191.454348]        ----                    ----
> [  191.454350]   lock(&port->lock#2);
> [  191.454353]                                lock(&dp->lock);
> [  191.454355]                                lock(&port->lock#2);
> [  191.454357]   lock(&dp->lock);
> [  191.454360]
>                 *** DEADLOCK ***
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> -Move the mutex_lock call to above the tcpm_queue_vdm() call, so that
>  we can use the regular tcpm_queue_vdm() instead of having to call
>  tcpm_queue_vdm_unlocked()
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 03a0c083ee9a..9b26b57a0172 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1249,6 +1249,27 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	if (PD_VDO_SVDM(p[0]))
>  		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
>  
> +	/*
> +	 * We are done with any state stored in the port struct now, except
> +	 * for any port struct changes done by the tcpm_queue_vdm() call
> +	 * below, which is a separate operation.
> +	 *
> +	 * So we can safely release the lock here; and we MUST release the
> +	 * lock here to avoid an AB BA lock inversion:
> +	 *
> +	 * If we keep the lock here then the lock ordering in this path is:
> +	 * 1. tcpm_pd_rx_handler take the tcpm port lock
> +	 * 2. One of the typec_altmode_* calls below takes the alt-mode's lock
> +	 *
> +	 * And we also have this ordering:
> +	 * 1. alt-mode driver takes the alt-mode's lock
> +	 * 2. alt-mode driver calls tcpm_altmode_enter which takes the
> +	 *    tcpm port lock
> +	 *
> +	 * Dropping our lock here avoids this.
> +	 */
> +	mutex_unlock(&port->lock);
> +
>  	if (adev) {
>  		switch (adev_action) {
>  		case ADEV_NONE:
> @@ -1273,6 +1294,15 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  		}
>  	}
>  
> +	/*
> +	 * We must re-take the lock here to balance the unlock in
> +	 * tcpm_pd_rx_handler, note that no changes, other then the
> +	 * tcpm_queue_vdm call, are made while the lock is held again.
> +	 * All that is done after the call is unwinding the call stack until
> +	 * we return to tcpm_pd_rx_handler and do the unlock there.
> +	 */
> +	mutex_lock(&port->lock);
> +
>  	if (rlen > 0)
>  		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
>  }
> -- 
> 2.26.2

thanks,

-- 
heikki
