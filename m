Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3D447BB46
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 08:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbhLUHqp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 02:46:45 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34570 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhLUHqo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 02:46:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD929B8110A
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 07:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0174C36AE7;
        Tue, 21 Dec 2021 07:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640072802;
        bh=HIZ40j3T/yhFTODUmRRn0abB9d9TKDEdClTe49Lkzvw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FnZ8JufUJR0kRoMFzMuGYPZYgNo1WbU5yRv5mZpJqEY7B3Znu8J6ohj+vGHgg+ykf
         N9Ok2W5bDMOKakALXRK0+E/ZZQ9Cjm/rBQQXJ3vqiEBqJoBzHCTauEzYLzmGvYlRoX
         /1JK4E0F0Bm+gW/b75cY2cvr0f+RIlUJVfVlxg5U=
Date:   Tue, 21 Dec 2021 08:46:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, John Keeping <john@metanate.com>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v6] usb: f_fs: Fix use-after-free for epfile
Message-ID: <YcGGXx26yP2TFjxy@kroah.com>
References: <1638857274-24842-1-git-send-email-quic_ugoswami@quicinc.com>
 <YbdT+6FkeIuHz55L@kroah.com>
 <35df37e9-226b-c059-a538-581b5d2e53ff@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35df37e9-226b-c059-a538-581b5d2e53ff@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 07:16:14PM +0530, Udipto Goswami wrote:
> Hi Greg,
> 
> Apologies for the delay, please find the following comments as per my
> understanding inline.
> 
> On 13-12-2021 07:38 pm, Greg Kroah-Hartman wrote:
> > On Tue, Dec 07, 2021 at 11:37:54AM +0530, Udipto Goswami wrote:
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
> Fixes: a9e6f83c2df (usb: gadget: f_fs: stop sleeping in
> ffs_func_eps_disable)
> > > Reviewed-by: John Keeping <john@metanate.com>
> > > Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
> > > Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > ---
> > > v6: Addressing minor code formatting.
> > > 
> > >   drivers/usb/gadget/function/f_fs.c | 44 +++++++++++++++++++++++++++++---------
> > >   1 file changed, 34 insertions(+), 10 deletions(-)
> > What commit does this fix?
> > 
> > Does this need to go to stable kernel releases?
> > 
> > thanks,
> > 
> > greg k-h
> > 
> This is fixing Commit:  a9e6f83c2df (usb: gadget: f_fs: stop sleeping in
> ffs_func_eps_disable)
> 
> Yes this fix is needed for >=5.4 Kernel releases.

Please put that in the patch when you resend it.

> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index 3c584da..6f23a66 100644
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
> > You are accessing epfiles outside of the lock.  How is that ok?
> There are 2 parties that are trying to free the ffs->epfiles. We use the
> lock to serialize which party gets to free the ffs->epfiles. Where we are
> making it NULL we protected that, The freeing part doesn't need to be inside
> spinlock because now it is epfiles(local_ variable) with which we are trying
> to operate now. We removed the ffs->epfiles as the common structure to
> operate and made the local variable epfiles to do the job.

Why is the lock used only for that one field and not all other fields in
that structure?  What about the no_disconnect access above these lines?
The setup_state access below them?  Why does only one pointer deserve
this locking and not all of them?

thanks,

greg k-h
