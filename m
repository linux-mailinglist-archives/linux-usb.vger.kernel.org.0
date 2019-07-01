Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29A3E5B726
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 10:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbfGAItC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 04:49:02 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17874 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfGAItC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 04:49:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d19c8fc0002>; Mon, 01 Jul 2019 01:49:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 01 Jul 2019 01:49:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 01 Jul 2019 01:49:01 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Jul
 2019 08:49:01 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Jul
 2019 08:49:01 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 1 Jul 2019 08:49:01 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.108.127]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d19c8fc0002>; Mon, 01 Jul 2019 01:49:01 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <linux-usb@vger.kernel.org>, <stern@rowland.harvard.edu>,
        <usb-storage@lists.one-eyed-alien.net>, <oneukum@suse.com>
CC:     JC Kuo <jckuo@nvidia.com>
Subject: [PATCH] usb: storage: skip only when uas driver is loaded
Date:   Mon, 1 Jul 2019 16:48:48 +0800
Message-ID: <20190701084848.32502-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561970940; bh=NMa2kpkFyVuDAYM2DG7p4ti7V3iwbEjLpuSET89Dm/I=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=UELMapZm0v50A4Cd36sX7BhInHHWGliU7Wsy+P/MnoQIwFa4K8djzAGlf7nC1xJHk
         0LBtAkQHv0WCsSsAbK58KIOphlN081ArvOTFnxsv4IzSGPJqgbkejED+FZ0JXG7ZsV
         BJQ7iuLhrjxLbr+ugHZuLfU3zTggtyyXjDgcwfEsjCkC1p7jH3gG6XRH7/Uqwki3MC
         W160oNa9w2QWcWT58jfSXfKdAsY1HVgas5mzSCxkt2Sd4ylwg8rGrMyHHrvia4slxf
         ub2pLRxvLsBhtC6GyMjcU95Pp12VEef2Ls5mugDtNzJN2kiicElc3yK8L/pxjvdzbU
         FvFtPmtNYaN9Q==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When usb-storage driver detects a UAS capable device, it ignores the
device if CONFIG_USB_UAS is enabled. usb-storage driver assumes uas
driver certainly will be loaded. However, it's possible that uas
driver will not be loaded, for example, uas kernel module is not
installed properly or it is in modprobe blacklist.

In case of uas driver not being loaded, the UAS capable device will
not fallback to work at Bulk-only-transfer mode. The device just
disappears without any notification to user/userspace.

This commit changes usb-storage driver to skip UAS capable device
only when uas driver is already loaded to make sure the device will
at least work with Bulk protocol.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/usb/core/driver.c | 1 +
 drivers/usb/storage/usb.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index ebcadaad89d1..265c5dd490d2 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1923,3 +1923,4 @@ struct bus_type usb_bus_type = {
 	.uevent =	usb_uevent,
 	.need_parent_lock =	true,
 };
+EXPORT_SYMBOL_GPL(usb_bus_type);
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 9a79cd9762f3..d8f64e808783 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -1097,9 +1097,10 @@ static int storage_probe(struct usb_interface *intf,
 	int result;
 	int size;
 
-	/* If uas is enabled and this device can do uas then ignore it. */
+	/* If uas driver is loaded and this device can do uas then ignore it. */
 #if IS_ENABLED(CONFIG_USB_UAS)
-	if (uas_use_uas_driver(intf, id, NULL))
+	if (driver_find("uas", &usb_bus_type) &&
+		uas_use_uas_driver(intf, id, NULL))
 		return -ENXIO;
 #endif
 
-- 
2.17.1


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
