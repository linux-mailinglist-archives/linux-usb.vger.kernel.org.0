Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9FC8EBDA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731238AbfHOMsZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:48:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:36956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfHOMsY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 08:48:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E2042084D;
        Thu, 15 Aug 2019 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565873303;
        bh=NCiJdr1vMhBC906bEb/ULDbBO7L3UNQu1IL+0iBh+Nk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DwnRLmy4aLJWSxyZhOhhj5IM7VGL+nBl6pDsGSQmE2dt4/ef/MdAPrI3nOtguDzAr
         vsQktBmx9vIvmdmdT4sbiRC+0nXq6fiG9JypSGGx5VTo87aNpX2qOmXcdmHCgb/hQO
         EETfHDz00OdSsfOFk7VJ8UOiOJ/mS0MFogDBKHsc=
Date:   Thu, 15 Aug 2019 14:48:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: rio500: Fix lockdep violation
Message-ID: <20190815124821.GA25619@kroah.com>
References: <20190808175859.GA16092@kroah.com>
 <Pine.LNX.4.44L0.1908081421140.1319-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1908081421140.1319-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 02:23:00PM -0400, Alan Stern wrote:
> On Thu, 8 Aug 2019, Greg KH wrote:
> 
> > On Thu, Aug 08, 2019 at 01:34:08PM -0400, Alan Stern wrote:
> > > The syzbot fuzzer found a lockdep violation in the rio500 driver:
> > > 
> > > 	======================================================
> > > 	WARNING: possible circular locking dependency detected
> > > 	5.3.0-rc2+ #23 Not tainted
> > > 	------------------------------------------------------
> > > 	syz-executor.2/20386 is trying to acquire lock:
> > > 	00000000772249c6 (rio500_mutex){+.+.}, at: open_rio+0x16/0xc0  
> > > 	drivers/usb/misc/rio500.c:64
> > > 
> > > 	but task is already holding lock:
> > > 	00000000d3e8f4b9 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
> > > 	drivers/usb/core/file.c:39
> > > 
> > > 	which lock already depends on the new lock.
> > > 
> > > The problem is that the driver's open_rio() routine is called while
> > > the usbcore's minor_rwsem is locked for reading, and it acquires the
> > > rio500_mutex; whereas conversely, probe_rio() and disconnect_rio()
> > > first acquire the rio500_mutex and then call usb_register_dev() or
> > > usb_deregister_dev(), which lock minor_rwsem for writing.
> > > 
> > > The correct ordering of acquisition should be: minor_rwsem first, then
> > > rio500_mutex (since the locking in open_rio() cannot be changed).
> > > Thus, the probe and disconnect routines should avoid holding
> > > rio500_mutex while doing their registration and deregistration.
> > > 
> > > This patch adjusts the code in those two routines to do just that.  It
> > > also relies on the fact that the probe and disconnect routines are
> > > protected by the device mutex, so the initial test of rio->present
> > > needs no extra locking.
> > > 
> > > Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
> > > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > > Fixes: d710734b0677 ("USB: rio500: simplify locking")
> > > CC: Oliver Neukum <oneukum@suse.com>
> > > CC: <stable@vger.kernel.org>
> > > 
> > > ---
> > > 
> > > This patch is different from the one I posted earlier.  I realized that 
> > > we don't want to register the device's char file until after the 
> > > buffers have been allocated.
> > 
> > Should I revert Oliver's patch?
> 
> Sorry, I should have explained more clearly: This goes on top of 
> Oliver's patch.  In fact, Oliver's patch is the one listed in the 
> Fixes: tag.
> 
> You do not need to apply Oliver's reversion.  Assuming he agrees that 
> this patch is correct, of course.

Ok, I applied the revert, and that's in 5.3-rc4.  So of course this does
not apply :)

Shoudl I revert the revert and then apply this?  I will if I can get an
ack from Oliver...

thanks,

greg k-h
