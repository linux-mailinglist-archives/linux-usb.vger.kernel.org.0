Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFCD7617A3C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 10:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiKCJtl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 05:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiKCJtj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 05:49:39 -0400
X-Greylist: delayed 1123 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 03 Nov 2022 02:49:37 PDT
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9258F21
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=F87mc8lkAHj0ylbRzx8NYMGKOr+gBp0AZS8QBKStObU=; b=QsDYs
        F71nCGPDzVSTdCbNiSDGazL1Av4CuGRvsNlUpWmfQZ/cSEjKoYA09WpubDofsPWwouvqEDTEoV9XT
        fu/0v1UyOLqq3xEZhTthJLJQ5Cv2JW5xJFSos633tqj+jlJJuSiNoW2R27lwTcU+8KSavkjMAoMRR
        Ea6eXClssAuMDl4nZrdmvL1fRdfkCAuym0TqxaTy34S8wPPRAM3k4L/CDChPmD9zXbbd+5Z2Us9YK
        ij4Znkrdam/XTH4VH4MrLgiHXP6NVMAoZUPcLEgWoC2rZ1SKbpbo/n2/oFGYd3QoMw1/rVLxeVlJI
        XWv3QN/CyJpTkxHEzWzpKDc9TWCcg==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <john@metanate.com>)
        id 1oqWYg-0004GU-Ud;
        Thu, 03 Nov 2022 09:30:48 +0000
Date:   Thu, 3 Nov 2022 09:30:43 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Prevent race between
 functionfs_unbind & ffs_ep0_queue_wait
Message-ID: <Y2OKQ5xS23VYeRyj@donbot>
References: <20221103073821.8210-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103073821.8210-1-quic_ugoswami@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 03, 2022 at 01:08:21PM +0530, Udipto Goswami wrote:
> While performing fast composition switch, there is a possibility that the
> process of ffs_ep0_write/ffs_ep0_read get into a race condition
> due to ep0req being freed up from functionfs_unbind.
> 
> Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
> by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
> bounded so it can go ahead and mark the ep0req to NULL, and since there
> is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
> 
> Fix this by introducing a NULL check before any req operation.
> Also to ensure the serialization, perform the ep0req ops inside
> spinlock &ffs->ev.waitq.lock.
> 
> Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 73dc10a77cde..39980b2bf285 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -279,6 +279,13 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>  	struct usb_request *req = ffs->ep0req;
>  	int ret;
>  
> +	if (!req)
> +		return -EINVAL;
> +	/*
> +	 * Even if ep0req is freed won't be a problem since the local
> +	 * copy of the request will be used here.
> +	 */

This doesn't sound right - if we set ep0req to NULL then we've called
usb_ep_free_request() on it so the request is not longer valid.

>  	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
>  
>  	spin_unlock_irq(&ffs->ev.waitq.lock);
> @@ -1892,11 +1899,13 @@ static void functionfs_unbind(struct ffs_data *ffs)
>  	ENTER();
>  
>  	if (!WARN_ON(!ffs->gadget)) {
> +		spin_lock_irq(&ffs->ev.waitq.lock);
>  		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>  		ffs->ep0req = NULL;
>  		ffs->gadget = NULL;
>  		clear_bit(FFS_FL_BOUND, &ffs->flags);
>  		ffs_data_put(ffs);
> +		spin_unlock_irq(&ffs->ev.waitq.lock);

ffs may have been freed in ffs_data_put() so accessing the lock here is
unsafe.
