Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5A141971F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Sep 2021 17:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235004AbhI0PFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Sep 2021 11:05:41 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51685 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234991AbhI0PFj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Sep 2021 11:05:39 -0400
Received: (qmail 361986 invoked by uid 1000); 27 Sep 2021 11:04:00 -0400
Date:   Mon, 27 Sep 2021 11:04:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc:     Tobias Jakobi <cubic2k@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: storage: add quirks for VIA VL817 USB3-SATA bridge
Message-ID: <20210927150400.GA361082@rowland.harvard.edu>
References: <20210921101752.4679-1-tjakobi@math.uni-bielefeld.de>
 <20210921151323.GA170347@rowland.harvard.edu>
 <cfb2d4e4-0e6a-69d5-01ac-dc1ab4d9d319@math.uni-bielefeld.de>
 <20210921164221.GA172450@rowland.harvard.edu>
 <609b10d0-7a20-ffa2-b283-67e0e91c7909@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <609b10d0-7a20-ffa2-b283-67e0e91c7909@math.uni-bielefeld.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 26, 2021 at 08:14:46PM +0200, Tobias Jakobi wrote:
> Hello Alan,
> 
> On 9/21/21 6:42 PM, Alan Stern wrote:
> > On Tue, Sep 21, 2021 at 06:06:45PM +0200, Tobias Jakobi wrote:
> > > Hi Alan,
> > > 
> > > sorry but your analysis of the log is wrong. Nothing was disconnected or
> > > unplugged when the device behaves this way. The enclosure is connected to
> > > the power the entire time, and the same applies to the physical USB
> > > connection to my system.
> > That may be so, but if it is then the log extract you included with the
> > patch is very misleading.  For instance, you didn't include any part of
> > the log before and leading up to the line saying "usb 2-1.2: USB
> > disconnect, device number 4".  Thus there is no way for the reader to
> > tell what caused this event, whether it was a physical unplug or not.
> 
> I included the part of the kernel log which shows how the issue manifests
> itself. Do you think I'm so stupid as to believe I could prevent a physical
> unplug of the enclosure by blacklisting UAS? Really, this is getting
> ridiculous...

No, I don't believe that.  However, I do believe you are so stupid as 
to post a patch with a description that does not justify it and 
includes a lot of irrelevant details.  (Hey, you brought up the issue 
of how stupid you are!  :-)

> > > To make things very clear: This happens in under five minutes after having
> > > powered up the enclosure and starting a file transfer to the installed RAID.
> > > After blacklisting UASP the enclosure works perfectly fine for hours. I hope
> > > this clears things up.
> > You didn't answer my question about using NO_ATA_1X instead of
> > IGNORE_UAS.  This is a perfect example of one of the dangers of
> > top-posting -- it makes it far too easy for people to miss important
> > points in the email they are replying to.  (Hint: Don't top-post!)
> 
> I did not answer this question, because I didn't have the answer to it yet.
> I have tested your suggestion today, but sadly I'm running into the same
> type of problem with NO_ATA_1X. You can find the complete kernel log here:
> https://www.math.uni-bielefeld.de/~tjakobi/archive/dmesg_VL817.log

Good, thank you.  Unfortunately the log doesn't include any smoking 
guns pointing to an underlying cause.

> The RAID1 is broken after such an event.
> 
> With best wishes,
> Tobias
> 
> 
> > 
> > Alan Stern
> > 
> > > With best wishes,
> > > Tobias
> > > 
> > > On 9/21/21 5:13 PM, Alan Stern wrote:
> > > > On Tue, Sep 21, 2021 at 12:17:52PM +0200, Tobias Jakobi wrote:
> > > > > The VL817 is used in the RaidSonic Icy Box IB-3740-C31 enclosure. The enclosure
> > > > > is advertised as having UASP support, but appears to have problems with 4Kn
> > > > > drives (test was done with two Seagate Exos X, 12TB).
> > > > > 
> > > > > Disable UAS for the VL817 as it behaves highly unstable:

I still have to wonder if the enclosure works okay with other types of 
disk drive.  And if it doesn't, why don't these errors show up on 
Windows systems?  Or on other VIA enclosures?

That's why I'm cautious about accepting this patch.  I don't want to 
slow down unnecessarily a bunch of USB disks that could work just fine 
at the higher UAS transfer rates.

By the way, does the enclosure have its own power source, or does it 
rely entirely on power provided over the USB cable?  Note that UAS can 
use more power than the older mass-storage protocols, because it queues 
more operations in rapid succession (which is also why it runs faster).

Alan Stern
