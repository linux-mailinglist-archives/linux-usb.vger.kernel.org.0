Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A471D4955
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgEOJVY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:21:24 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:42418 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgEOJVW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589534483; x=1621070483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/ShI/Q7GIZEij7XyN+mHuuH9rRjoAPcdOsaNnOKnAmM=;
  b=ehhsNknWPV0ucM6TeM5NTq4VDxiIV2HFZDvmTNlMSYVYQ63LXXqI1Hsy
   kJ8NKVUaY6zDwyIhVqGOPqp7r2iAhcZ8+DnqMtM/qOo3x38rNBeJm2VIN
   fjrgeIadclgmX2OY4ZOaFDNS55RbvnwtgVCNS87e3H5AkZ8sh9LMc2v4C
   I8URt2FNN/KIuwmh2xj1GoIGyfqsq0LDlFG+VI/eC9RmOIBu41Uw1354T
   zRPevdQcDQisbKjprnWv9KS6T2PHu7YixFFr4uZLv9o3/SGxh1cramIAC
   l+NuIkUrJh9x5vi3/ypESVmbJh+Ekwwf/xdxZtMybZJ1/ovnCYQLfHLe7
   g==;
IronPort-SDR: KdRx2A/lKSmA5GNhpUQOWhCnwuOa9uOCvT7qwiEZgVMoMiBIlUURrI5Vd+B4ZKNouVxL3fdrMF
 AKBc1zSErz9E8wgXoqbFFVQEo0Ge08K5nzBaLEFGddFiakcjkFSLCMPLRqVv3sQ/JAQ5vmwCDJ
 HVumfDTzJ07x9J5bVvOwIyF+wZ5MM0Sv4YRSbdJW6g8YCf3QX9g+admThu0a+IDMVcRftU63w6
 kq5YAWfjXBvzxm35DIydMAdp72n1iMCeI7lA/vuGnRjuLyIsXbUzERgIU0dOy6YaixOgZWBBiT
 X6o=
X-IronPort-AV: E=Sophos;i="5.73,394,1583218800"; 
   d="scan'208";a="76018850"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 02:21:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 02:21:17 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 15 May 2020 02:21:12 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v3 4/7] staging: most: usb: use dev_dbg function
Date:   Fri, 15 May 2020 11:21:02 +0200
Message-ID: <1589534465-7423-5-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
References: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
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
v3:

 drivers/staging/most/usb/usb.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 36c277f..8995ed0 100644
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

