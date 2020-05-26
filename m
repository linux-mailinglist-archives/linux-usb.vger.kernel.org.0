Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B410019C5FA
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 17:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389332AbgDBPfZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 11:35:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55853 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388931AbgDBPfZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 11:35:25 -0400
Received: (qmail 21183 invoked by uid 500); 2 Apr 2020 11:35:24 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Apr 2020 11:35:24 -0400
Date:   Thu, 2 Apr 2020 11:35:23 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <ingrassia@epigenesys.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
In-Reply-To: <0000000000001873a005a240d114@google.com>
Message-ID: <Pine.LNX.4.44L0.2004021133440.13377-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 1 Apr 2020, syzbot wrote:

> syzbot has found a reproducer for the following crash on:
> 
> HEAD commit:    0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=12aa8567e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
> dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1342740be00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> usb 2-1: BOGUS urb xfer, pipe 2 != type 2
> WARNING: CPU: 0 PID: 9241 at drivers/usb/core/urb.c:478 usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478

At last!  Let's get some more information about this...

Alan Stern

#syz test: https://github.com/google/kasan.git 0fa84af8

Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -475,8 +475,9 @@ int usb_submit_urb(struct urb *urb, gfp_
 
 	/* Check that the pipe's type matches the endpoint's type */
 	if (usb_urb_ep_type_check(urb))
-		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
-			usb_pipetype(urb->pipe), pipetypes[xfertype]);
+		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x, ep addr 0x%02x, pipe 0x%x, xfertype %d\n",
+			usb_pipetype(urb->pipe), pipetypes[xfertype],
+			ep->desc.bEndpointAddress, urb->pipe, xfertype);
 
 	/* Check against a simple/standard policy */
 	allowed = (URB_NO_TRANSFER_DMA_MAP | URB_NO_INTERRUPT | URB_DIR_MASK |

