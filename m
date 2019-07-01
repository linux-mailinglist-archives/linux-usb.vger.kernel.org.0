Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01EF621703
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2019 12:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbfEQKhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 May 2019 06:37:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:18157 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbfEQKhn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 May 2019 06:37:43 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 May 2019 03:37:42 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 17 May 2019 03:37:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 17 May 2019 13:37:36 +0300
Date:   Fri, 17 May 2019 13:37:36 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Li Jun <jun.li@nxp.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Biju Das <biju.das@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 4/6] usb: roles: add API to get usb_role_switch by node
Message-ID: <20190517103736.GA1490@kuha.fi.intel.com>
References: <1557823643-8616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1557823643-8616-5-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557823643-8616-5-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 14, 2019 at 04:47:21PM +0800, Chunfeng Yun wrote:
> Add fwnode_usb_role_switch_get() to make easier to get
> usb_role_switch by fwnode which register it.
> It's useful when there is not device_connection registered
> between two drivers and only knows the fwnode which register
> usb_role_switch.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Tested-by: Biju Das <biju.das@bp.renesas.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v5 changes:
>  1. remove linux/of.h suggested by Biju
>  2. add tested by Biju
> 
> Note: still depends on [1]
>  [1]: [v6,08/13] usb: roles: Introduce stubs for the exiting functions in role.h
>       https://patchwork.kernel.org/patch/10909971/
> 
> v4 changes:
>   1. use switch_fwnode_match() to find fwnode suggested by Heikki
>   2. this patch now depends on [1]
> 
>  [1] [v6,08/13] usb: roles: Introduce stubs for the exiting functions in role.h
>     https://patchwork.kernel.org/patch/10909971/
> 
> v3 changes:
>   1. use fwnodes instead of node suggested by Andy
>   2. rebuild the API suggested by Heikki
> 
> v2 no changes
> ---
>  drivers/usb/roles/class.c | 24 ++++++++++++++++++++++++
>  include/linux/usb/role.h  |  8 ++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index f45d8df5cfb8..4a1f09a41ec0 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -135,6 +135,30 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_get);
>  
> +/**
> + * fwnode_usb_role_switch_get - Find USB role switch by it's parent fwnode
> + * @fwnode: The fwnode that register USB role switch
> + *
> + * Finds and returns role switch registered by @fwnode. The reference count
> + * for the found switch is incremented.
> + */
> +struct usb_role_switch *
> +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
> +{
> +	struct usb_role_switch *sw;
> +	struct device *dev;
> +
> +	dev = class_find_device(role_class, NULL, fwnode, switch_fwnode_match);
> +	if (!dev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	sw = to_role_switch(dev);
> +	WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> +
> +	return sw;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
> +
>  /**
>   * usb_role_switch_put - Release handle to a switch
>   * @sw: USB Role Switch
> diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
> index da2b9641b877..35d460f9ec40 100644
> --- a/include/linux/usb/role.h
> +++ b/include/linux/usb/role.h
> @@ -48,6 +48,8 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
>  enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
>  struct usb_role_switch *usb_role_switch_get(struct device *dev);
>  void usb_role_switch_put(struct usb_role_switch *sw);
> +struct usb_role_switch *
> +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode);
>  
>  struct usb_role_switch *
>  usb_role_switch_register(struct device *parent,
> @@ -72,6 +74,12 @@ static inline struct usb_role_switch *usb_role_switch_get(struct device *dev)
>  
>  static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
>  
> +static inline struct usb_role_switch *
> +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
>  static inline struct usb_role_switch *
>  usb_role_switch_register(struct device *parent,
>  			 const struct usb_role_switch_desc *desc)
> -- 
> 2.21.0

thanks,

-- 
heikki
