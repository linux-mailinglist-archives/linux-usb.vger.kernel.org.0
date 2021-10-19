Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E284332A8
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 11:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235045AbhJSJl4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 05:41:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:46194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234808AbhJSJl4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 05:41:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20D156137E;
        Tue, 19 Oct 2021 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634636383;
        bh=jkGX3Ba0dI/Q+qkOLWKijikhjoMcZNgzHpzCv8SdNw0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zCaDdf4/QaBkb2Nty9jkGINZ+kOMlWcqrj9lsZaNZ2Bo+gh5av/xXWNVOppl8y2Nm
         cVHFNIFxrjHm8ipaEGV1tOPdnwBmWE6IGN+cdXIQZYo2zgBrjsW2aBICUoi/wGbtj8
         0m5bKEYHPM9i9WkzO9wccw4Xl4lyOiAGAnW44rfU=
Date:   Tue, 19 Oct 2021 11:39:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <jackp@quicinc.com>
Subject: Re: [PATCH v11 3/3] usb: gadget: add configfs trace events
Message-ID: <YW6SXYrgTpz1OUu0@kroah.com>
References: <1634629473-15411-1-git-send-email-quic_linyyuan@quicinc.com>
 <1634629473-15411-4-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634629473-15411-4-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 03:44:32PM +0800, Linyu Yuan wrote:
> in case of USB Gadget functions configure through configfs from
> a complicated user space program, when switch function from one to another,
> if it failed, it is better to find out what action was done to configfs
> from user space program.
> 
> this change add some trace events which enable/disable a function,
> it including add/remove configuration, bind/unbind UDC,
> and some attribute files write operation.
> 
> Suggested-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: fix two issue Reported-by: kernel test robot <lkp@intel.com>
> v3: do not move private structure to configfs.h
> v4: add missing new file configfs_trace.h
> v5: lost some change of v2, add it again
> v6: fix comments from Greg Kroah-Hartman
> v7: three minor changes according to coding rules
> v8: change two trace location
> v9: fix when config is empty
> v10: fix wrong api in v9
> v11: split to 3 changes, remove read trace, change trace event print format
> 
>  drivers/usb/gadget/configfs.c       |  13 +++
>  drivers/usb/gadget/configfs_trace.h | 166 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 179 insertions(+)
>  create mode 100644 drivers/usb/gadget/configfs_trace.h
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 36c611d..9b063bb 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -102,6 +102,10 @@ struct gadget_config_name {
>  	struct list_head list;
>  };
>  
> +#define CONFIGFS_TRACE_STRING
> +#define CREATE_TRACE_POINTS
> +#include "configfs_trace.h"
> +
>  #define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
>  
>  static int usb_string_copy(const char *s, char **s_copy)
> @@ -210,6 +214,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
>  		return ret;
>  
>  	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
> +	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
>  	return len;
>  }
>  
> @@ -227,6 +232,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
>  		return ret;
>  
>  	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
> +	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
>  	return len;
>  }
>  
> @@ -248,6 +254,7 @@ static int unregister_gadget(struct gadget_info *gi)
>  {
>  	int ret;
>  
> +	trace_unregister_gadget(gi);
>  	if (!gi->composite.gadget_driver.udc_name)
>  		return -ENODEV;
>  
> @@ -294,6 +301,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
>  			goto err;
>  		}
>  	}
> +	trace_gadget_dev_desc_UDC_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  err:
> @@ -336,6 +344,7 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
>  
>  	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
>  
> +	trace_gadget_dev_desc_max_speed_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  err:
> @@ -459,6 +468,7 @@ static int config_usb_cfg_link(
>  	list_add_tail(&f->list, &cfg->func_list);
>  	ret = 0;
>  out:
> +	trace_config_usb_cfg_link(gi);
>  	mutex_unlock(&gi->lock);
>  	return ret;
>  }
> @@ -490,6 +500,7 @@ static void config_usb_cfg_unlink(
>  		if (f->fi == fi) {
>  			list_del(&f->list);
>  			usb_put_function(f);
> +			trace_config_usb_cfg_unlink(gi);
>  			mutex_unlock(&gi->lock);
>  			return;
>  		}
> @@ -525,6 +536,7 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
>  	if (DIV_ROUND_UP(val, 8) > 0xff)
>  		return -ERANGE;
>  	cfg->c.MaxPower = val;
> +	trace_gadget_config_desc_MaxPower_store(cfg_to_gadget_info(cfg));
>  	return len;
>  }
>  
> @@ -551,6 +563,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
>  				USB_CONFIG_ATT_WAKEUP))
>  		return -EINVAL;
>  	cfg->c.bmAttributes = val;
> +	trace_gadget_config_desc_bmAttributes_store(cfg_to_gadget_info(cfg));
>  	return len;
>  }
>  
> diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
> new file mode 100644
> index 0000000..74283f0
> --- /dev/null
> +++ b/drivers/usb/gadget/configfs_trace.h
> @@ -0,0 +1,166 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifdef CONFIGFS_TRACE_STRING
> +#undef CONFIGFS_TRACE_STRING
> +
> +#define MAX_CONFIGURAITON_STR_LEN	512
> +static __maybe_unused char *configfs_trace_string(struct gadget_info *gi)
> +{
> +	struct usb_configuration *uc;
> +	struct config_usb_cfg *cfg;
> +	struct usb_function *f;
> +	static char trs[MAX_CONFIGURAITON_STR_LEN];
> +	size_t len = MAX_CONFIGURAITON_STR_LEN - 1;
> +	int n = 0;
> +
> +	if (list_empty(&gi->cdev.configs)) {
> +		strcat(trs, "empty");
> +		return trs;
> +	}

What protects this list from changing why you are accessing it?  Where
is the lock here?

> +
> +	list_for_each_entry(uc, &gi->cdev.configs, list) {
> +		cfg = container_of(uc, struct config_usb_cfg, c);
> +
> +		n += scnprintf(trs + n, len - n,
> +			"{%d %02x %d ",
> +			uc->bConfigurationValue,
> +			uc->bmAttributes,
> +			uc->MaxPower);
> +
> +		list_for_each_entry(f, &cfg->func_list, list)
> +			n += scnprintf(trs + n, len - n, "%s,", f->name);
> +
> +		list_for_each_entry(f, &cfg->c.functions, list)
> +			n += scnprintf(trs + n, len - n, "%s,", f->name);

Same for all of these list entries, what happens if you are tracing and
remove a device at the same time?  Or add a device?

No locks feels very very wrong to me, I need some "proof" this is safe
to do.

thanks,

greg k-h
