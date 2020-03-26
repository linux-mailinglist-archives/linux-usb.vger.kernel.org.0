Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91947193A8D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 09:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgCZIQE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 04:16:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:39180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727769AbgCZIQE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 04:16:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 894902070A;
        Thu, 26 Mar 2020 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585210564;
        bh=l47MzSX7cX3IQBm0fIF13vzyV1Ox2Gb0ozdUSAx3r5c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g2fplb9SK2CaHE5P9OwPj1zhMFJO61V8HpgLXXsi88sLpLu3ImM5WlZ8Ni/Nf261A
         tvPdTYNG8g6j5Nv+ZFvpTmWCvF1nbx8mByb0bz0X+uVhEoeG3rAvSoImW4vyulVtXL
         ZFlaWgl7pom/PBkfcn51mt0zpjhAh0GC0T7YMWqk=
Date:   Thu, 26 Mar 2020 09:16:01 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sriharsha Allenki <sallenki@codeaurora.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        mgautam@codeaurora.org, jackp@codeaurora.org
Subject: Re: [PATCH] usb: gadget: f_fs: Fix use after free issue as part of
 queue failure
Message-ID: <20200326081601.GB979574@kroah.com>
References: <20200326060033.14550-1-sallenki@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326060033.14550-1-sallenki@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 11:30:33AM +0530, Sriharsha Allenki wrote:
> In AIO case, the request is freed up if ep_queue fails.
> However, io_data->req still has the reference to this freed
> request. In the case of this failure if there is aio_cancel
> call on this io_data it will lead to an invalid dequeue
> operation and a potential use after free issue.
> Fix this by setting the io_data->req to NULL when the request
> is freed as part of queue failure.
> 
> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> ---
>  drivers/usb/gadget/function/f_fs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 571917677d35..767f30b86645 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1120,6 +1120,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  
>  		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
>  		if (unlikely(ret)) {
> +			io_data->req = NULL;
>  			usb_ep_free_request(ep->ep, req);
>  			goto error_lock;
>  		}
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

What commit does this fix?  Should it go to stable kernels, and if so,
how far back?

thanks,

greg k-h
