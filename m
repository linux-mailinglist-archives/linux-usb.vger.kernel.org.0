Return-Path: <linux-usb+bounces-18086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A229E36F5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 10:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8226C2865A6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 09:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ED81AA1EB;
	Wed,  4 Dec 2024 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMvJeTVW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0818A6C4
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733306206; cv=none; b=sNsijK0CGmhKs9DVkQ5k+Cj4RCVX1i1vMJ9awqwkqIsvJwf0qKVPhFOsD9wR1EefIck6SLTJuMt5O0iUAkI6mQySbwmekyMKSxOlucJV4aSsf/RBpEUKadTMCAtLxJiTikuovp8MoXQwYXUi9kBlYSkaKA/LtrLew4Sk7t6cbAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733306206; c=relaxed/simple;
	bh=FmEF+e851SIpZ9uJP8JXmWBdAGQY3M1/KOqdH9E0nLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dkOqlwY2xmV/BaPdobwdIeAITtP5OcKqANfLWFgI6KZEQ1GZKYl1j60iEIb0Mfwab61VjNm7OvbRZDa9ybtThyORCpxoTr6PrdvPTP+mheSPKxe8BeHsGVBbpK3dEOinbI+mDX+WQXS7pp0MPbtALoWaZmSOhVtDIPHv9esUMmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMvJeTVW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733306205; x=1764842205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FmEF+e851SIpZ9uJP8JXmWBdAGQY3M1/KOqdH9E0nLc=;
  b=BMvJeTVWeEvWGMJNj7+JEICgJEGO3itBcufGdfGEq//kD+VBy3I0Z76x
   uh6Qb7b0MeZtAsmsOdkO6pTreOMGSkM2ajpCSapYfEEAxlEZ9qHtezEH5
   pIbPnPbi75V0OqD85O+gFATdj3jyPQJ265MC1OGKxwIA0k+YfB6QucVuo
   WwtlXt9qQ+LZUd5jWRcWls0rkcGdgpvtaO0eSsVfxrwHWRoCjyDrLxrgX
   lyAz9UCM9rEMLEyyH2zDFTsXaqD3ZxPalREJaZm1xTdSjks+KV76lumT4
   u/YpKnzbcWXk/1IshuIP0Ss9LIQsVdVcjxLICr2JstojiALZU3AeLtjw0
   A==;
X-CSE-ConnectionGUID: F7acglz8RFG027lTTuvoXQ==
X-CSE-MsgGUID: ERSrg32cQwa5SYYuMUGDZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37223367"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="37223367"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 01:56:44 -0800
X-CSE-ConnectionGUID: 1X3SmicKS7uNj5EEhR7QYw==
X-CSE-MsgGUID: lwA7iTUKTp2obJ9CVMkp0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="116968366"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2024 01:56:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2304027C; Wed, 04 Dec 2024 11:56:36 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Add support for Intel Panther Lake-M/P
Date: Wed,  4 Dec 2024 11:56:36 +0200
Message-ID: <20241204095636.1051165-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Panther Lake-M/P has the same integrated Thunderbolt/USB4
controller as Lunar Lake. Add these PCI IDs to the driver list of
supported devices.

Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 8 ++++++++
 drivers/thunderbolt/nhi.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 1257dd3ce7e6..f3a2264e012b 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1520,6 +1520,14 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_LNL_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_M_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_M_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI) },
 
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 7a07c7c1a9c2..16744f25a9a0 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -92,6 +92,10 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_RPL_NHI1			0xa76d
 #define PCI_DEVICE_ID_INTEL_LNL_NHI0			0xa833
 #define PCI_DEVICE_ID_INTEL_LNL_NHI1			0xa834
+#define PCI_DEVICE_ID_INTEL_PTL_M_NHI0			0xe333
+#define PCI_DEVICE_ID_INTEL_PTL_M_NHI1			0xe334
+#define PCI_DEVICE_ID_INTEL_PTL_P_NHI0			0xe433
+#define PCI_DEVICE_ID_INTEL_PTL_P_NHI1			0xe434
 
 #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
 
-- 
2.45.2


