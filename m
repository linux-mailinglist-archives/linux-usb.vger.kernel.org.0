Return-Path: <linux-usb+bounces-950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7B7B57D5
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 18:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 90DF4B20DE2
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769C01DA4A;
	Mon,  2 Oct 2023 16:18:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFEB1DA4B
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 16:18:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EEEBD;
	Mon,  2 Oct 2023 09:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696263532; x=1727799532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=25mC9ayhiVvOyhyLLT89N3/FQzoVtawylvAn3pXdF80=;
  b=B2tePY5g5C67WekeQ/1V1wRaQ47IXSbbc9IY3mnpJhNrS+nFjq+TQ4s4
   JDZ4F0HxZl0bo7pUN7vaVgPTK0YSMqOvmMLt3Hwbxnu8TYqo4KwG8DhcE
   CliNe6IKjsRMGSqqU5Rese7HF/kRIMCzO3KeG0eATUekY6FIX3Zcdp73k
   7TzWAjPlDYhKb99oL8rcbPwvGF5h7+PTEK/mKtvo3E0MDNSoYfusXREjb
   z4d2Rx1iK39mvgA58acXnJ9vuU2FBhdk0KwwZgkiy+LxW71NCtdqBphU9
   4CKPM1rWhYZ7IzZhnCkRXzQ9aoKKf0J2jS72LeEvuFmLFvncOl2CzN+yj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362949543"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="362949543"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 09:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816339811"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816339811"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 02 Oct 2023 09:16:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 898081665; Mon,  2 Oct 2023 19:16:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 10/10] xhci: dbc: Add missing headers
Date: Mon,  2 Oct 2023 19:16:10 +0300
Message-Id: <20231002161610.2648818-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231002161610.2648818-1-andriy.shevchenko@linux.intel.com>
References: <20231002161610.2648818-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Don't inherit headers "by chances" from asm/bug.h, asm/io.h,
etc... Include the needed headers explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 366ce3146a93..eb2e89bf31be 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -6,9 +6,24 @@
  *
  * Author: Lu Baolu <baolu.lu@linux.intel.com>
  */
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
+#include <asm/bug.h>
+#include <asm/byteorder.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
-- 
2.40.0.1.gaa8946217a0b


