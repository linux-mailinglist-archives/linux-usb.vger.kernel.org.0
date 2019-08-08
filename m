Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C027B86470
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 16:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732855AbfHHOfz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 10:35:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:38552 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727649AbfHHOfz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 10:35:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 87DBDACC6;
        Thu,  8 Aug 2019 14:35:54 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: cdc-acm: make sure a refcount is taken early enough
Date:   Thu,  8 Aug 2019 16:21:19 +0200
Message-Id: <20190808142119.7998-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

destroy() will decrement the refcount on the interface, so that
it needs to be taken so early that it never undercounts.

Fixes: 7fb57a019f94e ("USB: cdc-acm: Fix potential deadlock (lockdep warning)")
Reported-and-tested-by: syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-acm.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 183b41753c98..62f4fb9b362f 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1301,10 +1301,6 @@ static int acm_probe(struct usb_interface *intf,
 	tty_port_init(&acm->port);
 	acm->port.ops = &acm_port_ops;
 
-	minor = acm_alloc_minor(acm);
-	if (minor < 0)
-		goto alloc_fail1;
-
 	ctrlsize = usb_endpoint_maxp(epctrl);
 	readsize = usb_endpoint_maxp(epread) *
 				(quirks == SINGLE_RX_URB ? 1 : 2);
@@ -1312,6 +1308,13 @@ static int acm_probe(struct usb_interface *intf,
 	acm->writesize = usb_endpoint_maxp(epwrite) * 20;
 	acm->control = control_interface;
 	acm->data = data_interface;
+
+	usb_get_intf(acm->control); /* undone in destruct() */
+
+	minor = acm_alloc_minor(acm);
+	if (minor < 0)
+		goto alloc_fail1;
+
 	acm->minor = minor;
 	acm->dev = usb_dev;
 	if (h.usb_cdc_acm_descriptor)
@@ -1458,7 +1461,6 @@ static int acm_probe(struct usb_interface *intf,
 	usb_driver_claim_interface(&acm_driver, data_interface, acm);
 	usb_set_intfdata(data_interface, acm);
 
-	usb_get_intf(control_interface);
 	tty_dev = tty_port_register_device(&acm->port, acm_tty_driver, minor,
 			&control_interface->dev);
 	if (IS_ERR(tty_dev)) {
-- 
2.16.4

