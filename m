Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E301015C938
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 18:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgBMRMU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 12:12:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:46519 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728220AbgBMRMU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 12:12:20 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 09:12:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,437,1574150400"; 
   d="scan'208";a="347766366"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 13 Feb 2020 09:12:17 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 13 Feb 2020 19:12:16 +0200
Date:   Thu, 13 Feb 2020 19:12:16 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     jun.li@nxp.com
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: set correct data role for non-DRD
Message-ID: <20200213171216.GO1498@kuha.fi.intel.com>
References: <1581487203-27499-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581487203-27499-1-git-send-email-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Feb 12, 2020 at 02:00:03PM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> Since the typec port data role is separated from power role,
> so check the port data capability when setting data role.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

You forgot the change log. I put a minor nitpick bellow, but feel
free to ignore it if there are no other comments.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 53 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index f3087ef..7009644 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -788,10 +788,30 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
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
> +		if (data == TYPEC_HOST) {
> +			if (role == TYPEC_SOURCE)
> +				usb_role = USB_ROLE_HOST;
> +			else
> +				usb_role = USB_ROLE_NONE;
> +		} else {
> +			return -ENOTSUPP;
> +		}
> +	} else {
> +		if (data == TYPEC_DEVICE) {
> +			if (role == TYPEC_SINK)
> +				usb_role = USB_ROLE_DEVICE;
> +			else
> +				usb_role = USB_ROLE_NONE;
> +		} else {
> +			return -ENOTSUPP;
> +		}
> +	}
>  
>  	ret = tcpm_mux_set(port, TYPEC_STATE_USB, usb_role, orientation);
>  	if (ret < 0)
> @@ -1817,7 +1837,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  		tcpm_set_state(port, SOFT_RESET, 0);
>  		break;
>  	case PD_CTRL_DR_SWAP:
> -		if (port->port_type != TYPEC_PORT_DRP) {
> +		if (port->typec_caps.data != TYPEC_PORT_DRD) {
>  			tcpm_queue_message(port, PD_MSG_CTRL_REJECT);
>  			break;
>  		}
> @@ -2609,6 +2629,9 @@ static int tcpm_src_attach(struct tcpm_port *port)
>  	enum typec_cc_polarity polarity =
>  				port->cc2 == TYPEC_CC_RD ? TYPEC_POLARITY_CC2
>  							 : TYPEC_POLARITY_CC1;
> +	enum typec_data_role data_role =
> +				port->typec_caps.data == TYPEC_PORT_UFP ?
> +				TYPEC_DEVICE : TYPEC_HOST;

To me something like this would be more readable:

	enum typec_data_role data_role = TYPEC_HOST;

        if (port->typec_caps.data == TYPEC_PORT_UFP)
                data_role = TYPEC_DEVICE;

It does not actually add any lines in this case.

>  	int ret;
>  
>  	if (port->attached)
> @@ -2618,7 +2641,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
> +	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, data_role);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -2730,6 +2753,9 @@ static void tcpm_src_detach(struct tcpm_port *port)
>  
>  static int tcpm_snk_attach(struct tcpm_port *port)
>  {
> +	enum typec_data_role data_role =
> +				port->typec_caps.data == TYPEC_PORT_DFP ?
> +				TYPEC_HOST : TYPEC_DEVICE;

ditto.

>  	int ret;
>  
>  	if (port->attached)
> @@ -2740,7 +2766,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = tcpm_set_roles(port, true, TYPEC_SINK, TYPEC_DEVICE);
> +	ret = tcpm_set_roles(port, true, TYPEC_SINK, data_role);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -2761,12 +2787,15 @@ static void tcpm_snk_detach(struct tcpm_port *port)
>  
>  static int tcpm_acc_attach(struct tcpm_port *port)
>  {
> +	enum typec_data_role data_role =
> +				port->typec_caps.data == TYPEC_PORT_UFP ?
> +				TYPEC_DEVICE : TYPEC_HOST;

Here as well.

>  	int ret;
>  
>  	if (port->attached)
>  		return 0;
>  
> -	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
> +	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, data_role);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -3293,7 +3322,8 @@ static void run_state_machine(struct tcpm_port *port)
>  		tcpm_set_vconn(port, true);
>  		tcpm_set_vbus(port, false);
>  		tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
> -			       TYPEC_HOST);
> +			       port->typec_caps.data == TYPEC_PORT_UFP ?
> +			       TYPEC_DEVICE : TYPEC_HOST);
>  		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
>  		break;
>  	case SRC_HARD_RESET_VBUS_ON:
> @@ -3308,7 +3338,8 @@ static void run_state_machine(struct tcpm_port *port)
>  		if (port->pd_capable)
>  			tcpm_set_charge(port, false);
>  		tcpm_set_roles(port, port->self_powered, TYPEC_SINK,
> -			       TYPEC_DEVICE);
> +			       port->typec_caps.data == TYPEC_PORT_DFP ?
> +			       TYPEC_HOST : TYPEC_DEVICE);
>  		/*
>  		 * VBUS may or may not toggle, depending on the adapter.
>  		 * If it doesn't toggle, transition to SNK_HARD_RESET_SINK_ON
> @@ -3969,7 +4000,7 @@ static int tcpm_dr_set(struct typec_port *p, enum typec_data_role data)
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
