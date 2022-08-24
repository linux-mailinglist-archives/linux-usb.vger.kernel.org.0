Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8ED59FD69
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 16:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239249AbiHXOjV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Aug 2022 10:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237544AbiHXOjU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Aug 2022 10:39:20 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B108867CAF;
        Wed, 24 Aug 2022 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661351959; x=1692887959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TWDQ6olQNWq8m9QH7Ozt/+HPJ58A66QhDRIWz18XGWY=;
  b=WDj8RPUHPL+/zbK+8UuYsvpkPwjECSHFKWVhrpRhSzRQra8n81tYyTsR
   8DnTQGqOuU3kIoHoFYzoiaTnXTpGc5EnQVQEIdRIXvvNNGsxQ9RJVMk1Q
   NHCuu+veGg1DoSpLaeXpuaNXdH5cEzoZtX4Ui0AAwdMx52WksmaB7nDF7
   tkV0ZTJEFGzm3OYqdb50bw1+4uwZlIG4KlriJkcNpj71Yl9H+eNtXo0k9
   fBc7va6bPu8OhQRExaDphR5B7MBYwqZjMJgiLx8BTzMgOa1NYtEsJRqN8
   qtUc3EkTceKuvTp4htzP4Ywb2w7Jkck2mSIsW4gXn5iE1hs2yxX8nJdQ9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="294768513"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="294768513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 07:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="752107116"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Aug 2022 07:39:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 24 Aug 2022 17:39:14 +0300
Date:   Wed, 24 Aug 2022 17:39:14 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     robh+dt@kernel.org, peda@axentia.se, shawnguo@kernel.org,
        gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] usb: typec: mux: add typec orientation switch
 support via mux controller
Message-ID: <YwY4Elu/W7qlojNc@kuha.fi.intel.com>
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
 <20220823195429.1243516-4-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823195429.1243516-4-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Aug 24, 2022 at 03:54:28AM +0800, Xu Yang wrote:
> Some dedicated mux block can use existing mux controller as a mux
> provider, typec port as a consumer to select channel for orientation
> switch, this can be an alternate way to control typec orientation switch.
> Also, one mux controller could cover highspeed, superspeed and sideband
> use case one time in this implementation.
> 
> Reported-by: kernel test robot <lkp@intel.com>

Drop that Reported-by tag.

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes since v1:
> - add build dependence (select MULTIPLEXER)
> - improve Multiplexer control logic
> 
>  drivers/usb/typec/Kconfig     |  1 +
>  drivers/usb/typec/mux.c       | 76 ++++++++++++++++++++++++++++++++++-
>  include/linux/usb/typec_mux.h |  7 +---
>  3 files changed, 78 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 5defdfead653..73d4976d8148 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -2,6 +2,7 @@
>  
>  menuconfig TYPEC
>  	tristate "USB Type-C Support"
> +	select MULTIPLEXER

Whoa, do not tie TYPEC to another subsystem like that! You probable
want to make your driver depend on that instead.

>  	help
>  	  USB Type-C Specification defines a cable and connector for USB where
>  	  only one type of plug is supported on both ends, i.e. there will not
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 464330776cd6..05e6ed217620 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -13,6 +13,7 @@
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/mux/consumer.h>
>  
>  #include "class.h"
>  #include "mux.h"
> @@ -22,6 +23,11 @@
>  struct typec_switch {
>  	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS];
>  	unsigned int num_sw_devs;
> +
> +	/* Could handle HighSpeed, SuperSpeed, Sideband switch one time */
> +	struct mux_control *mux_switch;

That does not belong here...

> +	/* 3 state correspond to NONE, NORMAL, REVERSE for all switches */
> +	int mux_states[3];
>  };
>  
>  static int switch_fwnode_match(struct device *dev, const void *fwnode)
> @@ -117,6 +123,58 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
>  }
>  EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
>  
> +static struct typec_switch *mux_control_typec_switch_get(struct device *dev)
> +{
> +	struct typec_switch *sw;
> +	struct mux_control *mux;
> +	int ret;
> +
> +	if (!device_property_present(dev, "mux-controls"))
> +		return NULL;
> +
> +	sw = kzalloc(sizeof(*sw), GFP_KERNEL);
> +	if (!sw)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mux = mux_control_get(dev, NULL);
> +	if (!IS_ERR(mux)) {
> +		sw->mux_switch = mux;
> +		ret = device_property_read_u32_array(dev,
> +			"typec-switch-states", sw->mux_states, 3);
> +		if (ret) {
> +			kfree(sw);
> +			return ERR_PTR(ret);
> +		}
> +	} else {
> +		kfree(sw);
> +		return ERR_CAST(mux);
> +	}
> +
> +	return sw;
> +}

That code is broken - you return a switch that has never been
registered - but never mind that...

You need to register the switch from the place/driver that actually
handles the orientation. If you really think that you have to have a
generic multiplexer class wrapper layer for these switches, then you
need to propose a multiplexer class wrapper driver for that. Though,
I'm not sure you need that.

There is a GPIO driver proposal for these switches, so can you take a
look if that covers your case as well:
https://lore.kernel.org/linux-usb/20220810204750.3672362-3-bjorn.andersson@linaro.org/#t

In any case, you can't mix that code into the device class code itself
like you do above. That kind of coupling is always going to be fragile
(as we can see above), but more importantly, it forces the dependency
on every Type-C driver, and that is completely wrong.

So please keep the subsystems themselves independent of each other and
handle things in the device drivers.

thanks,

-- 
heikki
