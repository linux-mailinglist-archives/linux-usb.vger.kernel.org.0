Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F394135883
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 12:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgAILw2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 06:52:28 -0500
Received: from mga17.intel.com ([192.55.52.151]:30375 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728614AbgAILw1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jan 2020 06:52:27 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 03:52:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; 
   d="scan'208";a="227238577"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 09 Jan 2020 03:52:25 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 09 Jan 2020 13:52:24 +0200
Date:   Thu, 9 Jan 2020 13:52:24 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jun Li <jun.li@nxp.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
Message-ID: <20200109115224.GC29437@kuha.fi.intel.com>
References: <1577442957-6921-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577442957-6921-1-git-send-email-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jun,

Where's the 1/2 of this series?

On Fri, Dec 27, 2019 at 10:39:17AM +0000, Jun Li wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> Since the typec port data role is separated from power role,
> so check the port data capability when setting data role.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 56fc356..1f0d82e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -780,7 +780,7 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
>  			  enum typec_role role, enum typec_data_role data)
>  {
>  	enum typec_orientation orientation;
> -	enum usb_role usb_role;
> +	enum usb_role usb_role = USB_ROLE_NONE;
>  	int ret;
>  
>  	if (port->polarity == TYPEC_POLARITY_CC1)
> @@ -788,10 +788,20 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
>  	else
>  		orientation = TYPEC_ORIENTATION_REVERSE;
>  
> -	if (data == TYPEC_HOST)
> -		usb_role = USB_ROLE_HOST;
> -	else
> -		usb_role = USB_ROLE_DEVICE;
> +	if (port->typec_caps.data == TYPEC_PORT_DRD) {
> +		if (data == TYPEC_HOST)
> +			usb_role = USB_ROLE_HOST;
> +		else
> +			usb_role = USB_ROLE_DEVICE;
> +	} else if (port->typec_caps.data == TYPEC_PORT_DFP) {
> +		if (data == TYPEC_HOST)
> +			usb_role = USB_ROLE_HOST;
> +		data = TYPEC_HOST;

So if data != host, tcpc is told that data == host, but the mux is set
to USB_ROLE_NONE. So why tcpc needs to think the role is host in that
case?

Shouldn't this function actually return error if the port is DFP only,
and TYPEC_DEVICE is requested?

> +	} else {
> +		if (data == TYPEC_DEVICE)
> +			usb_role = USB_ROLE_DEVICE;
> +		data = TYPEC_DEVICE;
> +	}
>  
>  	ret = tcpm_mux_set(port, TYPEC_STATE_USB, usb_role, orientation);
>  	if (ret < 0)
> @@ -1817,7 +1827,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  		tcpm_set_state(port, SOFT_RESET, 0);
>  		break;
>  	case PD_CTRL_DR_SWAP:
> -		if (port->port_type != TYPEC_PORT_DRP) {
> +		if (port->typec_caps.data != TYPEC_PORT_DRD) {
>  			tcpm_queue_message(port, PD_MSG_CTRL_REJECT);
>  			break;
>  		}
> @@ -3969,7 +3979,7 @@ static int tcpm_dr_set(struct typec_port *p, enum typec_data_role data)
>  	mutex_lock(&port->swap_lock);
>  	mutex_lock(&port->lock);
>  
> -	if (port->port_type != TYPEC_PORT_DRP) {
> +	if (port->typec_caps.data != TYPEC_PORT_DRD) {
>  		ret = -EINVAL;
>  		goto port_unlock;
>  	}
> -- 
> 2.7.4

thanks,

-- 
heikki
