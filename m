Return-Path: <linux-usb+bounces-30295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E7C4781F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 061BA4F4F0F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FAE23EA9B;
	Mon, 10 Nov 2025 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLp6mhho"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234124677A
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787722; cv=none; b=jcjm4oD1cqA/Uutsci3bVHQQTUsj2EzFbCuIzWtbfClXTAymBrGh0oS2Zjle1z5MX1fU10h3Ko0Jhk50SHS1J42RICAy5k0tKdBoTwh06DCSvKVavXO51WBkzzDRW6kLXV0d1E8WSo95fGRKzaE8BIP+a6xBN+PX7OfbNAsnnfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787722; c=relaxed/simple;
	bh=lGZDL1ak6CfMuUkIRigZ2Kf4fkK1ILaUT8Z/XVh+VQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRBs9b67F0lKRCJDcIV2zk2fda8uibPG8JdIdDZ3ryNrdM67pxy+FpAXVO/7U+4hprrwqYe7tzI1UODtQcaSCBC4Z8i2kx1VFcAb4A6B2NJTRnswnKzm+KDieGlOwLefmdgDXrkda52l0YX1LGKMMNJca9ccovMsMLHLKkmLLfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLp6mhho; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787720; x=1794323720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lGZDL1ak6CfMuUkIRigZ2Kf4fkK1ILaUT8Z/XVh+VQ8=;
  b=PLp6mhhoeQxX7QYGG2CqHZn1Rah/qhG01SGhOvNBbGhVzcM/IPu4YaR1
   fNQtVErqBP/QnLVtxIuz9giTlzPz5U0nkB0ztHMKM3imLzIPv307taehl
   cWN7dqP3SQLeJVyBiM2gAiFOkOer9VCcBk6o/Pf9kDzf3wL9PQyOSMurA
   SGxAybHi7mLYlOgK8MLJkOEAKJgwOZW12NTp9VpUhUGpIpE99MB4Avj0g
   ncaHqv+kIw9yT8XVUd3H72R8UlACiLPINMcwIBN3R7X1aYNHs871uOUgr
   QiVm31b1Vr7adq9hhu4N0j387Xs+1Zw6NUWF8Nkc5kIqjcoKt2r/cuZIa
   Q==;
X-CSE-ConnectionGUID: qyuOdaWnRgG4s/DSZkRvBg==
X-CSE-MsgGUID: HA8+7O6wSLuBr8SzdAmv9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76185484"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="76185484"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:20 -0800
X-CSE-ConnectionGUID: FF8PubucSbCoqJNl8g9jCA==
X-CSE-MsgGUID: EaDhjOsoTrOt7oDHCSFwFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192954249"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 07:15:19 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 234AF96; Mon, 10 Nov 2025 16:15:19 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 10/13] usb: xhci: drop xhci-caps.h dependence on xhci-ext-caps.h
Date: Mon, 10 Nov 2025 16:14:47 +0100
Message-ID: <20251110151450.635410-11-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
References: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the dependency of xhci-caps.h on xhci-ext-caps.h by eliminating 2
instances where macros in xhci-caps.h were redefined from xhci-ext-caps.h.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index af47aebc5ba8..99557df89f88 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -6,7 +6,7 @@
 
 /* hc_capbase - bitmasks */
 /* bits 7:0 - Capability Registers Length */
-#define HC_LENGTH(p)		XHCI_HC_LENGTH(p)
+#define HC_LENGTH(p)		((p) & 0xff)
 /* bits 15:8 - Rsvd */
 /* bits 31:16 - Host Controller Interface Version Number */
 #define HC_VERSION(p)		(((p) >> 16) & 0xffff)
@@ -77,7 +77,7 @@
 /* bits 15:12 - Max size for Primary Stream Arrays, 2^(n+1) */
 #define HCC_MAX_PSA(p)		(1 << ((((p) >> 12) & 0xf) + 1))
 /* bits 31:16 - xHCI Extended Capabilities Pointer, from PCI base: 2^(n) */
-#define HCC_EXT_CAPS(p)		XHCI_HCC_EXT_CAPS(p)
+#define HCC_EXT_CAPS(p)		(((p) >> 16) & 0xffff)
 
 /* DBOFF - db_off - bitmasks */
 /* bits 1:0 - Rsvd */
-- 
2.50.1


