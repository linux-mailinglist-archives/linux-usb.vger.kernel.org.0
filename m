Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B98636A42E
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 04:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhDYCcN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 22:32:13 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55709 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229514AbhDYCcN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Apr 2021 22:32:13 -0400
Received: (qmail 324925 invoked by uid 1000); 24 Apr 2021 22:31:33 -0400
Date:   Sat, 24 Apr 2021 22:31:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Rene Rebe <rene@exactcode.com>, Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
Message-ID: <20210425023133.GC324386@rowland.harvard.edu>
References: <20210424.220316.855336714119430355.rene@exactcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210424.220316.855336714119430355.rene@exactcode.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 24, 2021 at 10:03:16PM +0200, Rene Rebe wrote:
> Hi there,
> 
> for some time I already wondered why my external USB Seagate Seven
> drive does not report any SMART status. Only recently did I take a
> look and it turns out ATA pass-through was explicitly disabed for all
> Seagate drives with 7fee72 "uas: Always apply US_FL_NO_ATA_1X quirk to

The kernel now uses >= 12-digit SHA1 values.  7fee72 is ambiguous.

> Seagate devices" in 2017. Apparently some early ones where buggy, ...
> 
> However, fast forward a couple of years and this is no longer true,
> this Segate Seven even is already from 2016, and apparently first
> available in 2015. I suggest removing this rather drastic global
> measure, and instead only add very old broken ones with individual
> quirks, should any of them still be alive ;-)
> 
> Signed-off-by: René Rebe <rene@exactcode.com>
> 
> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
> @@ -113,8 +113,4 @@
>  	}
>  
> -	/* All Seagate disk enclosures have broken ATA pass-through support */
> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
> -		flags |= US_FL_NO_ATA_1X;
> -
>  	usb_stor_adjust_quirks(udev, &flags);

I don't want to do this unless you can suggest an approach that won't 
suddenly break all those old buggy drives.  Just because they are now 
five years old or more doesn't mean they are no longer in use.

Alan Stern

PS: As a matter of good form, you should have CC'ed the person whose 
commit you are proposing to revert.
