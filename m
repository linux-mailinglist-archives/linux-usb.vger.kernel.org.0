Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7D54BA88C
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 19:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244424AbiBQSl2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 13:41:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237838AbiBQSl1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 13:41:27 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A907D50B2D
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 10:41:12 -0800 (PST)
Received: (qmail 829303 invoked by uid 1000); 17 Feb 2022 13:41:11 -0500
Date:   Thu, 17 Feb 2022 13:41:11 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] usb: host: ehci-q: make qtd_fill() return *unsigned
 int*
Message-ID: <Yg6Wx1oFhzGcDE10@rowland.harvard.edu>
References: <8c64fdeb-5857-8cb3-cfd8-0c248a14b909@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c64fdeb-5857-8cb3-cfd8-0c248a14b909@omp.ru>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 17, 2022 at 08:30:13PM +0300, Sergey Shtylyov wrote:
> At the end of qtd_fill(), we assign the 'int count' variable to the 'size_t
> length' field of 'struct ehci_qtd' -- which implies a problematic type cast.
> Let's make that variable and the function's result *unsigned int* instead...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> 
> Changes in version 2:
> - changed 'u16' to *unsigned int* everywhere, repordering the declarations;
> - updated the type of the 'this_qtd_len' local variable qh_urb_transaction();
> - rewrote the patch description.
> 
>  drivers/usb/host/ehci-q.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> Index: usb/drivers/usb/host/ehci-q.c
> ===================================================================
> --- usb.orig/drivers/usb/host/ehci-q.c
> +++ usb/drivers/usb/host/ehci-q.c
> @@ -33,12 +33,13 @@
>  
>  /* fill a qtd, returning how much of the buffer we were able to queue up */
>  
> -static int
> +static unsigned int
>  qtd_fill(struct ehci_hcd *ehci, struct ehci_qtd *qtd, dma_addr_t buf,
>  		  size_t len, int token, int maxpacket)
>  {
> -	int	i, count;
> +	unsigned int count;
>  	u64	addr = buf;
> +	int	i;
>  
>  	/* one buffer entry per 4K ... first might be short or unaligned */
>  	qtd->hw_buf[0] = cpu_to_hc32(ehci, (u32)addr);
> @@ -652,7 +653,7 @@ qh_urb_transaction (
>  	 * and may serve as a control status ack
>  	 */
>  	for (;;) {
> -		int this_qtd_len;
> +		unsigned int this_qtd_len;
>  
>  		this_qtd_len = qtd_fill(ehci, qtd, buf, this_sg_len, token,
>  				maxpacket);
