Return-Path: <linux-usb+bounces-11689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE5918159
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5816A1F24168
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29129186E25;
	Wed, 26 Jun 2024 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nr26iSNm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B51862BB
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406028; cv=none; b=B3IRqFI5Fj7xx4Sf5j18V1SpHvMI+rJYmPtYt/pq46hPV7pRqE/PMaDxonVm+TCfvfuiUqfWANjtbcF++/T+MI01jkENkP/t2C5Hxk+61IRKMVtBatb1sIHgklZ2m8+SdgC/ZF0A7oUyQ08X14iswpmsR9JZm5DHyVVJssra/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406028; c=relaxed/simple;
	bh=w4AA+wcWJnE+8cPEe2cewV+uhUoH9nz5oqtVXRyL8EE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kyii4k5AOjJL3J5tzCFzOJsM8lQDp4OVKhASVMgO5GctqzWf9NoyuWSM1YLL3P7s7O36rbPv5jVFlLkHjqy14BS2+dlw5+VbZbevCNqvIlTVWgAvrPdlLphdMfAYmIbf1BBTOLCDeGx7DpjyhV55MNQuIPpAxM+WNmNAB5PuNQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nr26iSNm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406027; x=1750942027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w4AA+wcWJnE+8cPEe2cewV+uhUoH9nz5oqtVXRyL8EE=;
  b=nr26iSNm8Uoz7GTKH2vb4OWSARNwnYA8hnJjvmz3dWKjHqWs+tKaE8dK
   N106quw6NJauVvCRUs3d7p86dYFiy/52ocTwdrdNB/wLpV2XbNc2yP9RC
   LP3rwmMDvtGBUEA+eY7NWCj7wRCYy9WEp0eFY/9iXH/jo6jDdfdbxna6x
   JQCdigkH7AxqstAKxuRMR3V2TVPo69b+rhgLIAzQTqbclDe0JIborJCeA
   yRXxvEN6uKclJaZNXyGJsA4uKYWLFu47qfSHewiZWjIPs8tpY/G3B+J40
   CxrDFeac/JAvw+YQdIwamXoZH687X+tu9Dfxa+Ik6Yiiz2tXj+j7zGxCU
   A==;
X-CSE-ConnectionGUID: te5xePYhTEyn0u1ozPyGIA==
X-CSE-MsgGUID: sfPm3GtrQ+S4B+uwmA5dnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353415"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353415"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:07 -0700
X-CSE-ConnectionGUID: uZjHRCRWTeC5+fRr4lGxZg==
X-CSE-MsgGUID: cs6XywqeR7ekB2hOtyb+Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442729"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:47:05 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/21] usb: xhci: remove false xhci_giveback_urb_in_irq() header comment
Date: Wed, 26 Jun 2024 15:48:30 +0300
Message-Id: <20240626124835.1023046-17-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The function doesn't releases and re-acquires the lock, this was removed
in commit 36dc01657b49 ("usb: host: xhci: Support running urb giveback in
tasklet context")

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 14898335d193..8289f69a6978 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -760,10 +760,6 @@ static void td_to_noop(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 	}
 }
 
-/*
- * Must be called with xhci->lock held in interrupt context,
- * releases and re-acquires xhci->lock
- */
 static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 				     struct xhci_td *cur_td, int status)
 {
-- 
2.25.1


