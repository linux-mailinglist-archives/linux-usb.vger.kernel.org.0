Return-Path: <linux-usb+bounces-14343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB0965A39
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 10:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15428B2363C
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 08:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E0516C6BD;
	Fri, 30 Aug 2024 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="al5AkR7t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA3166F3F
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006286; cv=none; b=tW0nUsjKiAAuQOrsb07hYNjbnK5ikqdNxV2p8MyzGHdVGMA2sqpfvjHjI8gz1CyR2eJewaNBpSpNE+MNlGXw6wuIqAV5gCN1nBrjhkd0hne2uf/sA106Ngg8KQ58s620wK0sx8m98WWRxxyNzHKnql+mYDqQswCtFoSUGE4g2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006286; c=relaxed/simple;
	bh=N2YGQNk0YoOAUKenKKpF0Bh5urPA5WunZeZsyjyVnqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aZ5JKaXrnGxYAH9uaQZZvRcSyLbdNo7fiysirJFMJrorcbp1EIuz0iRsbGBrkA798LBgMzfL4ojJPJVVldBFathSfQiVEUlftMkdCeo996/WVmQ8L6ulm3osP9hbttRyyySEROSAGVAYNUaLeipInkGC/djuiuyO2+mf0rdbfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=al5AkR7t; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725006285; x=1756542285;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N2YGQNk0YoOAUKenKKpF0Bh5urPA5WunZeZsyjyVnqw=;
  b=al5AkR7tPzrruBvodisIUU1ligV+mQbhqPlt1BRtVShV0Jx93bfx95RP
   VLKW5Jkju91327z/R/tj0RWFeYzpXECSnA91b4jDxfgK/N1TBPtNdos3L
   /xPFUtHxbYckLQYqmrYddFvIEYgdMLJDtz2mSwY3/cwv/JMf+kTsVbE+J
   L9knyZ1K24+iRhu1bl3T0bUyd6YX6dhURHc2O4YJZ/SLfuceOIUynr5SX
   1O4u53lK+PJTCUQ5nvjHtUe+XSCNjEY5KH1ToXAQumaEM6K1+WwiC13t7
   cCt3fJlB1pgtt0hsu2O3GhkguO/uzTLgRA5xT3jK8Vp2dZwGCnRDBw0LW
   Q==;
X-CSE-ConnectionGUID: 5p1+vm9QSqeXZBAQwsoFPg==
X-CSE-MsgGUID: EQfyilaDQ8mdaCRkyr05SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23803733"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23803733"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:24:44 -0700
X-CSE-ConnectionGUID: nguJVXm4TTK/VhoTZBvgOQ==
X-CSE-MsgGUID: gJLBvfZTQAatj4vyna7/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68231364"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.163.83])
  by fmviesa005.fm.intel.com with ESMTP; 30 Aug 2024 01:24:42 -0700
From: Saranya Gopal <saranya.gopal@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	rajaram.regupathy@intel.com,
	Saranya Gopal <saranya.gopal@intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI read operations
Date: Fri, 30 Aug 2024 14:13:42 +0530
Message-Id: <20240830084342.460109-1-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI _DSM methods are needed only for UCSI write operations and for reading
CCI during RESET_PPM operation. So, remove _DSM calls from other places.
While there, remove the Zenbook quirk also since the default behavior
now aligns with the Zenbook quirk. With this change, GET_CONNECTOR_STATUS
returns at least 6 seconds faster than before in Arrowlake-S platforms.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 56 +++---------------------------
 1 file changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 7a5dff8d9cc6..accf15ff1306 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -61,9 +61,11 @@ static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *cci)
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
-	if (ret)
-		return ret;
+	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
+		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
+		if (ret)
+			return ret;
+	}
 
 	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
 
@@ -73,11 +75,6 @@ static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *cci)
 static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-	int ret;
-
-	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
-	if (ret)
-		return ret;
 
 	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
 
@@ -102,42 +99,6 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.async_control = ucsi_acpi_async_control
 };
 
-static int
-ucsi_zenbook_read_cci(struct ucsi *ucsi, u32 *cci)
-{
-	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-	int ret;
-
-	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
-		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
-		if (ret)
-			return ret;
-	}
-
-	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
-
-	return 0;
-}
-
-static int
-ucsi_zenbook_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
-{
-	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-
-	/* UCSI_MESSAGE_IN is never read for PPM_RESET, return stored data */
-	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
-
-	return 0;
-}
-
-static const struct ucsi_operations ucsi_zenbook_ops = {
-	.read_version = ucsi_acpi_read_version,
-	.read_cci = ucsi_zenbook_read_cci,
-	.read_message_in = ucsi_zenbook_read_message_in,
-	.sync_control = ucsi_sync_control_common,
-	.async_control = ucsi_acpi_async_control
-};
-
 static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
 {
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
@@ -190,13 +151,6 @@ static const struct ucsi_operations ucsi_gram_ops = {
 };
 
 static const struct dmi_system_id ucsi_acpi_quirks[] = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX325UA_UM325UA"),
-		},
-		.driver_data = (void *)&ucsi_zenbook_ops,
-	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
-- 
2.34.1


