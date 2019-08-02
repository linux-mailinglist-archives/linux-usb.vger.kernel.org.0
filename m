Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78435801FB
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 22:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437036AbfHBUvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 16:51:19 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42172 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726999AbfHBUvT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Aug 2019 16:51:19 -0400
Received: (qmail 6861 invoked by uid 2102); 2 Aug 2019 16:51:18 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Aug 2019 16:51:18 -0400
Date:   Fri, 2 Aug 2019 16:51:18 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>,
        syzbot <syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, <miquel@df.uba.ar>,
        <rio500-users@lists.sourceforge.net>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: possible deadlock in open_rio
In-Reply-To: <00000000000088af91058f0fe377@google.com>
Message-ID: <Pine.LNX.4.44L0.1908021647090.1645-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 1 Aug 2019, syzbot wrote:

> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=136b6aec600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> dashboard link: https://syzkaller.appspot.com/bug?extid=7bbcbe9c9ff0cd49592a
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> 
> Unfortunately, I don't have any reproducer for this crash yet.
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 5.3.0-rc2+ #23 Not tainted
> ------------------------------------------------------
> syz-executor.2/20386 is trying to acquire lock:
> 00000000772249c6 (rio500_mutex){+.+.}, at: open_rio+0x16/0xc0  
> drivers/usb/misc/rio500.c:64
> 
> but task is already holding lock:
> 00000000d3e8f4b9 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
> drivers/usb/core/file.c:39
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #1 (minor_rwsem){++++}:
>         down_write+0x92/0x150 kernel/locking/rwsem.c:1500
>         usb_register_dev drivers/usb/core/file.c:187 [inline]
>         usb_register_dev+0x131/0x6a0 drivers/usb/core/file.c:156
>         probe_rio.cold+0x53/0x21d drivers/usb/misc/rio500.c:468

This was caused by Oliver's commit 3864d33943b4 ("USB: rio500: refuse 
more than one device at a time").  It added

	mutex_lock(&rio500_mutex);

to probe_rio().  I guess it will be necessary to add another mutex to 
fix this.

Alan Stern

