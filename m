Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47221D34DF
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgENPTB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:19:01 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:8015 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgENPTB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589469541; x=1621005541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=lUbXm9Hi2Ra7UqsdrP7ZRyeuZc3zmXm9sYSDoqr6Ukc=;
  b=voC5IqYDOpLrnqqq0m9+AZZRYhBGI8+lyokVKdH6zZi23xX60DCyai9a
   SDj6khASMB27J/KEtzxUAdgfm71V8fId9qtGQbIA7KzDz6T0C8MHUYyHs
   LeqV7ZbvzgEHwaj/v+uJnODFB2uYs8aCSOtzMd8N365OR52bEAVm4keS+
   hbHtXntglOjpMUwPI+bb950Ygq5/xWgkpMc1Yf6+iH0oX2vi7mvY9llzW
   8QxA14k+Z0JV14o5j66QUXqb0KnV4eCfsfgqvVxRPBp5YlKo3p+eDJ27+
   UMdXl44WP1NraZAtYHZz7AZC8Vvi5EE9/u4Cj7TT1Kd4WHMj+tzfZ41EY
   g==;
IronPort-SDR: Hw4LbRd5KLKkWog3YwbbBYlD377fNUU+nzVAwrJ72mssypSUvZXSO0h2z1INf9pEqLZgRygLQm
 UeranlswXdRu2HB6XPDMlF/lpjKfh96uxVa3NdP7GTRPYJP82HvDTavOr6mDG2CYw4GY0rc1iL
 xMoO3ExTwDan0ZZ4J/eD1yOZP/vjO48NdWFbvoEovBzPgu4KfjK9nHgHEcIXERRgZ0Lz+0JfJW
 ff4AZzAxK030pxJa2LpAuwJkXgPESYNPEkqq6OGJePpBxpKaQETTP3YGfBTFPb+LaOFAiB7B+4
 HnM=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75909810"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 08:19:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 08:19:03 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 08:19:02 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 4/7] staging: most: usb: use dev_dbg function
Date:   Thu, 14 May 2020 17:18:49 +0200
Message-ID: <1589469532-21488-5-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
References: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch replaces the functions dev_notice with dev_dbg to silence
the driver during normal operation.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:

 drivers/staging/most/usb/usb.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index d5c73cb..c3a7e71 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -1035,17 +1035,17 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 		init_usb_anchor(&mdev->busy_urbs[i]);
 		spin_lock_init(&mdev->channel_lock[i]);
 	}
-	dev_notice(dev, "claimed gadget: Vendor=%4.4x ProdID=%4.4x Bus=%02x Device=%02x\n",
-		   le16_to_cpu(usb_dev->descriptor.idVendor),
-		   le16_to_cpu(usb_dev->descriptor.idProduct),
-		   usb_dev->bus->busnum,
-		   usb_dev->devnum);
-
-	dev_notice(dev, "device path: /sys/bus/usb/devices/%d-%s:%d.%d\n",
-		   usb_dev->bus->busnum,
-		   usb_dev->devpath,
-		   usb_dev->config->desc.bConfigurationValue,
-		   usb_iface_desc->desc.bInterfaceNumber);
+	dev_dbg(dev, "claimed gadget: Vendor=%4.4x ProdID=%4.4x Bus=%02x Device=%02x\n",
+		le16_to_cpu(usb_dev->descriptor.idVendor),
+		le16_to_cpu(usb_dev->descriptor.idProduct),
+		usb_dev->bus->busnum,
+		usb_dev->devnum);
+
+	dev_dbg(dev, "device path: /sys/bus/usb/devices/%d-%s:%d.%d\n",
+		usb_dev->bus->busnum,
+		usb_dev->devpath,
+		usb_dev->config->desc.bConfigurationValue,
+		usb_iface_desc->desc.bInterfaceNumber);
 
 	ret = most_register_interface(&mdev->iface);
 	if (ret)
-- 
2.7.4

