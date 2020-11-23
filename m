Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EDF2C0EDB
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 16:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388129AbgKWPaJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 10:30:09 -0500
Received: from mga14.intel.com ([192.55.52.115]:10654 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729244AbgKWPaJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 10:30:09 -0500
IronPort-SDR: zXH04rPhVdBgnVOHmj25Cjfkjd3+izJVESYLjv93j51t9w9IbB4m1e3/2XTxuU62k9bDEgR8mF
 GKT5bJir0sLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="171001013"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="171001013"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:30:08 -0800
IronPort-SDR: HEmb1RIW2Z8vt2oQqZYuHlTAGvDorddLeYbZCovRtqA6Z2EFCjNdPtXnL+6ESNeWKSKa9rHV/2
 pjYFOwY3aIcQ==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="327230618"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:30:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1khDo0-009CDf-9Z; Mon, 23 Nov 2020 17:31:04 +0200
Date:   Mon, 23 Nov 2020 17:31:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com,
        lee.jones@linaro.org, mika.westerberg@linux.intel.com,
        dmitry.torokhov@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v6 5/6] usb: typec: mux: add typec switch via general mux
 control
Message-ID: <20201123153104.GI4077@smile.fi.intel.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
 <1606140096-1382-5-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606140096-1382-5-git-send-email-jun.li@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 23, 2020 at 10:01:35PM +0800, Li Jun wrote:
> The general mux controller can be easily extended to support
> various mux selection, this especially fits typec orientation
> switch block with a dedicated driver.

...

> @@ -42,10 +43,8 @@ static void *typec_switch_match(struct device_connection *con, int ep,
>  	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
>  		       !fwnode_property_present(con->fwnode, con->id))
>  		return NULL;
> -
>  	dev = class_find_device(&typec_mux_class, NULL, con->fwnode,
>  				switch_fwnode_match);
> -
>  	return dev ? to_typec_switch(dev) : ERR_PTR(-EPROBE_DEFER);
>  }
>  

Not related change.

...

> +	if (sw->mux_ctrl)
> +		return typec_switch_mux_ctrl(sw->mux_ctrl, orientation);

> +	else

Redundant.

> +		return sw->set(sw, orientation);

-- 
With Best Regards,
Andy Shevchenko


