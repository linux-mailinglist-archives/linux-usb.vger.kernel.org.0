Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0B2FC10
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 17:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfD3PAP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 11:00:15 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35620 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726050AbfD3PAO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 11:00:14 -0400
Received: (qmail 3262 invoked by uid 2102); 30 Apr 2019 11:00:13 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Apr 2019 11:00:13 -0400
Date:   Tue, 30 Apr 2019 11:00:13 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING: Support for this device (Terratec Grabster AV400) is
 experimental.
In-Reply-To: <0000000000004101370587c052fb@google.com>
Message-ID: <Pine.LNX.4.44L0.1904301058150.1465-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 30 Apr 2019, syzbot wrote:

> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    9a33b369 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=141ca62d200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
> dashboard link: https://syzkaller.appspot.com/bug?extid=af8f8d2ac0d39b0ed3a0
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1405bedd200000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ce3bbb200000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com
> 
> usb 1-1: New USB device found, idVendor=0ccd, idProduct=0039, bcdDevice=  
> d.3c
> usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 1-1: config 0 descriptor??
> pvrusb2: Hardware description: Terratec Grabster AV400
> pvrusb2: **********
> pvrusb2: WARNING: Support for this device (Terratec Grabster AV400) is  
> experimental.
> pvrusb2: Important functionality might not be entirely working.
> pvrusb2: Please consider contacting the driver author to help with further  
> stabilization of the driver.
> pvrusb2: **********
> 
> 
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.

This does seem like a bug in syzbot.  Why does it think this pr_info() 
output indicates a crash?  Is it fooled by the capitalized "WARNING" at 
the start of one of the lines?

Alan Stern

