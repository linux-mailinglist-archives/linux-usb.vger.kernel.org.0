Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DB1FB53
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfD3OXt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:23:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:49340 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726362AbfD3OXt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Apr 2019 10:23:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 64199AD6B;
        Tue, 30 Apr 2019 14:23:48 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, miquel@df.uba.ar,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/3] rio500: refuse more than one device at a time
Date:   Tue, 30 Apr 2019 16:23:24 +0200
Message-Id: <20190430142326.25815-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This driver is using a global variable. It cannot handle more than
one device at a time. The issue has been exisying since the dawn
of the driver.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: syzbot+35f04d136fc975a70da4@syzkaller.appspotmail.com
---
 drivers/usb/misc/rio500.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/rio500.c b/drivers/usb/misc/rio500.c
index 13e4889bc34f..a4b6fbea975f 100644
--- a/drivers/usb/misc/rio500.c
+++ b/drivers/usb/misc/rio500.c
@@ -449,7 +449,12 @@ static int probe_rio(struct usb_interface *intf,
 	struct rio_usb_data *rio = &rio_instance;
 	int retval;
 
-	dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
+	if (rio->present) {
+		dev_info(&intf->dev, "Second USB Rio at address %d refused\n", dev->devnum);
+		return -EBUSY;
+	} else {
+		dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
+	}
 
 	retval = usb_register_dev(intf, &usb_rio_class);
 	if (retval) {
-- 
2.16.4

