Return-Path: <linux-usb+bounces-18831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 661FF9FD40D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 13:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA64A18831DD
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 12:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2171F2379;
	Fri, 27 Dec 2024 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wfan24ab"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B42A155336
	for <linux-usb@vger.kernel.org>; Fri, 27 Dec 2024 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300858; cv=none; b=jMF5mYZDj07m3AXnHHj2J+BvdYSKff/wmmi+B57a74vBQR0QRjacVFg9DQe07+5dBvHh3wZZOzbjKZNHeIpN1KUyEM0J1raOSqkOeF/I6k/KGSDRz8lMVGZsbgta0HvgjeKx5lX4Sj1R10ZTJdG1VOGEmCORenXTponF1TEWQbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300858; c=relaxed/simple;
	bh=2CnCMP7jM8dDaNlbV30y5UmDchB35bFdXfWnsk8VkfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mJwfciDuzW9h95Y5O4JDL8N9LVwqVULxMtFxz2RQMvt5I13LvBs/dBiXJTFGbahh1yA+bx8K7oioCiBeYxqlW4rUW3RBuJTgtT07sLlbBvWDoSAsp4DDzkZg8XwD0MFoU/RyYDYq9Z4PTAs9+985NIppOIyMtC2La3kM8R9iYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wfan24ab; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735300857; x=1766836857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2CnCMP7jM8dDaNlbV30y5UmDchB35bFdXfWnsk8VkfE=;
  b=Wfan24abCPVCEOb3IvVvU7WDciqSOCmKKhziz3lSE/2MavSvSC8u5TUg
   AsDP6wvOydB1UVduvFsGzlAPHV9NbiFEaprgZgZEupVM0G+1xqunfwRAv
   cl7KPMviVSOI6jDMRuNj7/QynoDucnV5ne83M4jpq4DVy37RhSVV1bv7O
   1i/bLYgwiI3LSpI/m5ShihlFSLo4n/Dtr5U5iG7qxa4CRDpOENQ9+f8Dj
   WHZWLXZbOwj+TF+Zsn2h5JRlSTseqTrmMpOJkQ9ApTiSQ4mr6fCQjpqzl
   XajZMUp13RWETCJzbyBU3sP0t2bFlNRb3oOnc0d3OTW7kKu5/j9QVSDT1
   A==;
X-CSE-ConnectionGUID: P/9oRTcGQIOMrxtQhbiVyQ==
X-CSE-MsgGUID: o84X4Bq0Qk6H+PTiydLO4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35932533"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35932533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 04:00:57 -0800
X-CSE-ConnectionGUID: wRExDhSBTMygO3zvLJ8X7Q==
X-CSE-MsgGUID: ZuszN51BREm6nqtAU9GE6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104772459"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 04:00:56 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/5] xhci: Add missing capability definition bits
Date: Fri, 27 Dec 2024 14:01:42 +0200
Message-Id: <20241227120142.1035206-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
References: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add capability bits for the xHC Capability Parameters 2 (HCCPARAMS2)
register described in xHCI specification section 5.3.9

bit 7 Extended TBC TRB Status Capability (ETC_TSC)
bit 8 Get/Set Extended Property Capability (GSC)
bit 9 Virtualization Based Trusted I/O Capability (VTC)

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 9e94cebf4a56..f6b9a00a0ab9 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -83,3 +83,9 @@
 #define	HCC2_CIC(p)		((p) & (1 << 5))
 /* true: HC support Extended TBC Capability, Isoc burst count > 65535 */
 #define	HCC2_ETC(p)		((p) & (1 << 6))
+/* true: HC support Extended TBC TRB Status Capability */
+#define HCC2_ETC_TSC(p)         ((p) & (1 << 7))
+/* true: HC support Get/Set Extended Property Capability */
+#define HCC2_GSC(p)             ((p) & (1 << 8))
+/* true: HC support Virtualization Based Trusted I/O Capability */
+#define HCC2_VTC(p)             ((p) & (1 << 9))
-- 
2.25.1


