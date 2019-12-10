Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0302F118C2E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 16:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbfLJPM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 10:12:29 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:50526 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727211AbfLJPM3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 10:12:29 -0500
Received: (qmail 1791 invoked by uid 2102); 10 Dec 2019 10:12:28 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Dec 2019 10:12:28 -0500
Date:   Tue, 10 Dec 2019 10:12:28 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Erkka Talvitie <erkka.talvitie@vincit.fi>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
Subject: Re: [PATCH] USB: EHCI: Do not return -EPIPE when hub is disconnected
In-Reply-To: <1ec66c398699e95ca2b5755f6cbb8c5d2453dd71.1575893227.git.erkka.talvitie@vincit.fi>
Message-ID: <Pine.LNX.4.44L0.1912101004240.1647-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 10 Dec 2019, Erkka Talvitie wrote:

> When disconnecting a USB hub that has some child device(s) connected to it
> (such as a USB mouse), then the stack tries to clear halt and
> reset device(s) which are _already_ physically disconnected.
> 
> The issue has been reproduced with:
> 
> CPU: IMX6D5EYM10AD or MCIMX6D5EYM10AE.
> SW: U-Boot 2019.07 and kernel 4.19.40.
> 
> CPU: HP Proliant Microserver Gen8.
> SW: Linux version 4.2.3-300.fc23.x86_64
> 
> In this situation there will be error bit for MMF active yet the
> CERR equals EHCI_TUNE_CERR + halt. Existing implementation
> interprets this as a stall [1] (chapter 8.4.5).
> 
> The possible conditions when the MMF will be active + halt
> can be found from [2] (Table 4-13).
> 
> Fix for the issue is to check whether MMF is active and PID Code is
> IN before checking for the stall. If these conditions are true then
> it is not a stall.
> 
> What happens after the fix is that when disconnecting a hub with
> attached device(s) the situation is not interpret as a stall.
> 
> [1] https://www.usb.org/document-library/usb-20-specification, usb_20.pdf
> [2] https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/ehci-specification-for-usb.pdf
> 
> Signed-off-by: Erkka Talvitie <erkka.talvitie@vincit.fi>
> ---

Basically good, but you should always run patches through the 
scripts/checkpatch.pl script before sending them.  There are several 
places where the formatting needs to be fixed.

>  drivers/usb/host/ehci-q.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> index 3276304..285622d 100644
> --- a/drivers/usb/host/ehci-q.c
> +++ b/drivers/usb/host/ehci-q.c
> @@ -27,6 +27,10 @@
>  
>  /*-------------------------------------------------------------------------*/
>  
> +/* PID Codes that are used here, from EHCI specification, Table 3-16. */
> +#define PID_CODE_IN    1
> +#define PID_CODE_SETUP 2
> +
>  /* fill a qtd, returning how much of the buffer we were able to queue up */
>  
>  static int
> @@ -190,7 +194,7 @@ static int qtd_copy_status (
>  	int	status = -EINPROGRESS;
>  
>  	/* count IN/OUT bytes, not SETUP (even short packets) */
> -	if (likely (QTD_PID (token) != 2))
> +	if (likely (QTD_PID (token) != PID_CODE_SETUP))

This should be "QTD_PID(token)" with no extra space before the left
paren, and similarly for "likely(".  I realize you just kept the code
the way it already was, but we prefer to fix formatting errors like
these whenever the line gets changed, even if it's for a different
reason.

>  		urb->actual_length += length - QTD_LENGTH (token);
>  
>  	/* don't modify error codes */
> @@ -206,6 +210,11 @@ static int qtd_copy_status (
>  		if (token & QTD_STS_BABBLE) {
>  			/* FIXME "must" disable babbling device's port too */
>  			status = -EOVERFLOW;
> +		/* When MMF is active and PID Code is IN, queue is halted.
> +		 * EHCI Specification, Table 4-13.
> +		 */

Multi-line comments should be formatted like thus:

		/*
		 * When MMF...
		 * EHCI ...
		 */

> +		} else if((token & QTD_STS_MMF) && (QTD_PID(token) == PID_CODE_IN)) {

Try to avoid letting code extend beyond column 80 (for example, you 
could beak the line following the "&&").  Also, there should be a space 
between the "if" and the left paren -- the "if" isn't a function call!

> +			status = -EPROTO;
>  		/* CERR nonzero + halt --> stall */
>  		} else if (QTD_CERR(token)) {
>  			status = -EPIPE;

When you fix up these minor issues and resubmit, you can add:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

