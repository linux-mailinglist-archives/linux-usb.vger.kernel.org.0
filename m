Return-Path: <linux-usb+bounces-29108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62851BCBBF1
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 07:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6129119E64AE
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 05:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FCE245020;
	Fri, 10 Oct 2025 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDAbHRrL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C99F23A9AC
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 05:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760075793; cv=none; b=J1g5nR2/WzL33ws2zHn6w8K1beC56wrtKMV68IeOThEe3E9uTrx8KFclCgqTCX0iQNEUW+yGlrr1Y6Sj2+YvsnTlaaYiI6CPUU9SvG60L3PjL93uzdKErwYbpWLqcQZYpajX6+YDneoRX1W5oQoCFSk8wtAlLZiQqnOkfpnkAQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760075793; c=relaxed/simple;
	bh=bja4Chi7JWdUG74B8bgqFismgNM8XhuaA8z9OUCfvJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rN2Xby9TLT6KCXyB1v8rX73L1aWwrRimOEQHHmAMQbx/AiLRPboBsp70WUx8ETGYzevof3yaejw9slv6eV8vLZovSDCdJLWqsr88Ghl6cXsVsiP6W2TC2dRTt2USleR5H2f267N5gwRTO7CSkhBiX1VAIA0ymBJW39Z3Ym6wR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDAbHRrL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760075792; x=1791611792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bja4Chi7JWdUG74B8bgqFismgNM8XhuaA8z9OUCfvJQ=;
  b=FDAbHRrLMN6D6bFSg2OEZdYhOkf7kGDvfhx/twK1zIsc+tqXPjCrPcEZ
   V6NIp7HhScELWnDQ8yUBXrk0tulw2FnGVSexZKv/I3BUNseMUnfkmEPly
   D1gFtpkeEMY17SgtFhDtmTExq91vRoGDAeskub3+jttD3KLf77FiUrbOP
   wYCMMgcL0AkeISjnSCmNos7K5OL2/x1t9KNhyfam5WkctmLkt+4Zxm1UE
   OiQPa2mp1GY9OTHJrCSJoAoHWtGQUqm/yDS/m+4Yc/bnH77IAjMjbIOSe
   sFJptSTH51vbUPd25GxqD3bXibt66mYU98QPE4nNsBfs9i0rBCxMz1Iuh
   w==;
X-CSE-ConnectionGUID: w8xN0PePRMu00r3Gx8Y6Vw==
X-CSE-MsgGUID: 8up8RfQrRXmmit9o6c68Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="84912362"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="84912362"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:56:29 -0700
X-CSE-ConnectionGUID: BJALf+2lS0ebQ1bGrZw9EA==
X-CSE-MsgGUID: B8AQp0nISdmdG0h1kwGUJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180584671"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.98])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:56:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 40A56120815;
	Fri, 10 Oct 2025 08:56:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v7677-0000000HP2z-3Prl;
	Fri, 10 Oct 2025 08:56:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 2/2] usb: ljca: Improve ACPI hardware ID documentation
Date: Fri, 10 Oct 2025 08:56:25 +0300
Message-ID: <20251010055625.4147844-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>
References: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the differences between the LJCA client device ACPI hardware IDs,
including the USBIO IDs used for LJCA devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/misc/usb-ljca.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index cf01cc727685..ebc18fae76e8 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -164,28 +164,39 @@ struct ljca_match_ids_walk_data {
 	struct acpi_device *adev;
 };
 
+/*
+ * ACPI hardware IDs for LJCA client devices.
+ *
+ * [1] Some BIOS implementations use these IDs for denoting LJCA client devices
+ *     even though the IDs have been allocated for USBIO. This isn't a problem
+ *     as the usb-ljca driver is probed based on the USB device's vendor and
+ *     product IDs and its client drivers are probed based on auxiliary device
+ *     names, not these ACPI _HIDs. List of such systems:
+ *
+ *     Dell Precision 5490
+ */
 static const struct acpi_device_id ljca_gpio_hids[] = {
-	{ "INTC100B" },
-	{ "INTC1074" },
-	{ "INTC1096" },
-	{ "INTC10B5" },
-	{ "INTC10D1" },
+	{ "INTC100B" }, /* RPL LJCA GPIO */
+	{ "INTC1074" }, /* CVF LJCA GPIO */
+	{ "INTC1096" }, /* ADL LJCA GPIO */
+	{ "INTC10B5" }, /* LNL LJCA GPIO */
+	{ "INTC10D1" }, /* MTL (CVF VSC) USBIO GPIO [1] */
 	{},
 };
 
 static const struct acpi_device_id ljca_i2c_hids[] = {
-	{ "INTC100C" },
-	{ "INTC1075" },
-	{ "INTC1097" },
-	{ "INTC10D2" },
+	{ "INTC100C" }, /* RPL LJCA I2C */
+	{ "INTC1075" }, /* CVF LJCA I2C */
+	{ "INTC1097" }, /* ADL LJCA I2C */
+	{ "INTC10D2" }, /* MTL (CVF VSC) USBIO I2C [1] */
 	{},
 };
 
 static const struct acpi_device_id ljca_spi_hids[] = {
-	{ "INTC100D" },
-	{ "INTC1091" },
-	{ "INTC1098" },
-	{ "INTC10D3" },
+	{ "INTC100D" }, /* RPL LJCA SPI */
+	{ "INTC1091" }, /* TGL/ADL LJCA SPI */
+	{ "INTC1098" }, /* ADL LJCA SPI */
+	{ "INTC10D3" }, /* MTL (CVF VSC) USBIO SPI [1] */
 	{},
 };
 
-- 
2.47.3


