Return-Path: <linux-usb+bounces-11776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4E91BD43
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 13:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60577B21CB3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 11:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE1D156661;
	Fri, 28 Jun 2024 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGuLqpoY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D786B15572D
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719573529; cv=none; b=RfE7RdsczzvquSeJvzrb0101H9gqzz5ZZ5U/9MXRuVJtPQYm+iJhhsDZC1fOfuZ0r6w9Bf0gBjAPru3DeaDc54so+GuEC/7YVM8lmL3VxHuUKw9o7XeGgufyrvv5H3lxSU5I4qwUOjnFfaPCCbHEyuBfGuRRbQf5A0mZk3ONQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719573529; c=relaxed/simple;
	bh=JoBJ1aj7l1zim+s5ucqZVEjoWbJ7Q+hKG6/OpyUy1zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jeqZFZAUc1LOgkygp41r5Q/v8oU5oXw1cm8BtXdZ0HkrfWuu8ykuB6gb+oYVSjdIN1Ji8hR1NwQ0Z7PRW/arwMcYHLV65yzI1YOTVwXmzEPozVYHluZ1IDvsd/anCfKNbfrPW+xTEe0a0ser06FVoLrOgaGQ2kAIsXiW/oRjzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGuLqpoY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719573528; x=1751109528;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JoBJ1aj7l1zim+s5ucqZVEjoWbJ7Q+hKG6/OpyUy1zI=;
  b=AGuLqpoYiNybqIDIehK0kGgdez+Bklhc5oApoYXNUXLhipkzFs9YCgOq
   v9vI1OE5x4buA0Y4VicC5BlbLOMv8n22cSFcpPu2LLOyIDZ8siLhQGF2u
   S6uh5skWGUg6uaCKMrGoOsTs9nLK/l2Ts+ra0z7hYTq9Zusby4vb7RuTD
   hTJiv1GKi6RA+7XYNpxqYDdv+qke9aCvwXDiX8BPFOREyKCVjuRJwNJBE
   wLEcnhrta6oOVppF0f0BQwxJAGLrScGW4rcSvG1+LlhjfjnadFMOgMN6V
   y/xA+cwosXvUes+KnBEVdiwe1mUVMtlKGGRa5buHd4tbL3yJT7ZjjNzSI
   A==;
X-CSE-ConnectionGUID: R3phoSTPS6eGlv6UnkmUMA==
X-CSE-MsgGUID: 0se3Uo2VRNiD9+mjKc7l5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34289217"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="34289217"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 04:18:38 -0700
X-CSE-ConnectionGUID: 3ypKx5OBSPqaTepGQf2YzA==
X-CSE-MsgGUID: WgOCFnTYSsOabaDfVcrgFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="49666384"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 28 Jun 2024 04:18:36 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: add support for the Intel Panther Lake
Date: Fri, 28 Jun 2024 14:18:34 +0300
Message-ID: <20240628111834.1498461-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the necessary PCI IDs for Intel Panther Lake
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 9ef821ca2fc7..052852f80146 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -54,6 +54,10 @@
 #define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
 #define PCI_DEVICE_ID_INTEL_ARLH_PCH		0x777e
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
+#define PCI_DEVICE_ID_INTEL_PTLH		0xe332
+#define PCI_DEVICE_ID_INTEL_PTLH_PCH		0xe37e
+#define PCI_DEVICE_ID_INTEL_PTLU		0xe432
+#define PCI_DEVICE_ID_INTEL_PTLU_PCH		0xe47e
 #define PCI_DEVICE_ID_AMD_MR			0x163a
 
 #define PCI_INTEL_BXT_DSM_GUID		"732b85d5-b7a7-4a1b-9ba0-4bbd00ffd511"
@@ -430,6 +434,10 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, MTLS, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ARLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, TGL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, PTLH, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, PTLH_PCH, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, PTLU, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, PTLU_PCH, &dwc3_pci_intel_swnode) },
 
 	{ PCI_DEVICE_DATA(AMD, NL_USB, &dwc3_pci_amd_swnode) },
 	{ PCI_DEVICE_DATA(AMD, MR, &dwc3_pci_amd_mr_swnode) },
-- 
2.43.0


