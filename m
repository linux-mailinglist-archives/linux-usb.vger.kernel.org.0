Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8133448752D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 11:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346600AbiAGKEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 05:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346595AbiAGKEh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jan 2022 05:04:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D70C061245
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 02:04:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3373361EE7
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 10:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177DBC36AE0;
        Fri,  7 Jan 2022 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641549875;
        bh=YHZxGaOuK6CLiJfEK3ytcySD08doTB2sKqj+2fLb8ZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hLXLlwIaesbSjK58eczLK22SDlollE3hPM4vl4QV3+Vc32D/ecVINxeEPauIdRDCc
         zCjI+tSuDSbKYI1UmcANkfBtiFgW30QhQgjt/nu+eL74skC8M15xl9sM26gPJgi64Y
         WfWCYfg2AJMYjBruXSRxHM0Apzsx0ldemTNQCF2M=
Date:   Fri, 7 Jan 2022 11:04:33 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, John Keeping <john@metanate.com>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v8] usb: f_fs: Fix use-after-free for epfile
Message-ID: <YdgQMaQtku6jkcHh@kroah.com>
References: <1641391526-8737-1-git-send-email-quic_ugoswami@quicinc.com>
 <Ydb9povYs6YDSIpW@kroah.com>
 <a2ca96f8-ba41-e861-51f2-3aa051de04b5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2ca96f8-ba41-e861-51f2-3aa051de04b5@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 07, 2022 at 01:52:05PM +0530, Udipto Goswami wrote:
> Hi Greg,
> 
> On 06-01-2022 08:03 pm, Greg Kroah-Hartman wrote:
> > On Wed, Jan 05, 2022 at 07:35:26PM +0530, Udipto Goswami wrote:
> > > Consider a case where ffs_func_eps_disable is called from
> > > ffs_func_disable as part of composition switch and at the
> > > same time ffs_epfile_release get called from userspace.
> > > ffs_epfile_release will free up the read buffer and call
> > > ffs_data_closed which in turn destroys ffs->epfiles and
> > > mark it as NULL. While this was happening the driver has
> > > already initialized the local epfile in ffs_func_eps_disable
> > > which is now freed and waiting to acquire the spinlock. Once
> > > spinlock is acquired the driver proceeds with the stale value
> > > of epfile and tries to free the already freed read buffer
> > > causing use-after-free.
> > > 
> > > Following is the illustration of the race:
> > > 
> > >        CPU1                                  CPU2
> > > 
> > >     ffs_func_eps_disable
> > >     epfiles (local copy)
> > > 					ffs_epfile_release
> > > 					ffs_data_closed
> > > 					if (last file closed)
> > > 					ffs_data_reset
> > > 					ffs_data_clear
> > > 					ffs_epfiles_destroy
> > > spin_lock
> > > dereference epfiles
> > > 
> > > Fix this races by taking epfiles local copy & assigning it under
> > > spinlock and if epfiles(local) is null then update it in ffs->epfiles
> > > then finally destroy it.
> > > Extending the scope further from the race, protecting the ep related
> > > structures, and concurrent accesses.
> > > 
> > > Fixes: a9e6f83c2df (usb: gadget: f_fs: stop sleeping in
> > > ffs_func_eps_disable)
> > No need to line-wrap this line, the scripts will complain about it :(
> checkpatch didn't give any error for this though.

It's not a checkpatch error, it will show up in the scripts we run on
commits in our trees.  linux-next will report a problem with this, and
so I have the same scripts as well.  They were posted to the
users@kernel.org mailing list a year or so ago if you are curious.  It's
not a big deal.

> > > Reviewed-by: John Keeping <john@metanate.com>
> > > Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
> > > Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > ---
> > > v8: Fixed compilation errors from previous version.
> > > 
> > >   drivers/usb/gadget/function/f_fs.c | 60 ++++++++++++++++++++++++++++----------
> > >   1 file changed, 45 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index 3c584da..541a4af 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -1711,16 +1711,24 @@ static void ffs_data_put(struct ffs_data *ffs)
> > >   static void ffs_data_closed(struct ffs_data *ffs)
> > >   {
> > > +	struct ffs_epfile *epfiles;
> > > +	unsigned long flags;
> > > +
> > >   	ENTER();
> > >   	if (atomic_dec_and_test(&ffs->opened)) {
> > >   		if (ffs->no_disconnect) {
> > >   			ffs->state = FFS_DEACTIVATED;
> > > -			if (ffs->epfiles) {
> > > -				ffs_epfiles_destroy(ffs->epfiles,
> > > -						   ffs->eps_count);
> > > -				ffs->epfiles = NULL;
> > > -			}
> > > +			spin_lock_irqsave(&ffs->eps_lock, flags);
> > > +			epfiles = ffs->epfiles;
> > > +			ffs->epfiles = NULL;
> > > +			spin_unlock_irqrestore(&ffs->eps_lock,
> > > +							flags);
> > > +
> > > +			if (epfiles)
> > > +				ffs_epfiles_destroy(epfiles,
> > > +						 ffs->eps_count);
> > > +
> > >   			if (ffs->setup_state == FFS_SETUP_PENDING)
> > >   				__ffs_ep0_stall(ffs);
> > >   		} else {
> > > @@ -1767,14 +1775,27 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
> > >   static void ffs_data_clear(struct ffs_data *ffs)
> > >   {
> > > +	struct ffs_epfile *epfiles;
> > > +	unsigned long flags;
> > > +
> > >   	ENTER();
> > >   	ffs_closed(ffs);
> > >   	BUG_ON(ffs->gadget);
> > > -	if (ffs->epfiles)
> > > -		ffs_epfiles_destroy(ffs->epfiles, ffs->eps_count);
> > > +	spin_lock_irqsave(&ffs->eps_lock, flags);
> > > +	epfiles = ffs->epfiles;
> > > +	ffs->epfiles = NULL;
> > > +	spin_unlock_irqrestore(&ffs->eps_lock, flags);
> > > +
> > > +	/*
> > > +	 * potential race possible between ffs_func_eps_disable
> > > +	 * & ffs_epfile_release therefore maintaining a local
> > > +	 * copy of epfile will save us from use-after-free.
> > > +	 */
> > > +	if (epfiles)
> > > +		ffs_epfiles_destroy(epfiles, ffs->eps_count);
> > >   	if (ffs->ffs_eventfd)
> > >   		eventfd_ctx_put(ffs->ffs_eventfd);
> > > @@ -1790,7 +1811,6 @@ static void ffs_data_reset(struct ffs_data *ffs)
> > >   	ffs_data_clear(ffs);
> > > -	ffs->epfiles = NULL;
> > >   	ffs->raw_descs_data = NULL;
> > >   	ffs->raw_descs = NULL;
> > >   	ffs->raw_strings = NULL;
> > > @@ -1870,6 +1890,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
> > >   {
> > >   	struct ffs_epfile *epfile, *epfiles;
> > >   	unsigned i, count;
> > > +	unsigned long flags;
> > >   	ENTER();
> > > @@ -1895,7 +1916,9 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
> > >   		}
> > >   	}
> > > +	spin_lock_irqsave(&ffs->eps_lock, flags);
> > >   	ffs->epfiles = epfiles;
> > > +	spin_unlock_irqrestore(&ffs->eps_lock, flags);
> > Why is this lock needed when you set this value?  What is that
> > protecting?
> 
> Was making it uniform, protection ffs->epfiles all over. Here intention is
> to protect the operation of epfiles getting assigned to ffs->epfiles so that
> we protect the ffs->epfiles instance at the time of creation as well.

But it is not needed here, so no need to add it.

thanks,

greg k-h
