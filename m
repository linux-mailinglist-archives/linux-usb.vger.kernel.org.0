Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041E5538FF8
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 13:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbiEaLpE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 07:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343887AbiEaLpC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 07:45:02 -0400
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037C48217E
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 04:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=OUwNO3mUXfe674vwbPSZcbPd11bRcflPUhs3srz3epA=; b=OE9Kl
        w5JPIpyjXlQPedEpnUfsjyKvj55xvyRgig8FCggG1fSRHnIvMHRqBedrndbTWnM0IMqDqjIU57ZHT
        +lyJyaUWhXLxqQakwcwWDiUockHnp/5UFsLDRRn1G8n7xxVCI1iDZvXBv63eJ8Y4neQmSBUALPeS2
        bXgO1Gzx+/kfIooMXDX1e+SrnTGvHpecAryVrbCu31HjD/6vgdKbTtZ2yaf7U1Mv0BDrBfgtdmAVP
        vxNvhpXHLxQpJQ2CFMgbls576R/W3DG9W3AF1OBXdxnqmemGUsE1GCB+498zKsO82tAqDb8MCaMtR
        0anYPZPMj5bddv8CmxJfxZDXY2pIA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1nw0Ir-000756-SY; Tue, 31 May 2022 12:44:49 +0100
Date:   Tue, 31 May 2022 12:44:48 +0100
From:   John Keeping <john@metanate.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Michael Wu <michael@allwinnertech.com>
Subject: Re: [PATCH v1 1/2] usb: gadget: ffs: change ep->status safe in
 ffs_epfile_io()
Message-ID: <YpX/sILPw90Uvq+S@donbot>
References: <1653989775-14267-1-git-send-email-quic_linyyuan@quicinc.com>
 <1653989775-14267-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653989775-14267-2-git-send-email-quic_linyyuan@quicinc.com>
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

On Tue, May 31, 2022 at 05:36:14PM +0800, Linyu Yuan wrote:
> If a task read/write data in blocking mode, it will wait the completion
> in ffs_epfile_io(), if function unbind occurs, ffs_func_unbind() will
> kfree ffs ep, once the task wake up, it still dereference the ffs ep to
> obtain the request status.
> 
> Fix it by moving the request status to io_data which is stack-safe.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

One minor issue below, but otherwise I like this approach and it will
help solving a similar issue on the AIO path which I spotted while
looking into this (ffs_func_unbind() calls ffs_func_eps_disable()
setting epfile->ep = NULL before draining the completion workqueue where
ffs_user_copy_worker() relies on epfile->ep being non-null).

> ---
>  drivers/usb/gadget/function/f_fs.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 4585ee3..dcba835 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -122,8 +122,6 @@ struct ffs_ep {
>  	struct usb_endpoint_descriptor	*descs[3];
>  
>  	u8				num;
> -
> -	int				status;	/* P: epfile->mutex */
>  };
>  
>  struct ffs_epfile {
> @@ -227,6 +225,9 @@ struct ffs_io_data {
>  	bool use_sg;
>  
>  	struct ffs_data *ffs;
> +
> +	int status;
> +	struct completion done;
>  };
>  
>  struct ffs_desc_helper {
> @@ -707,12 +708,12 @@ static const struct file_operations ffs_ep0_operations = {
>  
>  static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
>  {
> +	struct ffs_io_data *io_data = req->context;
> +
>  	ENTER();
> -	if (req->context) {
> -		struct ffs_ep *ep = _ep->driver_data;
> -		ep->status = req->status ? req->status : req->actual;
> -		complete(req->context);
> -	}
> +
> +	io_data->status = req->status ? req->status : req->actual;
> +	complete(&io_data->done);
>  }
>  
>  static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
> @@ -1050,7 +1051,6 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  		WARN(1, "%s: data_len == -EINVAL\n", __func__);
>  		ret = -EINVAL;
>  	} else if (!io_data->aio) {
> -		DECLARE_COMPLETION_ONSTACK(done);
>  		bool interrupted = false;
>  
>  		req = ep->req;
> @@ -1066,7 +1066,8 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  
>  		io_data->buf = data;
>  
> -		req->context  = &done;
> +		init_completion(&io_data->done);
> +		req->context  = io_data;
>  		req->complete = ffs_epfile_io_complete;
>  
>  		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
> @@ -1075,7 +1076,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  
>  		spin_unlock_irq(&epfile->ffs->eps_lock);
>  
> -		if (wait_for_completion_interruptible(&done)) {
> +		if (wait_for_completion_interruptible(&io_data->done)) {
>  			/*
>  			 * To avoid race condition with ffs_epfile_io_complete,
>  			 * dequeue the request first then check
> @@ -1083,17 +1084,18 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  			 * condition with req->complete callback.
>  			 */
>  			usb_ep_dequeue(ep->ep, req);
> -			wait_for_completion(&done);
> -			interrupted = ep->status < 0;
> +			wait_for_completion(&io_data->done);
> +			interrupted = true;

This is a change in behaviour - shouldn't this be:

	interrupted = io_data->status;

?

Otherwise data is lost unnecessarily if the request completes
successfully in the small window between cancellation and being
dequeued.

>  		}
>  
>  		if (interrupted)
>  			ret = -EINTR;
> -		else if (io_data->read && ep->status > 0)
> -			ret = __ffs_epfile_read_data(epfile, data, ep->status,
> +		else if (io_data->read && io_data->status > 0)
> +			ret = __ffs_epfile_read_data(epfile, data, io_data->status,
>  						     &io_data->data);
>  		else
> -			ret = ep->status;
> +			ret = io_data->status;
> +
>  		goto error_mutex;
>  	} else if (!(req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC))) {
>  		ret = -ENOMEM;
> -- 
> 2.7.4
> 
