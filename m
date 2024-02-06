Return-Path: <linux-usb+bounces-5932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0584B5E6
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 490D71C24A90
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 13:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E43B130ACB;
	Tue,  6 Feb 2024 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDvivrn+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F7F12F382
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224640; cv=none; b=fif94sYrvuIYfh8fIhJE4ZSHaD+8y7JIkUhbyKlUOLet67OLKLuUe+XmuChnQIj5W5J4sbmJOOwUWGWoxJceTVCrjflQc5/OR14HN0+kwgnlVz1Y3vCDFdMfdl5vu6WUbUN+UChHVLLL30bQO31ZytFONsHUGHTM2oOQu61P1aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224640; c=relaxed/simple;
	bh=tEYJTZobOhb6mVQoly1IcMHB+yMhUn4vnHML1wc/Zgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0WAIKeFDMKCiky6To4+sFiXYBUysm1394qZHKZkElRMbdux0BratNLaPdHLHKzqzDqgIFH/HJjh869jbY/1ym6MF5ga7juS6+Dajd/eX5Fk1HCchxA+iu0TPx44h1ailNLTqMIEFOZtdod2uGXd/7aV2JblNwzNGFs3S8U+us4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDvivrn+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707224638; x=1738760638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tEYJTZobOhb6mVQoly1IcMHB+yMhUn4vnHML1wc/Zgw=;
  b=nDvivrn+YPoJiW4pWeoJ9Wqn9qqipsKoLVRhDZLNzhpiYEbfqNWWlG43
   vrbF7v3nI0m4l6lHtcTpaMFURoo8wxzr1fQ6T8MkY40Jdp7c7SD/hM9+k
   /DxliLL2p2ZyrdZSEzs8/H5B222F5zHBGoWlRVbZk2E6ILUDqxMoggDnB
   Qpnkals5KcOe9SWvTcsQhHDX6NOLE0iErK+vF4NyJv9n/uuCnU2f9hovu
   gP81WGKlp6O90R7nwMXTgrZ6faMOJwZow+GJYrOxWWz7ONtZgBMa29IwJ
   oEe+iNSEaakFdkT9LsicbdvVhU+m0Xu8ERSF18w76h0TcF5b9QiqAOZPV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26185045"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26185045"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909631989"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909631989"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2024 05:03:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 101ECF3C; Tue,  6 Feb 2024 15:03:55 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Sanath S <Sanath.S@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Skip discovery also in USB4 v2 host
Date: Tue,  6 Feb 2024 15:03:53 +0200
Message-ID: <20240206130354.1208816-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
References: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the host router is reset, there is no point running discovery as the
links are down. Furthermore this prevents CL-state enabling. For this
reason skip discovery in USB4 v2 host the same way we do with USB4 v1.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 20 ++++++--------------
 drivers/thunderbolt/tb.c  | 11 ++++++++---
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e8a4623dc531..91e26b982b0b 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1221,7 +1221,7 @@ static void nhi_check_iommu(struct tb_nhi *nhi)
 		str_enabled_disabled(port_ok));
 }
 
-static bool nhi_reset(struct tb_nhi *nhi)
+static void nhi_reset(struct tb_nhi *nhi)
 {
 	ktime_t timeout;
 	u32 val;
@@ -1229,11 +1229,11 @@ static bool nhi_reset(struct tb_nhi *nhi)
 	val = ioread32(nhi->iobase + REG_CAPS);
 	/* Reset only v2 and later routers */
 	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) < REG_CAPS_VERSION_2)
-		return false;
+		return;
 
 	if (!host_reset) {
 		dev_dbg(&nhi->pdev->dev, "skipping host router reset\n");
-		return false;
+		return;
 	}
 
 	iowrite32(REG_RESET_HRR, nhi->iobase + REG_RESET);
@@ -1244,14 +1244,12 @@ static bool nhi_reset(struct tb_nhi *nhi)
 		val = ioread32(nhi->iobase + REG_RESET);
 		if (!(val & REG_RESET_HRR)) {
 			dev_warn(&nhi->pdev->dev, "host router reset successful\n");
-			return true;
+			return;
 		}
 		usleep_range(10, 20);
 	} while (ktime_before(ktime_get(), timeout));
 
 	dev_warn(&nhi->pdev->dev, "timeout resetting host router\n");
-
-	return false;
 }
 
 static int nhi_init_msi(struct tb_nhi *nhi)
@@ -1333,7 +1331,6 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct device *dev = &pdev->dev;
 	struct tb_nhi *nhi;
 	struct tb *tb;
-	bool reset;
 	int res;
 
 	if (!nhi_imr_valid(pdev))
@@ -1367,12 +1364,7 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	nhi_check_quirks(nhi);
 	nhi_check_iommu(nhi);
-
-	/*
-	 * Only USB4 v2 hosts support host reset so if we already did
-	 * that then don't do it again when the domain is initialized.
-	 */
-	reset = nhi_reset(nhi) ? false : host_reset;
+	nhi_reset(nhi);
 
 	res = nhi_init_msi(nhi);
 	if (res)
@@ -1399,7 +1391,7 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	dev_dbg(dev, "NHI initialized, starting thunderbolt\n");
 
-	res = tb_domain_add(tb, reset);
+	res = tb_domain_add(tb, host_reset);
 	if (res) {
 		/*
 		 * At this point the RX/TX rings might already have been
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index f127088b6ebd..64dd22e1f5b2 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2584,6 +2584,7 @@ static int tb_scan_finalize_switch(struct device *dev, void *data)
 static int tb_start(struct tb *tb, bool reset)
 {
 	struct tb_cm *tcm = tb_priv(tb);
+	bool discover = true;
 	int ret;
 
 	tb->root_switch = tb_switch_alloc(tb, &tb->dev, 0);
@@ -2629,9 +2630,13 @@ static int tb_start(struct tb *tb, bool reset)
 	 * reset the ports to handle it as new hotplug for USB4 v1
 	 * routers (for USB4 v2 and beyond we already do host reset).
 	 */
-	if (reset && usb4_switch_version(tb->root_switch) == 1) {
-		tb_switch_reset(tb->root_switch);
-	} else {
+	if (reset && tb_switch_is_usb4(tb->root_switch)) {
+		discover = false;
+		if (usb4_switch_version(tb->root_switch) == 1)
+			tb_switch_reset(tb->root_switch);
+	}
+
+	if (discover) {
 		/* Full scan to discover devices added before the driver was loaded. */
 		tb_scan_switch(tb->root_switch);
 		/* Find out tunnels created by the boot firmware */
-- 
2.43.0


