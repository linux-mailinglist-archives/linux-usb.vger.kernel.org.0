Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624B3422AF8
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 16:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbhJEO0z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 10:26:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50873 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235404AbhJEO0x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 10:26:53 -0400
Received: (qmail 622262 invoked by uid 1000); 5 Oct 2021 10:25:02 -0400
Date:   Tue, 5 Oct 2021 10:25:02 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Robert Greener <rob@robgreener.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 02/13] usb: core: config: fix block comment styles
Message-ID: <20211005142502.GB621017@rowland.harvard.edu>
References: <cover.1633442131.git.rob@robgreener.com>
 <da05f4a46e5183a0aa067673159fb70ae6621403.1633442131.git.rob@robgreener.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da05f4a46e5183a0aa067673159fb70ae6621403.1633442131.git.rob@robgreener.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Robert:

Replying to this message would be easier if you had included an 
actual recipient list in the mail header.

On Tue, Oct 05, 2021 at 01:31:37PM +0100, Robert Greener wrote:
> Fix the following checkpatch warning at lines 45, 467, 547, 646, 696,
> 782, 897:
> 
> WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
> 
> Signed-off-by: Robert Greener <rob@robgreener.com>
> ---
>  drivers/usb/core/config.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 52b0edee5b55..52aab1462787 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -42,7 +42,8 @@ static int find_next_descriptor(unsigned char *buffer, int size,
>  	}
>  
>  	/* Store the number of descriptors skipped and return the
> -	 * number of bytes skipped */
> +	 * number of bytes skipped
> +	 */

In fact, the style we use in the USB subsystem is like this:

	/*
	 * Store the number of descriptors skipped and return the
	 * number of bytes skipped
	 */

with both the opening "/*" and closing "*/" on separate lines.  As 
long as you're changing the comments, you might as well update them 
to the style we use everywhere else.

Alan Stern
