Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 763C517C4DE
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 18:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgCFRsu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 6 Mar 2020 12:48:50 -0500
Received: from unicorn.mansr.com ([81.2.72.234]:52492 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgCFRsu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Mar 2020 12:48:50 -0500
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id B2D3815F0E; Fri,  6 Mar 2020 17:48:48 +0000 (GMT)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Crash while capturing with usbmon
References: <Pine.LNX.4.44L0.2003061211340.1480-100000@iolanthe.rowland.org>
Date:   Fri, 06 Mar 2020 17:48:48 +0000
In-Reply-To: <Pine.LNX.4.44L0.2003061211340.1480-100000@iolanthe.rowland.org>
        (Alan Stern's message of "Fri, 6 Mar 2020 12:27:25 -0500 (EST)")
Message-ID: <yw1xy2sdidbz.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan Stern <stern@rowland.harvard.edu> writes:

> On Fri, 6 Mar 2020, Måns Rullgård wrote:
>
>> Alan Stern <stern@rowland.harvard.edu> writes:
>> 
>> > On Thu, 5 Mar 2020, Måns Rullgård wrote:
>> >
>> >> While trying to capture some USB traffic, this happened:
>> >> 
>> >> 8<--- cut here ---
>> >> Unable to handle kernel paging request at virtual address ffeff000
>> > ...
>> >> [<c069e0a8>] (memcpy) from [<c050c88c>] (mon_copy_to_buff+0x4c/0x6c)
>> >> [<c050c88c>] (mon_copy_to_buff) from [<c050cd2c>] (mon_bin_event+0x480/0x7b8)
>> >> [<c050cd2c>] (mon_bin_event) from [<c050ade4>] (mon_bus_complete+0x50/0x6c)
>> > ...
>> >
>> >> It is easily reproducible.  What can I do to narrow down the cause?
>> >
>> > What kind of USB traffic were you monitoring?  Isochronous?  
>> > Scatter-gather?
>> >
>> > Can you add printk statements in drivers/usb/mon/mon_bin.c: 
>> > mon_bin_get_data() to determine which of the pathways was used for 
>> > calling mon_copy_buff() and what the values of the arguments were?
>> 
>> OK, I added a printk to mon_bin_get_data(), and the bad call has
>> offset=4736, length=4096 urb->num_sgs=0 urb->transfer_flags=0x281,
>> urb->transfer_buffer=0xffefee00.
>
> The values seem reasonable enough, except for transfer_buffer.
>
>> I guess the question now is how transfer_buffer got assigned that value.
>
> Depending on how your kernel is configured (in particular, whether
> CONFIG_MUSB_PIO_ONLY is enabled), it might be assigned in
> musb_alloc_temp_buffer() (in drivers/usb/musb/musb_host.c) or
> usb_sg_init() (in drivers/usb/core/message.c).
>
> With a little more detective work you ought to be to determine which 
> pathway is being used and what its important values are.  I wouldn't be 
> surprised to learn that 0xffefee0 was the value from sg_virt(sg) in 
> usb_sg_init().

I found the problem.  Initially, usb_sg_init() sets transfer_buffer to
NULL like this:

			if (!PageHighMem(sg_page(sg)))
				urb->transfer_buffer = sg_virt(sg);
			else
				urb->transfer_buffer = NULL;

Later, musb_host_rx() uses sg_miter_next() to assign a temporary
address:

			/*
			 * We need to map sg if the transfer_buffer is
			 * NULL.
			 */
			if (!urb->transfer_buffer) {
				qh->use_sg = true;
				sg_miter_start(&qh->sg_miter, urb->sg, 1,
						sg_flags);
			}

			if (qh->use_sg) {
				if (!sg_miter_next(&qh->sg_miter)) {
					dev_err(musb->controller, "error: sg list empty\n");
					sg_miter_stop(&qh->sg_miter);
					status = -EINVAL;
					done = true;
					goto finish;
				}
				urb->transfer_buffer = qh->sg_miter.addr;
				received_len = urb->actual_length;
				qh->offset = 0x0;
				done = musb_host_packet_rx(musb, urb, epnum,
						iso_err);
				/* Calculate the number of bytes received */
				received_len = urb->actual_length -
					received_len;
				qh->sg_miter.consumed = received_len;
				sg_miter_stop(&qh->sg_miter);
			} else {
				done = musb_host_packet_rx(musb, urb,
						epnum, iso_err);
			}

When the transfer has completed, a bogus value is left behind in
urb->transfer_buffer, and this trips up usbmon.  Apparently nothing else
uses that value before the urb is released.

This patch makes it not crash:

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 1c813c37462a..b67b40de1947 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1459,8 +1459,10 @@ void musb_host_tx(struct musb *musb, u8 epnum)
 	qh->segsize = length;
 
 	if (qh->use_sg) {
-		if (offset + length >= urb->transfer_buffer_length)
+		if (offset + length >= urb->transfer_buffer_length) {
 			qh->use_sg = false;
+			urb->transfer_buffer = NULL;
+		}
 	}
 
 	musb_ep_select(mbase, epnum);
@@ -1977,8 +1979,10 @@ void musb_host_rx(struct musb *musb, u8 epnum)
 	urb->actual_length += xfer_len;
 	qh->offset += xfer_len;
 	if (done) {
-		if (qh->use_sg)
+		if (qh->use_sg) {
 			qh->use_sg = false;
+			urb->transfer_buffer = NULL;
+		}
 
 		if (urb->status == -EINPROGRESS)
 			urb->status = status;


-- 
Måns Rullgård
