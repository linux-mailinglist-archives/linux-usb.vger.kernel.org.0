Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4340C4374A0
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 11:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhJVJXM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 05:23:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:49678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232395AbhJVJXI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Oct 2021 05:23:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A04761108;
        Fri, 22 Oct 2021 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634894451;
        bh=CSxs94ySVHI9OOcZXbH3pN37A1ihPISLd19FXhTXqY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sMP6C+RaxhJBzusU6MO9ius4TLIpAl68zi3FJLzmoJVig6dMhnvv8gZOfsYsB/2i9
         /xU9SdIklcO27vmKvqmSCGcsd3EHxGLBjGxsRkDeYc0nxFPHi/w4e2tQYRGy/dH1uF
         xzm3PnsTswS/ImdI5DOcDzYb5T9B/F6n1Mny2MFI=
Date:   Fri, 22 Oct 2021 11:20:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <jackp@quicinc.com>
Subject: Re: [PATCH v12 4/4] usb: gadget: add configfs trace events
Message-ID: <YXKCcT3FVxRVkUZo@kroah.com>
References: <1634649997-28745-1-git-send-email-quic_linyyuan@quicinc.com>
 <1634649997-28745-5-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634649997-28745-5-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 09:26:37PM +0800, Linyu Yuan wrote:
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
> v12: allocate trace string array per gadget driver
> 
>  drivers/usb/gadget/configfs.c       |  17 ++++
>  drivers/usb/gadget/configfs_trace.h | 168 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 185 insertions(+)
>  create mode 100644 drivers/usb/gadget/configfs_trace.h
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 27aa569..6e7d1b1 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -29,6 +29,7 @@ int check_user_usb_string(const char *name,
>  
>  #define MAX_NAME_LEN	40
>  #define MAX_USB_STRING_LANGS 2
> +#define MAX_TRACE_STR_LEN	512
>  
>  static const struct usb_descriptor_header *otg_desc[2];
>  
> @@ -51,6 +52,9 @@ struct gadget_info {
>  	char qw_sign[OS_STRING_QW_SIGN_LEN];
>  	spinlock_t spinlock;
>  	bool unbind;
> +#ifdef CONFIG_TRACING
> +	char trace_string[MAX_TRACE_STR_LEN];
> +#endif
>  };
>  
>  static inline struct gadget_info *to_gadget_info(struct config_item *item)
> @@ -102,6 +106,10 @@ struct gadget_config_name {
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
> @@ -212,6 +220,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
>  
>  	mutex_lock(&gi->lock);
>  	gi->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
> +	trace_gadget_dev_desc_bcdDevice_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  }
> @@ -232,6 +241,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
>  
>  	mutex_lock(&gi->lock);
>  	gi->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
> +	trace_gadget_dev_desc_bcdUSB_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  }
> @@ -254,6 +264,7 @@ static int unregister_gadget(struct gadget_info *gi)
>  {
>  	int ret;
>  
> +	trace_unregister_gadget(gi);
>  	if (!gi->composite.gadget_driver.udc_name)
>  		return -ENODEV;
>  
> @@ -300,6 +311,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
>  			goto err;
>  		}
>  	}
> +	trace_gadget_dev_desc_UDC_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  err:
> @@ -342,6 +354,7 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
>  
>  	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
>  
> +	trace_gadget_dev_desc_max_speed_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  err:
> @@ -465,6 +478,7 @@ static int config_usb_cfg_link(
>  	list_add_tail(&f->list, &cfg->func_list);
>  	ret = 0;
>  out:
> +	trace_config_usb_cfg_link(gi);
>  	mutex_unlock(&gi->lock);
>  	return ret;
>  }
> @@ -496,6 +510,7 @@ static void config_usb_cfg_unlink(
>  		if (f->fi == fi) {
>  			list_del(&f->list);
>  			usb_put_function(f);
> +			trace_config_usb_cfg_unlink(gi);
>  			mutex_unlock(&gi->lock);
>  			return;
>  		}
> @@ -533,6 +548,7 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
>  		return -ERANGE;
>  	mutex_lock(&gi->lock);
>  	cfg->c.MaxPower = val;
> +	trace_gadget_config_desc_MaxPower_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  }
> @@ -562,6 +578,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
>  		return -EINVAL;
>  	mutex_lock(&gi->lock);
>  	cfg->c.bmAttributes = val;
> +	trace_gadget_config_desc_bmAttributes_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  }
> diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
> new file mode 100644
> index 0000000..d36c61f
> --- /dev/null
> +++ b/drivers/usb/gadget/configfs_trace.h
> @@ -0,0 +1,168 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifdef CONFIGFS_TRACE_STRING
> +#undef CONFIGFS_TRACE_STRING
> +
> +#ifdef CONFIG_TRACING
> +static __maybe_unused char *configfs_trace_string(struct gadget_info *gi)
> +{
> +	struct usb_configuration *uc;
> +	struct config_usb_cfg *cfg;
> +	struct usb_function *f;
> +	size_t len = sizeof(gi->trace_string) - 1;
> +	int n = 0;
> +
> +	if (list_empty(&gi->cdev.configs)) {
> +		strcat(gi->trace_string, "empty");
> +		return gi->trace_string;
> +	}
> +
> +	list_for_each_entry(uc, &gi->cdev.configs, list) {
> +		cfg = container_of(uc, struct config_usb_cfg, c);
> +
> +		n += scnprintf(gi->trace_string + n, len - n,
> +			"{%d %02x %d ",
> +			uc->bConfigurationValue,
> +			uc->bmAttributes,
> +			uc->MaxPower);
> +
> +		list_for_each_entry(f, &cfg->func_list, list)
> +			n += scnprintf(gi->trace_string + n,
> +				len - n, "%s,", f->name);
> +
> +		list_for_each_entry(f, &cfg->c.functions, list)
> +			n += scnprintf(gi->trace_string + n,
> +				len - n, "%s,", f->name);
> +
> +		n += scnprintf(gi->trace_string + n, len - n, "};");
> +	}
> +
> +	return gi->trace_string;

I still do not see where you are locking anything to protect the walking
of these lists.

Where is that now happening?

thanks,

greg k-h
