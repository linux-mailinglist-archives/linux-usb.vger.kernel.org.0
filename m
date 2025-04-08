Return-Path: <linux-usb+bounces-22742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A7A804A2
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6105422FA7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBA026A0F5;
	Tue,  8 Apr 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VV26DeNB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF93C26A0D9
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113589; cv=none; b=CE4bSv1b9OJbKeeaXCEJ4NH+tysa24IlFX+TDlsZ3Ts8jxojQehhS1HfzvVspVU0MLz4bFmEP50vP3eDxnf2wi+1pExQ1U5mt+GdBTuBLEx0H+LJYMRs+RLEBJ/VPl+I+Ztm67OFPGeJhXR46Kfo3Lg2V70esA8loSZW2lh/5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113589; c=relaxed/simple;
	bh=h7B5yL+lCB4y9maC5JNARcEPThbC1anABN0yN0Gldlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdMxc+4uHmQYNYer+/BBy9UyuPPJQ8joD+TMdqGZ8UxjoTAHw52R95xgR4t9EKv2y/gBUfcwdLXUETwY9SWSOgYbqVTkRrPTxvhMbNF28aikmNOz8HpaNeSxNF2yhdnNihtqQFXZolNi+gkLLEg/GzxC7C67zAC9kFyQopM+GKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VV26DeNB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113588; x=1775649588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h7B5yL+lCB4y9maC5JNARcEPThbC1anABN0yN0Gldlo=;
  b=VV26DeNBTApZydce2rOwzuF+Tr7yY/TgKieWrK+qsTt1WohFkogAKG+r
   CL3nSHlJaUmHK0pd3vVM36EUDhrX2v0lIxTXREfraUOffCVB93zTVW/3t
   HxZFwX70GoeCiz6e75ppLcjWQOzqNx8Z4pFes05B8amSt+fcOo+JntSIL
   +MIRRAVK5EYZeGM8uiK3GMJSoUpTG6JF3A5mQ4eTGgjjNiI93RYcyaFAw
   jhzS6MWvUFUmWlgL6ncMWaW0RnvYy+SyIVm44t2EwtX8lUT7Qa03vtaZN
   IwvEEJjC84l68o17JNhE5T/crSttKo/kGInRnuQvJ0UVQxh7y2LWI3kB5
   w==;
X-CSE-ConnectionGUID: eeWSMQcYQjelKST71VQftw==
X-CSE-MsgGUID: wcJPx1j0QJeafSoqkRDuBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45676460"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45676460"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:47 -0700
X-CSE-ConnectionGUID: 8tWfcPzvSeWPSfqrdW8ACQ==
X-CSE-MsgGUID: 06UUmcX/SGqUJP6/gwXQxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151428042"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 04:59:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 4E4E0398; Tue, 08 Apr 2025 14:59:45 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/9] usb: xhci: guarantee that IMAN register is flushed
Date: Tue,  8 Apr 2025 14:57:46 +0300
Message-ID: <20250408115752.1344901-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
References: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add read call to guarantee that the write to the IMAN register has
been flushed.

xHCI specification 1.2, section 5.5.2.1, Note:
"Most systems have write buffers that minimize overhead, but this may
 require a read operation to guarantee that the write has been flushed
 from the posted buffer."

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 3 +++
 drivers/usb/host/xhci.c      | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5d64c297721c..412eb90c29fb 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3092,6 +3092,9 @@ static void xhci_clear_interrupt_pending(struct xhci_interrupter *ir)
 		irq_pending = readl(&ir->ir_set->irq_pending);
 		irq_pending |= IMAN_IP;
 		writel(irq_pending, &ir->ir_set->irq_pending);
+
+		/* Read operation to guarantee the write has been flushed from posted buffers */
+		readl(&ir->ir_set->irq_pending);
 	}
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5cf9908188cf..93daaac102f7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -334,6 +334,8 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	iman |= IMAN_IE;
 	writel(iman, &ir->ir_set->irq_pending);
 
+	/* Read operation to guarantee the write has been flushed from posted buffers */
+	readl(&ir->ir_set->irq_pending);
 	return 0;
 }
 
@@ -349,6 +351,7 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 	iman &= ~IMAN_IE;
 	writel(iman, &ir->ir_set->irq_pending);
 
+	readl(&ir->ir_set->irq_pending);
 	return 0;
 }
 
-- 
2.47.2


