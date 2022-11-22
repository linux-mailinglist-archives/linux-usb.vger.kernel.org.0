Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89D6F633BC0
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 12:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbiKVLru (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 06:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232778AbiKVLrm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 06:47:42 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3CD631D
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 03:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=lT+L+ZhexK5wX1mdnjDED0NFRmbmv4LwmUWUtpCT9Ac=; b=nUUlJ
        m+L016wHQ3u8P+oybEMqSkxHS+PvCnwt5DKLcqbA0jAk5F9ukYvxt1eXcMSVkZJwf0t2iNr9/lA5v
        4rRE0xarulJnRvUFpGVjqHOZz+f0jf70BysJSS0aiP3wIk4NXqnB94P4itW01hVAJQBh/ZA8hGZx9
        aggqSg01TgJfVeeiyOieyLVZY8yxbzx0F9OOk6A4HqCSG23uA3E4K6Pm+c3T/a3rJkUo+z/zxxpK5
        goJIRQ1giEkTfkm2bSI8wiKJjRzSQkiBrwlj+ZvOM+dJ9rGAyoxSFIfPWAqzLVPROD8fX/mee0AqK
        lFKuGfJIGYuqRUfQYl2hZajOqJwPg==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <john@metanate.com>)
        id 1oxRkU-0002fU-04;
        Tue, 22 Nov 2022 11:47:34 +0000
Date:   Tue, 22 Nov 2022 11:47:32 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [v2] usb: gadget: f_fs: Prevent race between functionfs_unbind &
 ffs_ep0_queue_wait
Message-ID: <Y3y21CAt7HBr7NRL@donbot>
References: <20221116111955.21057-1-quic_ugoswami@quicinc.com>
 <Y3ewqxYSbb2W1Hfq@donbot>
 <00b2c24d-a663-f16c-deb1-9beb40d424a2@quicinc.com>
 <Y3poWpdn05ZEuaF2@donbot>
 <3eb52cdb-fc32-8b06-97a5-d5196d4794da@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eb52cdb-fc32-8b06-97a5-d5196d4794da@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 09:52:43AM +0530, Udipto Goswami wrote:
> Hi John
> 
> On 11/20/22 11:18 PM, John Keeping wrote:
> > On Sun, Nov 20, 2022 at 12:23:50PM +0530, Udipto Goswami wrote:
> > > On 11/18/22 9:49 PM, John Keeping wrote:
> > > > On Wed, Nov 16, 2022 at 04:49:55PM +0530, Udipto Goswami wrote:
> > > > > While performing fast composition switch, there is a possibility that the
> > > > > process of ffs_ep0_write/ffs_ep0_read get into a race condition
> > > > > due to ep0req being freed up from functionfs_unbind.
> > > > > 
> > > > > Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
> > > > > by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
> > > > > bounded so it can go ahead and mark the ep0req to NULL, and since there
> > > > > is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
> > > > > 
> > > > > Fix this by making a serialized execution between the two functions using
> > > > > a mutex_lock(ffs->mutex). Also, dequeue the ep0req to ensure that no
> > > > > other function can use it after the free operation.
> > > > > 
> > > > > Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
> > > > > Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > > > ---
> > > > > v2: Replaces spinlock with mutex & added dequeue operation in unbind.
> > > > > 
> > > > >    drivers/usb/gadget/function/f_fs.c | 7 +++++++
> > > > >    1 file changed, 7 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > > > index 73dc10a77cde..1439449df39a 100644
> > > > > --- a/drivers/usb/gadget/function/f_fs.c
> > > > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > > > @@ -279,6 +279,9 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
> > > > >    	struct usb_request *req = ffs->ep0req;
> > > > >    	int ret;
> > > > > +	if (!req)
> > > > > +		return -EINVAL;
> > > > > +
> > > > >    	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
> > > > >    	spin_unlock_irq(&ffs->ev.waitq.lock);
> > > > > @@ -1892,10 +1895,14 @@ static void functionfs_unbind(struct ffs_data *ffs)
> > > > >    	ENTER();
> > > > >    	if (!WARN_ON(!ffs->gadget)) {
> > > > > +		mutex_lock(&ffs->mutex);
> > > > > +		/* dequeue before freeing ep0req */
> > > > > +		usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
> > > > >    		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
> > > > >    		ffs->ep0req = NULL;
> > > > >    		ffs->gadget = NULL;
> > > > >    		clear_bit(FFS_FL_BOUND, &ffs->flags);
> > > > > +		mutex_unlock(&ffs->mutex);
> > > > 
> > > > There's now a deadlock here if some other thread is waiting in
> > > > __ffs_ep0_queue_wait() on ep0req_completion.
> > > > 
> > > > You need to dequeue before taking the lock.
> > > That's a control request right, will it be async?
> > > 
> > > Anyway I see only 2 possible threads ep0_read/ep0_write who calls
> > > ep0_queue_wait and waits for the completion of ep0req and both
> > > ep0_read/write are prptected by the mutex lock so i guess execution won't
> > > reach there right ?
> > > Say functionfs_unbind ran first then ep0_read/write had to wait will the
> > > functionfs_unbind is completed so ep_dequeue will ran, will get completed,
> > > further free the request, mark in NULL. now ep0_read/write will have ep0req
> > > as NULL so bail out.
> > > 
> > > Is reverse then functionfs_unbind will wait will the ep0_read/write is
> > > completed.
> > 
> > What guarantee is there that the transfer completes?
> > 
> > If there is such a guarantee, then the request will not be queued, so
> > why is usb_ep_dequeue() necessary?
> 
> I Agree that we cannot say that for sure, but we see that
> wait_for_completion in the ep0_queue_wait is also inside mutex which was
> acquired in ep0_read/write right?

Correct.

> I Though of maintaining the uniformity for the approaches.

What uniformity?  If one process is blocked waiting for completion and
another process wants to cancel the operation, then the cancel
(usb_eq_dequeue()) must run concurrently with the wait, otherwise the
blocked process will never wake up.
