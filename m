Return-Path: <linux-usb+bounces-29626-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D4C07053
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 17:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AB561C258C3
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 15:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5E632A3C2;
	Fri, 24 Oct 2025 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfBx3iII"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7175D31B817
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320534; cv=none; b=gG5w2uyqeA/YEbwvVuWr01wN1u7mrQ6Y2c4d6fcov7zm+MkKDl11TUCI9dXgmsfvwDrplcQiFn6hzCM2k+3ku2f24r9KB8/iqV9NNYEoi4TX1BVpGfLL5ouaQG/8fIxobPGlHFHBRCsxEQKvDyYeszbm+zq/pG9mat7kDH1R+Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320534; c=relaxed/simple;
	bh=RVfgFyJuvNL0JmC3RGbfh8Mwj1O2Xt5v+eG98LZH4Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVrXe2CFgtwTWiCZtv8cs7JOsqaIjdmLN4o5tYjYszOj8H1UKHwmwDOcnBopzSUz0ETajFSuBcycoErX6PyfT9geoZS/fTzUBqvjTp1QMkzRQf2VvUbyeEkpmJVmbJeW7n+myUtdfO1hsaR7z9YHxl/ocT8R/y3zW6/M2VPagHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfBx3iII; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761320533; x=1792856533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RVfgFyJuvNL0JmC3RGbfh8Mwj1O2Xt5v+eG98LZH4Zc=;
  b=bfBx3iIID5vOQThjVnMzeInD761l3+HZvkX8qi3Q42xiFv1OCXWAKErq
   neOC11GacOgLF+Yg2HLAQx4cmHDRKNYVjM6tbOOpTKLDBQcztvJCVz9ZK
   j/iu6/Q5U8OrL191dlyVWw5diafgZ2qJW4rm4P9JPXTk0IO7KA9lUWURX
   qPEzmLtnUMzjvIlCYxZEiBL5JkyuaBdA/6jUYk/P4SJLYvy2qK3sVYhpt
   IYESOa/cm2oneVkr7NoHk+4edc5d6ELW0i6N2kaE2EziNh06AWKhIlKXn
   6Lu90M1YJJmtSPsi768PVlhoBe2eVCrYSQhxBpS1CUePFLsRWl3Rtk/J2
   g==;
X-CSE-ConnectionGUID: qaB/n/ChTbqrU3Jh8dv3gw==
X-CSE-MsgGUID: /Oejl+2MSFmDDZXnLz+RcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51079993"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="51079993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 08:42:12 -0700
X-CSE-ConnectionGUID: s4kvFy6HTq+llTxoeN4E7Q==
X-CSE-MsgGUID: NlBmIaBbQsCrhC4nTIzI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184938339"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.138])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 08:42:10 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: migo.oravec@gmail.com
Cc: <linux-usb@vger.kernel.org>,
	<gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH] usb: early: xhci-dbc: Try smaller early_ioremap size if original size fails
Date: Fri, 24 Oct 2025 18:41:57 +0300
Message-ID: <20251024154157.40800-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
References: <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Retry early_ioremap() with smaller sizes down to 4k if original size for
remap fails.

Walk the xHCI capabilitues manually while looking for the DbC capability
offset. Making sure we don't go over the new ioremap size limit.

DbC capability is 64bytes itself.

If we are lucky then the vendor has put DbC capability early in the
mmio range, and we can work with a reduced ioremap size

TESTPATCH, Hack with pr_warn() messages
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/early/xhci-dbc.c | 38 +++++++++++++++++++++++++++++++++---
 drivers/usb/early/xhci-dbc.h |  1 +
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 41118bba9197..9a7f3f12f18f 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -85,8 +85,18 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 
 	xdbc.xhci_start = val64;
 	xdbc.xhci_length = sz64;
+	xdbc.xhci_orig_length = sz64;
+retry:
 	base = early_ioremap(val64, sz64);
 
+	if (!base && sz64 > 0x1000) {
+		pr_warn("Failed to ioremap xhci-dbc with size 0x%llx\n", sz64);
+		sz64 = sz64 >> 1;
+		pr_warn("Retry xhci-dbc ioremap with reduced size 0x%llx\n", sz64);
+		xdbc.xhci_length = sz64;
+		goto retry;
+	}
+
 	return base;
 }
 
@@ -601,7 +611,8 @@ static int __init xdbc_early_setup(void)
 int __init early_xdbc_parse_parameter(char *s, int keep_early)
 {
 	unsigned long dbgp_num = 0;
-	u32 bus, dev, func, offset;
+	u32 bus, dev, func, offset = 0;
+	u32 val;
 	char *e;
 	int ret;
 
@@ -640,15 +651,36 @@ int __init early_xdbc_parse_parameter(char *s, int keep_early)
 		return -EINVAL;
 
 	/* Locate DbC registers: */
-	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
+	if (xdbc.xhci_length == xdbc.xhci_orig_length) {
+		offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
+	} else {
+		/*
+		 * Mapped mmio size cut short from what xhci needs.
+		 * Check if this dBc capability is withing the new cut size.
+		 * DbC capability needs 64 bytes from its capabilty offset.
+		 */
+		do {
+			offset = xhci_find_next_ext_cap(xdbc.xhci_base, offset, 0);
+			if (!offset || (offset + 64 >= xdbc.xhci_length)) {
+				pr_warn("Bad DbC offset 0x%x, max 0x%lx", offset, xdbc.xhci_length);
+				offset = 0;
+				break;
+			}
+			pr_warn("Looking for DbC capability at offset 0x%x", offset);
+			val = readl(xdbc.xhci_base + offset);
+		} while (XHCI_EXT_CAPS_ID(val) != XHCI_EXT_CAPS_DEBUG);
+	}
+
 	if (!offset) {
-		pr_notice("xhci host doesn't support debug capability\n");
+		pr_warn("xhci host doesn't support debug capability\n");
 		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
 		xdbc.xhci_base = NULL;
 		xdbc.xhci_length = 0;
 
 		return -ENODEV;
 	}
+	pr_warn("DbC capability found at offset 0x%x", offset);
+
 	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
 
 	return 0;
diff --git a/drivers/usb/early/xhci-dbc.h b/drivers/usb/early/xhci-dbc.h
index 8b4d71de45fc..5c3855862569 100644
--- a/drivers/usb/early/xhci-dbc.h
+++ b/drivers/usb/early/xhci-dbc.h
@@ -146,6 +146,7 @@ struct xdbc_state {
 	void __iomem		*xhci_base;
 	u64			xhci_start;
 	size_t			xhci_length;
+	size_t			xhci_orig_length;
 	int			port_number;
 
 	/* DbC register base */
-- 
2.43.0


