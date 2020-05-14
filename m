Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4B31D34E0
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgENPTD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:19:03 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:3694 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgENPTC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589469542; x=1621005542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/UWZL9NYOlen4KPZDTsNBZyFf3AQGXvl6hp1Di1o6k4=;
  b=h6v2Z/Fjb02urvLA16smsIXvprfD4XlOVtyPpt6o22YC3M3RhkiWHYKP
   /8BdakIg6uyyiL+2BAv6UmTc/f9jHOng6z8skgGTjffR4kUqgR4paY96W
   4RSfxUL5DBVOJNdZQtmUtuMR9qpIUfl92w1ehx254oFyMm7hAZJgYrcaS
   qgXculiCRbj+5BhCN2o6A+B6+CLWGgCkZEujo9MoCMoe5iQWXppDolUBA
   0jWXOM/5EbE+o/hNAID16dxaYhIoJDUwhjn5LNcXWtCGToSOP+DSKdc54
   q/9xnivSG7R+YBqA2PxpZszhEYOVA590ZoR+JBpTo4pKKgtRhv2jW/yyH
   w==;
IronPort-SDR: tnlGKB5IBYztJTaNWgmN7PR9xbHlq7tCM4FXfUU30Cm9eevqlGiRDtgh7sGjdKWzChGV3yoe8J
 7qU5tkJJsGybwt1TrpUdhuAwoTV9/F6Y++38cp3D2mxndUZl3X/nTR0kmYsgYqF591YGVzNTGj
 BEC/DKZljD9+MyEYtENYq3/jUMFQPULXv56qi51oGgYNUmjiHk3pyEdyE+yaMgcxACDNI0jumr
 4kp7hDCDpteEfXYlo54EIhvAfVMXNf8F0ldkcaBsUWiq6+YDbQIFGFH0MBBRDawya4z4T5Z2uL
 uy0=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="76658384"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 08:19:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 08:19:01 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 08:19:04 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 5/7] staging: most: fix typo in Kconfig
Date:   Thu, 14 May 2020 17:18:50 +0200
Message-ID: <1589469532-21488-6-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
References: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch corrects the typo in the Kconfig file where it says
tranceiver instead of transceiver.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
---
v2:

 drivers/staging/most/usb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/usb/Kconfig b/drivers/staging/most/usb/Kconfig
index a86f1f6..75dc25c 100644
--- a/drivers/staging/most/usb/Kconfig
+++ b/drivers/staging/most/usb/Kconfig
@@ -7,7 +7,7 @@ config MOST_USB
 	tristate "USB"
 	depends on USB && NET
 	help
-	  Say Y here if you want to connect via USB to network tranceiver.
+	  Say Y here if you want to connect via USB to network transceiver.
 	  This device driver depends on the networking AIM.
 
 	  To compile this driver as a module, choose M here: the
-- 
2.7.4

