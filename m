Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9CF17C543
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 19:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCFSSX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 13:18:23 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:42666 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726251AbgCFSSX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 13:18:23 -0500
Received: (qmail 4386 invoked by uid 2102); 6 Mar 2020 13:18:22 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Mar 2020 13:18:22 -0500
Date:   Fri, 6 Mar 2020 13:18:22 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Crash while capturing with usbmon
In-Reply-To: <yw1xy2sdidbz.fsf@mansr.com>
Message-ID: <Pine.LNX.4.44L0.2003061316110.1480-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 6 Mar 2020, [iso-8859-1] Måns Rullgård wrote:

> I found the problem.  Initially, usb_sg_init() sets transfer_buffer to
> NULL like this:
> 
> 			if (!PageHighMem(sg_page(sg)))
> 				urb->transfer_buffer = sg_virt(sg);
> 			else
> 				urb->transfer_buffer = NULL;
> 
> Later, musb_host_rx() uses sg_miter_next() to assign a temporary
> address:
> 
> 			/*
> 			 * We need to map sg if the transfer_buffer is
> 			 * NULL.
> 			 */
> 			if (!urb->transfer_buffer) {
> 				qh->use_sg = true;
> 				sg_miter_start(&qh->sg_miter, urb->sg, 1,
> 						sg_flags);
> 			}
> 
> 			if (qh->use_sg) {
> 				if (!sg_miter_next(&qh->sg_miter)) {
> 					dev_err(musb->controller, "error: sg list empty\n");
> 					sg_miter_stop(&qh->sg_miter);
> 					status = -EINVAL;
> 					done = true;
> 					goto finish;
> 				}
> 				urb->transfer_buffer = qh->sg_miter.addr;
> 				received_len = urb->actual_length;
> 				qh->offset = 0x0;
> 				done = musb_host_packet_rx(musb, urb, epnum,
> 						iso_err);
> 				/* Calculate the number of bytes received */
> 				received_len = urb->actual_length -
> 					received_len;
> 				qh->sg_miter.consumed = received_len;
> 				sg_miter_stop(&qh->sg_miter);
> 			} else {
> 				done = musb_host_packet_rx(musb, urb,
> 						epnum, iso_err);
> 			}
> 
> When the transfer has completed, a bogus value is left behind in
> urb->transfer_buffer, and this trips up usbmon.  Apparently nothing else
> uses that value before the urb is released.
> 
> This patch makes it not crash:
> 
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index 1c813c37462a..b67b40de1947 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -1459,8 +1459,10 @@ void musb_host_tx(struct musb *musb, u8 epnum)
>  	qh->segsize = length;
>  
>  	if (qh->use_sg) {
> -		if (offset + length >= urb->transfer_buffer_length)
> +		if (offset + length >= urb->transfer_buffer_length) {
>  			qh->use_sg = false;
> +			urb->transfer_buffer = NULL;
> +		}
>  	}
>  
>  	musb_ep_select(mbase, epnum);
> @@ -1977,8 +1979,10 @@ void musb_host_rx(struct musb *musb, u8 epnum)
>  	urb->actual_length += xfer_len;
>  	qh->offset += xfer_len;
>  	if (done) {
> -		if (qh->use_sg)
> +		if (qh->use_sg) {
>  			qh->use_sg = false;
> +			urb->transfer_buffer = NULL;
> +		}
>  
>  		if (urb->status == -EINPROGRESS)
>  			urb->status = status;

Good detective work, and I'm glad I was able to help.

Alan Stern

