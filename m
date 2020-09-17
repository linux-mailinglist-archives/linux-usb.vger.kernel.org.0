Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C368426D9CE
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 13:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgIQLET (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 07:04:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:47836 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbgIQLDR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 07:03:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600340570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=aRuNZn9DZq04RhZrasixWm1rwDIXQsQVN4YYKiZ1FbQ=;
        b=NMQI8nS5SMa2WQOoxEn10W8j9sIrGWPU32Gx7jy6OmwVTMFEjv5ksUZcTHafAtzfdvEdQ+
        dSGPZC++MlhTpdlz4djBbVB60CzBmxbSXC0I/KFOEYt0NOpxhieuPXCZTLef0o9qv9+8Q2
        /vk/BVwWKtlX+TTxgvrcj06p/MzRIxdUvESKGd955NMc62dw//pNaXWnMxw4MqeTO1FmsT
        fJlhJtTQtjVBvEunLnx4amvU8qQqQpNqmyeftHIgrXYB4Uijxb6aDHErKEcPlMMWeML69u
        6YRkXRUDEojZRCHX7mhfBe1pbcT+dRyVquzpgayBBoo99KT8gb1vHjAxSseaHg==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E304CB0BE;
        Thu, 17 Sep 2020 11:03:23 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] CDC-ACM: cleanup of data structures
Date:   Thu, 17 Sep 2020 13:02:35 +0200
Message-Id: <20200917110235.11854-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Buffers should be u8*, not unsigned char*
Buffers have an unsigned length and using an int
as a boolean is a bit outdated.

No functional change intended.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-acm.c | 13 +++++++------
 drivers/usb/class/cdc-acm.h |  6 +++---
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 85377bd740b3..e79ba5616fa0 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -173,7 +173,7 @@ static int acm_wb_alloc(struct acm *acm)
 	for (;;) {
 		wb = &acm->wb[wbn];
 		if (!wb->use) {
-			wb->use = 1;
+			wb->use = true;
 			wb->len = 0;
 			return wbn;
 		}
@@ -191,7 +191,8 @@ static int acm_wb_is_avail(struct acm *acm)
 	n = ACM_NW;
 	spin_lock_irqsave(&acm->write_lock, flags);
 	for (i = 0; i < ACM_NW; i++)
-		n -= acm->wb[i].use;
+		if(acm->wb[i].use)
+			n--;
 	spin_unlock_irqrestore(&acm->write_lock, flags);
 	return n;
 }
@@ -201,7 +202,7 @@ static int acm_wb_is_avail(struct acm *acm)
  */
 static void acm_write_done(struct acm *acm, struct acm_wb *wb)
 {
-	wb->use = 0;
+	wb->use = false;
 	acm->transmitting--;
 	usb_autopm_put_interface_async(acm->control);
 }
@@ -745,7 +746,7 @@ static void acm_port_shutdown(struct tty_port *port)
 		if (!urb)
 			break;
 		wb = urb->context;
-		wb->use = 0;
+		wb->use = false;
 		usb_autopm_put_interface_async(acm->control);
 	}
 
@@ -796,7 +797,7 @@ static int acm_tty_write(struct tty_struct *tty,
 	wb = &acm->wb[wbn];
 
 	if (!acm->dev) {
-		wb->use = 0;
+		wb->use = false;
 		spin_unlock_irqrestore(&acm->write_lock, flags);
 		return -ENODEV;
 	}
@@ -808,7 +809,7 @@ static int acm_tty_write(struct tty_struct *tty,
 
 	stat = usb_autopm_get_interface_async(acm->control);
 	if (stat) {
-		wb->use = 0;
+		wb->use = false;
 		spin_unlock_irqrestore(&acm->write_lock, flags);
 		return stat;
 	}
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index cd5e9d8ab237..a50ea3911042 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -64,12 +64,12 @@
 #define ACM_NR  16
 
 struct acm_wb {
-	unsigned char *buf;
+	u8 *buf;
 	dma_addr_t dmah;
-	int len;
-	int use;
+	unsigned int len;
 	struct urb		*urb;
 	struct acm		*instance;
+	bool use;
 };
 
 struct acm_rb {
-- 
2.16.4

