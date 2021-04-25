Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D4836A731
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 14:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhDYM1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 08:27:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:42298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230165AbhDYM1s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Apr 2021 08:27:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3DF261177;
        Sun, 25 Apr 2021 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619353627;
        bh=oZ4gb5eJGcBESeHohicE0dKhJef2anocx4dtkllspl0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o1lB1+eLVUvgTwce2Dv8vK7uKTFNRwKNliJIV0fHjN0gb8ResazeSc6xhtS0dhhw2
         vOJizooodbJzDa/kNcMiOmOw4huFjFNU8OAkkIFofuUggtKws65hLPZobmWWEdof3e
         mlimtFQ36jQN6g5p3//Pn2Gvm4i672Wq9aJYB2IM=
Date:   Sun, 25 Apr 2021 14:27:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rene Rebe <rene@exactcode.com>
Cc:     hdegoede@redhat.com, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
Message-ID: <YIVgGdGbSpQ1norU@kroah.com>
References: <ee48ea5d-c820-ae24-b557-2a7b7372821c@redhat.com>
 <20210425.135048.1651130854722875318.rene@exactcode.com>
 <YIVZ2l9qUfkcyPpG@kroah.com>
 <20210425.141536.1295354861910527121.rene@exactcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210425.141536.1295354861910527121.rene@exactcode.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 25, 2021 at 02:15:36PM +0200, Rene Rebe wrote:
> From: Greg KH <gregkh@linuxfoundation.org>
> Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
> Date: Sun, 25 Apr 2021 14:00:26 +0200
> 
> > On Sun, Apr 25, 2021 at 01:50:48PM +0200, Rene Rebe wrote:
> > > From: Hans de Goede <hdegoede@redhat.com>
> > > Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
> > > Date: Sun, 25 Apr 2021 12:58:40 +0200
> > > 
> > > > Hi,
> > > > 
> > > > On 4/25/21 12:47 PM, Hans de Goede wrote:
> > > > > Hi,
> > > > > 
> > > > > On 4/25/21 12:41 PM, Rene Rebe wrote:
> > > > >> Greg KH wrote:
> > > > >>
> > > > >>> On Sun, Apr 25, 2021 at 09:20:59AM +0200, René Rebe wrote:
> > > > >>>> Hey,
> > > > >>>>
> > > > >>>>> On 25. Apr 2021, at 04:31, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > >>>>>> Seagate devices" in 2017. Apparently some early ones where buggy, ...
> > > > >>>>>>
> > > > >>>>>> However, fast forward a couple of years and this is no longer true,
> > > > >>>>>> this Segate Seven even is already from 2016, and apparently first
> > > > >>>>>> available in 2015. I suggest removing this rather drastic global
> > > > >>>>>> measure, and instead only add very old broken ones with individual
> > > > >>>>>> quirks, should any of them still be alive ;-)
> > > > >>>>>>
> > > > >>>>>> Signed-off-by: René Rebe <rene@exactcode.com>
> > > > >>>>>>
> > > > >>>>>> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
> > > > >>>>>> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
> > > > >>>>>> @@ -113,8 +113,4 @@
> > > > >>>>>> 	}
> > > > >>>>>>
> > > > >>>>>> -	/* All Seagate disk enclosures have broken ATA pass-through support */
> > > > >>>>>> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
> > > > >>>>>> -		flags |= US_FL_NO_ATA_1X;
> > > > >>>>>> -
> > > > >>>>>> 	usb_stor_adjust_quirks(udev, &flags);
> > > > >>>>>
> > > > >>>>> I don't want to do this unless you can suggest an approach that won't 
> > > > >>>>> suddenly break all those old buggy drives.  Just because they are now 
> > > > >>>>> five years old or more doesn't mean they are no longer in use.
> > > > >>>>
> > > > >>>> Well, what do you propose then? A allow quirk for all new devices going forward?
> > > > >>>> Given that the user usually needs to actively run something like smartctl
> > > > >>>> manually on the drive I don’t see that this should cause too many issues.
> > > > >>>> I don’t have any non-supporting device - can we not just add them to the
> > > > >>>> quirk list when someone reports one?
> > > > >>>
> > > > >>> How about since you know your device works, you make the check detect
> > > > >>> your specific device and not apply the flag to it?  You should be able
> > > > >>> to do so based on the
> > > > >>
> > > > >> Sure, while that does not really solve this for all the other newer
> > > > >> Seagate drives other users might have at home, here is a patch
> > > > >> checking for this one USB product ID. I hope that is what you meant:
> > > > >>
> > > > >> Signed-off-by: René Rebe <rene@exactcode.com>
> > > > >>
> > > > >> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
> > > > >> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
> > > > >> @@ -113,5 +113,6 @@
> > > > >>  
> > > > >>  	/* All Seagate disk enclosures have broken ATA pass-through support */
> > > > >> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
> > > > >> +	if ((le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2) &&
> > > > >> +	    (le16_to_cpu(udev->descriptor.idProduct) != 0xab03))
> > > > >>  		flags |= US_FL_NO_ATA_1X;
> > > > >>  
> > > > >>
> > > > > 
> > > > > As I indicated in my other email which crossed with this one, please make this
> > > > > more generic, add a new US_FL_ATA_1X_OK flag and make the above code check that +
> > > > > add a new unusual_uas.h entry for your device setting the new flag.
> > > > > 
> > > > > Note there is no need to add support for the new flag to usb_stor_adjust_quirks()
> > > > > if a user overrides quirks for a device on the kernel commandline without specifying
> > > > > the "t" flag then the US_FL_NO_ATA_1X flag will already get cleared.
> > > > > 
> > > > > I deliberately put the:
> > > > > 
> > > > >         if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
> > > > >                 flags |= US_FL_NO_ATA_1X;
> > > > > 
> > > > > code before the usb_stor_adjust_quirks() call to allow users to override this
> > > > > from the kernel commandline.
> > > > 
> > > > p.s.
> > > > 
> > > > A "git log drivers/usb/storage/unusual_uas.h" quickly finds the commit which removed the
> > > > quirks which the generic Seagate check replaces. At that time there were US_FL_NO_ATA_1X
> > > > quirks for *9* different Seagate models present in unusual_uas.h and I assume someone
> > > > reporting a 10th model is what made me go for the just disable this for all Seagate
> > > > driver option.
> > > > 
> > > > See commit 92335ad9e895 ("uas: Remove US_FL_NO_ATA_1X unusual device entries for Seagate devices")
> > > > 
> > > > Also I did a quick websearch for the "Seagate Seven" and rather then the usual re-usable
> > > > drive-enclosure with a standard 2.5" or 3.5" drive in there, this seems to be a custom
> > > > model where the enclosure is actually integrated into the drive to make it smaller.
> > > > 
> > > > So I would not be surprised if this is using another chipset then their usual enclosures,
> > > > which would explain why it does have working ATA1x passthrough.
> > > 
> > > I would expect that more modern devices to work. Vendors usually
> > > linearly allocate their product ids for new devices, and we could
> > > allow list product ids higher than this Seven to unbreak more modern
> > > devices by default and limit the amount of device quirks needed?
> > 
> > Vendors do not allocate device ids that way at all, as there is no
> > requirement to do so.  I know of many vendors that seemingly use random
> > values from their product id space, so there is no guarantee that this
> > will work, sorry.
> 
> I did not say it is a requirement, just that they usually do speaking
> of just this Seagate case. What is wrong with using that to
> potentially significantly cut down the quirk list?

Because the down-side of this is if we guess wrong, we break things.

> > What is wrong with just allowing specific devices that you have tested
> > will work, to the list instead?  That's the safest way to handle this.
> 
> The problem is that out of the box it does not work for users, and
> normal users do not dive into the kernel code to find out and simply
> think their devices sucks. Even I for years thought the drive sucks,
> before I took a closer look. If you long term want more new devices in
> an allow list than the previous quirk list included (9 or 10 does not
> sound that many to me), ... whatever you prefer ,-) I would rather
> have 10 quirk disable list than potential many more white listed the
> next years to come. Maybe we shoudl simply restore the prevoius
> quirks.

No, let's explicitly add the devices that you know will work properly.
That way we default to a working system overall and do not cause
problems.

"first cause no harm" is a good mantra to follow...

thanks,

greg k-h
