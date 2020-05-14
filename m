Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D0E1D2BD6
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 11:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgENJxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 05:53:09 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:61878 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgENJxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 05:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589449988; x=1620985988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ulFIoRuFlAhbgBKdyPyVoH1HEiouU5Elxw0OIIY1pcQ=;
  b=NqflolDYci8TG3eyax4SuyhVL8BLFmCD03VbNSQLD736raf/GEdP7UvU
   hRzoMZjgmva3GxefR49rVni/2BWa16TwiuUhhWq1u/gVpUFylElrnOzwi
   q+R2VYAvSN4iWb63NP/Bx38cMee3rhnmsmhcWvrfbP3ooYMthdzpe8QeG
   JMJqD69e5IVE8RMCx7zNCWz7DO4HXQFR93XnfqhZeYwsUv4Rwv1/yAr+8
   FSnx49oa9dA3pm4ivTOOmsOPTWslYkZr0lB7MxYwYxQqNoHMm8tQGgic4
   k3or0JFn1c3nVLCIqM2XlbqZYzieJ59gIp9R/xnH12pMznv/GqNgST2XY
   A==;
IronPort-SDR: TM7+S6WU4eYPGBPIPzHkhIql2l8pYsqIPF+JMTyc2i432h/zcoWusOV06+MzErVFQRGnmDiosP
 w/iZ/MrQMtx2M+KFkM3Vn2Uh0616G4Zqqdne1RTdcJMv2jLzSz72sgNd/UUfHpWED0lbTENucI
 6YkgwPGJjmsrpjqgw5bFRW+mzCIMliQIxAvOfnJ8rj6ho3u8+v/UrHQcqRmHWVTH+Z/+D4fLeT
 BzWVlCNVpUOVGhoKtNOWrCGOkEpjVrEg+OPf/w78FbmojNitpW8Q7W0UC7fTnBrZ+elSw0LrRq
 254=
X-IronPort-AV: E=Sophos;i="5.73,390,1583218800"; 
   d="scan'208";a="73430412"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 02:53:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 02:53:06 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 02:53:05 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 5/8] drivers: most: usb: use dev_dbg function
Date:   Thu, 14 May 2020 11:52:53 +0200
Message-ID: <1589449976-11378-6-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
References: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
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

 drivers/most/most_usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index 1655fcd..35620a1 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -1129,13 +1129,13 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 		init_usb_anchor(&mdev->busy_urbs[i]);
 		spin_lock_init(&mdev->channel_lock[i]);
 	}
-	dev_notice(dev, "claimed gadget: Vendor=%4.4x ProdID=%4.4x Bus=%02x Device=%02x\n",
+	dev_dbg(dev, "claimed gadget: Vendor=%4.4x ProdID=%4.4x Bus=%02x Device=%02x\n",
 		   le16_to_cpu(usb_dev->descriptor.idVendor),
 		   le16_to_cpu(usb_dev->descriptor.idProduct),
 		   usb_dev->bus->busnum,
 		   usb_dev->devnum);
 
-	dev_notice(dev, "device path: /sys/bus/usb/devices/%d-%s:%d.%d\n",
+	dev_dbg(dev, "device path: /sys/bus/usb/devices/%d-%s:%d.%d\n",
 		   usb_dev->bus->busnum,
 		   usb_dev->devpath,
 		   usb_dev->config->desc.bConfigurationValue,
-- 
2.7.4

