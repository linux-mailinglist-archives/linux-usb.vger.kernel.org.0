Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D54E3A79
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 19:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394107AbfJXR5e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 13:57:34 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:59672 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2392747AbfJXR5e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 13:57:34 -0400
Received: (qmail 2715 invoked by uid 2102); 24 Oct 2019 13:57:33 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Oct 2019 13:57:33 -0400
Date:   Thu, 24 Oct 2019 13:57:33 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     syzbot <syzbot+8ab8bf161038a8768553@syzkaller.appspotmail.com>,
        "Jacky . Cao @ sony . com" <Jacky.Cao@sony.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: divide error in dummy_timer
In-Reply-To: <CAAeHK+xHTtkSRkMv5kV1hKcR3mhTPkyfUparka3oRBSs6U8yLQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1910241336130.1318-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 24 Oct 2019, Andrey Konovalov wrote:

> > Is this really the sort of thing we need to catch?  It isn't a bug in
> > any existing kernel code, as far as I know.  Maybe only gadgetfs and
> > configfs need to worry about it.
> 
> Hi Alan,
> 
> Do you mean that the gadget driver must ensure that the max packet
> size in the endpoint descriptor is not zero? Do HCDs rely on that? I
> can add this check into the driver we use for USB fuzzing.

Well, if there are any gadget drivers in the kernel which do set an
endpoint's maxpacket size to 0, they should be fixed.  I'm not aware of
any.

Of course, gadget drivers in userspace are always suspect.  That's why
I suggested having gadgetfs and configfs perform this check.  Even so
it's not really a _security_ risk, because only the superuser is
allowed to run a userspace gadget driver.  (Although obviously it is 
better to have a clean failure than to crash the system when a buggy 
program runs with superuser privileges.)

Yes, HCDs do depend on endpoints having reasonable maxpacket values.  I 
suppose the core should check for this.  Currently we check for values 
that are too large or invalid in other ways (like high-speed bulk 
endpoints with maxpacket != 512), but we don't check for 0.

In fact, that sounds like a much better solution to the problem
overall.  Let's see if this patch fixes the bug...

Alan Stern

#syz test: https://github.com/google/kasan.git 22be26f7

 drivers/usb/core/config.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -348,6 +348,11 @@ static int usb_parse_endpoint(struct dev
 
 	/* Validate the wMaxPacketSize field */
 	maxp = usb_endpoint_maxp(&endpoint->desc);
+	if (maxp == 0) {
+		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has wMaxPacketSize 0, skipping\n",
+		    cfgno, inum, asnum, d->bEndpointAddress);
+		goto skip_to_next_endpoint_or_interface_descriptor;
+	}
 
 	/* Find the highest legal maxpacket size for this endpoint */
 	i = 0;		/* additional transactions per microframe */

