Return-Path: <linux-usb+bounces-3554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C45F800DED
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC9C1C20FD2
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B58482FA;
	Fri,  1 Dec 2023 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uq43RAUt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9D893
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443154; x=1732979154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xmeDhVNiYm2qHg1elyDyXQ7PYx4JHfJgMZPurWOb1wA=;
  b=Uq43RAUt+BvZj61gedUrkazjCBJLmeDVwbcNOi2BIR8CWGtT7/v8iP4h
   ptGOnWYdiVKsI5XtDjwD26lomAYthQzLosZMg60Gydw2urncS20vItuxn
   Ak6JaD3EcedRmUQzSMlpAaZV/UgXqsjy5RjKxB2/C3TsewYG+6m/s2dqN
   +RX53AQrv3XKqaRoP4YAIXWO7zyGobQKFt4ttepYOv7Ang0j6a/L/+BQ+
   3qcQwIY3hvDNMNpVlU69OafZVhw0VFr7h2t/c2ta/3+SZcUwhcyznlp7O
   TG0M2dx9O+h9R4UPrrTeKSoJdOolTDtAkhNox5awYnexHiAUGCj9RI5c7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309718"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309718"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112549"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112549"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:52 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/19] xhci: dbc: Replace custom return value with proper Linux error code
Date: Fri,  1 Dec 2023 17:06:35 +0200
Message-Id: <20231201150647.1307406-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Replace the custom return value with proper Linux error code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index c211c69e8041..779a564ad698 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -593,7 +593,7 @@ static int xhci_do_dbc_start(struct xhci_dbc *dbc)
 static int xhci_do_dbc_stop(struct xhci_dbc *dbc)
 {
 	if (dbc->state == DS_DISABLED)
-		return -1;
+		return -EINVAL;
 
 	writel(0, &dbc->regs->control);
 	dbc->state = DS_DISABLED;
-- 
2.25.1


