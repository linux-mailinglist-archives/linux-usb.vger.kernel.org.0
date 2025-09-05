Return-Path: <linux-usb+bounces-27607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BEB46284
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 20:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13AEBA67DAA
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 18:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC92277028;
	Fri,  5 Sep 2025 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYEQxSgB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7233987
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097835; cv=none; b=DX7NBlcnVeQXaLPNcukkah988i6uISLXxwE/AyblFah+sKtYgBs/RfapC5LJNkHXV3+wJRTHY7CzjRWtFIf78dDcXpzt5Ukp/9qfr4nRPFglLIMJ1MtGxcO5xanGXtBzYHWIBImFeIRvlF8uAQc3po86L/ETy1e0holVLM5wyy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097835; c=relaxed/simple;
	bh=x6tBVIhCVvljH1GPAcc34jdicPlrCzRb3SNOzWRI5IE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SP9beEek6tUuMnUdeYEOVxFryrvcdETWW3qERiVOQceuFD8of4G7LGcZDTfyEO3BoGqnpc4OHDw2xptZnSa2q5Iaoj3EuWMHJQt9K7UPbP3rx67A3qFVI41LIxdYtJPhTXH/iDVcpOOW6/+x4Fs0/f+6HVQfF1MFgGNUyeccSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYEQxSgB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757097832; x=1788633832;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x6tBVIhCVvljH1GPAcc34jdicPlrCzRb3SNOzWRI5IE=;
  b=eYEQxSgB1vSrDJb6We3OHtzgtlLu9X66E7ezHRtb4p7HlWHr9H7YEbqZ
   AaU1uHfWt/JprU0LDOgHpJl+znEfOY/4BaRHLBrgjut29nOCmoUYKTOnr
   Qih1G7XUMaPPiEPhEIQo7HCfewcuJcYgZCPZC6TO/FxlkFkuAH/VZXbV7
   5LHQtm2wjPk3wYV/Pr6I24o2v5/HxvL2cCgD27Xnowed8U76e9T6UiOp5
   Mlv/TYBiNd0naL3wr+U6ZBXc9vGUz9bM6KkejNym6fxoeIu0u2tDlNvox
   s//GBednY+Vk6qgrujSRGMJ/238hO1Y4eAl7dF42ukK2G5/7e2QF/zXMK
   Q==;
X-CSE-ConnectionGUID: 3bumvCzfTxeNXsIR37LRSg==
X-CSE-MsgGUID: 9akdYT/VSq2LSn72zcOyJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63283806"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63283806"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 11:43:52 -0700
X-CSE-ConnectionGUID: 6Ff06I6vTSWeeHFc/tG5wA==
X-CSE-MsgGUID: q6NsEElKSpazfcptAdO0NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="195889461"
Received: from clke15vm100.fm.intel.com (HELO clke15vm100.amr.corp.intel.com) ([10.80.46.92])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2025 11:43:52 -0700
From: Venkat Jayaraman <venkat.jayaraman@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	neil.armstrong@linaro.org,
	pse.type-c.linux@intel.com,
	venkat.jayaraman@intel.com
Subject: [PATCH] usb: typec: ucsi: Add check for UCSI version
Date: Fri,  5 Sep 2025 11:44:01 -0700
Message-ID: <20250905184401.3222530-1-venkat.jayaraman@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Power Reading" bit is introduced in UCSI v2.1 and so limit the
check for that bit only if version supported is 2.1 or above.

Fixes: c851b71fd6cd ("usb: typec: ucsi: Add support for READ_POWER_LEVEL command")
Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 0d6b0cf5a7cd..3f568f790f39 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1293,7 +1293,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	if (change & UCSI_CONSTAT_BC_CHANGE)
 		ucsi_port_psy_changed(con);
 
-	if (UCSI_CONSTAT(con, PWR_READING_READY_V2_1)) {
+	if (con->ucsi->version >= UCSI_VERSION_2_1 &&
+	    UCSI_CONSTAT(con, PWR_READING_READY_V2_1)) {
 		curr_scale = UCSI_CONSTAT(con, CURRENT_SCALE_V2_1);
 		volt_scale = UCSI_CONSTAT(con, VOLTAGE_SCALE_V2_1);
 
-- 
2.43.0


