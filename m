Return-Path: <linux-usb+bounces-3665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6608030D5
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9785E280EC3
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA74D22EE5;
	Mon,  4 Dec 2023 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLTR49AN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89079B9
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686681; x=1733222681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EUL/FtnZISZsmtv06dx9u9mR2kZr0AUmLafaSgyQDNg=;
  b=LLTR49ANNawd2lxvhBSTGquol7YxU03djiOF16FIikFmMEBtBPEFrT+T
   ifw+PK/4mGcpIufVlzxDG6wH1cSOaNXSMnoYOT86WLcVQXL5LTXcj65Nq
   MCtnPlrUiD3GqELIk9/7xMczbSa8nkryT7Pox/rb8/TVe5MA0WdrXXuj0
   jnoFFeTz6/tYjfVP4dcofNycswLj7iFZeSLufch5BnGlN+9ZEAdt6LenW
   Kzv3WeXY4hg5Ys9kPQJHSEnQf3JLnTw3nH7MXteHc+pxDcgVnsrKpiayE
   cOoscXolZF1dBvl1mxIpmvIRvyBR2A8zjh4IRl3f0l7CM30Qaq4z0nd/0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260662"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260662"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338928"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338928"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:36 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 09/18] xhci: dbc: Add missing headers
Date: Mon,  4 Dec 2023 12:45:25 +0200
Message-Id: <20231204104534.1335903-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
References: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Don't inherit headers "by chances" from asm/bug.h, asm/io.h,
etc... Include the needed headers explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 8053aa3a7092..1d14bd0b328e 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -6,9 +6,24 @@
  *
  * Author: Lu Baolu <baolu.lu@linux.intel.com>
  */
+#include <linux/bug.h>
+#include <linux/device.h>
 #include <linux/dma-mapping.h>
-#include <linux/slab.h>
+#include <linux/errno.h>
+#include <linux/kstrtox.h>
+#include <linux/list.h>
 #include <linux/nls.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <linux/io-64-nonatomic-lo-hi.h>
+
+#include <asm/byteorder.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
-- 
2.25.1


