Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F56D33F289
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 15:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhCQOZi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 10:25:38 -0400
Received: from m12-17.163.com ([220.181.12.17]:49360 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231461AbhCQOZg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Mar 2021 10:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5396v
        hsMEuggyxExI2EHyYdpDZ4CTtj5nrguIg8ySxM=; b=cHYBiLzLmotMxa0NdHDQ7
        bemdoBeC3NS0NL/XoeVAAIvwf2gfZQ9nDJKogsySUovdY6LHwbFs65f0OP7VSaWy
        L7jmIbl886+PxloyvttDcYj3YPkwSa1fjdM9rLctJRkD2ZsRIqWmS1mSheHkosI5
        MLBJCjYFcZDuQe1bzicHtE=
Received: from jiangzhipeng.ccdomain.com (unknown [218.94.48.178])
        by smtp13 (Coremail) with SMTP id EcCowADn6JA+EVJgLOIHqg--.53612S2;
        Wed, 17 Mar 2021 22:25:08 +0800 (CST)
From:   jzp0409 <jzp0409@163.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, "edison.jiang" <jiangzhipeng@yulong.com>
Subject: [PATCH] usb: acpi: Fix shifting 31 bits
Date:   Wed, 17 Mar 2021 22:25:13 +0800
Message-Id: <20210317142513.1340-1-jzp0409@163.com>
X-Mailer: git-send-email 2.30.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowADn6JA+EVJgLOIHqg--.53612S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy5GrWfCw4UWr1UAF17GFg_yoWfArb_uF
        1kur17Ww1xCFWfZr1Uu345Zry8t3W3ZrsxuFs8tF4akF15trs5Zr1DCrWrtrW7XrWj9F9x
        WF10kr45uw4xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1LFx7UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: hm2sikiqz6il2tof0z/1tbiUQRYhlWBSg97GQAAs4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "edison.jiang" <jiangzhipeng@yulong.com>

Fix undefined behaviour in the usb apci driver by using 'BIT' marcro.

Signed-off-by: edison.jiang <jiangzhipeng@yulong.com>
---
 drivers/usb/core/usb-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 50b2fc7..3e467a8 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -122,7 +122,7 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
  * Private to usb-acpi, all the core needs to know is that
  * port_dev->location is non-zero when it has been set by the firmware.
  */
-#define USB_ACPI_LOCATION_VALID (1 << 31)
+#define USB_ACPI_LOCATION_VALID BIT(31)
 
 static struct acpi_device *usb_acpi_find_port(struct acpi_device *parent,
 					      int raw)
-- 
1.9.1


