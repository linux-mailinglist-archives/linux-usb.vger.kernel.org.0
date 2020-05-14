Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62781D2BD5
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 11:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgENJxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 05:53:09 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:37259 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENJxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 05:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589449987; x=1620985987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=FiT6KA+3tggUbq0sZ6v1AT6SWXbGH6Gme6onwqj5nyI=;
  b=uOeGS0/bJXubTdTGx2SjcP9xuNT8n878vf78m8wR+XNpyTrz98/ITxne
   cOscWqISs/2u36SDzEs4GuPxSmrZd0xtkjcc2VNnL40n8UT2EtoCeOwWp
   SQp4XFk23FjWBm8BwF4/9/uyqCDBKU9gt6SsAUEYxCBhw+P2FPbOI3Ti6
   ysb4j4PrzULjnKukB4LXZFzpXiJzwoh5NopLbDAw7RE4/El/OCZ8FJhdv
   A12pUpKJzeoN8q4HTT1F21qd/849INBxQnOGG1P0rixvafxsk8e+VRW5m
   26c33Ga+4+7iV9W/jv5YKtWCnko8clHBSgbW7SD176eQ/sp9YwHVChFUX
   g==;
IronPort-SDR: BWkcbR5AxwF2iycFyHmFaxZSAgxKJYRoqos5nrX6+PlLNcEqK23GWn9F/HlELF+p/99sLxqGaa
 PhQTBDI7ZfZzPNc2XT11jLYv3kYABhqFjyF40lgmIPztjPfpiRqVPY/uXiVOn+bNFsYd18MLlt
 MBBEMtVPPY/ozeOzhWlNrGwKd/HZyDHMPWo8FdfFwO4vXy0UPPXDR8fepz+2feov4APDTAO0gz
 YjbLVRqYuYaZWDlAhRCQDXAD0WaF+b8q74r7Xreji8VZ9d5RWGzN6dsc+8it7Wl7iUT3sJ/7ux
 Plc=
X-IronPort-AV: E=Sophos;i="5.73,390,1583218800"; 
   d="scan'208";a="75245170"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 02:53:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 02:53:07 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 02:53:06 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 6/8] drivers: most: fix typo in Kconfig
Date:   Thu, 14 May 2020 11:52:54 +0200
Message-ID: <1589449976-11378-7-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
References: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
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

 drivers/most/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/most/Kconfig b/drivers/most/Kconfig
index 8650683..42f042d 100644
--- a/drivers/most/Kconfig
+++ b/drivers/most/Kconfig
@@ -19,7 +19,7 @@ config MOST_USB
 	tristate "USB"
 	depends on USB && NET
 	help
-	  Say Y here if you want to connect via USB to network tranceiver.
+	  Say Y here if you want to connect via USB to network transceiver.
 	  This device driver depends on the networking AIM.
 
 	  To compile this driver as a module, choose M here: the
-- 
2.7.4

