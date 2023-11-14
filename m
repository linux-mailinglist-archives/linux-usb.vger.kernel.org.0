Return-Path: <linux-usb+bounces-2856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF57EAAC4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 08:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8466AB20A80
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 07:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20A811718;
	Tue, 14 Nov 2023 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4d+5Abs"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F75BE4D
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 07:08:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D55195
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 23:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699945707; x=1731481707;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EI+f6fYrzaOyYoTNSy0nR2nSThyevAe6RYlrAD9I2OQ=;
  b=A4d+5Abs7M0h615azJ/klurGeL11ohSJHsZuq0I3kwaJy6KHBlTaH6I1
   wSUadDsZDCYtyMmItXh2ctmY9Upf4s0nh7tXW8i2xHKqJjLRcfAB3PP1L
   lNmlPMWjM0sZ8Q7eMQSSndmC0IKEaBxNIIhbX+FtM1JFeGrV75Requ4ZA
   GQbG1Erozn8ER5rfCpvQswNkQPnHXz/zyXo9dY8xrwKyMW9Cibf239kwD
   +b6yWkI6q/Rk2NWuatZEMLr4DFjVSgyhranMcn18szg+3eE/s60rZlAkT
   Cmsm/+N2hjOUspOD9D7J/XqH9wENv2swjDppe1niXEZVUm2MNIWLUYpFD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454891843"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="454891843"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 23:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741008561"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="741008561"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by orsmga006.jf.intel.com with ESMTP; 13 Nov 2023 23:08:25 -0800
From: Wentong Wu <wentong.wu@intel.com>
To: andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH] usb: misc: ljca: Drop _ADR support to get ljca children devices
Date: Tue, 14 Nov 2023 15:25:31 +0800
Message-Id: <20231114072531.1366753-1-wentong.wu@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the shipped platforms use only _HID to distinguish
ljca children devices. The _ADR support here is for future HW.
This patch is to drop _ADR support and we can then re-introduce
it (revert this patch) if future HW actually starts using _ADR
to distinguish children devices.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/usb/misc/usb-ljca.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index c9decd0396d4..7f0deebebc13 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -457,8 +457,8 @@ static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
 				  u64 adr, u8 id)
 {
 	struct ljca_match_ids_walk_data wd = { 0 };
-	struct acpi_device *parent, *adev;
 	struct device *dev = adap->dev;
+	struct acpi_device *parent;
 	char uid[4];
 
 	parent = ACPI_COMPANION(dev);
@@ -466,17 +466,7 @@ static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
 		return;
 
 	/*
-	 * get auxdev ACPI handle from the ACPI device directly
-	 * under the parent that matches _ADR.
-	 */
-	adev = acpi_find_child_device(parent, adr, false);
-	if (adev) {
-		ACPI_COMPANION_SET(&auxdev->dev, adev);
-		return;
-	}
-
-	/*
-	 * _ADR is a grey area in the ACPI specification, some
+	 * Currently LJCA hw doesn't use _ADR instead the shipped
 	 * platforms use _HID to distinguish children devices.
 	 */
 	switch (adr) {
-- 
2.34.1


