Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D65A631596
	for <lists+linux-usb@lfdr.de>; Sun, 20 Nov 2022 18:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiKTRsR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 12:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiKTRsP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 12:48:15 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF1910E5
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 09:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=fJqRMhjF1CfGRkpLJ5mb+iV8O78KfvQP9CiNtRJInBY=; b=KeYUE
        Lz9092P4DfAzAtW9H/jIYOv02p8rRmZth9ZD0u8AvJiiqs8sdPiVy3iON6NRwh7gwHW8ZobN4zJ5o
        qhcuhVd4XkZEvLOHIbwchNquVccEucxbFiQ/OqFcjWPW2Q5qNfHmjGHR/XcixOwT03pmEWDM5vS6o
        1wpdbX1wSVPE6D/T31rN+R+72d/OWinUM1jo/VkQpn+DSrrwjp1E00G4QHG7KmD1m0gFBSHoTRyQE
        ej0hHZLTDy5oWMOuuocDakDR0fn0qFJ1k/AZ2mG4WmsqAqTT1ixXHnz3fLc/+H+HlJWYYZy84Y+lP
        haHonE3ZvQBIbNoacz2MnvrJR67/g==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <john@metanate.com>)
        id 1owoQN-0002Wf-KQ;
        Sun, 20 Nov 2022 17:48:12 +0000
Date:   Sun, 20 Nov 2022 17:48:10 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [v2] usb: gadget: f_fs: Prevent race between functionfs_unbind &
 ffs_ep0_queue_wait
Message-ID: <Y3poWpdn05ZEuaF2@donbot>
References: <20221116111955.21057-1-quic_ugoswami@quicinc.com>
 <Y3ewqxYSbb2W1Hfq@donbot>
 <00b2c24d-a663-f16c-deb1-9beb40d424a2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00b2c24d-a663-f16c-deb1-9beb40d424a2@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 20, 2022 at 12:23:50PM +0530, Udipto Goswami wrote:
> On 11/18/22 9:49 PM, John Keeping wrote:
> > On Wed, Nov 16, 2022 at 04:49:55PM +0530, Udipto Goswami wrote:
> > > While performing fast composition switch, there is a possibility that the
> > > process of ffs_ep0_write/ffs_ep0_read get into a race condition
> > > due to ep0req being freed up from functionfs_unbind.
> > > 
> > > Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
> > > by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
> > > bounded so it can go ahead and mark the ep0req to NULL, and since there
> > > is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
> > > 
> > > Fix this by making a serialized execution between the two functions using
> > > a mutex_lock(ffs->mutex). Also, dequeue the ep0req to ensure that no
> > > other function can use it after the free operation.
> > > 
> > > Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
> > > Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > ---
> > > v2: Replaces spinlock with mutex & added dequeue operation in unbind.
> > > 
> > >   drivers/usb/gadget/function/f_fs.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index 73dc10a77cde..1439449df39a 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -279,6 +279,9 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
> > >   	struct usb_request *req = ffs->ep0req;
> > >   	int ret;
> > > +	if (!req)
> > > +		return -EINVAL;
> > > +
> > >   	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
> > >   	spin_unlock_irq(&ffs->ev.waitq.lock);
> > > @@ -1892,10 +1895,14 @@ static void functionfs_unbind(struct ffs_data *ffs)
> > >   	ENTER();
> > >   	if (!WARN_ON(!ffs->gadget)) {
> > > +		mutex_lock(&ffs->mutex);
> > > +		/* dequeue before freeing ep0req */
> > > +		usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
> > >   		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
> > >   		ffs->ep0req = NULL;
> > >   		ffs->gadget = NULL;
> > >   		clear_bit(FFS_FL_BOUND, &ffs->flags);
> > > +		mutex_unlock(&ffs->mutex);
> > 
> > There's now a deadlock here if some other thread is waiting in
> > __ffs_ep0_queue_wait() on ep0req_completion.
> > 
> > You need to dequeue before taking the lock.
> That's a control request right, will it be async?
> 
> Anyway I see only 2 possible threads ep0_read/ep0_write who calls
> ep0_queue_wait and waits for the completion of ep0req and both
> ep0_read/write are prptected by the mutex lock so i guess execution won't
> reach there right ?
> Say functionfs_unbind ran first then ep0_read/write had to wait will the
> functionfs_unbind is completed so ep_dequeue will ran, will get completed,
> further free the request, mark in NULL. now ep0_read/write will have ep0req
> as NULL so bail out.
> 
> Is reverse then functionfs_unbind will wait will the ep0_read/write is
> completed.

What guarantee is there that the transfer completes?

If there is such a guarantee, then the request will not be queued, so
why is usb_ep_dequeue() necessary?
