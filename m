Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0873847237D
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 10:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbhLMJHX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 04:07:23 -0500
Received: from mga09.intel.com ([134.134.136.24]:7099 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233404AbhLMJHX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Dec 2021 04:07:23 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238508187"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="238508187"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 01:07:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="660802229"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 13 Dec 2021 01:07:20 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 13 Dec 2021 11:07:19 +0200
Date:   Mon, 13 Dec 2021 11:07:19 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH V2] usb: typec: tcpm: fix tcpm unregister port but leave
 a pending timer
Message-ID: <YbcNR06DkP496qnt@kuha.fi.intel.com>
References: <20211209101507.499096-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209101507.499096-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 09, 2021 at 06:15:07PM +0800, Xu Yang wrote:
> In current design, when the tcpm port is unregisterd, the kthread_worker
> will be destroyed in the last step. Inside the kthread_destroy_worker(),
> the worker will flush all the works and wait for them to end. However, if
> one of the works calls hrtimer_start(), this hrtimer will be pending until
> timeout even though tcpm port is removed. Once the hrtimer timeout, many
> strange kernel dumps appear.
> 
> Thus, we can first complete kthread_destroy_worker(), then cancel all the
> hrtimers. This will guarantee that no hrtimer is pending at the end.
> 
> Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority for processing events")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Guenter should take a look at this.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in V2:
>  -Introduced a flag "port->registered" to avoid race.
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 6010b9901126..59d4fa2443f2 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -324,6 +324,7 @@ struct tcpm_port {
>  
>  	bool attached;
>  	bool connected;
> +	bool registered;
>  	bool pd_supported;
>  	enum typec_port_type port_type;
>  
> @@ -6291,7 +6292,8 @@ static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
>  {
>  	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
>  
> -	kthread_queue_work(port->wq, &port->state_machine);
> +	if (port->registered)
> +		kthread_queue_work(port->wq, &port->state_machine);
>  	return HRTIMER_NORESTART;
>  }
>  
> @@ -6299,7 +6301,8 @@ static enum hrtimer_restart vdm_state_machine_timer_handler(struct hrtimer *time
>  {
>  	struct tcpm_port *port = container_of(timer, struct tcpm_port, vdm_state_machine_timer);
>  
> -	kthread_queue_work(port->wq, &port->vdm_state_machine);
> +	if (port->registered)
> +		kthread_queue_work(port->wq, &port->vdm_state_machine);
>  	return HRTIMER_NORESTART;
>  }
>  
> @@ -6307,7 +6310,8 @@ static enum hrtimer_restart enable_frs_timer_handler(struct hrtimer *timer)
>  {
>  	struct tcpm_port *port = container_of(timer, struct tcpm_port, enable_frs_timer);
>  
> -	kthread_queue_work(port->wq, &port->enable_frs);
> +	if (port->registered)
> +		kthread_queue_work(port->wq, &port->enable_frs);
>  	return HRTIMER_NORESTART;
>  }
>  
> @@ -6315,7 +6319,8 @@ static enum hrtimer_restart send_discover_timer_handler(struct hrtimer *timer)
>  {
>  	struct tcpm_port *port = container_of(timer, struct tcpm_port, send_discover_timer);
>  
> -	kthread_queue_work(port->wq, &port->send_discover_work);
> +	if (port->registered)
> +		kthread_queue_work(port->wq, &port->send_discover_work);
>  	return HRTIMER_NORESTART;
>  }
>  
> @@ -6403,6 +6408,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  	typec_port_register_altmodes(port->typec_port,
>  				     &tcpm_altmode_ops, port,
>  				     port->port_altmode, ALTMODE_DISCOVERY_MAX);
> +	port->registered = true;
>  
>  	mutex_lock(&port->lock);
>  	tcpm_init(port);
> @@ -6424,6 +6430,9 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  {
>  	int i;
>  
> +	port->registered = false;
> +	kthread_destroy_worker(port->wq);
> +
>  	hrtimer_cancel(&port->send_discover_timer);
>  	hrtimer_cancel(&port->enable_frs_timer);
>  	hrtimer_cancel(&port->vdm_state_machine_timer);
> @@ -6435,7 +6444,6 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  	typec_unregister_port(port->typec_port);
>  	usb_role_switch_put(port->role_sw);
>  	tcpm_debugfs_exit(port);
> -	kthread_destroy_worker(port->wq);
>  }
>  EXPORT_SYMBOL_GPL(tcpm_unregister_port);
>  
> -- 
> 2.25.1

-- 
heikki
