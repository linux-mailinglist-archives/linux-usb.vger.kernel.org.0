Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234BB250ADA
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 23:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHXV2g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 17:28:36 -0400
Received: from shells.gnugeneration.com ([66.240.222.126]:46820 "EHLO
        shells.gnugeneration.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgHXV2g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 17:28:36 -0400
X-Greylist: delayed 595 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Aug 2020 17:28:36 EDT
Received: by shells.gnugeneration.com (Postfix, from userid 1000)
        id D265F1A4018B; Mon, 24 Aug 2020 14:18:39 -0700 (PDT)
Date:   Mon, 24 Aug 2020 14:18:39 -0700
From:   Vito Caputo <vcaputo@pengaru.com>
To:     trix@redhat.com
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: storage: initialize variable
Message-ID: <20200824211839.6c7m7yhgd7ffq3g3@shells.gnugeneration.com>
References: <20200824211027.11543-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824211027.11543-1-trix@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020 at 02:10:27PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports this representative problem
> 
> transport.c:495:15: warning: Assigned value is garbage or
>   undefined
>         length_left -= partial;
>                    ^  ~~~~~~~
> partial is set only when usb_stor_bulk_transfer_sglist()
> is successful.
> 
> So set partial on entry to 0.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/usb/storage/transport.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 238a8088e17f..044429717dcc 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -414,6 +414,9 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
>  {
>  	int result;
>  
> +	if (act_len)
> +		*act_len = 0;
> +
>  	/* don't submit s-g requests during abort processing */
>  	if (test_bit(US_FLIDX_ABORTING, &us->dflags))
>  		return USB_STOR_XFER_ERROR;

At a glance this seems odd to me.  If the caller insists on ignoring
the return value, shouldn't it just initialize partial to zero?

In my experience it's generally frowned upon for functions to store
results in error paths.

Regards,
Vito Caputo
