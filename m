Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5CC4CE67D
	for <lists+linux-usb@lfdr.de>; Sat,  5 Mar 2022 19:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbiCES7s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Mar 2022 13:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiCES7r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Mar 2022 13:59:47 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AB9BF8093B
        for <linux-usb@vger.kernel.org>; Sat,  5 Mar 2022 10:58:56 -0800 (PST)
Received: (qmail 1360486 invoked by uid 1000); 5 Mar 2022 13:58:55 -0500
Date:   Sat, 5 Mar 2022 13:58:55 -0500
From:   "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To:     syzbot <syzbot+348b571beb5eeb70a582@syzkaller.appspotmail.com>
Cc:     "Zhang, Qiang1" <qiang1.zhang@intel.com>,
        "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [syzbot] KASAN: use-after-free Read in dev_uevent
Message-ID: <YiOy73F0J31b8uPj@rowland.harvard.edu>
References: <0000000000005a991a05a86970bb@google.com>
 <00000000000033314805d8765175@google.com>
 <PH0PR11MB58805E3C4CF7D4C41D49BFCFDA3C9@PH0PR11MB5880.namprd11.prod.outlook.com>
 <YhYafwiwUV2Sbn5t@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhYafwiwUV2Sbn5t@kroah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 23, 2022 at 12:29:03PM +0100, gregkh@linuxfoundation.org wrote:
> On Wed, Feb 23, 2022 at 11:17:07AM +0000, Zhang, Qiang1 wrote:
> > 
> > syzbot has found a reproducer for the following issue on:
> > 
> > HEAD commit:    4f12b742eb2b Merge tag 'nfs-for-5.17-3' of git://git.linux..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=110a6df2700000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=f6a069ed94a1ed1d
> > dashboard link: https://syzkaller.appspot.com/bug?extid=348b571beb5eeb70a582
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12377296700000
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+348b571beb5eeb70a582@syzkaller.appspotmail.com
> > 
> > ==================================================================
> > BUG: KASAN: use-after-free in dev_uevent+0x712/0x780 drivers/base/core.c:2320 Read of size 8 at addr ffff88802b934098 by task udevd/3689
> > 
> > CPU: 2 PID: 3689 Comm: udevd Not tainted 5.17.0-rc4-syzkaller-00229-g4f12b742eb2b #0 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014 Call Trace:
> >  <TASK>
> >  __dump_stack lib/dump_stack.c:88 [inline]
> >  dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
> >  print_address_description.constprop.0.cold+0x8d/0x303 mm/kasan/report.c:255  __kasan_report mm/kasan/report.c:442 [inline]  kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
> >  dev_uevent+0x712/0x780 drivers/base/core.c:2320
> >  uevent_show+0x1b8/0x380 drivers/base/core.c:2391
> >  dev_attr_show+0x4b/0x90 drivers/base/core.c:2094

If the uevent file being read was for the gadget rather than the udc, 
this should fix the problem.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v5.17-rc4

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1436,7 +1436,6 @@ static void usb_gadget_remove_driver(str
 	usb_gadget_udc_stop(udc);
 
 	udc->driver = NULL;
-	udc->dev.driver = NULL;
 	udc->gadget->dev.driver = NULL;
 }
 
@@ -1498,7 +1497,6 @@ static int udc_bind_to_driver(struct usb
 			driver->function);
 
 	udc->driver = driver;
-	udc->dev.driver = &driver->driver;
 	udc->gadget->dev.driver = &driver->driver;
 
 	usb_gadget_udc_set_speed(udc, driver->max_speed);
@@ -1521,7 +1519,6 @@ err1:
 		dev_err(&udc->dev, "failed to start %s: %d\n",
 			udc->driver->function, ret);
 	udc->driver = NULL;
-	udc->dev.driver = NULL;
 	udc->gadget->dev.driver = NULL;
 	return ret;
 }

