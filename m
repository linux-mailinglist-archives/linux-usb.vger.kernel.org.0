Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524D32472C5
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391629AbgHQSrV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:47:21 -0400
Received: from mga02.intel.com ([134.134.136.20]:34839 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391620AbgHQSrH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:47:07 -0400
IronPort-SDR: uskqGMA10Oma3oy37AdN2b1njuurMuC0zDWbROcwamNVa70IzZUhEmyKRWkpO1ldQdqWaSgQV7
 FRCFpJV7BX2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142602249"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="142602249"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:47:05 -0700
IronPort-SDR: NhoMsZxUMqWQ9n8/ODTRfpZKUWhcMWJqqbvgkg6avL8P6CxfK21tebRG9a4wOT+1wTxXXjkhpJ
 53rzTcsashmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="326493007"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 11:47:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7E0C2411; Mon, 17 Aug 2020 21:47:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 6/8] usb: early: xhci-dbc: use readl_poll_timeout() to simplify code
Date:   Mon, 17 Aug 2020 21:46:57 +0300
Message-Id: <20200817184659.58419-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use readl_poll_timeout() to poll the status of the registers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no change
 drivers/usb/early/xhci-dbc.c | 56 +++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index c0507767a8e3..77c2e8301971 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -14,6 +14,7 @@
 #include <linux/pci_ids.h>
 #include <linux/memblock.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <asm/pci-direct.h>
 #include <asm/fixmap.h>
 #include <linux/bcd.h>
@@ -131,38 +132,23 @@ static u32 __init xdbc_find_dbgp(int xdbc_num, u32 *b, u32 *d, u32 *f)
 	return -1;
 }
 
-static int handshake(void __iomem *ptr, u32 mask, u32 done, int wait, int delay)
-{
-	u32 result;
-
-	do {
-		result = readl(ptr);
-		result &= mask;
-		if (result == done)
-			return 0;
-		udelay(delay);
-		wait -= delay;
-	} while (wait > 0);
-
-	return -ETIMEDOUT;
-}
-
 static void __init xdbc_bios_handoff(void)
 {
 	int offset, timeout;
 	u32 val;
 
 	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_LEGACY);
-	val = readl(xdbc.xhci_base + offset);
 
-	if (val & XHCI_HC_BIOS_OWNED) {
+	val = readl(xdbc.xhci_base + offset);
+	if (val & XHCI_HC_BIOS_OWNED)
 		writel(val | XHCI_HC_OS_OWNED, xdbc.xhci_base + offset);
-		timeout = handshake(xdbc.xhci_base + offset, XHCI_HC_BIOS_OWNED, 0, 5000, 10);
 
-		if (timeout) {
-			pr_notice("failed to hand over xHCI control from BIOS\n");
-			writel(val & ~XHCI_HC_BIOS_OWNED, xdbc.xhci_base + offset);
-		}
+	timeout = readl_poll_timeout_atomic(xdbc.xhci_base + offset, val,
+					    !(val & XHCI_HC_BIOS_OWNED),
+					    10, 5000);
+	if (timeout) {
+		pr_notice("failed to hand over xHCI control from BIOS\n");
+		writel(val & ~XHCI_HC_BIOS_OWNED, xdbc.xhci_base + offset);
 	}
 
 	/* Disable BIOS SMIs and clear all SMI events: */
@@ -421,7 +407,9 @@ static int xdbc_start(void)
 
 	ctrl = readl(&xdbc.xdbc_reg->control);
 	writel(ctrl | CTRL_DBC_ENABLE | CTRL_PORT_ENABLE, &xdbc.xdbc_reg->control);
-	ret = handshake(&xdbc.xdbc_reg->control, CTRL_DBC_ENABLE, CTRL_DBC_ENABLE, 100000, 100);
+	ret = readl_poll_timeout_atomic(&xdbc.xdbc_reg->control, ctrl,
+					(ctrl & CTRL_DBC_ENABLE) == CTRL_DBC_ENABLE,
+					100, 100000);
 	if (ret) {
 		xdbc_trace("failed to initialize hardware\n");
 		return ret;
@@ -432,14 +420,18 @@ static int xdbc_start(void)
 		xdbc_reset_debug_port();
 
 	/* Wait for port connection: */
-	ret = handshake(&xdbc.xdbc_reg->portsc, PORTSC_CONN_STATUS, PORTSC_CONN_STATUS, 5000000, 100);
+	ret = readl_poll_timeout_atomic(&xdbc.xdbc_reg->portsc, status,
+					(status & PORTSC_CONN_STATUS) == PORTSC_CONN_STATUS,
+					100, 5000000);
 	if (ret) {
 		xdbc_trace("waiting for connection timed out\n");
 		return ret;
 	}
 
 	/* Wait for debug device to be configured: */
-	ret = handshake(&xdbc.xdbc_reg->control, CTRL_DBC_RUN, CTRL_DBC_RUN, 5000000, 100);
+	ret = readl_poll_timeout_atomic(&xdbc.xdbc_reg->control, status,
+					(status & CTRL_DBC_RUN) == CTRL_DBC_RUN,
+					100, 5000000);
 	if (ret) {
 		xdbc_trace("waiting for device configuration timed out\n");
 		return ret;
@@ -523,11 +515,14 @@ static int xdbc_bulk_transfer(void *data, int size, bool read)
 
 static int xdbc_handle_external_reset(void)
 {
-	int ret = 0;
+	u32 result;
+	int ret;
 
 	xdbc.flags = 0;
 	writel(0, &xdbc.xdbc_reg->control);
-	ret = handshake(&xdbc.xdbc_reg->control, CTRL_DBC_ENABLE, 0, 100000, 10);
+	ret = readl_poll_timeout_atomic(&xdbc.xdbc_reg->control, result,
+					!(result & CTRL_DBC_ENABLE),
+					10, 100000);
 	if (ret)
 		goto reset_out;
 
@@ -552,10 +547,13 @@ static int xdbc_handle_external_reset(void)
 
 static int __init xdbc_early_setup(void)
 {
+	u32 result;
 	int ret;
 
 	writel(0, &xdbc.xdbc_reg->control);
-	ret = handshake(&xdbc.xdbc_reg->control, CTRL_DBC_ENABLE, 0, 100000, 100);
+	ret = readl_poll_timeout_atomic(&xdbc.xdbc_reg->control, result,
+					!(result & CTRL_DBC_ENABLE),
+					100, 100000);
 	if (ret)
 		return ret;
 
-- 
2.28.0

