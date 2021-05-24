Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88AA338E151
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 09:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhEXHGH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 03:06:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:34032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232279AbhEXHGF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 03:06:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0A686109E;
        Mon, 24 May 2021 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621839873;
        bh=flpTUM3KCbXVN1mvpd23lkWFKiwOOCx5MvX+UdQqIZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M8v6BOQ0WBnodIXvYr8soB716XWbeRQZeLPRgviMvv8ap5JkqwFn5MfyzeZE9N+q6
         nZunRvaga0OjpNQflmPUsipqCqezJf9JMFixSBDHFozyY2UYAFQ6HSUgcmM+0cJDrc
         0JSBcw/XRrjKNd9zkkfRt6KJIxCRkHP77VlItvBU=
Date:   Mon, 24 May 2021 09:04:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alexandr Ivanov <alexandr.sky@gmail.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: Remove unnecessary condition from
 xhci_check_tt_bw_table
Message-ID: <YKtQAG9J9kvs0Az2@kroah.com>
References: <a7ca3671-aaee-2b4e-ed90-208ba82baef8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7ca3671-aaee-2b4e-ed90-208ba82baef8@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 23, 2021 at 06:10:31PM +0300, Alexandr Ivanov wrote:
> Remove condition (old_active_eps == 0) from xhci_check_tt_bw_table
> because the previous check of old_active_eps returns
> from the function if old_active_eps is not zero.
> 
> Move the previous condition to the function beginning.
> 
> Signed-off-by: Alexandr Ivanov <alexandr.sky@gmail.com>
> ---
>  drivers/usb/host/xhci.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 27283654ca08..14aae87d6c8f 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -2329,16 +2329,18 @@ static int xhci_check_tt_bw_table(struct xhci_hcd
> *xhci,
>      struct xhci_interval_bw_table *bw_table;
>      struct xhci_tt_bw_info *tt_info;
> 
> -    /* Find the bandwidth table for the root port this TT is attached to.
> */
> -    bw_table = &xhci->rh_bw[virt_dev->real_port - 1].bw_table;
> -    tt_info = virt_dev->tt_info;
>      /* If this TT already had active endpoints, the bandwidth for this TT
>       * has already been added.  Removing all periodic endpoints (and thus
>       * making the TT enactive) will only decrease the bandwidth used.
>       */
>      if (old_active_eps)
>          return 0;
> -    if (old_active_eps == 0 && tt_info->active_eps != 0) {
> +
> +    /* Find the bandwidth table for the root port this TT is attached to.
> */
> +    bw_table = &xhci->rh_bw[virt_dev->real_port - 1].bw_table;
> +    tt_info = virt_dev->tt_info;
> +
> +    if (tt_info->active_eps != 0) {
>          if (bw_table->bw_used + TT_HS_OVERHEAD > HS_BW_LIMIT)
>              return -ENOMEM;
>          return 0;
> -- 
> 2.31.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
