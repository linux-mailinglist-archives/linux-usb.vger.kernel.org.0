Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C33432124
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 16:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232399AbhJRPBp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 11:01:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232067AbhJRPBo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Oct 2021 11:01:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B3D861074;
        Mon, 18 Oct 2021 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634569173;
        bh=1raRxo/kjh5FNJs7tdqe9zCznv33dH0689HSocfeJQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RAXb8HOX0LAbsDDsTwg/3D+6A+x/uEpmg2ji9jMW5A/fhL9CHQr0WGdCT8Rhyzont
         p14HXkKx/5jvtotCYhvxjhBk+wvN855KC529CbhW/dPklwAJ/EbVkQs5P0mLxwke/F
         WGid8OdMCYpHaymWcCHQdLz0Y62jrvxzK2iu09ko=
Date:   Mon, 18 Oct 2021 16:59:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <jackp@quicinc.com>
Subject: Re: [PATCH v10] usb: gadget: add configfs trace events
Message-ID: <YW2L0sI1UVzc60yL@kroah.com>
References: <1634534970-9198-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634534970-9198-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 18, 2021 at 01:29:30PM +0800, Linyu Yuan wrote:
> in case of USB Gadget functions configure through configfs from
> a complicated user space program, when switch function from one to another,
> if it failed, it is better to find out what action was done to configfs
> from user space program.
> 
> this change add most trace events which enable/disable a function,
> it including add/remove configuration, bind/unbind UDC,
> and write/read some attributes.
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
> 
>  drivers/usb/gadget/configfs.c       |  43 ++++++--
>  drivers/usb/gadget/configfs_trace.h | 196 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 230 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/usb/gadget/configfs_trace.h
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 477e72a..0e7feaa 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -73,6 +73,11 @@ static inline struct config_usb_cfg *to_config_usb_cfg(struct config_item *item)
>  			group);
>  }
>  
> +static inline struct gadget_info *cfg_to_gadget_info(struct config_usb_cfg *cfg)
> +{
> +	return container_of(cfg->c.cdev, struct gadget_info, cdev);
> +}
> +
>  struct gadget_strings {
>  	struct usb_gadget_strings stringtab_dev;
>  	struct usb_string strings[USB_GADGET_FIRST_AVAIL_IDX];
> @@ -97,6 +102,10 @@ struct gadget_config_name {
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
> @@ -205,6 +214,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
>  		return ret;
>  
>  	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
> +	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
>  	return len;
>  }
>  
> @@ -222,6 +232,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
>  		return ret;
>  
>  	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
> +	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
>  	return len;
>  }
>  
> @@ -234,6 +245,7 @@ static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char *page)
>  	mutex_lock(&gi->lock);
>  	udc_name = gi->composite.gadget_driver.udc_name;
>  	ret = sprintf(page, "%s\n", udc_name ?: "");
> +	trace_gadget_dev_desc_UDC_show(gi);

Why are you traceing things that you have full control over in
userspace?  You can read this data out there, why do you need to trace
this here?

>  	mutex_unlock(&gi->lock);
>  
>  	return ret;
> @@ -243,6 +255,7 @@ static int unregister_gadget(struct gadget_info *gi)
>  {
>  	int ret;
>  
> +	trace_unregister_gadget(gi);
>  	if (!gi->composite.gadget_driver.udc_name)
>  		return -ENODEV;
>  
> @@ -289,6 +302,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
>  			goto err;
>  		}
>  	}
> +	trace_gadget_dev_desc_UDC_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  err:
> @@ -302,6 +316,7 @@ static ssize_t gadget_dev_desc_max_speed_show(struct config_item *item,
>  {
>  	enum usb_device_speed speed = to_gadget_info(item)->composite.max_speed;
>  
> +	trace_gadget_dev_desc_max_speed_show(to_gadget_info(item));
>  	return sprintf(page, "%s\n", usb_speed_string(speed));

Same here, why trace a configfs show callback?  You can get this same
information just by reading the configfs file.

>  }
>  
> @@ -331,6 +346,7 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
>  
>  	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
>  
> +	trace_gadget_dev_desc_max_speed_store(gi);
>  	mutex_unlock(&gi->lock);
>  	return len;
>  err:
> @@ -413,8 +429,7 @@ static int config_usb_cfg_link(
>  	struct config_item *usb_func_ci)
>  {
>  	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
> -	struct usb_composite_dev *cdev = cfg->c.cdev;
> -	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
> +	struct gadget_info *gi = cfg_to_gadget_info(cfg);
>  
>  	struct config_group *group = to_config_group(usb_func_ci);
>  	struct usb_function_instance *fi = container_of(group,
> @@ -455,6 +470,7 @@ static int config_usb_cfg_link(
>  	list_add_tail(&f->list, &cfg->func_list);
>  	ret = 0;
>  out:
> +	trace_config_usb_cfg_link(gi);
>  	mutex_unlock(&gi->lock);
>  	return ret;
>  }
> @@ -464,8 +480,7 @@ static void config_usb_cfg_unlink(
>  	struct config_item *usb_func_ci)
>  {
>  	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
> -	struct usb_composite_dev *cdev = cfg->c.cdev;
> -	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
> +	struct gadget_info *gi = cfg_to_gadget_info(cfg);

Why not make this a 2 patch series, the first one adds the
cfg_to_gadget_info() function, and the second the traces.  That way it's
easier to review.

And why so many versions of the patch so quickly?

thanks,

greg k-h
