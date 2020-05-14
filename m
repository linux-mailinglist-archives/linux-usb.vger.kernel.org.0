Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B78B1D31AA
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 15:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgENNqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 09:46:40 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:62113 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgENNqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 09:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589464000; x=1621000000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=q62AaMvRlnJWHFhcdKw6BSnQ1+0vKJEbrDyzf0ZKEbo=;
  b=dpVuYCI9ObPruUUE8I/1t/DJzGnzITTfDiY9Ykn0LXE3jcr4jS9d7xtP
   0ZajLaf/3E8xgMFckRWkcL/DFxh1A6n5kcjPNCTGc0yaCF+KjohfUjEyY
   THeTUR86Bc/m2dafgpeGzs9D5opJmQ08j3PF0nMnl/uR8sJO+/SkaYqgV
   bxSeCq2H53EeGnG0u+B1/uFHlApZve66zezje4trgaOsHwMGd/6gwVIH+
   4P9ylDIFc7pYIP8Obpj5MOaoU9lc9+SfE5Oq+FgZcNQPbJ4yEe1B+uUFe
   BMZW52v9R3MEC+QKAVwXG8PGPoxdETfDRwKTQWZhn1eHDucL6O9m8vY6W
   g==;
IronPort-SDR: QT6xHZ9BqKXJ2PUNCtCgHwvy7pOtuQTx074zY1NHlqE5YyMnZf0noO+zNWS8PVhHsvpZd9J9QQ
 WulfXVwhJ7IkQL0VIGo+U1iFKQVKC7B3f8jwnpduc8/jmXwva6Xx9eVjhmed9Jq9mNeyQ7M8Yz
 Q6IupYP51Q3uAkjXbvO7oIbm8+Xht6s16ZTipc7lSRWhwoAb3RJyZIjws571EeoQdaDhYLwMhX
 dLS67wuk6cdETux4QZMBWbOGvPlJ85M5hfyv/xaz9sJu72LANtCJRk8TdgNGMUHWFhmOxJiQwa
 woE=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75894437"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 06:46:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 06:46:38 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 06:46:40 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 4/7] staging: most: usb: use dev_dbg function
Date:   Thu, 14 May 2020 15:46:26 +0200
Message-ID: <1589463989-30029-5-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
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
 drivers/staging/most/usb/usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 25e114d..882f59e 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -1130,13 +1130,13 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
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

