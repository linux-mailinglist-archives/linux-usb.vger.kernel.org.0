Return-Path: <linux-usb+bounces-1665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262F7CA8DF
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 15:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7D4281615
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 13:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C96527727;
	Mon, 16 Oct 2023 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfok7jaf"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E28120B22
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 13:09:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E836BF5;
	Mon, 16 Oct 2023 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697461787; x=1728997787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5wFq2LWIAxkbz3owrFJUzWLLHVZI7rE5EIksKjGKEtQ=;
  b=dfok7jafci87ko77G726DMhHigZPsbaTky0XT2Ty5RmmAqX4eGd/tCYq
   PDFXk8uRZ4JndD5CZa1XwuYAiTmJEk/L8wX+GfMT0Co7C5MYWoHJ5pSEM
   1l/2MsvRg1P/uMW3M9DkG0NEO+uM3D+xqxxLFO+AIJuQ+ph49IJmfuVaq
   vm/kS8GnKCWpS+ejtKjQGQ/9M4Xc7haJ8UPTGOeQ8Lc34IFl+2YZdaKwV
   p56L/Ogj/OwYMhYYX1qG8kdmhQNq0I/NX2uTMiQZYkI60C6CT8dxmVER/
   97o/7WdwuIbL1FFK3DHum3kWIPDOR3nCmjkv1J1acZbX9ggvL5TQ4FQWp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416590139"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="416590139"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 06:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="759385503"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="759385503"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 16 Oct 2023 06:09:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 10A7285E; Mon, 16 Oct 2023 16:09:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 02/10] xhci: dbc: Convert to use sysfs_streq()
Date: Mon, 16 Oct 2023 16:09:26 +0300
Message-Id: <20231016130934.1158504-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231016130934.1158504-1-andriy.shevchenko@linux.intel.com>
References: <20231016130934.1158504-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

It's standard approach to parse values from user space by using
sysfs_streq(). Make driver use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 9e9ce3711813..f505b79afe53 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -957,9 +957,9 @@ static ssize_t dbc_store(struct device *dev,
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
 
-	if (!strncmp(buf, "enable", 6))
+	if (sysfs_streq(buf, "enable"))
 		xhci_dbc_start(dbc);
-	else if (!strncmp(buf, "disable", 7))
+	else if (sysfs_streq(buf, "disable"))
 		xhci_dbc_stop(dbc);
 	else
 		return -EINVAL;
-- 
2.40.0.1.gaa8946217a0b


