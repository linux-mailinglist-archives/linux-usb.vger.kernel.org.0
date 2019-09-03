Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA82A75D2
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 22:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfICU6m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 16:58:42 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:33808 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726375AbfICU6m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 16:58:42 -0400
Received: (qmail 9141 invoked by uid 2102); 3 Sep 2019 16:58:41 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Sep 2019 16:58:41 -0400
Date:   Tue, 3 Sep 2019 16:58:41 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+35f4d916c623118d576e@syzkaller.appspotmail.com>
cc:     Thinh.Nguyen@synopsys.com, <andreyknvl@google.com>,
        <dianders@chromium.org>, <gregkh@linuxfoundation.org>,
        <jflat@chromium.org>, <kai.heng.feng@canonical.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <malat@debian.org>, <mathias.nyman@linux.intel.com>,
        <nsaenzjulienne@suse.de>, <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: slab-out-of-bounds Read in usb_reset_and_verify_device
In-Reply-To: <0000000000007c1f820591ab8105@google.com>
Message-ID: <Pine.LNX.4.44L0.1909031654240.1859-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 3 Sep 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> KASAN: slab-out-of-bounds Read in usb_reset_and_verify_device
> 
> usb 4-1: Using ep0 maxpacket: 16
> usb 4-1: Old BOS ffff8881d516b780  Len 0xa8
> usb 4-1: New BOS ffff8881d5dd6d20  Len 0xa8
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in memcmp+0xa6/0xb0 lib/string.c:904
> Read of size 1 at addr ffff8881d5dd6db6 by task kworker/0:1/12

More debugging.  If my guess is right, this is pretty malicious...

Alan Stern

#syz test: https://github.com/google/kasan.git eea39f24

 drivers/usb/core/config.c |    2 ++
 drivers/usb/core/hub.c    |    7 +++++++
 2 files changed, 9 insertions(+)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -5721,6 +5721,13 @@ static int usb_reset_and_verify_device(s
 	if (ret < 0)
 		goto re_enumerate;
 
+	if (bos)
+		dev_info(&udev->dev, "Old BOS %px  Len 0x%x\n",
+			bos, le16_to_cpu(bos->desc->wTotalLength));
+	if (udev->bos)
+		dev_info(&udev->dev, "New BOS %px  Len 0x%x\n",
+			udev->bos, le16_to_cpu(udev->bos->desc->wTotalLength));
+
 	/* Device might have changed firmware (DFU or similar) */
 	if (descriptors_changed(udev, &descriptor, bos)) {
 		dev_info(&udev->dev, "device firmware changed\n");
Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -966,6 +966,8 @@ int usb_get_bos_descriptor(struct usb_de
 			ret = -ENOMSG;
 		goto err;
 	}
+	dev_info(ddev, "BOS total length %d, descriptor %d\n", total_len,
+		le16_to_cpu(dev->bos->desc->wTotalLength));
 	total_len -= length;
 
 	for (i = 0; i < num; i++) {

