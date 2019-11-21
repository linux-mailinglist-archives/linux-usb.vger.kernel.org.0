Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A75F105302
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 14:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfKUN3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 08:29:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:48970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbfKUN3F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Nov 2019 08:29:05 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EC4C2067D;
        Thu, 21 Nov 2019 13:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574342944;
        bh=gMZLttUal9w1I7osIq4r5nvYcmLYrtQRv0mfxxFzV7I=;
        h=From:To:Cc:Subject:Date:From;
        b=X7tt/4gESOJAo2ULlZT4DZzmELlSZlaQvSVca/2mVtPowomTMsoXtji10D+MfxEXX
         LI+I1uemJIuMaXEQrGYNCClsG5mbmeYhmzOnhCbme9KBhpJnTFfN8tK/Wq92rGFKwb
         0XdLq7xNh+aEypfzPC+On8sTyYqndqFGpIUF024s=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: misc: Fix Kconfig indentation
Date:   Thu, 21 Nov 2019 21:29:01 +0800
Message-Id: <20191121132901.29186-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/usb/misc/Kconfig | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 653aa34aba6c..834b2494da73 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -233,17 +233,17 @@ config USB_HUB_USB251XB
 	  Say Y or M here if you need to configure such a device via SMBus.
 
 config USB_HSIC_USB3503
-       tristate "USB3503 HSIC to USB20 Driver"
-       depends on I2C
-       select REGMAP_I2C
-       help
-	 This option enables support for SMSC USB3503 HSIC to USB 2.0 Driver.
+	tristate "USB3503 HSIC to USB20 Driver"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  This option enables support for SMSC USB3503 HSIC to USB 2.0 Driver.
 
 config USB_HSIC_USB4604
-       tristate "USB4604 HSIC to USB20 Driver"
-       depends on I2C
-       help
-	 This option enables support for SMSC USB4604 HSIC to USB 2.0 Driver.
+	tristate "USB4604 HSIC to USB20 Driver"
+	depends on I2C
+	help
+	  This option enables support for SMSC USB4604 HSIC to USB 2.0 Driver.
 
 config USB_LINK_LAYER_TEST
 	tristate "USB Link Layer Test driver"
-- 
2.17.1

