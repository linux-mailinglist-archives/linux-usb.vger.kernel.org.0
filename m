Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0FC0189EE
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 14:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfEIMmZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 08:42:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:49198 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726054AbfEIMmY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 May 2019 08:42:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BA5D8AB92;
        Thu,  9 May 2019 12:42:23 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     thomas@winischhofer.net, gregKH@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2] USB: sisusbvga: fix oops in error path of sisusb_probe
Date:   Thu,  9 May 2019 14:41:50 +0200
Message-Id: <20190509124150.31867-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pointer used to log a failure of usb_register_dev() must
be set before the error is logged.

v2: fix that minor is not available before registration

Signed-off-by: oliver Neukum <oneukum@suse.com>
Reported-by: syzbot+a0cbdbd6d169020c8959@syzkaller.appspotmail.com
Fixes: 7b5cd5fefbe02 ("USB: SisUSB2VGA: Convert printk to dev_* macros")
---
 drivers/usb/misc/sisusbvga/sisusb.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 9560fde621ee..ea06f1fed6fa 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -3029,6 +3029,13 @@ static int sisusb_probe(struct usb_interface *intf,
 
 	mutex_init(&(sisusb->lock));
 
+	sisusb->sisusb_dev = dev;
+	sisusb->vrambase   = SISUSB_PCI_MEMBASE;
+	sisusb->mmiobase   = SISUSB_PCI_MMIOBASE;
+	sisusb->mmiosize   = SISUSB_PCI_MMIOSIZE;
+	sisusb->ioportbase = SISUSB_PCI_IOPORTBASE;
+	/* Everything else is zero */
+
 	/* Register device */
 	retval = usb_register_dev(intf, &usb_sisusb_class);
 	if (retval) {
@@ -3039,13 +3046,7 @@ static int sisusb_probe(struct usb_interface *intf,
 		goto error_1;
 	}
 
-	sisusb->sisusb_dev = dev;
-	sisusb->minor      = intf->minor;
-	sisusb->vrambase   = SISUSB_PCI_MEMBASE;
-	sisusb->mmiobase   = SISUSB_PCI_MMIOBASE;
-	sisusb->mmiosize   = SISUSB_PCI_MMIOSIZE;
-	sisusb->ioportbase = SISUSB_PCI_IOPORTBASE;
-	/* Everything else is zero */
+	sisusb->minor = intf->minor;
 
 	/* Allocate buffers */
 	sisusb->ibufsize = SISUSB_IBUF_SIZE;
-- 
2.16.4

