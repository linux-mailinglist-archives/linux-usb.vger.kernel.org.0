Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD7E1C7281
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 16:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgEFOMK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 10:12:10 -0400
Received: from netrider.rowland.org ([192.131.102.5]:36925 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728535AbgEFOMJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 May 2020 10:12:09 -0400
Received: (qmail 15152 invoked by uid 500); 6 May 2020 10:12:08 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 May 2020 10:12:08 -0400
Date:   Wed, 6 May 2020 10:12:08 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Wei Yongjun <weiyongjun1@huawei.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] USB: ohci-sm501: fix error return code in
 ohci_hcd_sm501_drv_probe()
In-Reply-To: <20200506135625.106910-1-weiyongjun1@huawei.com>
Message-ID: <Pine.LNX.4.44L0.2005061010480.13334-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 6 May 2020, Wei Yongjun wrote:

> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 7d9e6f5aebe8 ("usb: host: ohci-sm501: init genalloc for local memory")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/host/ohci-sm501.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
> index c158cda9e4b9..cff965240327 100644
> --- a/drivers/usb/host/ohci-sm501.c
> +++ b/drivers/usb/host/ohci-sm501.c
> @@ -157,9 +157,10 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
>  	 * the call to usb_hcd_setup_local_mem() below does just that.
>  	 */
>  
> -	if (usb_hcd_setup_local_mem(hcd, mem->start,
> -				    mem->start - mem->parent->start,
> -				    resource_size(mem)) < 0)
> +	retval = usb_hcd_setup_local_mem(hcd, mem->start,
> +					 mem->start - mem->parent->start,
> +					 resource_size(mem));
> +	if (retval < 0)
>  		goto err5;
>  	retval = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (retval)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Thanks for noticing and fixing this.

Alan Stern

