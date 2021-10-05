Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479F14224D1
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 13:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234327AbhJELSF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 07:18:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234262AbhJELSE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 07:18:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3149661264;
        Tue,  5 Oct 2021 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633432574;
        bh=vXKpNAgMH7kBMIHIHXC4RR2G6UsfK8eCxPQLhuJIghE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jCkvx6Ey3b+ZEnIdwp+GCA+IUxiUwFJlWKrR1q3XvuLulI1TZzzRTnBu86hlhejNE
         jW7BucluCcjwSeLRTm+u2940zi72DPGbKlxcdIYBpiNR0gQyj72u//iR51s5CcGAmT
         YveZ8mN8affp01boCX7mM75VOwO4+2HEJkAMViyc=
Date:   Tue, 5 Oct 2021 13:16:12 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 3/3] usb: gadget: configfs: add some trace event
Message-ID: <YVwz/EY4A/y4rY48@kroah.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-4-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630976977-13938-4-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 07, 2021 at 09:09:37AM +0800, Linyu Yuan wrote:
> add UDC, cfg link/unlink and some attributes trace
> to better trace gadget issues.

Please document this a lot better.  What do these traces do and who is
supposed to use them and what for?


> 
> Suggested-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v3: build trace inside configfs.c
> v4: no change
> v5: lost v2 fix, add it again
> 
>  drivers/usb/gadget/configfs.c       |  54 ++++++++++++
>  drivers/usb/gadget/configfs_trace.h | 167 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 221 insertions(+)
>  create mode 100644 drivers/usb/gadget/configfs_trace.h
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index cea12c3..61a8908 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -103,6 +103,42 @@ struct gadget_config_name {
>  	struct list_head list;
>  };
>  
> +#define MAX_CONFIGURAITON_STR_LEN	512
> +
> +static char *config_trace_string(struct gadget_info *gi)
> +{
> +	struct usb_configuration *uc;
> +	struct config_usb_cfg *cfg;
> +	struct config_usb_function *cf;
> +	static char trs[MAX_CONFIGURAITON_STR_LEN];

One buffer for all messages?  What locking do you have in place to
handle things when multiple CPUs call this function at the same time?

> +	size_t len = MAX_CONFIGURAITON_STR_LEN;

Should be MAX_CONFIGURAITON_STR_LEN - 1, right?

> +	int n = 0;
> +
> +	trs[0] = '\0';

Why initialize just the first character


> +
> +	list_for_each_entry(uc, &gi->cdev.configs, list) {
> +		cfg = container_of(uc, struct config_usb_cfg, c);
> +
> +		n += scnprintf(trs + n, len - n,
> +			"group:%s,bConfigurationValue:%d,bmAttributes:%d,"

No spaces in the trace message, is that normal?

> +			"MaxPower:%d,",

Please do not split strings across a line.

> +			config_item_name(&cfg->group.cg_item),
> +			uc->bConfigurationValue,
> +			uc->bmAttributes,
> +			uc->MaxPower);
> +
> +		n += scnprintf(trs + n, len - n, "function:[");
> +		list_for_each_entry(cf, &cfg->func_list, list)
> +			n += scnprintf(trs + n, len - n, "%s", cf->f->name);
> +		n += scnprintf(trs + n, len - n, "},");
> +	}
> +
> +	return trs;

Again, you return a pointer to a static structure, yet you have no locks
at all.

> +}
> +
> +#define CREATE_TRACE_POINTS
> +#include "configfs_trace.h"
> +
>  #define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
>  
>  static int usb_string_copy(const char *s, char **s_copy)
> @@ -210,6 +246,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
>  	if (ret)
>  		return ret;
>  
> +	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
>  	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
>  	return len;
>  }
> @@ -228,6 +265,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
>  		return ret;
>  
>  	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
> +	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
>  	return len;
>  }
>  
> @@ -240,6 +278,7 @@ static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char *page)
>  	mutex_lock(&gi->lock);
>  	udc_name = gi->composite.gadget_driver.udc_name;
>  	ret = sprintf(page, "%s\n", udc_name ?: "");
> +	trace_gadget_dev_desc_UDC_show(gi);
>  	mutex_unlock(&gi->lock);
>  
>  	return ret;
> @@ -249,6 +288,7 @@ static int unregister_gadget(struct gadget_info *gi)
>  {
>  	int ret;
>  
> +	trace_unregister_gadget(gi);
>  	if (!gi->composite.gadget_driver.udc_name)
>  		return -ENODEV;
>  
> @@ -276,6 +316,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
>  	if (name[len - 1] == '\n')
>  		name[len - 1] = '\0';
>  
> +	trace_gadget_dev_desc_UDC_store(gi);
> +
>  	mutex_lock(&gi->lock);
>  
>  	if (!strlen(name)) {
> @@ -296,6 +338,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
>  		}
>  	}
>  	mutex_unlock(&gi->lock);
> +
> +	trace_gadget_dev_desc_UDC_store(gi);
>  	return len;
>  err:
>  	kfree(name);
> @@ -308,6 +352,7 @@ static ssize_t gadget_dev_desc_max_speed_show(struct config_item *item,
>  {
>  	enum usb_device_speed speed = to_gadget_info(item)->composite.max_speed;
>  
> +	trace_gadget_dev_desc_max_speed_show(to_gadget_info(item));
>  	return sprintf(page, "%s\n", usb_speed_string(speed));
>  }
>  
> @@ -337,6 +382,8 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
>  
>  	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
>  
> +	trace_gadget_dev_desc_max_speed_store(gi);
> +
>  	mutex_unlock(&gi->lock);
>  	return len;
>  err:
> @@ -468,6 +515,7 @@ static int config_usb_cfg_link(
>  	list_add_tail(&cf->list, &cfg->func_list);
>  	ret = 0;
>  out:
> +	trace_config_usb_cfg_link(gi);
>  	mutex_unlock(&gi->lock);
>  	return ret;
>  }
> @@ -500,10 +548,12 @@ static void config_usb_cfg_unlink(
>  			list_del(&cf->list);
>  			usb_put_function(cf->f);
>  			kfree(cf);
> +			trace_config_usb_cfg_unlink(gi);
>  			mutex_unlock(&gi->lock);
>  			return;
>  		}
>  	}
> +	trace_config_usb_cfg_unlink(gi);
>  	mutex_unlock(&gi->lock);
>  	WARN(1, "Unable to locate function to unbind\n");
>  }
> @@ -518,6 +568,7 @@ static struct configfs_item_operations gadget_config_item_ops = {
>  static ssize_t gadget_config_desc_MaxPower_show(struct config_item *item,
>  		char *page)
>  {
> +	trace_gadget_config_desc_MaxPower_show(to_config_usb_cfg(item)->gi);
>  	return sprintf(page, "%u\n", to_config_usb_cfg(item)->c.MaxPower);
>  }
>  
> @@ -532,12 +583,14 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
>  	if (DIV_ROUND_UP(val, 8) > 0xff)
>  		return -ERANGE;
>  	to_config_usb_cfg(item)->c.MaxPower = val;
> +	trace_gadget_config_desc_MaxPower_store(to_config_usb_cfg(item)->gi);
>  	return len;
>  }
>  
>  static ssize_t gadget_config_desc_bmAttributes_show(struct config_item *item,
>  		char *page)
>  {
> +	trace_gadget_config_desc_bmAttributes_show(to_config_usb_cfg(item)->gi);
>  	return sprintf(page, "0x%02x\n",
>  		to_config_usb_cfg(item)->c.bmAttributes);
>  }
> @@ -556,6 +609,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
>  				USB_CONFIG_ATT_WAKEUP))
>  		return -EINVAL;
>  	to_config_usb_cfg(item)->c.bmAttributes = val;
> +	trace_gadget_config_desc_bmAttributes_store(to_config_usb_cfg(item)->gi);
>  	return len;
>  }
>  
> diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
> new file mode 100644
> index 0000000..59d73d5
> --- /dev/null
> +++ b/drivers/usb/gadget/configfs_trace.h
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.

Wrong copyright notice, right?  I could be wrong, but you might want to
check...


thanks,

greg k-h
