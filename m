Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508346761B1
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 00:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjATXmH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 18:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjATXmG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 18:42:06 -0500
X-Greylist: delayed 90 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 20 Jan 2023 15:42:04 PST
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7221E9C7
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 15:42:04 -0800 (PST)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id 9810A31181CC;
        Sat, 21 Jan 2023 00:40:32 +0100 (CET)
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id 3F4F4167D6;
        Sat, 21 Jan 2023 00:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1674258032; bh=tAHRLgm6IhHni12DXtcuIH0/yjW4BrhLDM/lawo+0EA=;
        h=From:To:Cc:Subject:Date:From;
        b=jqbsdKQ9qcr6kphxR0PRE4gPARTOCOtb1pNBcbGIxl+BQVC3GrMR/fG7L4HUlheYw
         xGuOhX9xgnVCY0EwqhgbE+o1fM5yKLrPKfblcMqx7DpGpzxpV2wn5ijz1GfDFLWUJC
         g1pomQ3gR+DHe+GrGgS5T2s4tIRIbcu7VDdiCe0E=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id 2C6DF14214F0; Sat, 21 Jan 2023 00:40:31 +0100 (CET)
From:   =?UTF-8?q?Samuel=20=C4=8Cavoj?= <samuel@cavoj.net>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, samuel@cavoj.net
Subject: [PATCH] usb: typec: ucsi: introduce read_explicit operation
Date:   Sat, 21 Jan 2023 00:39:21 +0100
Message-Id: <20230120233920.752245-1-samuel@cavoj.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On some ACPI platforms (namely the ASUS Zenbook UM325) the _DSM method must
not be called after a notification is received but instead the mailbox
should be read immediately from RAM. This is because the ACPI interrupt
handler destroys the CCI in ERAM after copying to system memory, and when
_DSM is later called to perform a second copy, it retrieves a garbage
value.

Instead, the _DSM(read) method should only be called when necessary, i.e.
for polling the state after reset and for retrieving the version. Other
reads should not call _DSM and only peek into the RAM region.

For platforms other than ACPI, the read_explicit op uses the same
implementation as read.

Link: https://lore.kernel.org/linux-usb/20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain/
Signed-off-by: Samuel Čavoj <samuel@cavoj.net>
---
 drivers/usb/typec/ucsi/ucsi.c         |  9 +++++----
 drivers/usb/typec/ucsi/ucsi.h         |  3 +++
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 11 +++++++++++
 drivers/usb/typec/ucsi/ucsi_ccg.c     |  1 +
 drivers/usb/typec/ucsi/ucsi_stm32g0.c |  1 +
 5 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index eabe519013e7..39ee3b63d07d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -883,7 +883,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 			goto out;
 		}
 
-		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+		ret = ucsi->ops->read_explicit(ucsi, UCSI_CCI, &cci, sizeof(cci));
 		if (ret)
 			goto out;
 
@@ -1347,7 +1347,8 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 {
 	struct ucsi *ucsi;
 
-	if (!ops || !ops->read || !ops->sync_write || !ops->async_write)
+	if (!ops || !ops->read || !ops->read_explicit || !ops->sync_write ||
+	    !ops->async_write)
 		return ERR_PTR(-EINVAL);
 
 	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
@@ -1382,8 +1383,8 @@ int ucsi_register(struct ucsi *ucsi)
 {
 	int ret;
 
-	ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
-			      sizeof(ucsi->version));
+	ret = ucsi->ops->read_explicit(ucsi, UCSI_VERSION, &ucsi->version,
+				       sizeof(ucsi->version));
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c968474ee547..8361e1cfc8eb 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -37,6 +37,7 @@ struct ucsi_altmode;
 /**
  * struct ucsi_operations - UCSI I/O operations
  * @read: Read operation
+ * @read_explicit: Read operation with explicit poll if applicable
  * @sync_write: Blocking write operation
  * @async_write: Non-blocking write operation
  * @update_altmodes: Squashes duplicate DP altmodes
@@ -48,6 +49,8 @@ struct ucsi_altmode;
 struct ucsi_operations {
 	int (*read)(struct ucsi *ucsi, unsigned int offset,
 		    void *val, size_t val_len);
+	int (*read_explicit)(struct ucsi *ucsi, unsigned int offset,
+			     void *val, size_t val_len);
 	int (*sync_write)(struct ucsi *ucsi, unsigned int offset,
 			  const void *val, size_t val_len);
 	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index ce0c8ef80c04..6b3475ed4874 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -45,6 +45,16 @@ static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
 			  void *val, size_t val_len)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+
+	memcpy(val, ua->base + offset, val_len);
+
+	return 0;
+}
+
+static int ucsi_acpi_read_explicit(struct ucsi *ucsi, unsigned int offset,
+				   void *val, size_t val_len)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
 	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
@@ -89,6 +99,7 @@ static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 static const struct ucsi_operations ucsi_acpi_ops = {
 	.read = ucsi_acpi_read,
+	.read_explicit = ucsi_acpi_read_explicit,
 	.sync_write = ucsi_acpi_sync_write,
 	.async_write = ucsi_acpi_async_write
 };
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 46441f1477f2..d00c262f334f 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -605,6 +605,7 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read = ucsi_ccg_read,
+	.read_explicit = ucsi_ccg_read,
 	.sync_write = ucsi_ccg_sync_write,
 	.async_write = ucsi_ccg_async_write,
 	.update_altmodes = ucsi_ccg_update_altmodes
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 93fead0096b7..008fa7a3533c 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -437,6 +437,7 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
 
 static const struct ucsi_operations ucsi_stm32g0_ops = {
 	.read = ucsi_stm32g0_read,
+	.read_explicit = ucsi_stm32g0_read,
 	.sync_write = ucsi_stm32g0_sync_write,
 	.async_write = ucsi_stm32g0_async_write,
 };
-- 
2.39.0

