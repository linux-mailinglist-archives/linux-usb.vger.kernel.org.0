Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263FB39D876
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 11:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhFGJUH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 05:20:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:36029 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230131AbhFGJUG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 05:20:06 -0400
IronPort-SDR: w21QMtvLSJuWLGD+qLFKOmFy8lHcRjXqDZ7Aq1CdKmACnqxioZLH1XC7DqncjLPTAA3Ng88u96
 6zTrhKonxKAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="204610084"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="204610084"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 02:18:15 -0700
IronPort-SDR: +MLiwQY5rG4WwdiU/0yHX233ROG2Y8CejM0liuJP+ze02L1aWM35Dtwe4/1GHf9UWc+MEQ2MHL
 Cp1obNRF+a6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="551815655"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 07 Jun 2021 02:18:13 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Jun 2021 12:18:12 +0300
Date:   Mon, 7 Jun 2021 12:18:12 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: typec: tcpm: cancel send discover hrtimer when
 unregister tcpm port
Message-ID: <YL3kVCZtfe2Khiaq@kuha.fi.intel.com>
References: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
 <1622627829-11070-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622627829-11070-3-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 02, 2021 at 05:57:09PM +0800, Li Jun wrote:
> Like the state_machine_timer, we should also cancel possible pending
> send discover identity hrtimer when unregister tcpm port.
> 
> Fixes: c34e85fa69b9 ("usb: typec: tcpm: Send DISCOVER_IDENTITY from dedicated work")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index c7460df2119d..2899c9de6d20 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6328,6 +6328,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  {
>  	int i;
>  
> +	hrtimer_cancel(&port->send_discover_timer);
>  	hrtimer_cancel(&port->enable_frs_timer);
>  	hrtimer_cancel(&port->vdm_state_machine_timer);
>  	hrtimer_cancel(&port->state_machine_timer);
> -- 
> 2.25.1

-- 
heikki
