Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8036864C6FF
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 11:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237757AbiLNKWv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 05:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237744AbiLNKWs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 05:22:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90811624F
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 02:22:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7CE2EB817B1
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 10:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35B0C433EF;
        Wed, 14 Dec 2022 10:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671013362;
        bh=xnpXd5UMGrv9R9RJhC+72XWqME6bvWjc8D0U8uXvzxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CzUcWGzZjQLgLbDSAHR4Z59+GnqnnX5pyWhaYDBlWjqjqzRWvSMiE8uAWyJT9mPFW
         LEM5la/qMxNs7iHQr74L0Ylv8KpR5es33Qf2Mwa0GUlvW6e9OK3f41KBYM0LhBYgsV
         RYokq0r5wWWVqt5lSQ1nK5DpA9595MiJlbFf0Ev0=
Date:   Wed, 14 Dec 2022 11:22:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     John Keeping <john@metanate.com>, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [v3] usb: gadget: f_fs: Prevent race between functionfs_unbind &
 ffs_ep0_queue_wait
Message-ID: <Y5mj71rsDkb+YOzj@kroah.com>
References: <20221125054119.25135-1-quic_ugoswami@quicinc.com>
 <68e1a725-9343-c7ad-ff70-bcbf11a11bc8@quicinc.com>
 <Y5mICGooaaQJOOQL@kroah.com>
 <43bbd23f-f560-8b65-daaf-2f205082fc7f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43bbd23f-f560-8b65-daaf-2f205082fc7f@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 14, 2022 at 03:42:10PM +0530, Udipto Goswami wrote:
> Hi Greg,
> 
> On 12/14/22 1:53 PM, Greg Kroah-Hartman wrote:
> > On Wed, Dec 14, 2022 at 12:47:17PM +0530, Udipto Goswami wrote:
> > > Hi All,
> > > 
> > > On 11/25/22 11:11 AM, Udipto Goswami wrote:
> > > > While performing fast composition switch, there is a possibility that the
> > > > process of ffs_ep0_write/ffs_ep0_read get into a race condition
> > > > due to ep0req being freed up from functionfs_unbind.
> > > > 
> > > > Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
> > > > by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
> > > > bounded so it can go ahead and mark the ep0req to NULL, and since there
> > > > is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
> > > > 
> > > > Fix this by making a serialized execution between the two functions using
> > > > a mutex_lock(ffs->mutex). Also, dequeue the ep0req to ensure that no
> > > > other function can use it after the free operation.
> > > > 
> > > > Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
> > > > Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > > ---
> > > > v3: Moved dequeue out of mutex to prevent deadlock
> > > > 
> > > >    drivers/usb/gadget/function/f_fs.c | 7 +++++++
> > > >    1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > > index 73dc10a77cde..523a961b910b 100644
> > > > --- a/drivers/usb/gadget/function/f_fs.c
> > > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > > @@ -279,6 +279,9 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
> > > >    	struct usb_request *req = ffs->ep0req;
> > > >    	int ret;
> > > > +	if (!req)
> > > > +		return -EINVAL;
> > > > +
> > > >    	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
> > > >    	spin_unlock_irq(&ffs->ev.waitq.lock);
> > > > @@ -1892,10 +1895,14 @@ static void functionfs_unbind(struct ffs_data *ffs)
> > > >    	ENTER();
> > > >    	if (!WARN_ON(!ffs->gadget)) {
> > > > +		/* dequeue before freeing ep0req */
> > > > +		usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
> > > > +		mutex_lock(&ffs->mutex);
> > > >    		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
> > > >    		ffs->ep0req = NULL;
> > > >    		ffs->gadget = NULL;
> > > >    		clear_bit(FFS_FL_BOUND, &ffs->flags);
> > > > +		mutex_unlock(&ffs->mutex);
> > > >    		ffs_data_put(ffs);
> > > >    	}
> > > >    }
> > > 
> > > Gentle reminder for any comments/suggestions on this patch.
> > 
> > It's the middle of the merge window, and you submitted a patch that has
> > obvious coding style issues, so there's nothing that we can do with it
> > no matter what...
> 
> Apologies for this, I had ran checkpatch, I didn't get any error:
> 
> total: 0 errors, 0 warnings, 23 lines checked
> 
> 0001-usb-gadget-f_fs-Prevent-race-between-functionfs_unbi.patch has no
> obvious style problems and is ready for submission.
> 
> was curious what's the coding style error you are referring here?

No blank line after the variable description and before your new if
statement.

thanks,

greg k-h
