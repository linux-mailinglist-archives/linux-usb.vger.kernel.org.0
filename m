Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5EC437496
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 11:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhJVJTO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 05:19:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:48764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232213AbhJVJTO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Oct 2021 05:19:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6BE0610CF;
        Fri, 22 Oct 2021 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634894217;
        bh=uk61e7ZeCpQbaHAX5BbCHzNag5jTC9yaanYNZ7cfHgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E+zBQl/bDwrKE1y0AheZ5CJcZyCM9VUIqqe56ubhiwe3RP0TlHSGGhgat5skbHztG
         lmEhxcJi3KLNNA9wsOVOKJka/J7zoA7VGsqBWVwDOKoUKWS7kO42x2DVO/yFf3gwSK
         k9jaKlYVbsTknDh6UHuzyvnpF8N/VOj9esWB3QGM=
Date:   Fri, 22 Oct 2021 11:16:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <jackp@quicinc.com>
Subject: Re: [PATCH v12 3/4] usb: gadget: configfs: use gi->lock to protect
 write operation
Message-ID: <YXKBhgJiBr1oLnhP@kroah.com>
References: <1634649997-28745-1-git-send-email-quic_linyyuan@quicinc.com>
 <1634649997-28745-4-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634649997-28745-4-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 09:26:36PM +0800, Linyu Yuan wrote:
> write operation from user space should be protected by
> one mutex lock gi->lock.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/gadget/configfs.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 36c611d..27aa569 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -199,6 +199,7 @@ static ssize_t is_valid_bcd(u16 bcd_val)
>  static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
>  		const char *page, size_t len)
>  {
> +	struct gadget_info *gi = to_gadget_info(item);
>  	u16 bcdDevice;
>  	int ret;
>  
> @@ -209,13 +210,16 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
>  	if (ret)
>  		return ret;
>  
> -	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
> +	mutex_lock(&gi->lock);
> +	gi->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
> +	mutex_unlock(&gi->lock);

What exactly is this lock now protecting?

How can this write cause a problem if it is read from before or after it
changes?  What problem is this lock now solving?

>  	return len;
>  }
>  
>  static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
>  		const char *page, size_t len)
>  {
> +	struct gadget_info *gi = to_gadget_info(item);
>  	u16 bcdUSB;
>  	int ret;
>  
> @@ -226,7 +230,9 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
>  	if (ret)
>  		return ret;
>  
> -	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
> +	mutex_lock(&gi->lock);
> +	gi->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
> +	mutex_unlock(&gi->lock);

Same here.

>  	return len;
>  }
>  
> @@ -517,6 +523,7 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
>  		const char *page, size_t len)
>  {
>  	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
> +	struct gadget_info *gi = cfg_to_gadget_info(cfg);
>  	u16 val;
>  	int ret;
>  	ret = kstrtou16(page, 0, &val);
> @@ -524,7 +531,9 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
>  		return ret;
>  	if (DIV_ROUND_UP(val, 8) > 0xff)
>  		return -ERANGE;
> +	mutex_lock(&gi->lock);
>  	cfg->c.MaxPower = val;
> +	mutex_unlock(&gi->lock);

Same here.

>  	return len;
>  }
>  
> @@ -540,6 +549,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
>  		const char *page, size_t len)
>  {
>  	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
> +	struct gadget_info *gi = cfg_to_gadget_info(cfg);
>  	u8 val;
>  	int ret;
>  	ret = kstrtou8(page, 0, &val);
> @@ -550,7 +560,9 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
>  	if (val & ~(USB_CONFIG_ATT_ONE | USB_CONFIG_ATT_SELFPOWER |
>  				USB_CONFIG_ATT_WAKEUP))
>  		return -EINVAL;
> +	mutex_lock(&gi->lock);
>  	cfg->c.bmAttributes = val;
> +	mutex_unlock(&gi->lock);

And here.

>  	return len;
>  }
>  
> @@ -729,7 +741,9 @@ static struct config_group *config_desc_make(
>  			&gadget_config_name_strings_type);
>  	configfs_add_default_group(&cfg->strings_group, &cfg->group);
>  
> +	mutex_lock(&gi->lock);
>  	ret = usb_add_config_only(&gi->cdev, &cfg->c);
> +	mutex_unlock(&gi->lock);

This is different, are you sure you should do this with the lock held?
This looks like an actual fix, possibly, but what is it protecting from
going wrong?

thanks,

greg k-h
