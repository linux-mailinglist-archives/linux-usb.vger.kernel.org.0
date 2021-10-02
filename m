Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4814E41FC9B
	for <lists+linux-usb@lfdr.de>; Sat,  2 Oct 2021 16:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbhJBO4g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Oct 2021 10:56:36 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44733 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229560AbhJBO4e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Oct 2021 10:56:34 -0400
Received: (qmail 533794 invoked by uid 1000); 2 Oct 2021 10:54:47 -0400
Date:   Sat, 2 Oct 2021 10:54:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc:     Tobias Jakobi <cubic2k@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: storage: add quirks for VIA VL817 USB3-SATA bridge
Message-ID: <20211002145447.GA533451@rowland.harvard.edu>
References: <20210921101752.4679-1-tjakobi@math.uni-bielefeld.de>
 <20210921151323.GA170347@rowland.harvard.edu>
 <cfb2d4e4-0e6a-69d5-01ac-dc1ab4d9d319@math.uni-bielefeld.de>
 <20210921164221.GA172450@rowland.harvard.edu>
 <609b10d0-7a20-ffa2-b283-67e0e91c7909@math.uni-bielefeld.de>
 <20210927150400.GA361082@rowland.harvard.edu>
 <c4d2ed9c-0aea-e0f5-7f9a-d603ffd26df5@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d2ed9c-0aea-e0f5-7f9a-d603ffd26df5@math.uni-bielefeld.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 01, 2021 at 10:36:59PM +0200, Tobias Jakobi wrote:
> On 9/27/21 5:04 PM, Alan Stern wrote:
> 
> > Good, thank you.  Unfortunately the log doesn't include any smoking
> > guns pointing to an underlying cause.
> 
> I'm open to suggestions regarding identifying the cause. As you might
> guess, I'm also not happy that I had to disable UAS for the enclosure -- in
> particular since I selected this particular product because it was
> advertised with having support.

One thing you might try is to capture a usbmon trace showing what 
happens, starting from when the USB cable is attached up to the point 
when the failure occurs.  However, I'm doubtful that the trace will 
show anything useful, since the kernel log indicated that the first 
failed command was an ordinary write.

> > I still have to wonder if the enclosure works okay with other types of
> > disk drive.  And if it doesn't, why don't these errors show up on
> > Windows systems?  Or on other VIA enclosures?
> 
> I only experienced this after installing the two 4Kn drives, never with the
> two 512e drives that were installed first. My guess is that 4Kn drives are
> still rare and if they're used, then natively attached to a SATA port. I
> don't have any Windows system here to test this, and even if, I wouldn't
> know how to assemble the RAID1 there anyway.

It's entirely possible that this failure has nothing to do with the 
use of RAID.

> > That's why I'm cautious about accepting this patch.  I don't want to
> > slow down unnecessarily a bunch of USB disks that could work just fine
> > at the higher UAS transfer rates.
> 
> I understand. If that's the case, I'm just going to continue to keep the
> patch in my local kernel tree.

You don't even need a patch; you can accomplish the same effect 
simply by specifying a module parameter for usb-storage:

	quirks=2109:0715:u

(You might have to rebuild your initramfs image, if you need the 
quirk to take effect during the early stages of boot-up.)

> > By the way, does the enclosure have its own power source, or does it
> > rely entirely on power provided over the USB cable?  Note that UAS can
> > use more power than the older mass-storage protocols, because it queues
> > more operations in rapid succession (which is also why it runs faster).
> 
> This is the enclosure:
> https://icybox.de/product.php?id=155
> 
> It has a external power supply (quite a bulky one) and it does not work
> without it. So it doesn't draw anything (significant) from the USB cable. I
> first also suspected this to be a power supply related problem, but I
> discarded that idea since the whole thing works as MSC. I can't imagine the
> power draw to be so much different for UAS, but maybe I'm just naive there.

Yeah, you might be surprised.  There have been other instances of 
people submitting patches to disable UAS for their drives, when it 
seemed quite likely that lack of power was the underlying cause.  
Although to be fair, these occurred in very power-constrained 
situations, such as running a bus-powered drive attached to a 
Raspberry Pi.  Not like your case.  Still, you see why I had to ask.

Alan Stern
