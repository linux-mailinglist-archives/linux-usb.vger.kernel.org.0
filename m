Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D0138AE57
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 14:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236690AbhETMfM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 08:35:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:40582 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236467AbhETMe6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 May 2021 08:34:58 -0400
IronPort-SDR: xNyF7BnA0sfzqeRborUJpS50Ukj3lR6AilMBTTQU+wzwC1b65BFmBDmXV7iCtdJJeuQX4PTj+Z
 zHDFLjGZWq5w==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="200915678"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="200915678"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 05:33:36 -0700
IronPort-SDR: YPSVAAhCNqWnrl03Khe1at6noFmJbazD2tO2C08UqTvwyl8miudcz6Eae7wNh9YY+h1msFXqt3
 MeBj/VRPwjPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="543512173"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2021 05:33:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 20 May 2021 15:33:32 +0300
Date:   Thu, 20 May 2021 15:33:32 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org,
        gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Message-ID: <YKZXHG7BSSZssiBg@kuha.fi.intel.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-4-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621408490-23811-4-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 19, 2021 at 03:14:49PM +0800, Li Jun wrote:
> Some dedicated mux block can use existing mux controller as a
> mux provider, typec port as a consumer to select channel for
> orientation switch, this can be an alternate way to current
> typec_switch interface.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/typec/class.c     | 26 +++++++++++++++++++++++++-
>  drivers/usb/typec/class.h     |  2 ++
>  drivers/usb/typec/mux.c       | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec_mux.h |  4 ++++
>  4 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index a29bf2c32233..1bb0275e6204 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1601,6 +1601,7 @@ static void typec_release(struct device *dev)
>  	ida_simple_remove(&typec_index_ida, port->id);
>  	ida_destroy(&port->mode_ids);
>  	typec_switch_put(port->sw);
> +	typec_mux_control_switch_put(port->mux_control_switch);
>  	typec_mux_put(port->mux);
>  	kfree(port->cap);
>  	kfree(port);
> @@ -1816,6 +1817,13 @@ int typec_set_orientation(struct typec_port *port,
>  	if (ret)
>  		return ret;
>  
> +	if (!port->sw) {
> +		ret = typec_mux_control_switch_set(port->mux_control_switch,
> +				port->mux_control_switch_states[orientation]);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	port->orientation = orientation;
>  	sysfs_notify(&port->dev.kobj, NULL, "orientation");
>  	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE);
> @@ -1991,7 +1999,7 @@ struct typec_port *typec_register_port(struct device *parent,
>  				       const struct typec_capability *cap)
>  {
>  	struct typec_port *port;
> -	int ret;
> +	int ret = 0;
>  	int id;
>  
>  	port = kzalloc(sizeof(*port), GFP_KERNEL);
> @@ -2068,6 +2076,22 @@ struct typec_port *typec_register_port(struct device *parent,
>  		return ERR_PTR(ret);
>  	}
>  
> +	if (!port->sw) {
> +		/* Try to get typec switch via general mux controller */
> +		port->mux_control_switch = typec_mux_control_switch_get(&port->dev);
> +		if (IS_ERR(port->mux_control_switch))
> +			ret = PTR_ERR(port->mux_control_switch);
> +		else if (port->mux_control_switch)
> +			ret = device_property_read_u32_array(&port->dev,
> +					"mux-control-switch-states",
> +					port->mux_control_switch_states,
> +					3);
> +		if (ret) {
> +			put_device(&port->dev);
> +			return ERR_PTR(ret);
> +		}
> +	}

Why not just do that inside fwnode_typec_switch_get() and handle the
whole thing in drivers/usb/typec/mux.c (or in its own file if you
prefer)?

You'll just need to register a "wrapper" Type-C switch object for the
OF mux controller, but that should not be a problem. That way you
don't need to export any new functions, touch this file or anything
else.


thanks,

-- 
heikki
