Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB824F7204
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 04:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238689AbiDGCXW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 22:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233671AbiDGCXV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 22:23:21 -0400
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 55E6B12A8F7
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 19:21:22 -0700 (PDT)
Received: from localhost.localdomain (unknown [222.205.11.114])
        by mail-app2 (Coremail) with SMTP id by_KCgCHb56cSk5iC6VCAQ--.41141S4;
        Thu, 07 Apr 2022 10:21:16 +0800 (CST)
From:   Lin Ma <linma@zju.edu.cn>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        mdharm-usb@one-eyed-alien.net
Cc:     Lin Ma <linma@zju.edu.cn>
Subject: [PATCH v0 3/3] usb-storage: shuttle_usbat: fix initFunction error return
Date:   Thu,  7 Apr 2022 10:21:15 +0800
Message-Id: <20220407022115.3773-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: by_KCgCHb56cSk5iC6VCAQ--.41141S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyrXrWUGr1rCr1rWFy5CFg_yoW5tF43pa
        nxG398AFy8tanxXry8tw4DJ3W3ua1xJry7KrW7Gas3uw10g3WIkr13Ka4vga4Yg3W5Xa4I
        qan2qF45Cas7G3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv01xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
        AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l
        42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
        twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
        N6pPUUUUU==
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The initFunction is called when probing a new device, its call relation
is like:
USB core: probe() -> usb_stor_probe2() -> usb_stor_acquire_resources()
-> init_usbat_cd() or init_usbat_flash() -> init_usbat()

That is, the error return of the initFunction should tell USB core what
happened instead of using constant or error code like
USB_STOR_TRANSPORT_FAILED.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 drivers/usb/storage/shuttle_usbat.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
index 54aa1392c9ca..f0d0ca37163d 100644
--- a/drivers/usb/storage/shuttle_usbat.c
+++ b/drivers/usb/storage/shuttle_usbat.c
@@ -1456,7 +1456,7 @@ static int init_usbat(struct us_data *us, int devicetype)
 
 	us->extra = kzalloc(sizeof(struct usbat_info), GFP_NOIO);
 	if (!us->extra)
-		return 1;
+		return -ENOMEM;
 
 	info = (struct usbat_info *) (us->extra);
 
@@ -1465,7 +1465,7 @@ static int init_usbat(struct us_data *us, int devicetype)
 				 USBAT_UIO_OE1 | USBAT_UIO_OE0,
 				 USBAT_UIO_EPAD | USBAT_UIO_1);
 	if (rc != USB_STOR_XFER_GOOD)
-		return USB_STOR_TRANSPORT_ERROR;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 1\n");
 
@@ -1473,42 +1473,42 @@ static int init_usbat(struct us_data *us, int devicetype)
 
 	rc = usbat_read_user_io(us, status);
 	if (rc != USB_STOR_TRANSPORT_GOOD)
-		return rc;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 2\n");
 
 	rc = usbat_read_user_io(us, status);
 	if (rc != USB_STOR_XFER_GOOD)
-		return USB_STOR_TRANSPORT_ERROR;
+		return -EIO;
 
 	rc = usbat_read_user_io(us, status);
 	if (rc != USB_STOR_XFER_GOOD)
-		return USB_STOR_TRANSPORT_ERROR;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 3\n");
 
 	rc = usbat_select_and_test_registers(us);
 	if (rc != USB_STOR_TRANSPORT_GOOD)
-		return rc;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 4\n");
 
 	rc = usbat_read_user_io(us, status);
 	if (rc != USB_STOR_XFER_GOOD)
-		return USB_STOR_TRANSPORT_ERROR;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 5\n");
 
 	/* Enable peripheral control signals and card detect */
 	rc = usbat_device_enable_cdt(us);
 	if (rc != USB_STOR_TRANSPORT_GOOD)
-		return rc;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 6\n");
 
 	rc = usbat_read_user_io(us, status);
 	if (rc != USB_STOR_XFER_GOOD)
-		return USB_STOR_TRANSPORT_ERROR;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 7\n");
 
@@ -1516,19 +1516,19 @@ static int init_usbat(struct us_data *us, int devicetype)
 
 	rc = usbat_read_user_io(us, status);
 	if (rc != USB_STOR_XFER_GOOD)
-		return USB_STOR_TRANSPORT_ERROR;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 8\n");
 
 	rc = usbat_select_and_test_registers(us);
 	if (rc != USB_STOR_TRANSPORT_GOOD)
-		return rc;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 9\n");
 
 	/* At this point, we need to detect which device we are using */
 	if (usbat_set_transport(us, info, devicetype))
-		return USB_STOR_TRANSPORT_ERROR;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 10\n");
 
@@ -1539,11 +1539,11 @@ static int init_usbat(struct us_data *us, int devicetype)
 	rc = usbat_set_shuttle_features(us, (USBAT_FEAT_ETEN | USBAT_FEAT_ET2 | USBAT_FEAT_ET1),
 									0x00, 0x88, 0x08, subcountH, subcountL);
 	if (rc != USB_STOR_XFER_GOOD)
-		return USB_STOR_TRANSPORT_ERROR;
+		return -EIO;
 
 	usb_stor_dbg(us, "INIT 11\n");
 
-	return USB_STOR_TRANSPORT_GOOD;
+	return 0;
 }
 
 /*
-- 
2.35.1

