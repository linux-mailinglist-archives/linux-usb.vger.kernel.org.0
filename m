Return-Path: <linux-usb+bounces-23996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC320AB88AA
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B6364E3F6F
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974CD1BE238;
	Thu, 15 May 2025 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKDZ6vkD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE4C1F582A
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317417; cv=none; b=i3GZz2tQn0uMjDpuXTj/J0jyOhyrOvjfS275QHi+kQ6Bt8I3+ECgwkUwA+S5kPcS4yCU833xrYdohtZ10zB4sW7j/GKYDNO94mvfAUZzyKIaFfTldn6sLwK6PDwscOmSoDKAhMCafTkp0UoMOaY9PxHx656Ki+lvf7PQA4xD678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317417; c=relaxed/simple;
	bh=hpBBAyn6Jojy6JZR07ETLPDrDcOall1hmF5KaLE7QsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qqv8c0wZ3IDqEW2147wZQd6WrU4ESPdmSfxw65QC/Af0zmnBYATgSrfBlnzz7pDc9ZbfF5cvpmBKV8rCHp1VWM7N+FVkZduy0uVjulpXiJZPM89h/jccBZzR25glUzkwWk+Txoj27VadbHiVbobGgle6GWLPVzoybzXcq6fMuYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKDZ6vkD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317416; x=1778853416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hpBBAyn6Jojy6JZR07ETLPDrDcOall1hmF5KaLE7QsM=;
  b=CKDZ6vkD3DS35DRirfmZLWeuWsQ6P5drsMBlil+31H48Kx4MaydzpsNT
   zRMPnqk7Uw6o+Iv4ULlIxuCGvshnBuUQ+YKaf19LCpMXHTW1SOKaIeSdC
   86d53gPBt8ipoBdHYaIzgWrRr3+vUNsk2pT7cI1mdkwXO8wkY7eq6eW1d
   68Sr605r53D8MDhX9Lqo4Dj03ajRpNIc01zWSZEzRT2Rhjo+/Bw76cGUt
   ++iwo3ofuClj0Cl+8qm++3nr2i8D92SJn39tup2/pvwm2oxpL1xvW/tO5
   GgCr+k4U+YWVUk0gJp9+6qD2vaBizI53OyrDih4WndRR2rl8sNAa6vUKU
   g==;
X-CSE-ConnectionGUID: oPVkNr7kTGmnw7Vhv9irkQ==
X-CSE-MsgGUID: GFSeoKp/SkiUWSekdaOLwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270074"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270074"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:56 -0700
X-CSE-ConnectionGUID: fV61yj6VQZyOWdzy1OTX0g==
X-CSE-MsgGUID: I40NIcTNQqyWSWTg5ezQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372312"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:53 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/24] usb: xhci: guarantee that IMAN register is flushed
Date: Thu, 15 May 2025 16:56:13 +0300
Message-ID: <20250515135621.335595-17-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Add read call to guarantee that the write to the IMAN register has
been flushed.

xHCI specification 1.2, section 5.5.2.1, Note:
"Most systems have write buffers that minimize overhead, but this may
 require a read operation to guarantee that the write has been flushed
 from the posted buffer."

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 3 +++
 drivers/usb/host/xhci.c      | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9607f75b8d2a..91a9ad687704 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3088,6 +3088,9 @@ static void xhci_clear_interrupt_pending(struct xhci_interrupter *ir)
 		irq_pending = readl(&ir->ir_set->irq_pending);
 		irq_pending |= IMAN_IP;
 		writel(irq_pending, &ir->ir_set->irq_pending);
+
+		/* Read operation to guarantee the write has been flushed from posted buffers */
+		readl(&ir->ir_set->irq_pending);
 	}
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 472589679af3..8cdb1a01a3ed 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -335,6 +335,8 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	iman |= IMAN_IE;
 	writel(iman, &ir->ir_set->irq_pending);
 
+	/* Read operation to guarantee the write has been flushed from posted buffers */
+	readl(&ir->ir_set->irq_pending);
 	return 0;
 }
 
@@ -350,6 +352,7 @@ int xhci_disable_interrupter(struct xhci_interrupter *ir)
 	iman &= ~IMAN_IE;
 	writel(iman, &ir->ir_set->irq_pending);
 
+	readl(&ir->ir_set->irq_pending);
 	return 0;
 }
 
-- 
2.43.0


