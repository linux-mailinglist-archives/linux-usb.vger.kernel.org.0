Return-Path: <linux-usb+bounces-27551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A93B440CF
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 17:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21ACD58687C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 15:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373E328135D;
	Thu,  4 Sep 2025 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1FO7vd5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95528003A
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000622; cv=none; b=qhW/6SJt8ftBom2ts2nZTTy5hB8apVATig5g2PuHVIwM3quYSGQWsaaCOjV3aM7I+fftn5OhUiJXcF0mxPZTkY/Va84SdNKVHpHx0o3Zl7E6r1UY0Be+gkSS/vSuyqjtdtUimapW852x3fLBEGHgyYHg4dQB7ADfQ2sS7mnixoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000622; c=relaxed/simple;
	bh=1xfCwgS21Nmk5xo/GSZMjJEZxvsDdvBfapcUqIEiYVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1qDwUwBSapYqGBs4amoCzrnKn8wplbZthHO5gMd9hbPzDefHGpXTUqg2FBfT39Q3RHzvkVqQPu7KjZKyjuUsL2SzO7OrRKSyeTGpsVOgLfXncSfdB/KAxCuVMeAgqroznGByYCMiAiWPE/x7AiNGgkjHhxljeos48ojaOHawWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1FO7vd5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757000621; x=1788536621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1xfCwgS21Nmk5xo/GSZMjJEZxvsDdvBfapcUqIEiYVI=;
  b=j1FO7vd5FaCO+aXqSY8Vxw1TVGZUhHfa13u0EMYjdWIYXJJ2x8FAJWJR
   MqZdo3JcY6ooquJnwVkLGb/bCGGv6FM3T8p4ETAVYldGpY79mwUKvPqkH
   5bZW99FxLIrGswHMET83vszJnZ1RcVC+3TtaUgUGyFMxvNoMCCXxsD52Y
   ZLmflEQ6zQtDm35y4l/OF3MGJX9eefB1R5LaenVMd+bfMRdwTLj2QFFLf
   NJs8Xg0cjiS6yp6MG2A6BuN/WtVeqzn+0HOU+uM7Ms+UdgEik3fVeWAIb
   sVCHlnBjbpehtJtIySpmoesr9t7NwN3NALxHPiq+5pszZWf0wLqCmD2LO
   g==;
X-CSE-ConnectionGUID: Xh0FG66JRP+xz71HbMkFpA==
X-CSE-MsgGUID: k2gqhhFqTTKs5oDZ9HFmVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59492527"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="59492527"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:43:40 -0700
X-CSE-ConnectionGUID: EwY2O4cmTlaoqrnL1Rm5qg==
X-CSE-MsgGUID: JoTQENvOS2qyeqFnwh8XIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="172288304"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2025 08:43:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 6A47595; Thu, 04 Sep 2025 17:43:38 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/7] usb: xhci: align PORTCS trace with one-based port numbering
Date: Thu,  4 Sep 2025 17:42:15 +0200
Message-ID: <20250904154221.2314596-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the xHCI driver, port numbers are typically described using a one-based
index. However, tracing currently uses a zero-based index. To ensure
consistency between tracing and dynamic debugging, update the trace port
number to use a one-based index.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index f303ce600ff5..9abc904f1749 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -550,7 +550,7 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 	),
 	TP_fast_assign(
 		__entry->busnum = port->rhub->hcd->self.busnum;
-		__entry->portnum = port->hcd_portnum;
+		__entry->portnum = port->hcd_portnum + 1;
 		__entry->portsc = portsc;
 	),
 	TP_printk("port %d-%d: %s",
-- 
2.50.1


