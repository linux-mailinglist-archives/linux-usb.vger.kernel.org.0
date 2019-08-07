Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E666884E3A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 16:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387670AbfHGOHR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 10:07:17 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42468 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729968AbfHGOHR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 10:07:17 -0400
Received: (qmail 2698 invoked by uid 2102); 7 Aug 2019 10:07:16 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Aug 2019 10:07:16 -0400
Date:   Wed, 7 Aug 2019 10:07:16 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     syzbot <syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com>,
        <miquel@df.uba.ar>, <andreyknvl@google.com>,
        <syzkaller-bugs@googlegroups.com>, <gregkh@linuxfoundation.org>,
        <rio500-users@lists.sourceforge.net>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: possible deadlock in open_rio
In-Reply-To: <1565185044.15973.0.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1908071002310.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 7 Aug 2019, Oliver Neukum wrote:

> Am Dienstag, den 06.08.2019, 15:13 -0400 schrieb Alan Stern:
> > On Thu, 1 Aug 2019, syzbot wrote:
> > 
> > > Hello,
> > > 
> > > syzbot found the following crash on:
> > > 
> > > HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=136b6aec600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=7bbcbe9c9ff0cd49592a
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > 
> > > Unfortunately, I don't have any reproducer for this crash yet.
> > > 
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
> > > 
> > > ======================================================
> > > WARNING: possible circular locking dependency detected
> > > 5.3.0-rc2+ #23 Not tainted
> > > ------------------------------------------------------
> > 
> > Andrey:
> > 
> > This should be completely reproducible, since it's a simple ABBA
> > locking violation.  Maybe just introducing a time delay (to avoid races
> > and give the open() call time to run) between the gadget creation and
> > gadget removal would be enough to do it.
> 
> Hi,
> 
> technically yes. However in practical terms the straight revert I sent
> out yesterday should fix it.

I didn't see the revert, and it doesn't appear to have reached the 
mailing list archive.  Can you post it again?

Alan Stern

PS: syzbot reported a similar lock inversion problem (involving two
mutexes rather than just one) in drivers/usb/misc/iowarrior.c.  
Probably the two drivers need similar fixes.

