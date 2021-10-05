Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158FF422B63
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 16:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbhJEOpw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 10:45:52 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54387 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235306AbhJEOpw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 10:45:52 -0400
Received: (qmail 623237 invoked by uid 1000); 5 Oct 2021 10:44:00 -0400
Date:   Tue, 5 Oct 2021 10:44:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Robert Greener <rob@robgreener.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 12/13] usb: core: config: remove multiple assignments
Message-ID: <20211005144400.GG621017@rowland.harvard.edu>
References: <cover.1633442131.git.rob@robgreener.com>
 <af1fb8e9de157431a5a912f7a03f6ff70d4263cd.1633442131.git.rob@robgreener.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af1fb8e9de157431a5a912f7a03f6ff70d4263cd.1633442131.git.rob@robgreener.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 05, 2021 at 02:43:08PM +0100, Robert Greener wrote:
> This fixes the following checkpatch.pl warning at multiple locations:
> 
> CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
> 
> Signed-off-by: Robert Greener <rob@robgreener.com>
> ---
>  drivers/usb/core/config.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index ab3395ec4260..1fe995a66182 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -342,7 +342,8 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  			 */
>  			if (udev->quirks & USB_QUIRK_LINEAR_FRAME_INTR_BINTERVAL) {
>  				n = clamp(fls(d->bInterval) + 3, i, j);
> -				i = j = n;
> +				j = n;
> +				i = j;

This is another case where I disagree with checkpatch.pl.  There are
times when multiple assignments are appropriate; this is one of them.
So are the other ones in this patch.

Alan Stern
