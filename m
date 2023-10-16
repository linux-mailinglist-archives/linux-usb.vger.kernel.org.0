Return-Path: <linux-usb+bounces-1669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 902AE7CA8E7
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 15:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96241C20B5E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 13:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A57F27EE9;
	Mon, 16 Oct 2023 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVx5nvbD"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B28227EC2
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 13:09:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27247F7;
	Mon, 16 Oct 2023 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697461789; x=1728997789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ycKEu6aIli6lxZMS9klc458Zt4d5Yco6j3mjsSXjEcE=;
  b=ZVx5nvbD8G2ZM6GvG/c6x5y0hrQHWEMNohBnpmt2pr3LIHzyffSdZrjy
   FfQysvRwbfqk3x2FjkWxFmACmkclz7PjW7g7iEglgdvflMSpGSestubkR
   ZT/wnekmrhuVL/7YMJcSZqsf1d2SKtLB+tq87/RIP1l9FHicchk1JcUH3
   7uWVLhkUhuE2OM3B6jlcVrhOMIOMIW2KvhrmRp3xYHWA4RW/ohtGgsQsF
   QFL5Glw+mRlXpkqWp/pxv2e8b29f3wJQ67ZzYoImOPUjVk2Ox9FvXpefe
   4ga1TB74viVA2+buTcSnVPtjQ5l4da5jF2rwLXwvuoJTzoL6ROPtwmku3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416590166"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="416590166"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 06:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="759385522"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="759385522"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 16 Oct 2023 06:09:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 626A9BC2; Mon, 16 Oct 2023 16:09:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 10/10] xhci: dbc: Add missing headers
Date: Mon, 16 Oct 2023 16:09:34 +0300
Message-Id: <20231016130934.1158504-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231016130934.1158504-1-andriy.shevchenko@linux.intel.com>
References: <20231016130934.1158504-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Don't inherit headers "by chances" from asm/bug.h, asm/io.h,
etc... Include the needed headers explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
2.40.0.1.gaa8946217a0b


