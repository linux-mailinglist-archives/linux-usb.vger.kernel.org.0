Return-Path: <linux-usb+bounces-19421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EB5A13DFD
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 16:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0194F3A7011
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 15:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8008622CBC7;
	Thu, 16 Jan 2025 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esc5G96P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023A22BAC2;
	Thu, 16 Jan 2025 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737042088; cv=none; b=pNARlagzW7gUcvn0uTpUUtWMw15PBBU1SBL55OVsaPRpnu1vF6hQJqoptlnKYTk7a56fZ1CrbGdHXTDXhZEzKAb8Jhym+rvR3h2LjXMc1BOhtV/vlJ7sSoE6aWD5H3jn36mxpziQZt8WB0MwTKc4i9d1QDn9eV7jP1Lkuga9dZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737042088; c=relaxed/simple;
	bh=/On/1g4U2EAzkLn8pPldeYXABCJaa9MoXs5eV93X0oI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVefzFOYMZ7QBenCY+3whVWh8irj0ZNpLGpmOgBB0POn+hleHSgd+BtcM4wpFsWk+khIbL+5MQXYZwm94olf33G4s6CrUzAQXuYGsaPxNGpwpU/1IyjGMjotgkweSYe10dw6knup/NvOxsOCgGmO/2iqUFNTX0Gh3QunpRMc4mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esc5G96P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737042087; x=1768578087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/On/1g4U2EAzkLn8pPldeYXABCJaa9MoXs5eV93X0oI=;
  b=esc5G96PNoNy6wgAMRbyVJcIt+4kN3txXA/9ofucMhkMN2zsm/ByNrB4
   1/+gnWuICo4QfgXlCO5boQn5HrdUHwgNUWRkMcOTcX+hKV0srLulYHlNB
   m3z+wBeQl6rv4V0A3qoioKnEY5sDsIs147R7Xz2oYnIL4wGL4MA/5POmf
   q/XHi3gD6kyf8CsYok4dHEGqsqQRQqcGujjLq902QWeDM6vW1UlL6P7RL
   AlyaSFM9ZB2mOzqNVa2JavczxauwYYC90VhZxxiacT2o6Vre/qRbs3SWE
   gzFS28QCsqAXVMCjseLLEPkqg45QO4VEG8gQddxPJfneM5gKEESJxZ7iq
   A==;
X-CSE-ConnectionGUID: bWf47mvbQhiGSWrVYgFHgw==
X-CSE-MsgGUID: l2JWq8wET5eLE7xeq8gVpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37554157"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37554157"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 07:41:24 -0800
X-CSE-ConnectionGUID: aOCy8hgtRUuCWSHXMVgDgg==
X-CSE-MsgGUID: F2Z/+cQ8Q+udOUMWGDBmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="110512094"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2025 07:41:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3C3F849D; Thu, 16 Jan 2025 17:41:19 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ferry Toth <fntoth@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out} on Intel Merrifield
Date: Thu, 16 Jan 2025 17:40:48 +0200
Message-ID: <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel Merrifield SoC uses these endpoints for tracing and they shouldn't
be used for normal transfers, we need to skip them.

• 1 High BW Bulk IN (IN#1) (RTIT)
• 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 052852f80146..9b73dfd34823 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -148,11 +148,20 @@ static const struct property_entry dwc3_pci_intel_byt_properties[] = {
 	{}
 };
 
+/*
+ * Intel Merrifield uses these endpoints for tracing and they shouldn't be used
+ * for normal transfers, we need to skip them.
+ * • 1 High BW Bulk IN (IN#1) (RTIT)
+ * • 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)
+ */
+static const u8 dwc3_pci_mrfld_reserved_endpoints[] = { 3, 16, 17 };
+
 static const struct property_entry dwc3_pci_mrfld_properties[] = {
 	PROPERTY_ENTRY_STRING("dr_mode", "otg"),
 	PROPERTY_ENTRY_STRING("linux,extcon-name", "mrfld_bcove_pwrsrc"),
 	PROPERTY_ENTRY_BOOL("snps,dis_u3_susphy_quirk"),
 	PROPERTY_ENTRY_BOOL("snps,dis_u2_susphy_quirk"),
+	PROPERTY_ENTRY_U8_ARRAY("snps,reserved-endpoints", dwc3_pci_mrfld_reserved_endpoints),
 	PROPERTY_ENTRY_BOOL("snps,usb2-gadget-lpm-disable"),
 	PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
 	{}
-- 
2.43.0.rc1.1336.g36b5255a03ac


