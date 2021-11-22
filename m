Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777FB458F3F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Nov 2021 14:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhKVNSl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Nov 2021 08:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbhKVNSk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Nov 2021 08:18:40 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57787C061574
        for <linux-usb@vger.kernel.org>; Mon, 22 Nov 2021 05:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=vNKMKziCPCyHZvPppp5Yq9832bkjWxAQ7Kb4G20UBZU=; b=ubJcR
        TfGQ6GlIuqOrmMAjOJYl5wjWfMPOcC3eAl0rMUsa4rmnbci3eXw71g5DPBxHnQl1Lp6gCCO+WKdme
        /Dr2U+ouFPOFd4H+uD6KpnwX1Q/i61yYdxCVQ54QNceOZYEoF5m+7ULXb4eLgRTDXIqzwpLDqqKx+
        ErLp9Cye+GhhwvNe7j3J6O9v6LJx1mkc6XvLcwfKbBixPOBbxWUDSntzOYnwoNH71Sf2xU5B44LmN
        1ikhdh5XtCRGv1teBD5JSB1PpsUrmlEH4JLlU1wz3Ve5hDTZESwNRLyRpmRRw6t4LfqAlyenA8CEg
        5dXymrh+WmB9TgOBWrqKw5GR9Vssg==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mp9AN-0002yh-HT; Mon, 22 Nov 2021 13:15:27 +0000
Date:   Mon, 22 Nov 2021 13:15:24 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v2] usb: f_fs: Fix use-after-free for epfile
Message-ID: <YZuX7O0V76gCf+b/@donbot>
References: <1637316529-31605-1-git-send-email-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637316529-31605-1-git-send-email-quic_ugoswami@quicinc.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 19, 2021 at 03:38:49PM +0530, Udipto Goswami wrote:
> Consider a case where ffs_func_eps_disable is called from
> ffs_func_disable as part of composition switch and at the
> same time ffs_epfile_release get called from userspace.
> ffs_epfile_release will free up the read buffer and call
> ffs_data_closed which in turn destroys ffs->epfiles and
> mark it as NULL. While this was happening the driver has
> already initialized the local epfile in ffs_func_eps_disable
> which is now freed and waiting to acquire the spinlock. Once
> spinlock is acquired the driver proceeds with the stale value
> of epfile and tries to free the already freed read buffer
> causing use-after-free.
> 
> Following is the illustration of the race:
> 
>       CPU1                                  CPU2
> 
>    ffs_func_eps_disable
>    epfiles (local copy)
> 					ffs_epfile_release
> 				  __ffs_epfile_read_buffer_free
> 					kfree(read_buffers)
> 					kfree(epfile)
> (epfiles still accessible
>  since local copy)
> kfree(read_buffers) <use_after_free>

For added clarity here, it looks like the issue is more like:

        CPU1                            CPU2

        ffs_func_eps_disable
        epfiles (local copy)
                                        ffs_epfile_release
                                        ffs_data_closed
                                        if (last file closed)
                                            ffs_data_reset
                                            ffs_data_clear
                                            ffs_epfiles_destroy
                                            free(epfiles)
        spin_lock
        dereference epfiles

leading to a use after free, is that correct?

In this case CPU1 may be called via set_alt() from the UDC code and CPU2
is from a userspace close().

> Another possibility of user after free is with the read_buffers
> Currently, ffs_func_eps_disable & ffs_epfile_release can race,
> if ffs_epfile_release ran in between while ffs_func_eps_disable
> was executing, due to not being in any lock it can go ahead
> and free the read buffer, but since ffs_func_eps_disable
> maintains a local copy of epfiles, it will still be valid here
> which when tried to free again will cause a user_after_free.
> Following is the illustration of the case:
>       CPU1				      CPU2
> 
>    ffs_func_eps_disable
>    spin_lock_irqsave
>    (epfile) local copy
> 	   				ffs_epfile_release
> 					__ffs_epfile_read_buffer_free
> 					kfree(epfile->read_buffer)
>    __ffs_epfile_read_buffer_free
>    kfree(epfile->read_buffer)
>      <<use_after_free>>

I don't see how this race can happen.  __ffs_epfile_read_buffer_free()
does:

	struct ffs_buffer *buf = xchg(&epfile->read_buffer, READ_BUFFER_DROP);
	if (buf && buf != READ_BUFFER_DROP)
		kfree(buf);

so there's no way for both threads to call kfree() on the same buffer
here.

> Fix this races by taking epfile local copy & assigning it under
> spinlock and if epfile(local) is null then update it in ffs->epfiles
> then finally destroy it.
> 
> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v2: Fixed the tags.
> 
>  drivers/usb/gadget/function/f_fs.c | 44 +++++++++++++++++++++++++++++---------
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 3c584da..3cdc636 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1268,10 +1268,13 @@ static int
>  ffs_epfile_release(struct inode *inode, struct file *file)
>  {
>  	struct ffs_epfile *epfile = inode->i_private;
> +	unsigned long flags;
>  
>  	ENTER();
>  
> +	spin_lock_irqsave(&epfile->ffs->eps_lock, flags);
>  	__ffs_epfile_read_buffer_free(epfile);
> +	spin_unlock_irqrestore(&epfile->ffs->eps_lock, flags);

Can you explain why the comment in struct ffs_epfile is wrong about the
buffer synchronisation?  At the very least, this patch looks like it
should be updating that comment as well since the locking rules have
clearly changed.

But I'm not convinced this hunk is necessary - what is guarded here?
epfile comes from the inode, so no need for eps_lock there and
__ffs_epfile_read_buffer_free() accesses read_buffer via xchg() as
described in ffs_epfile, so again no need for the lock.

>  	ffs_data_closed(epfile->ffs);
>  
>  	return 0;
> @@ -1711,16 +1714,23 @@ static void ffs_data_put(struct ffs_data *ffs)
>  
>  static void ffs_data_closed(struct ffs_data *ffs)
>  {
> +	struct ffs_epfile *epfile;

Should this be epfiles to match the field it is saving?

> +	unsigned long flags;
>  	ENTER();
>  
>  	if (atomic_dec_and_test(&ffs->opened)) {
>  		if (ffs->no_disconnect) {
>  			ffs->state = FFS_DEACTIVATED;
> -			if (ffs->epfiles) {
> -				ffs_epfiles_destroy(ffs->epfiles,
> -						   ffs->eps_count);
> -				ffs->epfiles = NULL;
> -			}
> +			spin_lock_irqsave(&ffs->eps_lock, flags);
> +			epfile = ffs->epfiles;
> +			ffs->epfiles = NULL;
> +			spin_unlock_irqrestore(&ffs->eps_lock,
> +							flags);
> +
> +			if (epfile)
> +				ffs_epfiles_destroy(epfile,
> +						 ffs->eps_count);
> +
>  			if (ffs->setup_state == FFS_SETUP_PENDING)
>  				__ffs_ep0_stall(ffs);
>  		} else {
> @@ -1767,14 +1777,25 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
>  
>  static void ffs_data_clear(struct ffs_data *ffs)
>  {
> +	struct ffs_epfile *epfile;

Again, epfiles?

> +	unsigned long flags;
>  	ENTER();
>  
>  	ffs_closed(ffs);
>  
>  	BUG_ON(ffs->gadget);
>  
> -	if (ffs->epfiles)
> -		ffs_epfiles_destroy(ffs->epfiles, ffs->eps_count);
> +	spin_lock_irqsave(&ffs->eps_lock, flags);
> +	epfile = ffs->epfiles;
> +	ffs->epfiles = NULL;
> +	spin_unlock_irqrestore(&ffs->eps_lock, flags);
> +	/* potential race possible between ffs_func_eps_disable
> +	 * & ffs_epfile_release therefore maintaining a local
> +	 * copy of epfile will save us from use-after-free.
> +	 */
> +	if (epfile)
> +		ffs_epfiles_destroy(epfile,
> +				    ffs->eps_count);
>  
>  	if (ffs->ffs_eventfd)
>  		eventfd_ctx_put(ffs->ffs_eventfd);
> @@ -1919,12 +1940,15 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
>  
>  static void ffs_func_eps_disable(struct ffs_function *func)
>  {
> -	struct ffs_ep *ep         = func->eps;
> -	struct ffs_epfile *epfile = func->ffs->epfiles;
> -	unsigned count            = func->ffs->eps_count;
> +	struct ffs_ep *ep;
> +	struct ffs_epfile *epfile;

epfiles?

> +	unsigned short count;

Why change this to "unsigned short"?

>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&func->ffs->eps_lock, flags);
> +	count = func->ffs->eps_count;
> +	epfile = func->ffs->epfiles;
> +	ep = func->eps;
>  	while (count--) {
>  		/* pending requests get nuked */
>  		if (ep->ep)
> -- 
> 2.7.4
> 
