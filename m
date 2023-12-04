Return-Path: <linux-usb+bounces-3663-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50FC8030D3
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CE801C20A72
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B99622EE1;
	Mon,  4 Dec 2023 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiXoLAI0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50771D5
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686680; x=1733222680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xmeDhVNiYm2qHg1elyDyXQ7PYx4JHfJgMZPurWOb1wA=;
  b=eiXoLAI0ylKhOoVwZMHdZu6frS4ev8Qrem1jz/dR62twc+EUnS2/YXiD
   cIQFA1MplTZt91bSQS79+ZirHMQbRk8CnFGDTqgs4E6Xwqhqd/s4N2pWg
   NuB2N5vifwWdVJ2jHXIY1Wjn7Tm6/C4zsajyP5Mxfy7kGpOFdsIYMgwDR
   FPfb5LamACPDsABSyNeEwId4PsWUY2QAAwjohqa3yKtKAU5o3eHleIulR
   dvsZxlJu5gMMkJ49vlbcQXL+H0Fy93i/fXyIjLQ2FwjmCPcLF2sMS5uPJ
   gs4P5846VPAP16vJ27ph/F/lA3YP6RRM3WTdPS6N82XU9w6/ZCkdJkTqF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260660"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260660"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338905"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338905"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:33 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 07/18] xhci: dbc: Replace custom return value with proper Linux error code
Date: Mon,  4 Dec 2023 12:45:23 +0200
Message-Id: <20231204104534.1335903-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
References: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
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


