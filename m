Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928C146534D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 17:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238587AbhLAQvI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 11:51:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234527AbhLAQvI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 11:51:08 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201CAC061574
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=LiXLIHKyRbITW6E9DoF7cybLhWng75Y61f6LbJ2xGQk=; b=lRg62
        Q4SLQT6E86CHKkvYukfFSlTw5v26onyT4f3gDp2aKfR5UUGvj37JUOb8tBcLG0wUTg25Jl4wO6C2n
        LV9EeO+3HXjaagxMuQo+L0piOwbuH1JpiCiKuXnYPb078LtwhqXHK1LM2XXRKlrD28grgKFBtQigi
        L27Vc+xtxsTW/hSr+k8PG7576IfLCwI02lb4pM1hteX8+bRlPsLquE2uLA0e47kkNF3xoVktNY79G
        5Ytee2t1sEoa4m85Ty3jZF4MZOjal2W/XZKCl3MXwo1S3/qYQUPd4VYkzDWmYZkdtV7wnXfWLFn2X
        uDXlx2rbZzn1VTilyVDxDPgHzE8FQ==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1msSli-0000n4-2p; Wed, 01 Dec 2021 16:47:42 +0000
Date:   Wed, 1 Dec 2021 16:47:40 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v5] usb: f_fs: Fix use-after-free for epfile
Message-ID: <YaenLIsKSRzF9qew@donbot>
References: <1638186777-29540-1-git-send-email-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638186777-29540-1-git-send-email-quic_ugoswami@quicinc.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 29, 2021 at 05:22:57PM +0530, Udipto Goswami wrote:
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
> Change-Id: I84b46f6c07cbf307a2bf92c366b933dc0e83d91a
> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>

A few formatting nits below, but other than that this is:

Reviewed-by: John Keeping <john@metanate.com>

> ---
> v5: Changed the naming of epfile to singular in
> ffs_func_eps_disable
> 
>  drivers/usb/gadget/function/f_fs.c | 41 ++++++++++++++++++++++++++++----------
>  1 file changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 3c584da..f7be222 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1711,16 +1711,23 @@ static void ffs_data_put(struct ffs_data *ffs)
>  
>  static void ffs_data_closed(struct ffs_data *ffs)
>  {
> +	struct ffs_epfile *epfiles;
> +	unsigned long flags;

Blank line after variable declarations.

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
> @@ -1767,14 +1774,25 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
>  
>  static void ffs_data_clear(struct ffs_data *ffs)
>  {
> +	struct ffs_epfile *epfiles;
> +	unsigned long flags;

Again there should be a blank line here.

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
> +	/* potential race possible between ffs_func_eps_disable
> +	 * & ffs_epfile_release therefore maintaining a local
> +	 * copy of epfile will save us from use-after-free.
> +	 */

/*
 * Multi-line comment blocks have the opening "/*" and closing "*/" each
 * on their own line.  This may benefit from a blank line before the
 * comment as well.
 */

> +	if (epfiles)
> +		ffs_epfiles_destroy(epfiles,
> +				    ffs->eps_count);

This was all one line before and you've made it shorter, so it can
probably stay on one line.

>  
>  	if (ffs->ffs_eventfd)
>  		eventfd_ctx_put(ffs->ffs_eventfd);
> @@ -1919,12 +1937,15 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
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
> -- 
> 2.7.4
> 
