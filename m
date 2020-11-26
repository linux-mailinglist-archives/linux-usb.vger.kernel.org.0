Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A632C5376
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 13:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbgKZL7H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 06:59:07 -0500
Received: from mga12.intel.com ([192.55.52.136]:44005 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730843AbgKZL7H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 06:59:07 -0500
IronPort-SDR: 0YA+krzJ2ji9OU0WxSf1yeUXXNNeEIYou+LCVXlGhUbW/2JnlwDD6kQ3DHwr1/cktmiBKeOzRO
 GK5wZWm6HyJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="151532637"
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="151532637"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 03:58:59 -0800
IronPort-SDR: WphlYTnm5Z1EcLz/ekvqQBg1XRJes0xayer7DYcacamNLq0/QKQ+MfdPvdCiNtAyf++uFOXksd
 uoTLNocBqsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="433253791"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Nov 2020 03:58:55 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 26 Nov 2020 13:58:54 +0200
Date:   Thu, 26 Nov 2020 13:58:54 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, rafael@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        lee.jones@linaro.org, mika.westerberg@linux.intel.com,
        dmitry.torokhov@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v6 4/6] usb: typec: mux: use fwnode's dev for driver
 module user count
Message-ID: <20201126115854.GK1008337@kuha.fi.intel.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
 <1606140096-1382-4-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606140096-1382-4-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 23, 2020 at 10:01:34PM +0800, Li Jun wrote:
> As the typec switch provider driver's dev may not the parent of
> typec_switch dev(may be the switch's parent's parent), but we use
> the typec switch provider driver dev's fwnode anyway, so change to
> use fwnode's dev to get driver's user count.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> New patch for v6.
> 
>  drivers/usb/typec/mux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 3da17d1..0219aa4 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -65,7 +65,7 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
>  	sw = fwnode_connection_find_match(fwnode, "typec-orientation-switch",
>  					  NULL, typec_switch_match);
>  	if (!IS_ERR_OR_NULL(sw))
> -		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> +		WARN_ON(!try_module_get(dev_fwnode(&sw->dev)->dev->driver->owner));
>  
>  	return sw;
>  }
> @@ -80,7 +80,7 @@ EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
>  void typec_switch_put(struct typec_switch *sw)
>  {
>  	if (!IS_ERR_OR_NULL(sw)) {
> -		module_put(sw->dev.parent->driver->owner);
> +		module_put(dev_fwnode(&sw->dev)->dev->driver->owner);
>  		put_device(&sw->dev);
>  	}
>  }
> -- 
> 2.7.4

thanks,

-- 
heikki
