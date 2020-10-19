Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A467292727
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 14:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgJSMYV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 08:24:21 -0400
Received: from mga07.intel.com ([134.134.136.100]:6495 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgJSMYU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 08:24:20 -0400
IronPort-SDR: n7qudlwflOkZsXxGqqgcDl5/IdBigM9QqTqMzJYVmqGhQ7VMxaAM01gNk49z3d16KZ7D3TqvFD
 7yIgDmkT4U8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="231206985"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="231206985"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 05:24:17 -0700
IronPort-SDR: zqFcZX/WkWZrVH1Uu8b6XaIxX3lFXCPrOKfWfberjQZgiPbHADDIh3NJ4JcASaKpuvjDz0DwaL
 O7joVYOhglwA==
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="315654594"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 05:24:14 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUUE0-00AZjb-7P; Mon, 19 Oct 2020 15:25:16 +0300
Date:   Mon, 19 Oct 2020 15:25:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com,
        lee.jones@linaro.org, mika.westerberg@linux.intel.com,
        dmitry.torokhov@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v4 2/4] device property: Add fwnode_is_compatible() and
 device_is_compatible() helpers
Message-ID: <20201019122516.GN4077@smile.fi.intel.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603098195-9923-2-git-send-email-jun.li@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 19, 2020 at 05:03:13PM +0800, Li Jun wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Since there are also some ACPI platforms where the
> "compatible" property is used, introducing a generic helper
> function fwnode_is_compatible() that can be used with
> DT, ACPI and swnodes, and a wrapper function
> device_is_compatible() with it.
> 
> The function calls of_device_is_comaptible() with OF nodes,
> and with ACPI and swnodes it matches the given string
> against the "compatible" string property array.

...

> + * Match the compatible strings of @fwnode against @compat. Returns positive
> + * value on match, and 0 when no matching compatible string is found.

Please move Returns... to a separate paragraph.

Btw, this is not true...

> +int fwnode_is_compatible(struct fwnode_handle *fwnode, const char *compat)
> +{
> +	int ret;
> +
> +	if (is_of_node(fwnode))
> +		return of_device_is_compatible(to_of_node(fwnode), compat);
> +
> +	ret = fwnode_property_match_string(fwnode, "compatible", compat);
> +

> +	return ret < 0 ? 0 : 1;

...and this is at least strange after all.

> +}

> + * Match the compatible strings of @dev against @compat. Returns positive value
> + * on match, and 0 when no matching compatible string is found.

So does this.

...

> +int fwnode_is_compatible(struct fwnode_handle *fwnode, const char *compat);
> +int device_is_compatible(struct device *dev, const char *compat);

Please, group them rather device_is_compatible() with device_* and fwnode_*
ones respectively.

-- 
With Best Regards,
Andy Shevchenko


