Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD04062FA0D
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 17:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242050AbiKRQUN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 11:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242095AbiKRQUH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 11:20:07 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE496B3AF
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=ijmHfgcGbcYpXVrzmKkYPku1Y7SinGRD1Az9OEVxR9c=; b=a+2nz
        ziez+OLj3vU3NRJE1CXRFEf9+eTNvPQF5srvwAxHdbaF4rC0hBbBA/sfCfmeYlKohrYc8tRNhjNGD
        jWUraSZiRQZW8cOvjZk+/Z/C4MSgKMX/SWHv2BrLVC0pZQRWTI3y4FN4RvWrUqM+stQPG9yPYiKQP
        CUAv24PMJ4n7r0ZFVXxD4c9MD0IDWxJfuLS+QwPFdLHxKdsFUEpE/gD7wIzsAy/Ac0CE3RmYBl/cd
        r+CmmGQbyvRBeSq2MkXGzNVszoNJCde4ZKSNMgLMuG8mjupWNPpegCbPJT2Q2RY7EWiy1MhHXbD26
        Ii2Q1HtIobe1iFSjK/+fBoyfQqHeQ==;
Received: from 188-39-28-98.static.enta.net ([188.39.28.98] helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <john@metanate.com>)
        id 1ow45v-0003ks-Of;
        Fri, 18 Nov 2022 16:20:00 +0000
Date:   Fri, 18 Nov 2022 16:19:55 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [v2] usb: gadget: f_fs: Prevent race between functionfs_unbind &
 ffs_ep0_queue_wait
Message-ID: <Y3ewqxYSbb2W1Hfq@donbot>
References: <20221116111955.21057-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116111955.21057-1-quic_ugoswami@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 16, 2022 at 04:49:55PM +0530, Udipto Goswami wrote:
> While performing fast composition switch, there is a possibility that the
> process of ffs_ep0_write/ffs_ep0_read get into a race condition
> due to ep0req being freed up from functionfs_unbind.
> 
> Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
> by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
> bounded so it can go ahead and mark the ep0req to NULL, and since there
> is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
> 
> Fix this by making a serialized execution between the two functions using
> a mutex_lock(ffs->mutex). Also, dequeue the ep0req to ensure that no
> other function can use it after the free operation.
> 
> Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v2: Replaces spinlock with mutex & added dequeue operation in unbind.
> 
>  drivers/usb/gadget/function/f_fs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 73dc10a77cde..1439449df39a 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -279,6 +279,9 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>  	struct usb_request *req = ffs->ep0req;
>  	int ret;
>  
> +	if (!req)
> +		return -EINVAL;
> +
>  	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
>  
>  	spin_unlock_irq(&ffs->ev.waitq.lock);
> @@ -1892,10 +1895,14 @@ static void functionfs_unbind(struct ffs_data *ffs)
>  	ENTER();
>  
>  	if (!WARN_ON(!ffs->gadget)) {
> +		mutex_lock(&ffs->mutex);
> +		/* dequeue before freeing ep0req */
> +		usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
>  		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>  		ffs->ep0req = NULL;
>  		ffs->gadget = NULL;
>  		clear_bit(FFS_FL_BOUND, &ffs->flags);
> +		mutex_unlock(&ffs->mutex);

There's now a deadlock here if some other thread is waiting in
__ffs_ep0_queue_wait() on ep0req_completion.

You need to dequeue before taking the lock.
