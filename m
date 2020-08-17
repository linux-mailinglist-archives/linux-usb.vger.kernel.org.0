Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612F02472C3
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390085AbgHQSrU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:47:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:34836 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391628AbgHQSrO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:47:14 -0400
IronPort-SDR: 9KvaRhHUdq/OXIamnPQt2HVOQgdrwBSDN3r6sWqG22+bFb7HwniyPEEGYU4zlcrOEDZnWNPQGt
 Cao+JEfaUKlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142602250"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="142602250"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:47:05 -0700
IronPort-SDR: JjAghirCwbBFETuxjL/t9gyN/ap9xBtlOutOnZmrsCLiiniZg4u5QJCJjN3Wjlzav0iWUwrWi4
 7AFBV8U4whLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="326493009"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 11:47:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 855A9456; Mon, 17 Aug 2020 21:47:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 7/8] usb: early: xhci-dbc: Make use of cpu_to_le16_array()
Date:   Mon, 17 Aug 2020 21:46:58 +0300
Message-Id: <20200817184659.58419-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we have a new helper, let's replace open coded variant by it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: updated commit message due to split (see patch 1)
 drivers/usb/early/xhci-dbc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 77c2e8301971..c5761ea9394d 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ":%s: " fmt, __func__
 
+#include <linux/byteorder/generic.h>
 #include <linux/console.h>
 #include <linux/pci_regs.h>
 #include <linux/pci_ids.h>
@@ -200,14 +201,6 @@ static void xdbc_reset_ring(struct xdbc_ring *ring)
 	}
 }
 
-static inline void xdbc_put_utf16(u16 *s, const char *c, size_t size)
-{
-	int i;
-
-	for (i = 0; i < size; i++)
-		s[i] = cpu_to_le16(c[i]);
-}
-
 static void xdbc_mem_init(void)
 {
 	struct xdbc_ep_context *ep_in, *ep_out;
@@ -263,7 +256,7 @@ static void xdbc_mem_init(void)
 	s_desc->bLength		= (strlen(XDBC_STRING_SERIAL) + 1) * 2;
 	s_desc->bDescriptorType	= USB_DT_STRING;
 
-	xdbc_put_utf16(s_desc->wData, XDBC_STRING_SERIAL, strlen(XDBC_STRING_SERIAL));
+	cpu_to_le16_array(s_desc->wData, XDBC_STRING_SERIAL, strlen(XDBC_STRING_SERIAL));
 	string_length = s_desc->bLength;
 	string_length <<= 8;
 
@@ -272,7 +265,7 @@ static void xdbc_mem_init(void)
 	s_desc->bLength		= (strlen(XDBC_STRING_PRODUCT) + 1) * 2;
 	s_desc->bDescriptorType	= USB_DT_STRING;
 
-	xdbc_put_utf16(s_desc->wData, XDBC_STRING_PRODUCT, strlen(XDBC_STRING_PRODUCT));
+	cpu_to_le16_array(s_desc->wData, XDBC_STRING_PRODUCT, strlen(XDBC_STRING_PRODUCT));
 	string_length += s_desc->bLength;
 	string_length <<= 8;
 
@@ -281,7 +274,7 @@ static void xdbc_mem_init(void)
 	s_desc->bLength		= (strlen(XDBC_STRING_MANUFACTURER) + 1) * 2;
 	s_desc->bDescriptorType	= USB_DT_STRING;
 
-	xdbc_put_utf16(s_desc->wData, XDBC_STRING_MANUFACTURER, strlen(XDBC_STRING_MANUFACTURER));
+	cpu_to_le16_array(s_desc->wData, XDBC_STRING_MANUFACTURER, strlen(XDBC_STRING_MANUFACTURER));
 	string_length += s_desc->bLength;
 	string_length <<= 8;
 
-- 
2.28.0

