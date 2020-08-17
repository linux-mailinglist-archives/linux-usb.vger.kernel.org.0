Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9BD246D16
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 18:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731322AbgHQQoj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 12:44:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:44950 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388936AbgHQQma (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 12:42:30 -0400
IronPort-SDR: x/v86nx6bXvNrSaNnzesarUHZSpbXgAian8P0GJvYIU5z4+8nBCXrfg/Bw0HlbSlNsPXa12vnf
 20o058aKx/rQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="154003095"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="154003095"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:42:28 -0700
IronPort-SDR: JYZ9rQ8B6AgSTm1MCFYzMWwMCt5A73L5B/TLwoqdTaYAHtfwNEJ2S8TaK8OpyksG0MUhJf1XrY
 BShn7/dwuabQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="336329428"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2020 09:42:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B10FF11E; Mon, 17 Aug 2020 19:42:26 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] usb: early: xhci-dbc: Move cpu_to_le16_array() to core
Date:   Mon, 17 Aug 2020 19:42:25 +0300
Message-Id: <20200817164226.49119-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817164226.49119-1-andriy.shevchenko@linux.intel.com>
References: <20200817164226.49119-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's used in USB but it might be useful for other drivers as well.
While at it, introduce a counterpart helper, i.e. le16_to_cpu_array().

Make them available through byteorder/generic.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/early/xhci-dbc.c      | 15 ++++-----------
 include/linux/byteorder/generic.h | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 11 deletions(-)

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
 
diff --git a/include/linux/byteorder/generic.h b/include/linux/byteorder/generic.h
index 4b13e0a3e15b..24904ad79df0 100644
--- a/include/linux/byteorder/generic.h
+++ b/include/linux/byteorder/generic.h
@@ -156,6 +156,22 @@ static inline void le64_add_cpu(__le64 *var, u64 val)
 	*var = cpu_to_le64(le64_to_cpu(*var) + val);
 }
 
+static inline void cpu_to_le16_array(__le16 *dst, const u16 *src, size_t len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		dst[i] = cpu_to_le16(src[i]);
+}
+
+static inline void le16_to_cpu_array(u16 *dst, const __le16 *src, size_t len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		dst[i] = le16_to_cpu(src[i]);
+}
+
 /* XXX: this stuff can be optimized */
 static inline void le32_to_cpu_array(u32 *buf, unsigned int words)
 {
-- 
2.28.0

