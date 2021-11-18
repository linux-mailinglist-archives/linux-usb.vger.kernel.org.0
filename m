Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A23455C79
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 14:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhKRNVf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 08:21:35 -0500
Received: from mga02.intel.com ([134.134.136.20]:42004 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229461AbhKRNVe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Nov 2021 08:21:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221394887"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="221394887"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 05:18:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="646560252"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 18 Nov 2021 05:18:30 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 18 Nov 2021 15:18:29 +0200
Date:   Thu, 18 Nov 2021 15:18:29 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: fix tcpm unregister port but leave a
 pending timer
Message-ID: <YZZSpffDfPd/CJDX@kuha.fi.intel.com>
References: <20211118092352.259748-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118092352.259748-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Nov 18, 2021 at 05:23:52PM +0800, Xu Yang wrote:
> @@ -6428,6 +6432,9 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  {
>  	int i;

You need to take the port lock here, no?

        mutex_lock(&port->lock);

> +	kthread_destroy_worker(port->wq);
> +	port->wq = NULL;

        mutex_unlock(&port->lock);

>  	hrtimer_cancel(&port->send_discover_timer);
>  	hrtimer_cancel(&port->enable_frs_timer);
>  	hrtimer_cancel(&port->vdm_state_machine_timer);
> @@ -6439,7 +6446,6 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  	typec_unregister_port(port->typec_port);
>  	usb_role_switch_put(port->role_sw);
>  	tcpm_debugfs_exit(port);
> -	kthread_destroy_worker(port->wq);
>  }
>  EXPORT_SYMBOL_GPL(tcpm_unregister_port);

thanks,

-- 
heikki
