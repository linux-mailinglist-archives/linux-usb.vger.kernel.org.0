Return-Path: <linux-usb+bounces-9443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC18A9242
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 07:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CE781F20FB8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 05:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88FB54BED;
	Thu, 18 Apr 2024 05:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4OTfPIe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77125427E
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 05:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713416789; cv=none; b=ZjdfbEtRL0HMKeR6wvhtGtWwenabnDVtQYDpJgw2AYt9/PhG6HDJLw0nFnsGwSYcFp7z4X5rsbMZc5qJ5hLL0Co3mRiuDqhzRZ9+tHnfTJopG9l1VE9fmeRAQrCrnBTBtCa+QYyBNMpn8zYkeiBOqqJXWzBlG4BP9CvzEKdY03M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713416789; c=relaxed/simple;
	bh=k7sOzYq4y47gWLgnPqxcEn2QUD9VvaVnnIrGbCNQ80A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMbVMLOkjrxpAvMzHdokmGQm1EUixX1ZTqjQ8VghF+E0X9xmT9Lezvf8JZ+8I6aYZtzor2ZIqZmmLBDJ4p3Nmzmx2uGtSxf5sfTvHzV8Bmbsa268SkqSn+yu2HSIpLYqyJ2Mmm/2EWXnNlPSKujio+H7to8k9qHKoyUDQ4XsnYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4OTfPIe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713416787; x=1744952787;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k7sOzYq4y47gWLgnPqxcEn2QUD9VvaVnnIrGbCNQ80A=;
  b=F4OTfPIeWu9MHO6z70LXPFDty4Ixj8CrISGrNI4+SfaFs+rrRf3w7Nvs
   2hD8BxlnQM9Do58rNWF2UIDbhMMQishPM/w3Y/8qpNVijsfFN/fdB4W+H
   MsS1ZH5inQvIb76Q+OtRCRhgE8nuVF1d5vTQHB3J6opKECx9eOdZghpvb
   7WaNgXi38uDDILrzgKhNDAioYxKNupcsqbKPCJfu5saIUmYJWJVGwVvk+
   D1UVbsjNFnW+Q/0aIA3PNya3MLmCYsBnBMsss6wZp/vRqzkMZI9p1uZvT
   8PJbVbcyYA7xbGA8464oT+7dded1OAGDkSJzRvUb0CgQ26o3FGK5v67sG
   A==;
X-CSE-ConnectionGUID: kKkQWrzMT/G9ZLT01hgxhw==
X-CSE-MsgGUID: NZWKFEGWRZOwaiQcZ+rHqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31418885"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="31418885"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 22:06:26 -0700
X-CSE-ConnectionGUID: 0ivulxC/TJm4ry4aufKorQ==
X-CSE-MsgGUID: RBa9REyeQj6EcG4sgBN4/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="22947403"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2024 22:06:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 212D624D; Thu, 18 Apr 2024 08:06:23 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Increase sideband access polling delay
Date: Thu, 18 Apr 2024 08:06:21 +0300
Message-ID: <20240418050623.3157002-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB4 sideband access is slow compared to the high-speed link and the
access timing parameters are tens of milliseconds according the spec. To
avoid too much unnecessary polling for the sideband pass the wait delay
to usb4_port_wait_for_bit() and use larger (5ms) value compared to the
high-speed access.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 78b06e922fda..de480bf2a53d 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -52,6 +52,10 @@ enum usb4_ba_index {
 #define USB4_BA_VALUE_MASK		GENMASK(31, 16)
 #define USB4_BA_VALUE_SHIFT		16
 
+/* Delays in us used with usb4_port_wait_for_bit() */
+#define USB4_PORT_DELAY			50
+#define USB4_PORT_SB_DELAY		5000
+
 static int usb4_native_switch_op(struct tb_switch *sw, u16 opcode,
 				 u32 *metadata, u8 *status,
 				 const void *tx_data, size_t tx_dwords,
@@ -1245,7 +1249,7 @@ void usb4_port_unconfigure_xdomain(struct tb_port *port)
 }
 
 static int usb4_port_wait_for_bit(struct tb_port *port, u32 offset, u32 bit,
-				  u32 value, int timeout_msec)
+			  u32 value, int timeout_msec, unsigned long delay_usec)
 {
 	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
 
@@ -1260,7 +1264,7 @@ static int usb4_port_wait_for_bit(struct tb_port *port, u32 offset, u32 bit,
 		if ((val & bit) == value)
 			return 0;
 
-		usleep_range(50, 100);
+		fsleep(delay_usec);
 	} while (ktime_before(ktime_get(), timeout));
 
 	return -ETIMEDOUT;
@@ -1308,7 +1312,7 @@ static int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target,
 		return ret;
 
 	ret = usb4_port_wait_for_bit(port, port->cap_usb4 + PORT_CS_1,
-				     PORT_CS_1_PND, 0, 500);
+				     PORT_CS_1_PND, 0, 500, USB4_PORT_SB_DELAY);
 	if (ret)
 		return ret;
 
@@ -1355,7 +1359,7 @@ static int usb4_port_sb_write(struct tb_port *port, enum usb4_sb_target target,
 		return ret;
 
 	ret = usb4_port_wait_for_bit(port, port->cap_usb4 + PORT_CS_1,
-				     PORT_CS_1_PND, 0, 500);
+				     PORT_CS_1_PND, 0, 500, USB4_PORT_SB_DELAY);
 	if (ret)
 		return ret;
 
@@ -1410,6 +1414,8 @@ static int usb4_port_sb_op(struct tb_port *port, enum usb4_sb_target target,
 
 		if (val != opcode)
 			return usb4_port_sb_opcode_err_to_errno(val);
+
+		fsleep(USB4_PORT_SB_DELAY);
 	} while (ktime_before(ktime_get(), timeout));
 
 	return -ETIMEDOUT;
@@ -1591,13 +1597,14 @@ int usb4_port_asym_start(struct tb_port *port)
 	 * port started the symmetry transition.
 	 */
 	ret = usb4_port_wait_for_bit(port, port->cap_usb4 + PORT_CS_19,
-				     PORT_CS_19_START_ASYM, 0, 1000);
+				     PORT_CS_19_START_ASYM, 0, 1000,
+				     USB4_PORT_DELAY);
 	if (ret)
 		return ret;
 
 	/* Then wait for the transtion to be completed */
 	return usb4_port_wait_for_bit(port, port->cap_usb4 + PORT_CS_18,
-				      PORT_CS_18_TIP, 0, 5000);
+				      PORT_CS_18_TIP, 0, 5000, USB4_PORT_DELAY);
 }
 
 /**
@@ -2123,7 +2130,8 @@ static int usb4_usb3_port_cm_request(struct tb_port *port, bool request)
 	 */
 	val &= ADP_USB3_CS_2_CMR;
 	return usb4_port_wait_for_bit(port, port->cap_adap + ADP_USB3_CS_1,
-				      ADP_USB3_CS_1_HCA, val, 1500);
+				      ADP_USB3_CS_1_HCA, val, 1500,
+				      USB4_PORT_DELAY);
 }
 
 static inline int usb4_usb3_port_set_cm_request(struct tb_port *port)
-- 
2.43.0


