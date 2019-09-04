Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C899BA88EE
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730981AbfIDOlI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 10:41:08 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46818 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729993AbfIDOlH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 10:41:07 -0400
Received: (qmail 3843 invoked by uid 2102); 4 Sep 2019 10:41:06 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Sep 2019 10:41:06 -0400
Date:   Wed, 4 Sep 2019 10:41:06 -0400 (EDT)
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
In-Reply-To: <000000000000b580440591ac8df5@google.com>
Message-ID: <Pine.LNX.4.44L0.1909041038340.1722-100000@iolanthe.rowland.org>
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
> usb 6-1: Using ep0 maxpacket: 16
> usb 6-1: BOS total length 54, descriptor 168
> usb 6-1: Old BOS ffff8881cd814f60  Len 0xa8
> usb 6-1: New BOS ffff8881cd257ae0  Len 0xa8
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in memcmp+0xa6/0xb0 lib/string.c:904
> Read of size 1 at addr ffff8881cd257c36 by task kworker/1:0/17

Very sneaky!  A BOS descriptor whose wTotalLength field varies
depending on how many bytes you read.

This should fix it.  It's the same approach we use for the Config 
descriptor.

Alan Stern

#syz test: https://github.com/google/kasan.git eea39f24

 drivers/usb/core/config.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -921,7 +921,7 @@ int usb_get_bos_descriptor(struct usb_de
 	struct usb_bos_descriptor *bos;
 	struct usb_dev_cap_header *cap;
 	struct usb_ssp_cap_descriptor *ssp_cap;
-	unsigned char *buffer;
+	unsigned char *buffer, *buffer0;
 	int length, total_len, num, i, ssac;
 	__u8 cap_type;
 	int ret;
@@ -966,10 +966,12 @@ int usb_get_bos_descriptor(struct usb_de
 			ret = -ENOMSG;
 		goto err;
 	}
+
+	buffer0 = buffer;
 	total_len -= length;
+	buffer += length;
 
 	for (i = 0; i < num; i++) {
-		buffer += length;
 		cap = (struct usb_dev_cap_header *)buffer;
 
 		if (total_len < sizeof(*cap) || total_len < cap->bLength) {
@@ -983,8 +985,6 @@ int usb_get_bos_descriptor(struct usb_de
 			break;
 		}
 
-		total_len -= length;
-
 		if (cap->bDescriptorType != USB_DT_DEVICE_CAPABILITY) {
 			dev_warn(ddev, "descriptor type invalid, skip\n");
 			continue;
@@ -1019,7 +1019,11 @@ int usb_get_bos_descriptor(struct usb_de
 		default:
 			break;
 		}
+
+		total_len -= length;
+		buffer += length;
 	}
+	dev->bos->desc->wTotalLength = cpu_to_le16(buffer - buffer0);
 
 	return 0;
 

