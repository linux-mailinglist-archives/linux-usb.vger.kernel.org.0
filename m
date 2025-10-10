Return-Path: <linux-usb+bounces-29109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EAABCBFB0
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 09:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C41E13A1B6E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 07:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816C327057D;
	Fri, 10 Oct 2025 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PY+7tI5R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D45C24DCEC
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082660; cv=none; b=YVNK9/Rxx9ik5/zK9cdgcsbKSfRKtr/XxJoerlbv34zA4h/6k9onH7+h2cyaRMCINRhm9A5Fqfe8klX3ZRK+R3OGpzIMmtwq0aTaCRTTcEhY9m3xL1T3TEmrIYWrmwZ0QZ9KSpdQBHlRp9k9G/97qWMxKL0TvE/FfcIOAVf3XJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082660; c=relaxed/simple;
	bh=r+79ov+HmWGK0X3ALfDdtMWH5tq0tdJJrJSoBw2Kwlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ao1+1xVZ4Nu4HbNJh06I6AKkUbcxYIAX+sKWnWdmQfcn6gzQV5G23iSpZxAQspFPjknEUPwCkVNppjHM07a495UJiBf2woIiyVfqzj3EUdW099Sy9OWMVt5cW68Bpn9AilFRWt2hIy4EVKX/MXQ1oAvBzV7+b99L463sb22Up34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PY+7tI5R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760082658; x=1791618658;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r+79ov+HmWGK0X3ALfDdtMWH5tq0tdJJrJSoBw2Kwlo=;
  b=PY+7tI5Riqth7oJHy99MMfIPCKB8qdu4Yu/2vrJIJbrUuAXZJrxIjb3o
   9aQ48AHalgK++yT827eVtIT2+O4TF+brMl/JOp9v/5NUdt2gqAoY779Vp
   w/aBvaoJqf2ZsfbTHSA3hjQUO0/P9Y9BrzcI1OgM0w44oFsLozYjMSe/T
   089sruPIjTyTdkl5urFkVkutJEjxOj3lBQ729btbCiIVulzt0cMXz73F8
   Xlk0bCHbHXzIHXNEOPa8IDTgUQ+Uf4J8Q2saEa0CxSaBL9N3a4vlzX7Ij
   Hf52jcC9XsWHKvMb7kxi5TKihxKuMND+rRTnG5Mq565Gy9oFfv6eoF+bn
   A==;
X-CSE-ConnectionGUID: IqvjhPeOTRecMG364GvfAg==
X-CSE-MsgGUID: rQTnoHZ0SLK8wZu6C5qNZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72914110"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="72914110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 00:50:57 -0700
X-CSE-ConnectionGUID: H20/XvJTQAmGLucdqkTSRw==
X-CSE-MsgGUID: TtDR8g7OQhyB2it0yTYfrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180608199"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2025 00:50:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E290795; Fri, 10 Oct 2025 09:50:54 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Add support for Intel Wildcat Lake
Date: Fri, 10 Oct 2025 09:50:54 +0200
Message-ID: <20251010075054.2136100-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Intel Wildcat Lake derives its Thunderbolt/USB4 controller from Lunar
Lake platform. Add Wildcat Lake PCI ID to the driver list of supported
devices.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 2 ++
 drivers/thunderbolt/nhi.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index cab19d79d927..a5b38b3fd232 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1537,6 +1537,8 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_WCL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI) },
 
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 16744f25a9a0..24ac4246d0ca 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -75,6 +75,7 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE	0x15ef
 #define PCI_DEVICE_ID_INTEL_ADL_NHI0			0x463e
 #define PCI_DEVICE_ID_INTEL_ADL_NHI1			0x466d
+#define PCI_DEVICE_ID_INTEL_WCL_NHI0			0x4d33
 #define PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI	0x5781
 #define PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI	0x5784
 #define PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HUB_80G_BRIDGE 0x5786
-- 
2.50.1


