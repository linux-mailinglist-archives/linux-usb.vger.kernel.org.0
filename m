Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 220A210F0E3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 20:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbfLBTnk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 14:43:40 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:34206 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727686AbfLBTnj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 14:43:39 -0500
Received: (qmail 4882 invoked by uid 2102); 2 Dec 2019 14:43:38 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Dec 2019 14:43:38 -0500
Date:   Mon, 2 Dec 2019 14:43:38 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Erkka Talvitie <erkka.talvitie@vincit.fi>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
Subject: Re: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
In-Reply-To: <1046f0c10876628227b7c9f303b0582a20406b14.1575030959.git.erkka.talvitie@vincit.fi>
Message-ID: <Pine.LNX.4.44L0.1912021349440.1559-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 29 Nov 2019, Erkka Talvitie wrote:

> When disconnecting a USB hub that has some child device(s) connected to it
> (such as a USB mouse), then the stack tries to clear halt and
> reset device(s) which are _already_ physically disconnected.

That behavior is understandable.  The kernel doesn't know that the
device has been disconnected until it can process the notification from
an upstream hub, and it can't process that notification while it's
trying to reset the device.

> The issue has been reproduced with:
> 
> CPU: IMX6D5EYM10AD or MCIMX6D5EYM10AE.
> SW: U-Boot 2019.07 and kernel 4.19.40.
> 
> In this situation there will be error bit for MMF active yet the
> CERR equals EHCI_TUNE_CERR + halt.

Why?  In general, setting the MMF bit does not cause the halt bit to be 
set (set Table 4-13 in the EHCI spec).  In fact, MMF refers to errors 
that occur on the host, not bus errors caused by a disconnected device.

> Existing implementation
> interprets this as a stall [1] (chapter 8.4.5).

That is the correct thing to do.  When a transaction error occurs
during a Complete-Split transaction, the host controller is supposed to
decrement the CERR value, set the XACT bit, and retry the transaction
unless the CERR value is 0 or there isn't enough time left in the
microframe.

The fact that you saw CERR equal to EHCI_TUNE_CERR and XACT clear
probably means that your EHCI hardware is not behaving properly.

> Fix for the issue is at first to check for a stall that comes after
> an error (the CERR has been decreased).
> 
> Then after that, check for other errors.
> 
> And at last check for stall without other errors (the CERR equals
> EHCI_TUNE_CERR as stall does not decrease the CERR [2] (table 3-16)).
> 
> What happens after the fix is that when disconnecting a hub with
> attached device(s) the situation is not interpret as a stall.
> 
> The specification [2] is not clear about error priorities, but
> since there is no explicit error bit for the stall, it is
> assumed to be lower priority than other errors.

On the contrary, the specification is very clear.  Since transaction
errors cause CERR to be decremented until it reaches 0, a nonzero value
for CERR means the endpoint was halted for some other reason.  And the
only other reason is a stall.  (Or end of the microframe, but there's 
no way to tell if that happened.)

> [1] https://www.usb.org/document-library/usb-20-specification, usb_20.pdf
> [2] https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/ehci-specification-for-usb.pdf
> 
> Signed-off-by: Erkka Talvitie <erkka.talvitie@vincit.fi>

Can you duplicate this behavior on a standard PC, say with an Intel
EHCI controller?

>  drivers/usb/host/ehci-q.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> index 3276304..da7fd12 100644
> --- a/drivers/usb/host/ehci-q.c
> +++ b/drivers/usb/host/ehci-q.c
> @@ -206,8 +206,9 @@ static int qtd_copy_status (
>  		if (token & QTD_STS_BABBLE) {
>  			/* FIXME "must" disable babbling device's port too */
>  			status = -EOVERFLOW;
> -		/* CERR nonzero + halt --> stall */
> -		} else if (QTD_CERR(token)) {
> +		/* CERR nonzero and less than EHCI_TUNE_CERR + halt --> stall.
> +		   This handles situation where stall comes after an error. */

This comment doesn't make sense.  Who cares whether a stall comes after
an error or not?  It's still a stall and should be reported.

> +		} else if (QTD_CERR(token) && QTD_CERR(token) < EHCI_TUNE_CERR) {
>  			status = -EPIPE;

If an error occurs and the transaction is retried and the retry gets a
stall, then the final status should be -EPIPE, not something else.

>  		/* In theory, more than one of the following bits can be set
> @@ -228,6 +229,10 @@ static int qtd_copy_status (
>  				usb_pipeendpoint(urb->pipe),
>  				usb_pipein(urb->pipe) ? "in" : "out");
>  			status = -EPROTO;
> +		/* CERR equals EHCI_TUNE_CERR, no other errors + halt --> stall.
> +		   This handles situation where stall comes without error bits set. */

If CERR is equal to EHCI_TUNE_CERR then no other errors could have 
occurred (since any error will decrement CERR).  So why shouldn't this 
case be included with the earlier case?

> +		} else if (QTD_CERR(token)) {
> +			status = -EPIPE;
>  		} else {	/* unknown */
>  			status = -EPROTO;
>  		}

Alan Stern

