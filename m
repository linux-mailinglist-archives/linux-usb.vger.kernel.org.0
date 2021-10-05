Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B146422B42
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 16:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbhJEOmc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 10:42:32 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58577 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235175AbhJEOmb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 10:42:31 -0400
Received: (qmail 623062 invoked by uid 1000); 5 Oct 2021 10:40:40 -0400
Date:   Tue, 5 Oct 2021 10:40:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Robert Greener <rob@robgreener.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 10/13] usb: core: config: fix checkpatch.pl braces warning
Message-ID: <20211005144040.GE621017@rowland.harvard.edu>
References: <cover.1633442131.git.rob@robgreener.com>
 <9fb688c9a39a9114a6137361dc4a143d7a198822.1633442131.git.rob@robgreener.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fb688c9a39a9114a6137361dc4a143d7a198822.1633442131.git.rob@robgreener.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 05, 2021 at 02:34:03PM +0100, Robert Greener wrote:
> This fixes the following checkpatch.pl warnings:
> 
> core/config.c:268: CHECK:BRACES: braces {} should be used on all arms of this statement
> core/config.c:272: CHECK:BRACES: Unbalanced braces around else statement
> core/config.c:649: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'

This is one aspect of checkpatch I don't understand at all.

> Signed-off-by: Robert Greener <rob@robgreener.com>
> ---
>  drivers/usb/core/config.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 9717f89bcb6f..76038e8c84c5 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -265,11 +265,12 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  	buffer += d->bLength;
>  	size -= d->bLength;
>  
> -	if (d->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE)
> +	if (d->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE) {
>  		n = USB_DT_ENDPOINT_AUDIO_SIZE;
> -	else if (d->bLength >= USB_DT_ENDPOINT_SIZE)
> +	}

Why is it necessary to add braces to the "if" clause?  The "else"
clause doesn't use braces; it consists of a single "if" statement.
Things would different if the code had been:

	if (d->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE)
		n = USB_DT_ENDPOINT_AUDIO_SIZE;
	else {
		if (d->bLength >= USB_DT_ENDPOINT_SIZE)
			...
	}

Then I would agree that braces were needed.  But it isn't.  After all,
coding-style.rst says "Do not unnecessarily use braces where a single
statement will do."

This seems like a bug in checkpatch.pl.

Alan Stern
