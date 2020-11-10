Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7282AD424
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 11:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbgKJKvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 05:51:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:38941 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729719AbgKJKvc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 05:51:32 -0500
IronPort-SDR: tod3+zyWZitVvXX/0+6+bd6GO+AUOKCrx6oRiJ2zOrUk9fIYHbzzw3OOE4AUkSqSqDTfcnSrHU
 A8JZETc/ZGKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="149802829"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="149802829"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 02:51:31 -0800
IronPort-SDR: JnkdpB6Jqnhym2CQHTGd9OFFhx4aKIwVbkKOf0G1HOKeC3IKgeQsVSKWMyelCIPIc3c0x6Zwlh
 5JB8zHt6MYzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="428326032"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 Nov 2020 02:51:27 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 10 Nov 2020 12:51:26 +0200
Date:   Tue, 10 Nov 2020 12:51:26 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, rafael@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        lee.jones@linaro.org, mika.westerberg@linux.intel.com,
        dmitry.torokhov@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v5 3/4] usb: typec: mux: add "compatible" property for
 switch match
Message-ID: <20201110105126.GG1224435@kuha.fi.intel.com>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
 <1604403610-16577-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604403610-16577-3-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 03, 2020 at 07:40:09PM +0800, Li Jun wrote:
> For those need a dedicated typec switch simple solution driver,
> use compatible property for matching.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> No changes for v5
> New patch for v4
> 
>  drivers/usb/typec/mux.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 52ad277..3da17d1 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -39,7 +39,8 @@ static void *typec_switch_match(struct device_connection *con, int ep,
>  {
>  	struct device *dev;
>  
> -	if (con->id && !fwnode_property_present(con->fwnode, con->id))
> +	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
> +		       !fwnode_property_present(con->fwnode, con->id))
>  		return NULL;
>  
>  	dev = class_find_device(&typec_mux_class, NULL, con->fwnode,
> @@ -61,8 +62,8 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
>  {
>  	struct typec_switch *sw;
>  
> -	sw = fwnode_connection_find_match(fwnode, "orientation-switch", NULL,
> -					  typec_switch_match);
> +	sw = fwnode_connection_find_match(fwnode, "typec-orientation-switch",
> +					  NULL, typec_switch_match);
>  	if (!IS_ERR_OR_NULL(sw))
>  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
>  
> -- 
> 2.7.4

thanks,

-- 
heikki
