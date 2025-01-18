Return-Path: <linux-usb+bounces-19511-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F67BA15E2F
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jan 2025 18:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7907C1665EC
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jan 2025 17:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C5719F423;
	Sat, 18 Jan 2025 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaDl1uWG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EDB824A3;
	Sat, 18 Jan 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737219625; cv=none; b=KJU+6k2ULUzmVbe3gCXOkV5WAdpVNGTTQVNsp242N/iZIP6141f2QWGPKX6BaTVqZuP8isHZv9Ur0NuFi8S98yVRdBdpM4GL0PoaSBZFkn4olpQedLfa1SZT+U/Kpo17hrP0HwXlwj33mgju8Pj+eUoOTK0sY/ipaG+/1cZr4xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737219625; c=relaxed/simple;
	bh=IoNIQDxvgzXIsi9Z1VH9hKeyZmE6i2Mjyj8OlUwBGQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MaxL5PMI1GNuNZoNv89F1wgH1y9IaUiR0f6hsGVPiaUmFfgmM41Iiu+9BcNOAJ5M64vTN4lxx09FaoMjqaZ3pOYqAO//mklDTJbV3b9L1I8P3jy9WOswmrR/YkpZcQEr3A7ZQ9+nkssLaNNLgZgulaSAnPxzNyd7NLRdyIqtaIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaDl1uWG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737219623; x=1768755623;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IoNIQDxvgzXIsi9Z1VH9hKeyZmE6i2Mjyj8OlUwBGQI=;
  b=DaDl1uWGvVthw7qnxNxHEcHuBGZ+6GCHDuXhNUlyYmv2gvPmQviNi6Id
   dQHVVaIid1N8rreNNeYM2QUolr6PSTbuMpuDJztRMcDVCh7VElcJ8DDAd
   wJrQH7vZSbV82MT+o1f8RhmiSmRMj213CDTxyEDXrsBBFYLWIE2AbuxOs
   l5CNRLkNjUkStO4DZcIP3iSLvCMY3LPMTGlnl+dSjQRcEuqMC07QCgbjn
   X5cK2rB/Rfsud/2FjmRHOzaUVnWBLh+1pexVaEfd1oVmpUMrDUTx+x9/z
   6090VEZecHU06adQYuf0MEBk+f9lec2lKSJPsTU+wiUCM46lQKf8uLd2I
   Q==;
X-CSE-ConnectionGUID: IQ02RUViS9yesK4nFjhTaQ==
X-CSE-MsgGUID: LvfD4YwaT8aaoSrxnWdp9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="49031673"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="49031673"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 09:00:22 -0800
X-CSE-ConnectionGUID: zXQz5+mYTSKiXisehKTuRw==
X-CSE-MsgGUID: IB9f6x+ESdGBjxG3yRFMOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="136924002"
Received: from madhum.iind.intel.com ([10.223.167.64])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2025 09:00:20 -0800
From: madhu.m@intel.com
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abhishekpandit@chromium.org,
	dmitry.baryshkov@linaro.org,
	diogo.ivo@tecnico.ulisboa.pt,
	jthies@google.com,
	bleung@chromium.org,
	pooja.katiyar@intel.com,
	Madhu M <madhu.m@intel.com>
Subject: [PATCH v3 1/2] usb: typec: ucsi: Rename SET_UOM UCSI command to SET_CCOM
Date: Sat, 18 Jan 2025 22:54:54 +0530
Message-Id: <20250118172455.701348-1-madhu.m@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Madhu M <madhu.m@intel.com>

Rename the SET_UOM UCSI command to SET_CCOM as per the UCSI 3.0 spec.

Signed-off-by: Madhu M <madhu.m@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 2 +-
 drivers/usb/typec/ucsi/trace.c   | 2 +-
 drivers/usb/typec/ucsi/ucsi.h    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 83ff23086d79..638ac41b4b01 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -28,7 +28,7 @@ static int ucsi_cmd(void *data, u64 val)
 	ucsi->debugfs->status = 0;
 
 	switch (UCSI_COMMAND(val)) {
-	case UCSI_SET_UOM:
+	case UCSI_SET_CCOM:
 	case UCSI_SET_UOR:
 	case UCSI_SET_PDR:
 	case UCSI_CONNECTOR_RESET:
diff --git a/drivers/usb/typec/ucsi/trace.c b/drivers/usb/typec/ucsi/trace.c
index cb62ad835761..596a9542d401 100644
--- a/drivers/usb/typec/ucsi/trace.c
+++ b/drivers/usb/typec/ucsi/trace.c
@@ -12,7 +12,7 @@ static const char * const ucsi_cmd_strs[] = {
 	[UCSI_SET_NOTIFICATION_ENABLE]	= "SET_NOTIFICATION_ENABLE",
 	[UCSI_GET_CAPABILITY]		= "GET_CAPABILITY",
 	[UCSI_GET_CONNECTOR_CAPABILITY]	= "GET_CONNECTOR_CAPABILITY",
-	[UCSI_SET_UOM]			= "SET_UOM",
+	[UCSI_SET_CCOM]			= "SET_CCOM",
 	[UCSI_SET_UOR]			= "SET_UOR",
 	[UCSI_SET_PDM]			= "SET_PDM",
 	[UCSI_SET_PDR]			= "SET_PDR",
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5ff369c24a2f..431ab4a7e8d8 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -105,7 +105,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_CAPABILITY_SIZE		128
 #define UCSI_GET_CONNECTOR_CAPABILITY		0x07
 #define UCSI_GET_CONNECTOR_CAPABILITY_SIZE	32
-#define UCSI_SET_UOM				0x08
+#define UCSI_SET_CCOM				0x08
 #define UCSI_SET_UOR				0x09
 #define UCSI_SET_PDM				0x0a
 #define UCSI_SET_PDR				0x0b
-- 
2.34.1


