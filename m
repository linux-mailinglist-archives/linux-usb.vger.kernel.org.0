Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1559130589
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jan 2020 03:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgAECo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jan 2020 21:44:28 -0500
Received: from m12-14.163.com ([220.181.12.14]:53338 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbgAECo2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Jan 2020 21:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=loA+f
        h82oJEFLrqTKPjK+Z1T06WrO7Cp5uXbAIvuy+M=; b=P4NKNCDjiALljmrhiHjSp
        594iJFkLK7XRT32xzCQ+1kFc3nQXeF/V2hLbZRoz+O/YvA1Ab7IKbS+wf93b3Uiy
        CULkwGurYiesdany8/R8H5lduAPYwv5hR7SEA0bamA+tYhyQ77jKkLXnqhxYaBB4
        ywcFXsaEgxHupk3UPKVqSc=
Received: from localhost.localdomain (unknown [101.87.142.123])
        by smtp10 (Coremail) with SMTP id DsCowADHXr+GTRFeqRzuKQ--.1012S2;
        Sun, 05 Jan 2020 10:44:22 +0800 (CST)
From:   yuan linyu <cugyly@163.com>
To:     linux-usb@vger.kernel.org
Cc:     yuan linyu <cugyly@163.com>
Subject: [PATCH] usb: gadget: configfs: unregister gadget only when udc name exist
Date:   Sun,  5 Jan 2020 10:44:20 +0800
Message-Id: <20200105024420.18990-1-cugyly@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: DsCowADHXr+GTRFeqRzuKQ--.1012S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tryfAF47uw4UXFyDZFWkZwb_yoW8Wr13pF
        4ag34Fyr4UXrZ0qr4DJr4DZayqkan7tryDurZ7tw42y3Z5Xry7C398GFyYvF4xAa4xCrWa
        yFs5Kr1S9FWUAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U17K3UUUUU=
X-Originating-IP: [101.87.142.123]
X-CM-SenderInfo: pfxj5zr16rljoofrz/1tbiwAah41XlpdcemAAAsA
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When drop usb config link file, gadget will unregistered,
then if set UDC name to empty, it will return ENODEV.
this change will check udc name to avoid unregister gadget twice
and avoid user space warning message for ENODEV.

Signed-off-by: yuan linyu <cugyly@163.com>
---
 drivers/usb/gadget/configfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index ab9ac48a751a..88a56bf47c0e 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -242,9 +242,6 @@ static int unregister_gadget(struct gadget_info *gi)
 {
 	int ret;
 
-	if (!gi->composite.gadget_driver.udc_name)
-		return -ENODEV;
-
 	ret = usb_gadget_unregister_driver(&gi->composite.gadget_driver);
 	if (ret)
 		return ret;
@@ -269,9 +266,11 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 	mutex_lock(&gi->lock);
 
 	if (!strlen(name)) {
-		ret = unregister_gadget(gi);
-		if (ret)
-			goto err;
+		if (gi->composite.gadget_driver.udc_name) {
+			ret = unregister_gadget(gi);
+			if (ret)
+				goto err;
+		}
 		kfree(name);
 	} else {
 		if (gi->composite.gadget_driver.udc_name) {
@@ -1598,7 +1597,8 @@ void unregister_gadget_item(struct config_item *item)
 	struct gadget_info *gi = to_gadget_info(item);
 
 	mutex_lock(&gi->lock);
-	unregister_gadget(gi);
+	if (gi->composite.gadget_driver.udc_name)
+		unregister_gadget(gi);
 	mutex_unlock(&gi->lock);
 }
 EXPORT_SYMBOL_GPL(unregister_gadget_item);
-- 
2.17.1


