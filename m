Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A5924EDB0
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 16:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgHWOry (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 10:47:54 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37597 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725996AbgHWOrx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Aug 2020 10:47:53 -0400
Received: (qmail 304250 invoked by uid 1000); 23 Aug 2020 10:47:52 -0400
Date:   Sun, 23 Aug 2020 10:47:52 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Cyril Roelandt <tipecaml@gmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com, brice.goglin@gmail.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200823144752.GB303967@rowland.harvard.edu>
References: <20200417220957.GA4707@Susan>
 <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
 <20200421030137.GA2492@Susan>
 <20200815001829.GA2786@Susan>
 <20200815021929.GC52242@rowland.harvard.edu>
 <20200815232357.GB2786@Susan>
 <20200816162642.GC86937@rowland.harvard.edu>
 <20200818041324.GA3173@Susan>
 <20200818145722.GA146472@rowland.harvard.edu>
 <20200823013025.GA11449@Susan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823013025.GA11449@Susan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 23, 2020 at 03:30:25AM +0200, Cyril Roelandt wrote:
> Hello,
> 
> On 2020-08-18 10:57, Alan Stern wrote:
> > Somehow that commit is causing usb-storage to go crazy.  You're going
> > to have to do some debugging to find out why.
> > 
> > Here's what to look for in drivers/usb/storage/usb.c:
> > 
> > 	Is storage_probe() getting called at all?
> 
> Yes.
> 
> > 
> > 	If it is, it doesn't seem to get as far as calling
> > 	usb_stor_probe1().  Can you find out where it goes off the
> > 	rails and why?
> 
> Yes. I added a bunch of calls to printk[1] and noticed the following new
> lines in dmesg:
> 
> [Fri Aug 21 23:02:42 2020] [+] Entering storage_probe
> [Fri Aug 21 23:02:42 2020] [+] Using uas driver
> 
> So basically, the kernel realizes that UAS cannot be used, tries to use
> usb-storage instead, and then usb-storage says "well, this device should
> be using UAS, I'm not going to handle it". Somehow, we forget that UAS
> is broken for this device along the way.
> 
> I commented out the call to uas_use_uas_driver()[2] and was able to see
> my partitions, mount them, read and write data. Everything works as
> expected.
> 
> Do you have any idea why usb-storage may be led to believe UAS is
> suitable for this enclosure?

Yes; it looks like the problem is that there are entries for this device 
in both unusual_devs.h and unusual_uas.h -- and it doesn't help that the 
two entries aren't identical.

The unusual_devs.h entry tells usb-storage not to use FUA, but it 
doesn't rule out the uas driver.  And since the device claims to support 
UAS, usb-storage bows out.  But then the unusual_uas.h entry tells uas 
not to handle the drive, so the end result is that it doesn't get 
handled at all.

To fix the immediate problem you should add the US_FL_IGNORE_UAS flag to 
the entry in unusual_devs.h.

Alan Stern
