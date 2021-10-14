Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8454042D050
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 04:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhJNCWz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 22:22:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46405 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229496AbhJNCWy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Oct 2021 22:22:54 -0400
Received: (qmail 910561 invoked by uid 1000); 13 Oct 2021 22:20:49 -0400
Date:   Wed, 13 Oct 2021 22:20:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James Buren <braewoods+lkml@braewoods.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-storage: Add compatibility quirk flags for iODD
 2531/2541
Message-ID: <20211014022049.GB910341@rowland.harvard.edu>
References: <20211014015504.2695089-1-braewoods+lkml@braewoods.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014015504.2695089-1-braewoods+lkml@braewoods.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 13, 2021 at 08:55:04PM -0500, James Buren wrote:
> These drive enclosures have firmware bugs that make it impossible to mount
> a new virtual ISO image after Linux ejects the old one if the device is
> locked by Linux. Windows bypasses this problem by the fact that they do
> not lock the device. Add a quirk to disable device locking for these
> drive enclosures.
> 
> Signed-off-by: James Buren <braewoods+lkml@braewoods.net>
> ---

In the future, you should always include a version number in the email 
Subject: line (for example, "[PATCH v2]") so that readers will know 
which patch is which.  And you should include, here just below the "---" 
line, a description of how this version differs from the previous 
version.  See the email archives for examples of multi-version patches.

Nevertheless, this looks okay.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/unusual_devs.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index c6b3fcf90180..29191d33c0e3 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -406,6 +406,16 @@ UNUSUAL_DEV(  0x04b8, 0x0602, 0x0110, 0x0110,
>  		"785EPX Storage",
>  		USB_SC_SCSI, USB_PR_BULK, NULL, US_FL_SINGLE_LUN),
>  
> +/*
> + * Reported by James Buren <braewoods+lkml@braewoods.net>
> + * Virtual ISOs cannot be remounted if ejected while the device is locked
> + * Disable locking to mimic Windows behavior that bypasses the issue
> + */
> +UNUSUAL_DEV(  0x04c5, 0x2028, 0x0001, 0x0001,
> +		"iODD",
> +		"2531/2541",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL, US_FL_NOT_LOCKABLE),
> +
>  /*
>   * Not sure who reported this originally but
>   * Pavel Machek <pavel@ucw.cz> reported that the extra US_FL_SINGLE_LUN
> -- 
> 2.25.1
