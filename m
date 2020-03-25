Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2BB11928DE
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2020 13:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgCYMur (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Mar 2020 08:50:47 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53355 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgCYMur (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Mar 2020 08:50:47 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jH5UX-0005f3-9Y; Wed, 25 Mar 2020 12:50:41 +0000
From:   Colin King <colin.king@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: cdns3: make signed 1 bit bitfields unsigned
Date:   Wed, 25 Mar 2020 12:50:41 +0000
Message-Id: <20200325125041.94769-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The signed 1 bit bitfields should be unsigned, so make them unsigned.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 4 ++--
 drivers/usb/cdns3/gadget.h   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index c6a79ca15858..5685ba11480b 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -52,8 +52,8 @@ enum modestrap_mode { USBSS_MODESTRAP_MODE_NONE,
 struct cdns_ti {
 	struct device *dev;
 	void __iomem *usbss;
-	int usb2_only:1;
-	int vbus_divider:1;
+	unsigned usb2_only:1;
+	unsigned vbus_divider:1;
 	struct clk *usb2_refclk;
 	struct clk *lpm_clk;
 };
diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
index f003a7801872..bf2828e4df2c 100644
--- a/drivers/usb/cdns3/gadget.h
+++ b/drivers/usb/cdns3/gadget.h
@@ -1199,7 +1199,7 @@ struct cdns3_aligned_buf {
 	void			*buf;
 	dma_addr_t		dma;
 	u32			size;
-	int			in_use:1;
+	unsigned		in_use:1;
 	struct list_head	list;
 };
 
@@ -1308,8 +1308,8 @@ struct cdns3_device {
 	unsigned			u2_allowed:1;
 	unsigned			is_selfpowered:1;
 	unsigned			setup_pending:1;
-	int				hw_configured_flag:1;
-	int				wake_up_flag:1;
+	unsigned			hw_configured_flag:1;
+	unsigned			wake_up_flag:1;
 	unsigned			status_completion_no_call:1;
 	unsigned			using_streams:1;
 	int				out_mem_is_allocated;
-- 
2.25.1

