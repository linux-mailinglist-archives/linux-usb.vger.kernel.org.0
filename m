Return-Path: <linux-usb+bounces-11362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CED3090AA8B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 12:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5450C282AF2
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 10:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B950519049F;
	Mon, 17 Jun 2024 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nslBlrVZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2F3161320
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618482; cv=none; b=T33Ir6vGwYnZu2er+oRYtMciSLAPi2QVIEi1CDmsDbEpHVmPGIcu9DUNrLI3iZJOXZfjpTL18tSi6ERloJaOO0+6i8FvPqgagyXy6WiqkTQQa4U29FObGgZ6RjoYpOR/3u9si+xdJaS7/pNWig7Fj9ZMn8oZah5+KkwNapg0yTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618482; c=relaxed/simple;
	bh=/fOh7DaiLYJZDbRKBA08TiE035PsRAM9Tt8bUfNAP/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EoBBwZdCWghQhCUJs7WKKQg8HhtxQY3R8iTvviroh3tiAcHkhFYe94DpiwXZzXdtNiuqop/rBxD2Pca6xx+oI9FMhh8+ZszWYtNK48BOulfiSPiH5PUTxMX7Vo/pLnJJtfTX7+vH0xT6vnufFx3qq3OoJB9mmZfIJbWOcWK8ke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nslBlrVZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718618481; x=1750154481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/fOh7DaiLYJZDbRKBA08TiE035PsRAM9Tt8bUfNAP/Y=;
  b=nslBlrVZdg2QwILiikuKjw8jxUa/qP+oW0mb3mggn+BoBmAXDsCcA8Cf
   /KoHKlAAhX/2oRUiq7v1TXCzlRnV0ifbNrNoh0C6lC863C5xXPyn3ROxZ
   43Xz/J/DNRTT82HHBWcBR8KoahzphH2/46eN3ANU98vKiUqqiqkvB9QuW
   x/EJaIb3MhGRyvctBDCSBJYpBuvO7hqHQ+ESi9BSJYx18t4CWIapm6Igf
   tUlBD2MHVk0jGy9bXn9Gu2gZGFJD3fffk/mwcBOT6LKhp/uWgCGbzbpSp
   YeBT2gIiq8H9KYT8/KzSl+COZJYOSpXdESgMpELghl1pOJTgCEYUBR6o6
   g==;
X-CSE-ConnectionGUID: oLG3ebClQQiviZB8cfJsmA==
X-CSE-MsgGUID: 2YE0mJC0ShyrSqYcDd3ZQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="32907765"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="32907765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 03:01:04 -0700
X-CSE-ConnectionGUID: NN8sUDluS+C8NJu1ZKPFSA==
X-CSE-MsgGUID: REja1kZVSqW3wx3/liD6OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="72352935"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2024 03:01:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2EA0618E; Mon, 17 Jun 2024 13:01:00 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: debugfs: Use FIELD_GET()
Date: Mon, 17 Jun 2024 13:01:00 +0300
Message-ID: <20240617100100.1628147-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aapo Vienamo <aapo.vienamo@linux.intel.com>

Use the FIELD_GET() macro instead of open coding the masks and shifts.
This makes the code more compact and improves readability as the this
avoids the need to wrap excessively long lines.

Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 29 +++++++++++------------------
 drivers/thunderbolt/sb_regs.h |  9 ---------
 2 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index c2a735421609..11185cc1db92 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -7,6 +7,7 @@
  *	    Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/uaccess.h>
@@ -436,8 +437,7 @@ static bool both_lanes(const struct tb_margining *margining)
 static unsigned int
 independent_voltage_margins(const struct tb_margining *margining)
 {
-	return (margining->caps[0] & USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK) >>
-		USB4_MARGIN_CAP_0_VOLTAGE_INDP_SHIFT;
+	return FIELD_GET(USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK, margining->caps[0]);
 }
 
 static bool supports_time(const struct tb_margining *margining)
@@ -449,8 +449,7 @@ static bool supports_time(const struct tb_margining *margining)
 static unsigned int
 independent_time_margins(const struct tb_margining *margining)
 {
-	return (margining->caps[1] & USB4_MARGIN_CAP_1_TIME_INDP_MASK) >>
-		USB4_MARGIN_CAP_1_TIME_INDP_SHIFT;
+	return FIELD_GET(USB4_MARGIN_CAP_1_TIME_INDP_MASK, margining->caps[1]);
 }
 
 static ssize_t
@@ -845,7 +844,7 @@ static void voltage_margin_show(struct seq_file *s,
 {
 	unsigned int tmp, voltage;
 
-	tmp = val & USB4_MARGIN_HW_RES_1_MARGIN_MASK;
+	tmp = FIELD_GET(USB4_MARGIN_HW_RES_1_MARGIN_MASK, val);
 	voltage = tmp * margining->max_voltage_offset / margining->voltage_steps;
 	seq_printf(s, "%u mV (%u)", voltage, tmp);
 	if (val & USB4_MARGIN_HW_RES_1_EXCEEDS)
@@ -858,7 +857,7 @@ static void time_margin_show(struct seq_file *s,
 {
 	unsigned int tmp, interval;
 
-	tmp = val & USB4_MARGIN_HW_RES_1_MARGIN_MASK;
+	tmp = FIELD_GET(USB4_MARGIN_HW_RES_1_MARGIN_MASK, val);
 	interval = tmp * margining->max_time_offset / margining->time_steps;
 	seq_printf(s, "%u mUI (%u)", interval, tmp);
 	if (val & USB4_MARGIN_HW_RES_1_EXCEEDS)
@@ -1085,19 +1084,15 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	if (supports_software(margining))
 		margining->software = true;
 
-	val = (margining->caps[0] & USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK) >>
-		USB4_MARGIN_CAP_0_VOLTAGE_STEPS_SHIFT;
+	val = FIELD_GET(USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK, margining->caps[0]);
 	margining->voltage_steps = val;
-	val = (margining->caps[0] & USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK) >>
-		USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_SHIFT;
+	val = FIELD_GET(USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK, margining->caps[0]);
 	margining->max_voltage_offset = 74 + val * 2;
 
 	if (supports_time(margining)) {
-		val = (margining->caps[1] & USB4_MARGIN_CAP_1_TIME_STEPS_MASK) >>
-			USB4_MARGIN_CAP_1_TIME_STEPS_SHIFT;
+		val = FIELD_GET(USB4_MARGIN_CAP_1_TIME_STEPS_MASK, margining->caps[1]);
 		margining->time_steps = val;
-		val = (margining->caps[1] & USB4_MARGIN_CAP_1_TIME_OFFSET_MASK) >>
-			USB4_MARGIN_CAP_1_TIME_OFFSET_SHIFT;
+		val = FIELD_GET(USB4_MARGIN_CAP_1_TIME_OFFSET_MASK, margining->caps[1]);
 		/*
 		 * Store it as mUI (milli Unit Interval) because we want
 		 * to keep it as integer.
@@ -1107,11 +1102,9 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 
 	dir = debugfs_create_dir("margining", parent);
 	if (supports_hardware(margining)) {
-		val = (margining->caps[1] & USB4_MARGIN_CAP_1_MIN_BER_MASK) >>
-			USB4_MARGIN_CAP_1_MIN_BER_SHIFT;
+		val = FIELD_GET(USB4_MARGIN_CAP_1_MIN_BER_MASK, margining->caps[1]);
 		margining->min_ber_level = val;
-		val = (margining->caps[1] & USB4_MARGIN_CAP_1_MAX_BER_MASK) >>
-			USB4_MARGIN_CAP_1_MAX_BER_SHIFT;
+		val = FIELD_GET(USB4_MARGIN_CAP_1_MAX_BER_MASK, margining->caps[1]);
 		margining->max_ber_level = val;
 
 		/* Set the default to minimum */
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index a29ef3c19422..2a88edfc97b2 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -51,30 +51,21 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_CAP_0_MODES_SW		BIT(1)
 #define USB4_MARGIN_CAP_0_2_LANES		BIT(2)
 #define USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK	GENMASK(4, 3)
-#define USB4_MARGIN_CAP_0_VOLTAGE_INDP_SHIFT	3
 #define USB4_MARGIN_CAP_0_VOLTAGE_MIN		0x0
 #define USB4_MARGIN_CAP_0_VOLTAGE_HL		0x1
 #define USB4_MARGIN_CAP_0_VOLTAGE_BOTH		0x2
 #define USB4_MARGIN_CAP_0_TIME			BIT(5)
 #define USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK	GENMASK(12, 6)
-#define USB4_MARGIN_CAP_0_VOLTAGE_STEPS_SHIFT	6
 #define USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK GENMASK(18, 13)
-#define USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_SHIFT 13
 #define USB4_MARGIN_CAP_1_TIME_DESTR		BIT(8)
 #define USB4_MARGIN_CAP_1_TIME_INDP_MASK	GENMASK(10, 9)
-#define USB4_MARGIN_CAP_1_TIME_INDP_SHIFT	9
 #define USB4_MARGIN_CAP_1_TIME_MIN		0x0
 #define USB4_MARGIN_CAP_1_TIME_LR		0x1
 #define USB4_MARGIN_CAP_1_TIME_BOTH		0x2
 #define USB4_MARGIN_CAP_1_TIME_STEPS_MASK	GENMASK(15, 11)
-#define USB4_MARGIN_CAP_1_TIME_STEPS_SHIFT	11
 #define USB4_MARGIN_CAP_1_TIME_OFFSET_MASK	GENMASK(20, 16)
-#define USB4_MARGIN_CAP_1_TIME_OFFSET_SHIFT	16
 #define USB4_MARGIN_CAP_1_MIN_BER_MASK		GENMASK(25, 21)
-#define USB4_MARGIN_CAP_1_MIN_BER_SHIFT		21
 #define USB4_MARGIN_CAP_1_MAX_BER_MASK		GENMASK(30, 26)
-#define USB4_MARGIN_CAP_1_MAX_BER_SHIFT		26
-#define USB4_MARGIN_CAP_1_MAX_BER_SHIFT		26
 
 /* USB4_SB_OPCODE_RUN_HW_LANE_MARGINING */
 #define USB4_MARGIN_HW_TIME			BIT(3)
-- 
2.43.0


