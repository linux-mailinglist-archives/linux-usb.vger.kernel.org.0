Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4881B8FB
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2019 16:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730838AbfEMOrf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 May 2019 10:47:35 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:53582 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730604AbfEMOrf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 May 2019 10:47:35 -0400
Received: (qmail 3884 invoked by uid 2102); 13 May 2019 10:47:34 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 May 2019 10:47:34 -0400
Date:   Mon, 13 May 2019 10:47:34 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+71f1e64501a309fcc012@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <gustavo@embeddedor.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <suwan.kim027@gmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: slab-out-of-bounds Write in usb_get_bos_descriptor
In-Reply-To: <00000000000086510e05888df8c8@google.com>
Message-ID: <Pine.LNX.4.44L0.1905131046130.1478-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 10 May 2019, syzbot wrote:

> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=124794d8a00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
> dashboard link: https://syzkaller.appspot.com/bug?extid=71f1e64501a309fcc012
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=176a53d0a00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+71f1e64501a309fcc012@syzkaller.appspotmail.com
> 
> usb 1-1: Using ep0 maxpacket: 8
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in usb_get_bos_descriptor+0x8be/0x8fb  
> drivers/usb/core/config.c:976
> Write of size 1 at addr ffff8880a48e38ec by task kworker/0:2/533

Insufficient descriptor size check.

Alan Stern


#syz test: https://github.com/google/kasan.git usb-fuzzer

 drivers/usb/core/config.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -932,8 +932,8 @@ int usb_get_bos_descriptor(struct usb_de
 
 	/* Get BOS descriptor */
 	ret = usb_get_descriptor(dev, USB_DT_BOS, 0, bos, USB_DT_BOS_SIZE);
-	if (ret < USB_DT_BOS_SIZE) {
-		dev_err(ddev, "unable to get BOS descriptor\n");
+	if (ret < USB_DT_BOS_SIZE || bos->bLength < USB_DT_BOS_SIZE) {
+		dev_err(ddev, "unable to get BOS descriptor or descriptor too short\n");
 		if (ret >= 0)
 			ret = -ENOMSG;
 		kfree(bos);


