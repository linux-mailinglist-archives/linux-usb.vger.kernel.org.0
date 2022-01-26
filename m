Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157E049C9E9
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 13:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241435AbiAZMlI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 07:41:08 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50118 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234178AbiAZMlH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 07:41:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 50EAD61A18
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 12:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209A5C340E3;
        Wed, 26 Jan 2022 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643200866;
        bh=3mdOCOWCBMciG+9ebxVBY1B3Rb0MUf7XOnLdZPksA2Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1tjskUOgEaRlHCKAHlDfw/HBbBIdL4B642x2tPIZA+dazT3Yvi/+T/CYAMjq20mum
         F5qjuuCU8ryPI756JEXrEtN5LQg6WAAF5dkQruD/xXWz6cclpiH4szMJv0YBmQKnn7
         lF8vR3KnZjjOLqGj6q3tRfQFpU606fqv6bIB7Qq8=
Date:   Wed, 26 Jan 2022 13:41:03 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, John Keeping <john@metanate.com>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v9] usb: f_fs: Fix use-after-free for epfile
Message-ID: <YfFBXw5FhWupqday@kroah.com>
References: <1641961956-30641-1-git-send-email-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1641961956-30641-1-git-send-email-quic_ugoswami@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 12, 2022 at 10:02:36AM +0530, Udipto Goswami wrote:
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
> Extending the scope further from the race, protecting the ep related
> structures, and concurrent accesses.
> 
> Fixes: a9e6f83c2df (usb: gadget: f_fs: stop sleeping in ffs_func_eps_disable)
> Reviewed-by: John Keeping <john@metanate.com>
> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v9: Removed unnecessary spinlock from epfiles_create.
> 
>  drivers/usb/gadget/function/f_fs.c | 57 ++++++++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 3c584da..10294ca 100644
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
>  
>  	if (ffs->ffs_eventfd)
>  		eventfd_ctx_put(ffs->ffs_eventfd);
> @@ -1790,7 +1811,6 @@ static void ffs_data_reset(struct ffs_data *ffs)
>  
>  	ffs_data_clear(ffs);
>  
> -	ffs->epfiles = NULL;
>  	ffs->raw_descs_data = NULL;
>  	ffs->raw_descs = NULL;
>  	ffs->raw_strings = NULL;
> @@ -1919,12 +1939,15 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
>  
>  static void ffs_func_eps_disable(struct ffs_function *func)
>  {
> -	struct ffs_ep *ep         = func->eps;
> -	struct ffs_epfile *epfile = func->ffs->epfiles;
> -	unsigned count            = func->ffs->eps_count;
> +	struct ffs_ep *ep;
> +	struct ffs_epfile *epfile;
> +	unsigned short count;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&func->ffs->eps_lock, flags);
> +	count = func->ffs->eps_count;
> +	epfile = func->ffs->epfiles;
> +	ep = func->eps;
>  	while (count--) {
>  		/* pending requests get nuked */
>  		if (ep->ep)
> @@ -1942,14 +1965,18 @@ static void ffs_func_eps_disable(struct ffs_function *func)
>  
>  static int ffs_func_eps_enable(struct ffs_function *func)
>  {
> -	struct ffs_data *ffs      = func->ffs;
> -	struct ffs_ep *ep         = func->eps;
> -	struct ffs_epfile *epfile = ffs->epfiles;
> -	unsigned count            = ffs->eps_count;
> +	struct ffs_data *ffs;
> +	struct ffs_ep *ep;
> +	struct ffs_epfile *epfile;
> +	unsigned short count;
>  	unsigned long flags;
>  	int ret = 0;
>  
>  	spin_lock_irqsave(&func->ffs->eps_lock, flags);
> +	ffs = func->ffs;
> +	ep = func->eps;
> +	epfile = ffs->epfiles;
> +	count = ffs->eps_count;
>  	while(count--) {
>  		ep->ep->driver_data = ep;
>  
> -- 
> 2.7.4
> 

This does not apply against 5.17-rc1.  Can you please rebase and resend?

thanks,

greg k-h
