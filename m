Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DE9233248
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 14:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgG3Meq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 08:34:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:45046 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbgG3Meq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jul 2020 08:34:46 -0400
IronPort-SDR: mL4D9J+6bRsdSdSGnUN+QkS6EL6EswWZMy2v2XZmr6GmthdMp2cD6EpK0C7Lsbgi8QRnS7yegk
 LgTr1tbWnW6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="236450650"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="236450650"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 05:34:34 -0700
IronPort-SDR: a+EjjITPA3CAOLnFYI2jZrH9JOxMzQaTQZavapdRJsplFGxSPIQoUNw4Z41gq1h622zDGX5mvH
 ZQ1K2//pdTPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="394968658"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 30 Jul 2020 05:34:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 30 Jul 2020 15:34:31 +0300
Date:   Thu, 30 Jul 2020 15:34:31 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4] usb: typec: tcpm: Migrate workqueue to RT priority
 for processing events
Message-ID: <20200730123431.GO883641@kuha.fi.intel.com>
References: <20200730072531.3171984-1-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730072531.3171984-1-badhri@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

One more nitpick below...

On Thu, Jul 30, 2020 at 12:25:31AM -0700, Badhri Jagan Sridharan wrote:
> @@ -4786,10 +4807,28 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
>  	return PTR_ERR_OR_ZERO(port->psy);
>  }
>  
> +static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
> +{
> +	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
> +
> +	kthread_queue_work(port->wq, &port->state_machine);
> +	return HRTIMER_NORESTART;
> +}
> +
> +static enum hrtimer_restart vdm_state_machine_timer_handler(struct hrtimer *timer)
> +{
> +	struct tcpm_port *port = container_of(timer, struct tcpm_port, vdm_state_machine_timer);
> +
> +	kthread_queue_work(port->wq, &port->vdm_state_machine);
> +	return HRTIMER_NORESTART;
> +}
> +
>  struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  {
>  	struct tcpm_port *port;
>  	int err;
> +	/* Priority just lower than default irq thread priority */
> +	struct sched_param param = {.sched_priority = (MAX_USER_RT_PRIO / 2) + 1,};

Move that outside the function and constify it:

        static const struct sched_param param {
                .shed_priority = (MAX_USER_RT_PRIO / 2) + 1,
        };

>  	if (!dev || !tcpc ||
>  	    !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||

thanks,

-- 
heikki
