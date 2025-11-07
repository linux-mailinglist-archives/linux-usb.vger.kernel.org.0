Return-Path: <linux-usb+bounces-30196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A11C3FDE2
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 13:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 446EC4EBF98
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 12:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A162750FA;
	Fri,  7 Nov 2025 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6+CQUZ8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9259F9D9
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762517753; cv=none; b=rmlPt/ErwzgZgg7M8qisJDns5+dFW/r1HrAegexVh4tp4f7okNlSL0xFfocEQPvdSJ7c4TnHQaAR/Fyd+ccirnVQAlo0nFY8Xvx40lrVUiYGL7AaVq5QmtvH9TfmsrFWOWyNi3gh8StpkGOZvghmNj2iC8r7IK+I+/yCM7s6v58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762517753; c=relaxed/simple;
	bh=18r87jOLp1tDeuBYgovjbiUKgcxa7r/Qz3IMUYWM8HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sF/rY7a5OKJ2Twg+xTT6JSbc0Gp+lgbZrmHPIJL5wo7i/O3HdkgV93KY1/hlouoqNWP9Nzh+5qn9lPTeG1CvKwPL2LWo3oiwqpts/gTgV1MQ6qsng1zNs8Wxi8Cx+mASVbsk4zuSdC6NY3/JRu/Yunv0rYoFBS9ubqDuysgpzBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6+CQUZ8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762517751; x=1794053751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=18r87jOLp1tDeuBYgovjbiUKgcxa7r/Qz3IMUYWM8HM=;
  b=R6+CQUZ8yt4ARm9mFCFe7kzJB2Mw51yTUEx8cNWIy3TrtngZ9nMATUhE
   PAPUI1Id2ZvUxsePs2U8d6plox5+5CaG4Bf1SsEfLCd2UFUjLYjHgsiPg
   pFVsSTQ7jkKNB3x3lu1zunpEi1QxNQAyTUGb7xsZaOvaaVzXO0cN1zvOs
   s4BV2KIdP/t0jwc3Z3SIJHek1xQ3T5b1pKU3ARxwvuoiw3unVsEEXUfOL
   1WDngh0A0X40WDaJtosSTauoD0VqOaRoQstumCriFjjWhIKgRKJmzSWjK
   uLZP6afCXFNAb0urXxZxil/6IwEFiOPkmQpI2T6NzOONXsbpV9kadoqe9
   g==;
X-CSE-ConnectionGUID: JBBRdlafQtCJaafv42MqiQ==
X-CSE-MsgGUID: DUsUIJHHQ06a/XB7eWC8dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75276310"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="75276310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 04:15:50 -0800
X-CSE-ConnectionGUID: HiWKJ/88R8u20bkTNdamiA==
X-CSE-MsgGUID: QkN4RcH5Q4e/3DnkBpJl+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="187680034"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 07 Nov 2025 04:15:49 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: Sort out the Intel device IDs
Date: Fri,  7 Nov 2025 13:15:47 +0100
Message-ID: <20251107121548.2702900-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aQ2q4seXxTnDnBIc@kuha.fi.intel.com>
References: <aQ2q4seXxTnDnBIc@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCI device IDs were organised based on the Intel
architecture generation in most cases, but not with every
ID. That left the device ID table with no real order.
Sorting the table based on the device ID.

Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi,

I'm sending this as a followup to the Nova Lake ID patch, so that ID
is also sorted below. Let me know if you prefer that we do this the
other way around - first sort, then add the new device ID.

thanks,
---
 drivers/usb/dwc3/dwc3-pci.c | 82 ++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index c2bab6d4d507..8f5faf632a8b 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -21,41 +21,41 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 
+#define PCI_DEVICE_ID_INTEL_CMLLP		0x02ee
+#define PCI_DEVICE_ID_INTEL_CMLH		0x06ee
+#define PCI_DEVICE_ID_INTEL_BXT			0x0aaa
 #define PCI_DEVICE_ID_INTEL_BYT			0x0f37
 #define PCI_DEVICE_ID_INTEL_MRFLD		0x119e
-#define PCI_DEVICE_ID_INTEL_BSW			0x22b7
-#define PCI_DEVICE_ID_INTEL_SPTLP		0x9d30
-#define PCI_DEVICE_ID_INTEL_SPTH		0xa130
-#define PCI_DEVICE_ID_INTEL_BXT			0x0aaa
 #define PCI_DEVICE_ID_INTEL_BXT_M		0x1aaa
-#define PCI_DEVICE_ID_INTEL_APL			0x5aaa
-#define PCI_DEVICE_ID_INTEL_KBP			0xa2b0
-#define PCI_DEVICE_ID_INTEL_CMLLP		0x02ee
-#define PCI_DEVICE_ID_INTEL_CMLH		0x06ee
+#define PCI_DEVICE_ID_INTEL_BSW			0x22b7
 #define PCI_DEVICE_ID_INTEL_GLK			0x31aa
-#define PCI_DEVICE_ID_INTEL_CNPLP		0x9dee
-#define PCI_DEVICE_ID_INTEL_CNPH		0xa36e
-#define PCI_DEVICE_ID_INTEL_CNPV		0xa3b0
 #define PCI_DEVICE_ID_INTEL_ICLLP		0x34ee
-#define PCI_DEVICE_ID_INTEL_EHL			0x4b7e
-#define PCI_DEVICE_ID_INTEL_TGPLP		0xa0ee
 #define PCI_DEVICE_ID_INTEL_TGPH		0x43ee
-#define PCI_DEVICE_ID_INTEL_JSP			0x4dee
-#define PCI_DEVICE_ID_INTEL_WCL			0x4d7e
 #define PCI_DEVICE_ID_INTEL_ADL			0x460e
-#define PCI_DEVICE_ID_INTEL_ADL_PCH		0x51ee
 #define PCI_DEVICE_ID_INTEL_ADLN		0x465e
+#define PCI_DEVICE_ID_INTEL_EHL			0x4b7e
+#define PCI_DEVICE_ID_INTEL_WCL			0x4d7e
+#define PCI_DEVICE_ID_INTEL_JSP			0x4dee
+#define PCI_DEVICE_ID_INTEL_ADL_PCH		0x51ee
 #define PCI_DEVICE_ID_INTEL_ADLN_PCH		0x54ee
-#define PCI_DEVICE_ID_INTEL_ADLS		0x7ae1
-#define PCI_DEVICE_ID_INTEL_RPL			0xa70e
+#define PCI_DEVICE_ID_INTEL_APL			0x5aaa
+#define PCI_DEVICE_ID_INTEL_NVLS_PCH		0x6e6f
+#define PCI_DEVICE_ID_INTEL_ARLH_PCH		0x777e
 #define PCI_DEVICE_ID_INTEL_RPLS		0x7a61
+#define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
+#define PCI_DEVICE_ID_INTEL_ADLS		0x7ae1
 #define PCI_DEVICE_ID_INTEL_MTLM		0x7eb1
 #define PCI_DEVICE_ID_INTEL_MTLP		0x7ec1
 #define PCI_DEVICE_ID_INTEL_MTLS		0x7f6f
-#define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
-#define PCI_DEVICE_ID_INTEL_NVLS_PCH		0x6e6f
-#define PCI_DEVICE_ID_INTEL_ARLH_PCH		0x777e
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
+#define PCI_DEVICE_ID_INTEL_SPTLP		0x9d30
+#define PCI_DEVICE_ID_INTEL_CNPLP		0x9dee
+#define PCI_DEVICE_ID_INTEL_TGPLP		0xa0ee
+#define PCI_DEVICE_ID_INTEL_SPTH		0xa130
+#define PCI_DEVICE_ID_INTEL_KBP			0xa2b0
+#define PCI_DEVICE_ID_INTEL_CNPH		0xa36e
+#define PCI_DEVICE_ID_INTEL_CNPV		0xa3b0
+#define PCI_DEVICE_ID_INTEL_RPL			0xa70e
 #define PCI_DEVICE_ID_INTEL_PTLH		0xe332
 #define PCI_DEVICE_ID_INTEL_PTLH_PCH		0xe37e
 #define PCI_DEVICE_ID_INTEL_PTLU		0xe432
@@ -413,41 +413,41 @@ static void dwc3_pci_remove(struct pci_dev *pci)
 }
 
 static const struct pci_device_id dwc3_pci_id_table[] = {
-	{ PCI_DEVICE_DATA(INTEL, BSW, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, BYT, &dwc3_pci_intel_byt_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, MRFLD, &dwc3_pci_intel_mrfld_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, CMLLP, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, CMLH, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, SPTLP, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, SPTH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, BXT, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, BYT, &dwc3_pci_intel_byt_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, MRFLD, &dwc3_pci_intel_mrfld_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, BXT_M, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, APL, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, KBP, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, BSW, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, GLK, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, CNPLP, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, CNPH, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, CNPV, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ICLLP, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, EHL, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, TGPLP, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, TGPH, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, JSP, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, WCL, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ADL, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, ADL_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ADLN, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, EHL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, WCL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, JSP, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, ADL_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ADLN_PCH, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, ADLS, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, RPL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, APL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, NVLS_PCH, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, ARLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, RPLS, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, MTL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, ADLS, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTLM, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTLP, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, MTL, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, NVLS_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTLS, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, ARLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, TGL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, SPTLP, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, CNPLP, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, TGPLP, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, SPTH, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, KBP, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, CNPH, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, CNPV, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, RPL, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLU, &dwc3_pci_intel_swnode) },
-- 
2.50.1


