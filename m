Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FE136A58A
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 09:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhDYHde (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 03:33:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhDYHde (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Apr 2021 03:33:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6D06613CB;
        Sun, 25 Apr 2021 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619335970;
        bh=q2CHrugKj8qckzDmDGFBjQkD2YQPBCwFgWho587C8hs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rktpxgsdDgDcblMUfn9jwZeZFRZTqtuqZqPYVp3HuKH7/Pf0GPbyeW57pOxwmLBYb
         5vDKfFUVPaDaoJkji7hU1sHyV0QkCu04XQeNmRY2EK7gC2UJ4kbDSzF9m046dGtOY/
         lhHw3bPq/FSFZcZEGms0uAh5QCcGoQ87zHxeTH9U=
Date:   Sun, 25 Apr 2021 09:32:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactcode.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
Message-ID: <YIUbHKqs2gQPAu2T@kroah.com>
References: <20210424.220316.855336714119430355.rene@exactcode.com>
 <20210425023133.GC324386@rowland.harvard.edu>
 <883AF188-7817-42E2-84E8-F1DD7A5F3C08@exactcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <883AF188-7817-42E2-84E8-F1DD7A5F3C08@exactcode.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 25, 2021 at 09:20:59AM +0200, René Rebe wrote:
> Hey,
> 
> > On 25. Apr 2021, at 04:31, Alan Stern <stern@rowland.harvard.edu> wrote:
> >> Seagate devices" in 2017. Apparently some early ones where buggy, ...
> >> 
> >> However, fast forward a couple of years and this is no longer true,
> >> this Segate Seven even is already from 2016, and apparently first
> >> available in 2015. I suggest removing this rather drastic global
> >> measure, and instead only add very old broken ones with individual
> >> quirks, should any of them still be alive ;-)
> >> 
> >> Signed-off-by: René Rebe <rene@exactcode.com>
> >> 
> >> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
> >> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
> >> @@ -113,8 +113,4 @@
> >> 	}
> >> 
> >> -	/* All Seagate disk enclosures have broken ATA pass-through support */
> >> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
> >> -		flags |= US_FL_NO_ATA_1X;
> >> -
> >> 	usb_stor_adjust_quirks(udev, &flags);
> > 
> > I don't want to do this unless you can suggest an approach that won't 
> > suddenly break all those old buggy drives.  Just because they are now 
> > five years old or more doesn't mean they are no longer in use.
> 
> Well, what do you propose then? A allow quirk for all new devices going forward?
> Given that the user usually needs to actively run something like smartctl
> manually on the drive I don’t see that this should cause too many issues.
> I don’t have any non-supporting device - can we not just add them to the
> quirk list when someone reports one?

How about since you know your device works, you make the check detect
your specific device and not apply the flag to it?  You should be able
to do so based on the version of the device, right?

thanks,

greg k-h
