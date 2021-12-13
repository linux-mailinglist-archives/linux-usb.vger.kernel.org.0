Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166EF472E89
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 15:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236820AbhLMOJD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 09:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbhLMOJD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 09:09:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17494C061574
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 06:09:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC96F61044
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 14:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D124C34602;
        Mon, 13 Dec 2021 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639404542;
        bh=M1RlLx/pHd6hWFsUDvh3Zvav54Z1UhU38Sg6+7qMQ2g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jSCntoy3w2cmMAOS6iY+21Gjpbmi+MXb/PwZnwd+Sb9SInLhTkPSztVZpbEFnX+BD
         MQysDrmFzunQfHIM8d3CU2DWjloiEdy/kQX+vxrxnt4GujcJWDVIfqhnjfY4IJyJSm
         to5TrBIsWTlW8P8x+306h/FtjYRFDPxU5bmStUKc=
Date:   Mon, 13 Dec 2021 15:08:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, John Keeping <john@metanate.com>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v6] usb: f_fs: Fix use-after-free for epfile
Message-ID: <YbdT+6FkeIuHz55L@kroah.com>
References: <1638857274-24842-1-git-send-email-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638857274-24842-1-git-send-email-quic_ugoswami@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 07, 2021 at 11:37:54AM +0530, Udipto Goswami wrote:
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
> 					ffs_data_closed
> 					if (last file closed)
> 					ffs_data_reset
> 					ffs_data_clear
> 					ffs_epfiles_destroy
> spin_lock
> dereference epfiles
> 
> Fix this races by taking epfiles local copy & assigning it under
> spinlock and if epfiles(local) is null then update it in ffs->epfiles
> then finally destroy it.
> 
> Reviewed-by: John Keeping <john@metanate.com>
> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v6: Addressing minor code formatting.
> 
>  drivers/usb/gadget/function/f_fs.c | 44 +++++++++++++++++++++++++++++---------
>  1 file changed, 34 insertions(+), 10 deletions(-)

What commit does this fix?

Does this need to go to stable kernel releases?

thanks,

greg k-h


> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 3c584da..6f23a66 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1711,16 +1711,24 @@ static void ffs_data_put(struct ffs_data *ffs)
>  
>  static void ffs_data_closed(struct ffs_data *ffs)
>  {
> +	struct ffs_epfile *epfiles;
> +	unsigned long flags;
> +
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
> +			epfiles = ffs->epfiles;
> +			ffs->epfiles = NULL;
> +			spin_unlock_irqrestore(&ffs->eps_lock,
> +							flags);
> +
> +			if (epfiles)
> +				ffs_epfiles_destroy(epfiles,
> +						 ffs->eps_count);

You are accessing epfiles outside of the lock.  How is that ok?

> +
>  			if (ffs->setup_state == FFS_SETUP_PENDING)
>  				__ffs_ep0_stall(ffs);
>  		} else {
> @@ -1767,14 +1775,27 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
>  
>  static void ffs_data_clear(struct ffs_data *ffs)
>  {
> +	struct ffs_epfile *epfiles;
> +	unsigned long flags;
> +
>  	ENTER();
>  
>  	ffs_closed(ffs);
>  
>  	BUG_ON(ffs->gadget);
>  
> -	if (ffs->epfiles)
> -		ffs_epfiles_destroy(ffs->epfiles, ffs->eps_count);
> +	spin_lock_irqsave(&ffs->eps_lock, flags);
> +	epfiles = ffs->epfiles;
> +	ffs->epfiles = NULL;
> +	spin_unlock_irqrestore(&ffs->eps_lock, flags);
> +
> +	/*
> +	 * potential race possible between ffs_func_eps_disable
> +	 * & ffs_epfile_release therefore maintaining a local
> +	 * copy of epfile will save us from use-after-free.
> +	 */
> +	if (epfiles)
> +		ffs_epfiles_destroy(epfiles, ffs->eps_count);

How will it save you from a use-after-free as you never increased a
reference count on the pointer here?

And don't write code with new races.  Or are you trying to say this
fixes a race?

Just saving off a pointer feels wrong here.  What happens if the lock is
properly grabbed, then freed, right after you unlock?  You aren't really
protecting this properly in a normal way that reference counts and locks
work from what I can tell, only trying to reduce the race window but not
fixing it.

thanks,

greg k-h
