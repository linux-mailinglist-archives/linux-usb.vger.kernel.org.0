Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160C631CADB
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 14:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhBPNFv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 08:05:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:56517 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229796AbhBPNFp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 08:05:45 -0500
IronPort-SDR: /emXvvFRONqVD04qDzZonN5yAqu80inT7NJbh9W9VjKWvykeentSnH80MmgoE6j1JegbXL0dWe
 9+MuKGWgqfWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="179375350"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="179375350"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 05:05:01 -0800
IronPort-SDR: JSIYZjJUYsrXneEnVJG+cVIMZhbEmtBj9mkmU8okz07Sw0u0fKN8RIiaDOchMqTmSUdy6Amq/W
 Kp1Kb/dpk3Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="512524070"
Received: from ccdtglu46.jer.intel.com ([10.12.50.142])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2021 05:04:59 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 2/2] thunderbolt: drop unused functions for TGL and ICL
Date:   Tue, 16 Feb 2021 15:04:27 +0200
Message-Id: <20210216130427.7317-3-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216130427.7317-1-gil.fine@intel.com>
References: <20210216130427.7317-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We drop the unused functions:
tb_switch_is_tiger_lake() and tb_switch_is_ice_lake()

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/tb.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index beea88c34c0f..0fd23db4ce92 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -787,32 +787,6 @@ static inline bool tb_switch_is_titan_ridge(const struct tb_switch *sw)
 	return false;
 }
 
-static inline bool tb_switch_is_ice_lake(const struct tb_switch *sw)
-{
-	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
-		switch (sw->config.device_id) {
-		case PCI_DEVICE_ID_INTEL_ICL_NHI0:
-		case PCI_DEVICE_ID_INTEL_ICL_NHI1:
-			return true;
-		}
-	}
-	return false;
-}
-
-static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
-{
-	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
-		switch (sw->config.device_id) {
-		case PCI_DEVICE_ID_INTEL_TGL_NHI0:
-		case PCI_DEVICE_ID_INTEL_TGL_NHI1:
-		case PCI_DEVICE_ID_INTEL_TGL_H_NHI0:
-		case PCI_DEVICE_ID_INTEL_TGL_H_NHI1:
-			return true;
-		}
-	}
-	return false;
-}
-
 /**
  * tb_switch_is_usb4() - Is the switch USB4 compliant
  * @sw: Switch to check
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

