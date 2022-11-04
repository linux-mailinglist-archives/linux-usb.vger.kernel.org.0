Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6BDB6195A4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 12:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiKDLtf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 07:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiKDLte (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 07:49:34 -0400
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055EB2B636
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 04:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-ID:Content-Description;
        bh=7CuoIPreBKBAND251UgOMweVvXHfH/dfK1pLefV+3qg=; b=j+Ew3SLulGvgaflrkJQODkuJAZ
        XYmRJG8TvQTY/dnGOJv1Q7R2ulcEXyBtNdTx83yTYrKFpM+SS9WsFoNTcxNgJrH5ySth9Oj+7FqMS
        1FBfN5tJbn80poXI/PhdiMPsHg53EDXZH8jMrOUK1yx8AtdwFrvIgXdMV2/ijUXjiaUW5438aq5MN
        EDN6a7hYU/3BT6OaOAIqrkJ5U1jzE2wFut3HIFxvZB+vBM1CJUrw2SEgL1+1XE3rRIbwQgDZSb6/z
        dSWESo04GmBl8NNltNHEzLKUOTYEY9uphC30Q8MUn69GDpegSQlMpQvdPynaxG7vUfHxFb5BbK5Ul
        NQYFoYfA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <john@metanate.com>)
        id 1oqvCP-0006PV-Nr;
        Fri, 04 Nov 2022 11:49:27 +0000
Date:   Fri, 4 Nov 2022 11:49:25 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Prevent race between
 functionfs_unbind & ffs_ep0_queue_wait
Message-ID: <Y2T8RfjJusTWB1PC@donbot>
References: <20221103073821.8210-1-quic_ugoswami@quicinc.com>
 <Y2OKQ5xS23VYeRyj@donbot>
 <6b3e061f-f606-b498-cf5d-5fbfd79ced67@quicinc.com>
 <Y2Ode1eyrBHEFzGw@donbot>
 <12d74bde-4eb5-d7ec-97c9-08cc99e13983@quicinc.com>
 <a7bc3084-85fa-0775-baa1-9ea13a31beac@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7bc3084-85fa-0775-baa1-9ea13a31beac@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 04, 2022 at 03:44:09PM +0530, Udipto Goswami wrote:
> On 11/3/22 4:59 PM, Udipto Goswami wrote:
> > On 11/3/22 4:22 PM, John Keeping wrote:
> > > On Thu, Nov 03, 2022 at 03:57:02PM +0530, Udipto Goswami wrote:
> > > > On 11/3/22 3:00 PM, John Keeping wrote:
> > > > > On Thu, Nov 03, 2022 at 01:08:21PM +0530, Udipto Goswami wrote:
> > > > > > While performing fast composition switch, there is a
> > > > > > possibility that the
> > > > > > process of ffs_ep0_write/ffs_ep0_read get into a race condition
> > > > > > due to ep0req being freed up from functionfs_unbind.
> > > > > > 
> > > > > > Consider the scenario that the ffs_ep0_write calls the
> > > > > > ffs_ep0_queue_wait
> > > > > > by taking a lock &ffs->ev.waitq.lock. However, the
> > > > > > functionfs_unbind isn't
> > > > > > bounded so it can go ahead and mark the ep0req to NULL,
> > > > > > and since there
> > > > > > is no NULL check in ffs_ep0_queue_wait we will end up in
> > > > > > use-after-free.
> > > > > > 
> > > > > > Fix this by introducing a NULL check before any req operation.
> > > > > > Also to ensure the serialization, perform the ep0req ops inside
> > > > > > spinlock &ffs->ev.waitq.lock.
> > > > > > 
> > > > > > Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
> > > > > > Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > > > > ---
> > > > > >    drivers/usb/gadget/function/f_fs.c | 9 +++++++++
> > > > > >    1 file changed, 9 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/usb/gadget/function/f_fs.c
> > > > > > b/drivers/usb/gadget/function/f_fs.c
> > > > > > index 73dc10a77cde..39980b2bf285 100644
> > > > > > --- a/drivers/usb/gadget/function/f_fs.c
> > > > > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > > > > @@ -279,6 +279,13 @@ static int
> > > > > > __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data,
> > > > > > size_t len)
> > > > > >        struct usb_request *req = ffs->ep0req;
> > > > > >        int ret;
> > > > > > +    if (!req)
> > > > > > +        return -EINVAL;
> > > > > > +    /*
> > > > > > +     * Even if ep0req is freed won't be a problem since the local
> > > > > > +     * copy of the request will be used here.
> > > > > > +     */
> > > > > 
> > > > > This doesn't sound right - if we set ep0req to NULL then we've called
> > > > > usb_ep_free_request() on it so the request is not longer valid.
> > > > 
> > > > Yes I agree as soon as we spin_unlock it the functionfs_unbind
> > > > will execute
> > > > and free_up the req, so performing and ep_queue after that even
> > > > if it is a
> > > > local copy could be fatal.
> > > > 
> > > >           ret = usb_ep_queue(ffs->gadget->ep0, req, GFP_ATOMIC);
> > > >           if (unlikely(ret < 0))
> > > >                   return ret;
> > > > 
> > > >          spin_unlock_irq(&ffs->ev.waitq.lock);
> > > >   We can move the spin_unlock after to queue operation perhaps ?
> > > 
> > > I don't think it's that simple.  The documentation for
> > > usb_ep_free_request() says:
> > > 
> > >     * Caller guarantees the request is not queued, and that it will
> > >     * no longer be requeued (or otherwise used).
> > > 
> > > so some extra synchronisation is required here.
> > > 
> > > By the time we get to functionfs_unbind() everything should be disabled
> > > by ffs_func_disable() and ffs_func_unbind() has drained the workqueue,
> > > but none of that applies to ep0.
> > > 
> > > I think ffs_unbind() needs to dequeue the ep0 request.
> > > 
> > > In addition to that, I think we need a new ep0 status variable in struct
> > > ffs_data so that req is not accessed after wait_for_completion() in
> > > __ffs_ep0_queue_wait() and that status is set in ffs_ep0_complete().
> > > 
> > > With the spin_unlock_irq() moved to immediately before
> > > wait_for_completion() in __ffs_ep0_queue_wait() it looks like everything
> > > is then safe.
> > 
> > Thanks for the suggestions, let me try implementing it.
> > 
> Just curious because i saw __ffs_ep0_queue_wait will only be called from
> ffs_ep0_read & ffs_ep0_write, both using a mutex_lock(&ffs->mutex)
> 
> So if we protect the functionfs_unbind with this mutex, it will be better
> right?
> 
> @@ -1889,12 +1889,13 @@ static int functionfs_bind(struct ffs_data *ffs,
> struct usb_composite_dev *cdev)
>  static void functionfs_unbind(struct ffs_data *ffs)
>  {
>         ENTER();
> 
>         if (!WARN_ON(!ffs->gadget)) {
> +               ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
>                 usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>                 ffs->ep0req = NULL;
>                 ffs->gadget = NULL;
>                 clear_bit(FFS_FL_BOUND, &ffs->flags);
> +               mutex_unlock(&ffs->mutex);
>                 ffs_data_put(ffs);
>         }
>  }
> 
> Perhaps we don't have to take care of the the serialization in that case
> since it will exit the function __ffs_ep0_queue_wait only after everything
> is done and hence functionfs_unbind will get the control after the
> ep0_write/read has completed?
> 
> What do you think ?

The documentation does say it protects ep0req so this might make sense.

But I think you need to ensure ep0req is dequeued before locking the
mutex in order to avoid a deadlock as nothing else is going to complete
an outstanding request at this point.
