Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3150105304
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 14:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfKUN3K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 08:29:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727173AbfKUN3K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Nov 2019 08:29:10 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F5D32070B;
        Thu, 21 Nov 2019 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574342949;
        bh=Kx3MISgtagb4e+ZJuZjuqEvPg+uwfNk1F4TZpwAktfY=;
        h=From:To:Cc:Subject:Date:From;
        b=omXIxakSxdlk95IjRQShAsRxZJXArM5Q0uDp0lZ4rHkxAtODAmKVEfrW3z0sWDPzs
         VNaLLzaRi6KSpiNNyV72/kbMBttksfdT5oo4b3Kv5DnzC3eQ/wiqjQ/mhLCKhA+5KD
         8O+GxtVs0ZLbGbS0e9CjT4CV6uZdhOExS9s5WoGs=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: Fix Kconfig indentation
Date:   Thu, 21 Nov 2019 21:29:05 +0800
Message-Id: <20191121132905.29248-1-krzk@kernel.org>
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
 drivers/usb/gadget/legacy/Kconfig | 26 +++++++++++++-------------
 drivers/usb/gadget/udc/Kconfig    |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/legacy/Kconfig b/drivers/usb/gadget/legacy/Kconfig
index 38eaa9417b38..119a4e47681f 100644
--- a/drivers/usb/gadget/legacy/Kconfig
+++ b/drivers/usb/gadget/legacy/Kconfig
@@ -149,21 +149,21 @@ config USB_ETH_RNDIS
 	   is given in comments found in that info file.
 
 config USB_ETH_EEM
-       bool "Ethernet Emulation Model (EEM) support"
-       depends on USB_ETH
+	bool "Ethernet Emulation Model (EEM) support"
+	depends on USB_ETH
 	select USB_LIBCOMPOSITE
 	select USB_F_EEM
-       help
-	 CDC EEM is a newer USB standard that is somewhat simpler than CDC ECM
-	 and therefore can be supported by more hardware.  Technically ECM and
-	 EEM are designed for different applications.  The ECM model extends
-	 the network interface to the target (e.g. a USB cable modem), and the
-	 EEM model is for mobile devices to communicate with hosts using
-	 ethernet over USB.  For Linux gadgets, however, the interface with
-	 the host is the same (a usbX device), so the differences are minimal.
-
-	 If you say "y" here, the Ethernet gadget driver will use the EEM
-	 protocol rather than ECM.  If unsure, say "n".
+	help
+	  CDC EEM is a newer USB standard that is somewhat simpler than CDC ECM
+	  and therefore can be supported by more hardware.  Technically ECM and
+	  EEM are designed for different applications.  The ECM model extends
+	  the network interface to the target (e.g. a USB cable modem), and the
+	  EEM model is for mobile devices to communicate with hosts using
+	  ethernet over USB.  For Linux gadgets, however, the interface with
+	  the host is the same (a usbX device), so the differences are minimal.
+
+	  If you say "y" here, the Ethernet gadget driver will use the EEM
+	  protocol rather than ECM.  If unsure, say "n".
 
 config USB_G_NCM
 	tristate "Network Control Model (NCM) support"
diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index acaec3ae6ad7..ae70ce29d5e4 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -120,9 +120,9 @@ config USB_FOTG210_UDC
 	   dynamically linked module called "fotg210_udc".
 
 config USB_GR_UDC
-       tristate "Aeroflex Gaisler GRUSBDC USB Peripheral Controller Driver"
-       depends on HAS_DMA
-       help
+	tristate "Aeroflex Gaisler GRUSBDC USB Peripheral Controller Driver"
+	depends on HAS_DMA
+	help
 	  Select this to support Aeroflex Gaisler GRUSBDC cores from the GRLIB
 	  VHDL IP core library.
 
-- 
2.17.1

