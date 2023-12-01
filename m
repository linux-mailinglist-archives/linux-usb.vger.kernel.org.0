Return-Path: <linux-usb+bounces-3557-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBA0800DF1
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CFD1B21758
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D70F4A9A6;
	Fri,  1 Dec 2023 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0x9l8ZF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA3C193
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443159; x=1732979159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/x1/w8qB2lUGE2LxpGuagQoSSwWPD9GFOSewc0zND18=;
  b=T0x9l8ZFt8pI8xeX4UmG41FKTdPowIz+bwqW7ukcCdj17zaycP2bA1xj
   BMRcIrywYmHbQbBU91Z5oQoXZu4X+1wtuMXytf04wxlJ88ShJOFHt4qEw
   2VPSdJ/kahUbVvb8i7U8UVmyg3fKJpwFeJRwQMp4JbGQuSYf/WmyvojAK
   HQyWZYYpEVfMgPddsEuJ/AOs/LJdp+0Kx/L7RP2uc+O2N1w4pQelc715O
   E439psjNBbyzwMXN4BpRU4g4/lHqM/t9l+x+6PtQwzhMFGLvmf2qA/9/0
   s8AYjDxxskjuuGSUDE/CHF1cxLP6iPjOrVTB52V5neVjll+pS/yBUDGDx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309742"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309742"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112584"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112584"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:57 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/19] xhci: dbc: Add missing headers
Date: Fri,  1 Dec 2023 17:06:38 +0200
Message-Id: <20231201150647.1307406-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
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
index 73494d55b0be..d82935d31126 100644
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


