Return-Path: <linux-usb+bounces-951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1847B57D4
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 18:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 5BB21283E72
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71531DDD4;
	Mon,  2 Oct 2023 16:18:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79D61A711
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 16:18:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0792BC4;
	Mon,  2 Oct 2023 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696263533; x=1727799533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kv1vxuF0jud+8jhw5JHU/tzaPQgxkHf1HRU7hzDONZc=;
  b=cWsw52IET/wE4wODSbhI5NS3NxwWOMFyvQNsHGpCZ/xHO6YmLjvES5Az
   SI0NLWHmkDNA/hF4VCza0BLhQ0SXbw5SgXyZMNGZkfUypbff6xRSMTQwj
   WSaTHyrjbL9nXfVqUHKTGuacaUqruordrEPMQDm+giYqK4cPfjOdKVahD
   lPHkU0+PDpIt3/rbP+KW4OAlAmjvY7+i3wOwzPc1/SqJ6wB/OpbBVHDz/
   mATXAHQ5iiA09MAuEjDtQB/xLkW13mjrTbCLJeXlq2Tcg6CnAXacQzYkp
   cQOWfpn7xtrZ4ovcGCiJeHkCjwYt1sjaalS6nR0TA0qwjfUM5Hnbz1wrS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362949546"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="362949546"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 09:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816339812"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816339812"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 02 Oct 2023 09:16:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7551315BA; Mon,  2 Oct 2023 19:16:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 08/10] xhci: dbc: Use sizeof_field() where it makes sense
Date: Mon,  2 Oct 2023 19:16:08 +0300
Message-Id: <20231002161610.2648818-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231002161610.2648818-1-andriy.shevchenko@linux.intel.com>
References: <20231002161610.2648818-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Instead of doing custom calculations, use sizeof_field() macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 617d057aa5f8..88e90c30916c 100644
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
2.40.0.1.gaa8946217a0b


