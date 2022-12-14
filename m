Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202BF64C4FD
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 09:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237440AbiLNIXp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 03:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237358AbiLNIXn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 03:23:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA2BE5A
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 00:23:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 33C8CB816A4
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 08:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC91C433EF;
        Wed, 14 Dec 2022 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671006219;
        bh=+s1laG6GalT1WXcjFtW/AhiY7ie+7WUEgzKoxKU9MRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EQCm/Ru/eVYPXrywbVBr5vE1dzZm46g0eeqVhdNyWBZxg7Q+b4lbjtp0I1lYM+M+q
         aA+85ohk7/FQ9p+ldam9Q2w31eqE+CINE4q0Wmx3jMscEZkU1qXGQOn2cYURpWWl1z
         F1OxRlkl6fYVeZXOBbW6G5wmCl+sFJTI1Ox+8tEg=
Date:   Wed, 14 Dec 2022 09:23:36 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     John Keeping <john@metanate.com>, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [v3] usb: gadget: f_fs: Prevent race between functionfs_unbind &
 ffs_ep0_queue_wait
Message-ID: <Y5mICGooaaQJOOQL@kroah.com>
References: <20221125054119.25135-1-quic_ugoswami@quicinc.com>
 <68e1a725-9343-c7ad-ff70-bcbf11a11bc8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68e1a725-9343-c7ad-ff70-bcbf11a11bc8@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 14, 2022 at 12:47:17PM +0530, Udipto Goswami wrote:
> Hi All,
> 
> On 11/25/22 11:11 AM, Udipto Goswami wrote:
> > While performing fast composition switch, there is a possibility that the
> > process of ffs_ep0_write/ffs_ep0_read get into a race condition
> > due to ep0req being freed up from functionfs_unbind.
> > 
> > Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
> > by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
> > bounded so it can go ahead and mark the ep0req to NULL, and since there
> > is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
> > 
> > Fix this by making a serialized execution between the two functions using
> > a mutex_lock(ffs->mutex). Also, dequeue the ep0req to ensure that no
> > other function can use it after the free operation.
> > 
> > Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
> > Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > ---
> > v3: Moved dequeue out of mutex to prevent deadlock
> > 
> >   drivers/usb/gadget/function/f_fs.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index 73dc10a77cde..523a961b910b 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -279,6 +279,9 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
> >   	struct usb_request *req = ffs->ep0req;
> >   	int ret;
> > +	if (!req)
> > +		return -EINVAL;
> > +
> >   	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
> >   	spin_unlock_irq(&ffs->ev.waitq.lock);
> > @@ -1892,10 +1895,14 @@ static void functionfs_unbind(struct ffs_data *ffs)
> >   	ENTER();
> >   	if (!WARN_ON(!ffs->gadget)) {
> > +		/* dequeue before freeing ep0req */
> > +		usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
> > +		mutex_lock(&ffs->mutex);
> >   		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
> >   		ffs->ep0req = NULL;
> >   		ffs->gadget = NULL;
> >   		clear_bit(FFS_FL_BOUND, &ffs->flags);
> > +		mutex_unlock(&ffs->mutex);
> >   		ffs_data_put(ffs);
> >   	}
> >   }
> 
> Gentle reminder for any comments/suggestions on this patch.

It's the middle of the merge window, and you submitted a patch that has
obvious coding style issues, so there's nothing that we can do with it
no matter what...

Also, you are not explaining how this has been tested, or if it really
solves the problem for you or not, and it seems you are mixing two
different things into the same patch.

thanks,

greg k-h
