Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC682ED10C
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 14:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbhAGNm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 08:42:28 -0500
Received: from mga03.intel.com ([134.134.136.65]:46501 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726854AbhAGNl5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Jan 2021 08:41:57 -0500
IronPort-SDR: OS0YQFG5p5PiTgZq3XmylXi6pPeOs1Sk1Dr2ir+6m5aRc1HkXl9tzcxM5MykumoN7DHhjNFiCl
 L1DK/ouFaglQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="177522877"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="177522877"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 05:40:11 -0800
IronPort-SDR: 6HRgmbEUNhqQNWbk9xJ3cLtw9ba9T0jNKj/hPvMy0f8lLW+9mN2K6gG0M1QAi3G3t5nJ1IHgPw
 wLINuh40YCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="463040037"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 07 Jan 2021 05:40:09 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 07 Jan 2021 15:40:08 +0200
Date:   Thu, 7 Jan 2021 15:40:08 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mayank Rana <mrana@codeaurora.org>
Subject: Re: [PATCH] usb: typec: ucsi: Add support for USB role switch
Message-ID: <20210107134008.GB940479@kuha.fi.intel.com>
References: <20201217062047.13126-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217062047.13126-1-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 16, 2020 at 10:20:47PM -0800, Jack Pham wrote:
> From: Mayank Rana <mrana@codeaurora.org>
> 
> UCSI already conveys the information about a port's connection
> status, whether it is operating in UFP or DFP mode, and whether the
> partner supports USB data or not. This information can be used to
> notify a dual-role controller to start up its host or peripheral
> mode accordingly. Add optional support for this by querying each
> port's fwnode to look for an associated USB role switch device.
> If present, call usb_role_switch_set() with the determined data
> role upon Connect Change or Connector Partner Change updates.
> 
> Signed-off-by: Mayank Rana <mrana@codeaurora.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 55 +++++++++++++++++++++++++++++++++--
>  drivers/usb/typec/ucsi/ucsi.h |  3 ++
>  2 files changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 51a570d40a42..8d3e3518a506 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -588,6 +588,7 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
>  
>  static void ucsi_partner_change(struct ucsi_connector *con)
>  {
> +	enum usb_role u_role = USB_ROLE_NONE;
>  	int ret;
>  
>  	if (!con->partner)
> @@ -595,11 +596,14 @@ static void ucsi_partner_change(struct ucsi_connector *con)
>  
>  	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
>  	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> -	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
>  	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
> +		u_role = USB_ROLE_HOST;
> +		fallthrough;
> +	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
>  		typec_set_data_role(con->port, TYPEC_HOST);
>  		break;
>  	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
> +		u_role = USB_ROLE_DEVICE;
>  		typec_set_data_role(con->port, TYPEC_DEVICE);
>  		break;
>  	default:
> @@ -610,6 +614,15 @@ static void ucsi_partner_change(struct ucsi_connector *con)
>  	if (!completion_done(&con->complete))
>  		complete(&con->complete);
>  
> +	/* Only notify USB controller if partner supports USB data */
> +	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
> +		u_role = USB_ROLE_NONE;
> +
> +	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
> +	if (ret)
> +		dev_err(con->ucsi->dev, "con:%d: failed to set usb role:%d\n",
> +			con->num, u_role);
> +
>  	/* Can't rely on Partner Flags field. Always checking the alt modes. */
>  	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
>  	if (ret)
> @@ -626,6 +639,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>  						  work);
>  	struct ucsi *ucsi = con->ucsi;
>  	enum typec_role role;
> +	enum usb_role u_role = USB_ROLE_NONE;
>  	u64 command;
>  	int ret;
>  
> @@ -661,11 +675,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>  
>  		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
>  		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> -		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
>  		case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
> +			u_role = USB_ROLE_HOST;
> +			fallthrough;
> +		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
>  			typec_set_data_role(con->port, TYPEC_HOST);
>  			break;
>  		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
> +			u_role = USB_ROLE_DEVICE;
>  			typec_set_data_role(con->port, TYPEC_DEVICE);
>  			break;
>  		default:
> @@ -678,6 +695,16 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>  			ucsi_unregister_partner(con);
>  
>  		ucsi_port_psy_changed(con);
> +
> +		/* Only notify USB controller if partner supports USB data */
> +		if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> +				UCSI_CONSTAT_PARTNER_FLAG_USB))
> +			u_role = USB_ROLE_NONE;
> +
> +		ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
> +		if (ret)
> +			dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
> +				con->num, u_role);
>  	}
>  
>  	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE) {
> @@ -903,6 +930,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	struct ucsi_connector *con = &ucsi->connector[index];
>  	struct typec_capability *cap = &con->typec_cap;
>  	enum typec_accessory *accessory = cap->accessory;
> +	enum usb_role u_role = USB_ROLE_NONE;
>  	u64 command;
>  	int ret;
>  
> @@ -981,11 +1009,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  
>  	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
>  	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> -	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
>  	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
> +		u_role = USB_ROLE_HOST;
> +		fallthrough;
> +	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
>  		typec_set_data_role(con->port, TYPEC_HOST);
>  		break;
>  	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
> +		u_role = USB_ROLE_DEVICE;
>  		typec_set_data_role(con->port, TYPEC_DEVICE);
>  		break;
>  	default:
> @@ -1001,6 +1032,24 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  		ucsi_port_psy_changed(con);
>  	}
>  
> +	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
> +	if (IS_ERR(con->usb_role_sw)) {
> +		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> +			con->num);
> +		con->usb_role_sw = NULL;
> +	}
> +
> +	/* Only notify USB controller if partner supports USB data */
> +	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
> +		u_role = USB_ROLE_NONE;
> +
> +	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
> +	if (ret) {
> +		dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
> +			con->num, u_role);
> +		ret = 0;
> +	}
> +
>  	if (con->partner) {
>  		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
>  		if (ret) {
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index b7a92f246050..8474342b79a7 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -8,6 +8,7 @@
>  #include <linux/power_supply.h>
>  #include <linux/types.h>
>  #include <linux/usb/typec.h>
> +#include <linux/usb/role.h>
>  
>  /* -------------------------------------------------------------------------- */
>  
> @@ -329,6 +330,8 @@ struct ucsi_connector {
>  	u32 rdo;
>  	u32 src_pdos[UCSI_MAX_PDOS];
>  	int num_pdos;
> +
> +	struct usb_role_switch *usb_role_sw;
>  };
>  
>  int ucsi_send_command(struct ucsi *ucsi, u64 command,
> -- 
> 2.24.0

thanks,

-- 
heikki
