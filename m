Return-Path: <linux-usb+bounces-9908-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC928B5ABF
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21A31F21139
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4951C7C098;
	Mon, 29 Apr 2024 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5mMiHea"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650477F11
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399283; cv=none; b=lGd5+ZthdiDu8LPI5BPUiKrRJg1Xu1svv1gb5A3YOz2AmdEygnaXrIvjNo7cBDNoHxVLZH3KGJfSA7n+2P3wI7XNWVmmM0cC7gaaAARvMlfrfl6SBLksdkDGTEoW1YdcaDgdhWjPmTp71OD4hMnJ97tJ2cBIdUVeLVKwvIvQp2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399283; c=relaxed/simple;
	bh=DViq93Pit0NKqrFxw65mJiHhOCoOtXyVKIsAQ4hul38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UuZAm2UYwPrTbuHvH11+WBB0vUNGO8Vo2/gRriq1D4ipWA8Pl1giQ/SKceK34uX3/wPdOCfDUm0VHenaQ1ftfyrDr5tYDbQ0Qm/dEApk5XySnLQkXwjSGT/SlpWGQPH13x6uqS7M3w6ED79mFqI8GV0LMTC1aTQwiYkcHcvOPkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5mMiHea; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399282; x=1745935282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DViq93Pit0NKqrFxw65mJiHhOCoOtXyVKIsAQ4hul38=;
  b=N5mMiHea/QczUJ7/uAZTxW/SCWH2M9/OlOFeTr+Fngi93eXmp/cI9/4S
   Ad9CqEL275SjmXntg+O4/KouFLSaxB/Z9YJr74xzPTpNcQ1/+COuQ7dgo
   JkUrmMAnOBQjYpWH8aH7mgoYLMvMiQPr1us7j6ZaiIxiFP2QmVXK80Whx
   pNtM1AAw+Xak9H6yLZ3aR3P2bND3Jgeitge3CFdzkkiD/LxEQUmJLiIEQ
   I4OF9bRefRqz3qF+T6bkt+8gsCbYvJ0HDenDtsQTM+beeZZU32VEvmpVp
   NEBb0VTCuDfLBGV/FnnhzIc0mqk38hvMh211Czebkm2RGo1Kf+TvE1Gw/
   A==;
X-CSE-ConnectionGUID: dv90pg1KSLq/kiYcWQHLwA==
X-CSE-MsgGUID: uAT23XPgSsGIpoTzEy2Ycw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911522"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:22 -0700
X-CSE-ConnectionGUID: byUT0RlAQqOBLva/PRTu+w==
X-CSE-MsgGUID: jsSaW6DUQvSuhbwaIbNQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521912"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:20 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/18] xhci: pci: Group out Thunderbolt xHCI IDs
Date: Mon, 29 Apr 2024 17:02:42 +0300
Message-Id: <20240429140245.3955523-16-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

It's better to keep track on Thunderbolt xHCI IDs in a separate group.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index d45c84062b61..8e9b720ab330 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -46,6 +46,15 @@
 #define PCI_DEVICE_ID_INTEL_BROXTON_M_XHCI		0x0aa8
 #define PCI_DEVICE_ID_INTEL_BROXTON_B_XHCI		0x1aa8
 #define PCI_DEVICE_ID_INTEL_APOLLO_LAKE_XHCI		0x5aa8
+#define PCI_DEVICE_ID_INTEL_DENVERTON_XHCI		0x19d0
+#define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
+#define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
+#define PCI_DEVICE_ID_INTEL_COMET_LAKE_XHCI		0xa3af
+#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI		0x51ed
+#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_PCH_XHCI	0x54ed
+
+/* Thunderbolt */
+#define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI	0x15b5
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI	0x15b6
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_XHCI	0x15c1
@@ -54,13 +63,6 @@
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI		0x15e9
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI		0x15ec
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI		0x15f0
-#define PCI_DEVICE_ID_INTEL_DENVERTON_XHCI		0x19d0
-#define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
-#define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
-#define PCI_DEVICE_ID_INTEL_COMET_LAKE_XHCI		0xa3af
-#define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
-#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI		0x51ed
-#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_PCH_XHCI	0x54ed
 
 #define PCI_DEVICE_ID_AMD_RENOIR_XHCI			0x1639
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
-- 
2.25.1


