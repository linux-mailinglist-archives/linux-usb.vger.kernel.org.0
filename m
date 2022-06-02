Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB4E53B95F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 15:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbiFBNGi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 09:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbiFBNGh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 09:06:37 -0400
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B8BD8088
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=98QfqDjtz66JlPvv40jt/27dmn1PUnICIYeavmEqf5E=; b=4K1Vd
        OwKyOgfDRaNT3kJWSpMQQ+Ix2/yhud7hQoPWN/viTTq20CuYzhHRZdsFmC5iIwBJ/Jp1wqULGVCvZ
        0CoNbfw2sFsscoqVDTPFYVyFkszXcF8nsfpRhQ0ZMGqNAVVGHJo918BPPJJEMpQJCQCFunEK3DCcH
        DJ36Ww16LVwjbJwYneo53dx/1sL1vADeNZUl9uM+luuH0ZtuOvloFVHl96buIEYW7gWhs2E+Ra2Ew
        V7guJEQ/yimRHLSEdwhMUrq/rDROLgh9F1CJyWgi8Loset04NEGovVQ+kbwnzjdWVSr+x37S038TS
        wnFI0lC9ZmrFl9nlXlPYQevN3FDYw==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1nwkWw-0003HN-39; Thu, 02 Jun 2022 14:06:26 +0100
Date:   Thu, 2 Jun 2022 14:06:24 +0100
From:   John Keeping <john@metanate.com>
To:     Michael Wu <michael@allwinnertech.com>
Cc:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: gadget: f_fs: change ep->ep safe in
 ffs_epfile_io()
Message-ID: <Ypi10OWth6Rd08n9@donbot>
References: <1654056916-2062-1-git-send-email-quic_linyyuan@quicinc.com>
 <1654056916-2062-3-git-send-email-quic_linyyuan@quicinc.com>
 <0732d4f3-5359-0d9d-94b9-66a7403dc7d8@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0732d4f3-5359-0d9d-94b9-66a7403dc7d8@allwinnertech.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 02, 2022 at 06:39:30PM +0800, Michael Wu wrote:
> On 6/1/2022 12:15 PM, Linyu Yuan wrote:
> > In ffs_epfile_io(), when read/write data in blocking mode, it will wait
> > the completion in interruptible mode, if task receive a signal, it will
> > terminate the wait, at same time, if function unbind occurs,
> > ffs_func_unbind() will kfree all eps, ffs_epfile_io() still try to
> > dequeue request by dereferencing ep which may become invalid.
> > 
> > Fix it by add ep spinlock and will not dereference ep if it is not valid.
> > 
> > Reported-by: Michael Wu <michael@allwinnertech.com>
> > Reviewed-by: John Keeping <john@metanate.com>
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: add Reviewed-by from John keeping
> > v3: add Reported-by from Michael Wu
> > 
> >   drivers/usb/gadget/function/f_fs.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index d4d8940..9bf9287 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -1077,6 +1077,11 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
> >   		spin_unlock_irq(&epfile->ffs->eps_lock);
> >   		if (wait_for_completion_interruptible(&io_data->done)) {
> > +			spin_lock_irq(&epfile->ffs->eps_lock);
> > +			if (epfile->ep != ep) {
> > +				ret = -ESHUTDOWN;
> > +				goto error_lock;
> > +			}
> >   			/*
> >   			 * To avoid race condition with ffs_epfile_io_complete,
> >   			 * dequeue the request first then check
> > @@ -1084,6 +1089,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
> >   			 * condition with req->complete callback.
> >   			 */
> >   			usb_ep_dequeue(ep->ep, req);
> > +			spin_unlock_irq(&epfile->ffs->eps_lock);
> >   			wait_for_completion(&io_data->done);
> >   			interrupted = io_data->status < 0;
> >   		}
> 
> Tested-by: Michael Wu <michael@allwinnertech.com>
> 
> I've tested Linyu's patches [PATCH v3 1/2] [PATCH v3 2/2]. I believe it
> fixes the bug I reported.
> 
> What's more, John's solution [1] also works in my tests. It looks simpler.
> I'm not sure if it's as complete as Linyu's solution.

It's not as comprehensive, let's focus on this thread.

> [1] https://lore.kernel.org/linux-usb/YpUJkxWBNuZiW7Xk@donbot/
