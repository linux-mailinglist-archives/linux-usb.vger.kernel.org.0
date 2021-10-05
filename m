Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4274C422B44
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 16:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbhJEOnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 10:43:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50657 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234084AbhJEOnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 10:43:43 -0400
Received: (qmail 623112 invoked by uid 1000); 5 Oct 2021 10:41:51 -0400
Date:   Tue, 5 Oct 2021 10:41:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Robert Greener <rob@robgreener.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 11/13] usb: core: config: remove unnecessary parentheses
Message-ID: <20211005144151.GF621017@rowland.harvard.edu>
References: <cover.1633442131.git.rob@robgreener.com>
 <46320ab3bcc30f51da1f1dacf24eeed082690fa2.1633442131.git.rob@robgreener.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46320ab3bcc30f51da1f1dacf24eeed082690fa2.1633442131.git.rob@robgreener.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 05, 2021 at 02:37:35PM +0100, Robert Greener wrote:
> This fixes the following checkpatch.pl warnings:
> 
> core/config.c:657: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'header->bLength > size2'
> core/config.c:657: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'header->bLength < 2'
> 
> Signed-off-by: Robert Greener <rob@robgreener.com>
> ---
>  drivers/usb/core/config.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 76038e8c84c5..ab3395ec4260 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -267,8 +267,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  
>  	if (d->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE) {
>  		n = USB_DT_ENDPOINT_AUDIO_SIZE;
> -	}
> -	else if (d->bLength >= USB_DT_ENDPOINT_SIZE) {
> +	} else if (d->bLength >= USB_DT_ENDPOINT_SIZE) {
>  		n = USB_DT_ENDPOINT_SIZE;
>  	} else {
>  		dev_warn(ddev,

This has no connection with the patch's purpose.  It looks like a
remnant from an earlier patch.

Alan Stern

> @@ -655,7 +654,7 @@ static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
>  		}
>  
>  		header = (struct usb_descriptor_header *)buffer2;
> -		if ((header->bLength > size2) || (header->bLength < 2)) {
> +		if (header->bLength > size2 || header->bLength < 2) {
>  			dev_warn(ddev,
>  				 "config %d has an invalid descriptor of length %d, skipping remainder of the config\n",
>  				 cfgno, header->bLength);
> -- 
> 2.32.0
> 
