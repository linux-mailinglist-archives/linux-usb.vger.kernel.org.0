Return-Path: <linux-usb+bounces-3549-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48053800DE8
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4871281D8E
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722B7482FA;
	Fri,  1 Dec 2023 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f729m+i6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3E61707
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443145; x=1732979145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kby4GQabOCo2+3jOwcDprLpYfk4E0SQYQ/P/kJyI3qA=;
  b=f729m+i6KX8i8I9AJ9d/pendT5n3bWMPgLHg6u7mLlRlXjeDUMAOkFJt
   exuKv56XpEoECCRcaT/OQ07ytoCwdqXXwyIJeKAichmE0iC6Z5C/7Ptpi
   4B84nZplYbj0Upgd5tdbx8CC0YdQBQ3ihdyhfGgFG+xfJj3sZu6IsPAc1
   hNmq+jj69/v3HweTomBRrAsyadOhHQASLeq4lPvFSUjGTCQXQoTfP7I9K
   3Gh5XWDJl+a2GVRcVT7Z1C0N/QcsxLO5iRcaGH9o7guJRU4vY5uKiN5jl
   9mO1TLHBpiVdbcnnJyLegItizIvq9//YFcH/AU9SLYiJVCbLukKSHGzsg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309684"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309684"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112511"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112511"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:43 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/19] xhci: dbc: Convert to use sysfs_streq()
Date: Fri,  1 Dec 2023 17:06:30 +0200
Message-Id: <20231201150647.1307406-3-mathias.nyman@linux.intel.com>
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

It's standard approach to parse values from user space by using
sysfs_streq(). Make driver use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 9e9ce3711813..f505b79afe53 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -957,9 +957,9 @@ static ssize_t dbc_store(struct device *dev,
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
 
-	if (!strncmp(buf, "enable", 6))
+	if (sysfs_streq(buf, "enable"))
 		xhci_dbc_start(dbc);
-	else if (!strncmp(buf, "disable", 7))
+	else if (sysfs_streq(buf, "disable"))
 		xhci_dbc_stop(dbc);
 	else
 		return -EINVAL;
-- 
2.25.1


