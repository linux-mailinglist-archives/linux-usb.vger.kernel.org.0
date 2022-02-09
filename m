Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDD24AF486
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 15:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235348AbiBIOz2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 09:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbiBIOz0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 09:55:26 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4EEFDC061355
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 06:55:28 -0800 (PST)
Received: (qmail 563376 invoked by uid 1000); 9 Feb 2022 09:55:27 -0500
Date:   Wed, 9 Feb 2022 09:55:27 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/1] USB: usbfs: Use a spinlock instead of atomic
 accesses to tally used memory.
Message-ID: <YgPV32JEqQnNlsmR@rowland.harvard.edu>
References: <20220209123303.103340-1-ingo.rohloff@lauterbach.com>
 <20220209123303.103340-2-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209123303.103340-2-ingo.rohloff@lauterbach.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 09, 2022 at 01:33:03PM +0100, Ingo Rohloff wrote:
> While the existing code code imposes a limit on the used memory, it might be
> over pessimistic (even if this is unlikely).
> 
> Example scenario:
> 8 threads running in parallel, all entering
> "usbfs_increase_memory_usage()" at the same time.
> The atomic accesses in "usbfs_increase_memory_usage()" could be
> serialized like this:
>   8 x "atomic64_add"
>   8 x "atomic64_read"
> If the 8 x "atomic64_add" raise "usbfs_memory_usage" above the limit,
> then all 8 calls of "usbfs_increase_memory_usage()" will return with
> -ENOMEM.  If you instead serialize over the whole access to
> "usbfs_memory_usage" by using a spinlock, some of these calls will
> succeed.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/devio.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index fa66e6e58792..6abb7294e919 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -139,30 +139,42 @@ MODULE_PARM_DESC(usbfs_memory_mb,
>  /* Hard limit, necessary to avoid arithmetic overflow */
>  #define USBFS_XFER_MAX         (UINT_MAX / 2 - 1000000)
>  
> -static atomic64_t usbfs_memory_usage;	/* Total memory currently allocated */
> +static DEFINE_SPINLOCK(usbfs_memory_usage_lock);
> +static u64 usbfs_memory_usage;	/* Total memory currently allocated */
>  
>  /* Check whether it's okay to allocate more memory for a transfer */
>  static int usbfs_increase_memory_usage(u64 amount)
>  {
> -	u64 lim;
> +	u64 lim, total_mem;
> +	unsigned long flags;
> +	int ret;
>  
>  	lim = READ_ONCE(usbfs_memory_mb);
>  	lim <<= 20;
>  
> -	atomic64_add(amount, &usbfs_memory_usage);
> -
> -	if (lim > 0 && atomic64_read(&usbfs_memory_usage) > lim) {
> -		atomic64_sub(amount, &usbfs_memory_usage);
> -		return -ENOMEM;
> -	}
> +	ret = 0;
> +	spin_lock_irqsave(&usbfs_memory_usage_lock, flags);
> +	total_mem = usbfs_memory_usage + amount;
> +	if (lim > 0 && total_mem > lim)
> +		ret = -ENOMEM;
> +	else
> +		usbfs_memory_usage = total_mem;
> +	spin_unlock_irqrestore(&usbfs_memory_usage_lock, flags);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /* Memory for a transfer is being deallocated */
>  static void usbfs_decrease_memory_usage(u64 amount)
>  {
> -	atomic64_sub(amount, &usbfs_memory_usage);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&usbfs_memory_usage_lock, flags);
> +	if (amount > usbfs_memory_usage)
> +		usbfs_memory_usage = 0;
> +	else
> +		usbfs_memory_usage -= amount;
> +	spin_unlock_irqrestore(&usbfs_memory_usage_lock, flags);
>  }
>  
>  static int connected(struct usb_dev_state *ps)
> -- 
> 2.17.1
> 
