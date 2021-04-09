Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11833359F87
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 15:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhDINHr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 09:07:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:64376 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231370AbhDINHq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 09:07:46 -0400
IronPort-SDR: scOfa4RPMxfmJ42wwopMPkOeNKxbcvBSE0aFoSwswVDiTtSrZUIZUO06I0WJv49kHnzvGUhmtA
 q3/arGpHttZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="181290008"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="181290008"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 06:07:16 -0700
IronPort-SDR: YW2LJeVUrh/K3kk7KQkpJ6063dcZi3wtMxpXfGGs/eGRM6UbiMO673Ly0XoSTTyUZ5iMiXJnEk
 Mp8qj8Gmfk+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="520278017"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Apr 2021 06:07:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 09 Apr 2021 16:07:13 +0300
Date:   Fri, 9 Apr 2021 16:07:13 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: roles: Call try_module_get() from
 usb_role_switch_find_by_fwnode()
Message-ID: <YHBRgfysBCsRbRIr@kuha.fi.intel.com>
References: <20210409124136.65591-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409124136.65591-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 09, 2021 at 02:41:36PM +0200, Hans de Goede wrote:
> usb_role_switch_find_by_fwnode() returns a reference to the role-switch
> which must be put by calling usb_role_switch_put().
> 
> usb_role_switch_put() calls module_put(sw->dev.parent->driver->owner),
> add a matching try_module_get() to usb_role_switch_find_by_fwnode(),
> making it behave the same as the other usb_role_switch functions
> which return a reference.
> 
> This avoids a WARN_ON being hit at kernel/module.c:1158 due to the
> module-refcount going below 0.
> 
> Fixes: c6919d5e0cd1 ("usb: roles: Add usb_role_switch_find_by_fwnode()")
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Fix typo in Subject
> - Add Fixes tag
> ---
>  drivers/usb/roles/class.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 97f37077b7f9..33b637d0d8d9 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -189,6 +189,8 @@ usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
>  		return NULL;
>  
>  	dev = class_find_device_by_fwnode(role_class, fwnode);
> +	if (dev)
> +		WARN_ON(!try_module_get(dev->parent->driver->owner));
>  
>  	return dev ? to_role_switch(dev) : NULL;
>  }
> -- 
> 2.30.2

thanks,

-- 
heikki
