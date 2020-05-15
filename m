Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43B61D4956
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgEOJV0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:21:26 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:42418 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgEOJVX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589534484; x=1621070484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=KYVqGATsuFWFchEAYR/jk+REKbiH2P/RNFezfH0En/s=;
  b=ISiieF/drwqBbaYn78+6PWd3sdM1ntzlGIFHok4JWnxbVaQhfHJYC6a/
   or6gylrDao4OsGvBDv7dOfyAgc4qljlz/JZTFfzP0cXvIs2HoLXUKttmO
   XmzWjGWsWGWcus5FVVtlUis310/n96BLSL1NN5cxyVa9Cb1l4mgYf9btD
   QQRcyDClxADdPh/wReUn5T4UJ8+3J2kaeFYi4qadrBvVv+mkadXLNw+Jy
   xQyHSPeuUy57d09BEpLjy7qhYm94fsUsED82YASLwjsFu8e0oBiaoidki
   ly85daczdIi0qFYAZ8xB6VSBALwovVkFiwKiNO0BaGsiCWAHn5daktBns
   w==;
IronPort-SDR: ihA4kChsi7ZaaBLX6gsuDGs8H+s7G2V7pmHeXrqj759JfHc/NI6nHuKeqxcPywzWCnPa2+u3eL
 v+yg6VbqpMoOsR7R7lbbEU+s++LiIpZH/+6eB1nzeuhjhsEeSm87Lgq0OLWg9XzOdH0KnzmAPD
 R1Ll0Am4Y4UwdZqt302/Z1ZaZQn3mCwJDkzkYFUZbPWsqRExb4tQ65LZ84nL13+OeasP7xBiH1
 Xitn8kp6VrGyJ2X5D7fOKLqIrSKNCgoUFOP6z/pCwYL+tS8nFlBJ8iGdmmV1ixXl7B4ouUGdfw
 8t4=
X-IronPort-AV: E=Sophos;i="5.73,394,1583218800"; 
   d="scan'208";a="76018854"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 02:21:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 02:21:18 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 15 May 2020 02:21:14 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v3 5/7] staging: most: fix typo in Kconfig
Date:   Fri, 15 May 2020 11:21:03 +0200
Message-ID: <1589534465-7423-6-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
References: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
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
v3:

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

