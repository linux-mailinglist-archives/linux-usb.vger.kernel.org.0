Return-Path: <linux-usb+bounces-26756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B61B22824
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 15:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961833A48F9
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 13:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DE926FDB3;
	Tue, 12 Aug 2025 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAZTj5qy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC326AA88
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755004265; cv=none; b=HZzuuFgeZawk4ZJJsoUJp9MpOGGxe2v+1Fdj1caMxZ46Vb7HFwkr5HHpve1ARjPTaHFDC4Ukf/GIPH2GXO2gmdoYGXoSAJbJAmLCIYtdLlRTvs6/ksXOlBeU7m8Z4M0ATK6X3sLr5wouDEFjGtENUJTAG9O1SeeB/AdS5mIsAlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755004265; c=relaxed/simple;
	bh=f7TqFgRUB+ChNlZP3CImIIaBPI/Ap9f6aAGcbwitnzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDTw6vcdBAVmmPffBURuYR7E46egvyc0mfNJ8WL/bDPDoS8FpqYDY5OECepWBSgRCS1/LRhHXwruqizoUqBzTSwcGye4UcZpaAzzmksHVpCQmKOSFJezlyKb9eghFipwBiz/aerHwmoGA74vojPtoDq/pgdVhrm3LA1ppfQdoOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAZTj5qy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755004265; x=1786540265;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f7TqFgRUB+ChNlZP3CImIIaBPI/Ap9f6aAGcbwitnzc=;
  b=kAZTj5qyGu9iU4OWYYt9OaGuLcF5o8mzvq77s0luTxArpOrYiIgmwWVp
   czxuWW6SzMTURtkdFFXK2bqNlL5lX4JTRLSXL03mmj0dXZQqy04YW0KGy
   Vrl5AjJ0GoFcvbijNRLtfLdJlnVG+mExv0RBPftxJXXJOMLFN4JaJeAg7
   ns/x/HiJUSakfQbqatm8oTJjVJuygeUWRPCAGY7pNOSLrJOfH3D45xs8/
   1gvWznfDtdyw+x/RLGLD/appCA5t9iIH7zabS94XiO6XcRTTxLjYIYlfz
   pNgxKQpJZ2YRouOB5Si+t+MLslmsfeRyXxxwbk0KFN1ABefDqw5qGrvfi
   A==;
X-CSE-ConnectionGUID: bTOtYtBJSXCsfZEHFeyJyw==
X-CSE-MsgGUID: Ce17nQeFQ+iF36EvqpL12Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67541453"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="67541453"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:11:04 -0700
X-CSE-ConnectionGUID: lsH22pfOTn+kMbC3FcPEnA==
X-CSE-MsgGUID: CslObdFQQrSfEYF13Pm6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170642197"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2025 06:11:02 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: add support for the Intel Wildcat Lake
Date: Tue, 12 Aug 2025 16:11:00 +0300
Message-ID: <20250812131101.2930199-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the necessary PCI ID for Intel Wildcat Lake
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 54a4ee2b90b7..39c72cb52ce7 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -41,6 +41,7 @@
 #define PCI_DEVICE_ID_INTEL_TGPLP		0xa0ee
 #define PCI_DEVICE_ID_INTEL_TGPH		0x43ee
 #define PCI_DEVICE_ID_INTEL_JSP			0x4dee
+#define PCI_DEVICE_ID_INTEL_WCL			0x4d7e
 #define PCI_DEVICE_ID_INTEL_ADL			0x460e
 #define PCI_DEVICE_ID_INTEL_ADL_PCH		0x51ee
 #define PCI_DEVICE_ID_INTEL_ADLN		0x465e
@@ -431,6 +432,7 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, TGPLP, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, TGPH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, JSP, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, WCL, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ADL, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ADL_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ADLN, &dwc3_pci_intel_swnode) },
-- 
2.47.2


