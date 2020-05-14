Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D19F1D31AE
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 15:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgENNqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 09:46:43 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:62125 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgENNql (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 09:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589464002; x=1621000002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=NAWNHUGkWVqHw4OIUXqxJ6p/XpmnlbIkD3/DmN+xwEo=;
  b=mjGPZElZ0P/lipEk7IoqMBqYoxW5Sqrdk3kFd1FHnxOU/S8EzeA5a8hj
   /j3SaAKvLgOJIgIqj8uhuD6OrsDYUqC9LCMWzW87XBgIyCxQf6mFl6aA6
   1K180EkyhdTTlFssyeJh+WxIxl8q4CKCr6FjBFFVd8p12CGUlgWDHzQAb
   ZfA1lHcdja2OMliAxdm3eXXR8E/G2r8hjHmJr0TduAiFjMU/8kHHmqEUl
   yY89OcQb4n8ZO24UJrGO4879jutBQCkTWSI+UlFEWgltjuyKGlyovz2Ok
   F3wbNBm7LF8B8yZLnxnxgTpk01ilPzJbZ/QtsodXiXKgQAj+h0/9Svo2a
   w==;
IronPort-SDR: EqNu7ea7kDXbyk5j5o1+az4/iDy/TFMy05hMc11XCCLyhb0pllfMDptckjwWFzMjoj3/ry8IeT
 R9a+K3ccXQ72D+kEAJn6Ooo2GSV+WCC/YyIiuAJI8Y8XJ4ISswmP+c+xl12iL9VEPf9zkkNXqw
 QQcIsADDChHsgm0u9FX0OdFd15aLIvYiW5H9Fkmv29NyS0S8uvyRQ81/3o2RfslUYksk9PPTHX
 gvlZxGFjB9KlfFk7hDCJvVT8Dr4o0hu9kLthfjN+bUd+7mELMGe2hsnR+6vDZMomkZcuyjWY6x
 ruA=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75894442"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 06:46:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 06:46:42 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 06:46:41 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 5/7] staging: most: fix typo in Kconfig
Date:   Thu, 14 May 2020 15:46:27 +0200
Message-ID: <1589463989-30029-6-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
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

