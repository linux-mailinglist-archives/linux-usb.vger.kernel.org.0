Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1345738AE84
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 14:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239413AbhETMkK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 08:40:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:6545 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239135AbhETMjy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 May 2021 08:39:54 -0400
IronPort-SDR: vE8WcZtrCrcTjIE5PEWjCUbLYtv7sXtQnGCDNVJyKUYDexyfdh+kDYAmff2CU1fhwgD2TcE7JF
 a2EZqdmbicfQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="201257831"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="201257831"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 05:38:27 -0700
IronPort-SDR: vODqdqNTJRCpwnFsLFb39h9FJnSH/sqSv4Tg8/+8I++DYG7SDZn2TNIjvs+e76CFl/kQs7kDPh
 DHczPk+fcEIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="543513280"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2021 05:38:22 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 20 May 2021 15:38:21 +0300
Date:   Thu, 20 May 2021 15:38:21 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org,
        gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] usb: typec: use typec cap fwnode's of_node for typec
 port
Message-ID: <YKZYPSsjSnp3tb/j@kuha.fi.intel.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621408490-23811-3-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 19, 2021 at 03:14:48PM +0800, Li Jun wrote:
> Asssign typec cap fwnode's of_node to typec port, then we can use
> typec port device to get properties from its OF.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/typec/class.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index b9429c9f65f6..a29bf2c32233 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/usb/pd_vdo.h>
> @@ -2049,6 +2050,7 @@ struct typec_port *typec_register_port(struct device *parent,
>  	port->dev.class = &typec_class;
>  	port->dev.parent = parent;
>  	port->dev.fwnode = cap->fwnode;
> +	port->dev.of_node = to_of_node(cap->fwnode);
>  	port->dev.type = &typec_port_dev_type;
>  	dev_set_name(&port->dev, "port%d", id);
>  	dev_set_drvdata(&port->dev, cap->driver_data);

No. I think this is what you want to do:

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 1fb22388e7e07..e30e8504c1d6d 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -424,7 +424,7 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
  */
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 {
-       struct device_node *np = dev->of_node;
+       struct device_node *np = to_of_node(dev_fwnode(dev));
        struct of_phandle_args args;
        struct mux_chip *mux_chip;
        unsigned int controller;

thanks,

-- 
heikki
