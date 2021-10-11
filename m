Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221874286D8
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 08:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbhJKGde (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 02:33:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:9792 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231425AbhJKGda (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 02:33:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="213954073"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="213954073"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2021 23:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="625375176"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 Oct 2021 23:31:26 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 11 Oct 2021 09:31:25 +0300
Date:   Mon, 11 Oct 2021 09:31:25 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>, linux@roeck-us.net
Cc:     jun.li@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpm: fix issue of multiple tcpm_set_state
Message-ID: <YWPaPfzlnWdEsk21@kuha.fi.intel.com>
References: <20210827114809.1577720-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827114809.1577720-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Guenter, can you check this?

On Fri, Aug 27, 2021 at 07:48:09PM +0800, Xu Yang wrote:
> There are potential problems when states are set as following:
> 
>     tcpm_set_state(A, 0)
>     tcpm_set_state(B, X)
> 
> As long as the state A is set and the state_machine work is queued
> successfully, state_machine work will be scheduled soon after. Before
> running into tcpm_state_machine_work(), there is a chance to set state
> B again. If it does occur:
> 
> either (X = 0)
>     port->state = B and state_machine work is queued again, then work
>     will be executed twice.
> or (X != 0)
>     port->state = A and port->delayed_state = B, then work will be
>     executed once but timer is still running.
> 
> For this situation, tcpm should only handle the most recent state change
> as if only one state is set just now. Therefore, if the state_machine work
> has already been queued, it can't be queued again before running into
> tcpm_state_machine_work().
> 
> The state_machine_running flag already prevents from queuing the work, so
> we can make it contain the pending stage (after work be queued and before
> running into tcpm_state_machine_work). The state_machine_pending_or_running
> flag can be used to indicate that a state can be handled without queuing
> the work again.
> 
> Because the state_machine work has been queued for state A, there is no
> way to cancel as it may be already dequeued later, and then will run into
> tcpm_state_machine_work() certainly. To handle the delayed state B, such
> an abnormal work should be skiped. If port->delayed_state != INVALID_STATE
> and timer is still running, it's time to skip.
> 
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

What changed since v1?

thanks,

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 049f4c61ee82..a913bc620e88 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -371,7 +371,7 @@ struct tcpm_port {
>  	struct kthread_work enable_frs;
>  	struct hrtimer send_discover_timer;
>  	struct kthread_work send_discover_work;
> -	bool state_machine_running;
> +	bool state_machine_pending_or_running;
>  	bool vdm_sm_running;
>  
>  	struct completion tx_complete;
> @@ -1192,6 +1192,7 @@ static void mod_tcpm_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
>  	} else {
>  		hrtimer_cancel(&port->state_machine_timer);
>  		kthread_queue_work(port->wq, &port->state_machine);
> +		port->state_machine_pending_or_running = true;
>  	}
>  }
>  
> @@ -1250,7 +1251,7 @@ static void tcpm_set_state(struct tcpm_port *port, enum tcpm_state state,
>  		 * tcpm_state_machine_work() will continue running the state
>  		 * machine.
>  		 */
> -		if (!port->state_machine_running)
> +		if (!port->state_machine_pending_or_running)
>  			mod_tcpm_delayed_work(port, 0);
>  	}
>  }
> @@ -4810,13 +4811,15 @@ static void tcpm_state_machine_work(struct kthread_work *work)
>  	enum tcpm_state prev_state;
>  
>  	mutex_lock(&port->lock);
> -	port->state_machine_running = true;
>  
>  	if (port->queued_message && tcpm_send_queued_message(port))
>  		goto done;
>  
>  	/* If we were queued due to a delayed state change, update it now */
>  	if (port->delayed_state) {
> +		if (ktime_before(ktime_get(), port->delayed_runtime))
> +			goto done;
> +
>  		tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
>  			 tcpm_states[port->state],
>  			 tcpm_states[port->delayed_state], port->delay_ms);
> @@ -4837,7 +4840,7 @@ static void tcpm_state_machine_work(struct kthread_work *work)
>  	} while (port->state != prev_state && !port->delayed_state);
>  
>  done:
> -	port->state_machine_running = false;
> +	port->state_machine_pending_or_running = false;
>  	mutex_unlock(&port->lock);
>  }
>  
> @@ -6300,6 +6303,7 @@ static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
>  	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
>  
>  	kthread_queue_work(port->wq, &port->state_machine);
> +	port->state_machine_pending_or_running = true;
>  	return HRTIMER_NORESTART;
>  }
>  
> -- 
> 2.25.1

-- 
heikki
