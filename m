Return-Path: <linux-usb+bounces-3555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FEA800DEF
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95320B216EE
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6964A992;
	Fri,  1 Dec 2023 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCUf7IP4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2359010F8
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443156; x=1732979156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=86iMTrpGERSaEtz2iimPFmK8dbVMl6thZKjmQ6E6wdo=;
  b=fCUf7IP4N30qFfBZFjkyjRpzI+37esPRxYl7afjlv55bIi4QIhKQFf8T
   JUecL6f6VJ18jU7Fxa2dw4Fg/wcWRPwLL63mXGRm4/g5ACsbqj39L3hnd
   b4cL/zKT9zRZ3BLZM4su4CGEx2zfU8rMPj6/MLJOlEKDB/sTc5ajkMOvZ
   xkLSyCbHQaayW7kwWyK+Vfev6WQMhPmBVEIRtO5LPu9FHKHmdizxPouIo
   vK2WiJc2FzS37acP3yaHo/tS0oBYMEygBShYQBRsi15d/j4CuC50jrRAa
   l/7SMAZQ3PcoKCCVFrYcQyTFgJDlKZnUY1OH5n/wzFmGjy0BBTfbhVBOT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309732"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309732"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112559"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112559"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:53 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
Date: Fri,  1 Dec 2023 17:06:36 +0200
Message-Id: <20231201150647.1307406-9-mathias.nyman@linux.intel.com>
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

Instead of doing custom calculations, use sizeof_field() macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 779a564ad698..0c9fd61e9c5b 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -374,7 +374,7 @@ static void xhci_dbc_eps_init(struct xhci_dbc *dbc)
 
 static void xhci_dbc_eps_exit(struct xhci_dbc *dbc)
 {
-	memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps));
+	memset(dbc->eps, 0, sizeof_field(struct xhci_dbc, eps));
 }
 
 static int dbc_erst_alloc(struct device *dev, struct xhci_ring *evt_ring,
-- 
2.25.1


