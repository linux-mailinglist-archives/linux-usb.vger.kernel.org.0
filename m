Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988E62472C7
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391618AbgHQSrZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:47:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:35541 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391622AbgHQSrG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:47:06 -0400
IronPort-SDR: ab/K1TZoifOm6Thwb4jry2E/X7DogfSMyk3TW5cv5UwT9oTLcvsdlIEuYwzrMlcXj7p4vCqnan
 eY/3fW3JqnkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219094510"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="219094510"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:47:05 -0700
IronPort-SDR: TS+6oa9tqjdbayqVyJ/nGUU6NM3rgiPg5+9RNzFsUn5eJw2VIAk5nqrKwUZT+AAXIim3QAWf/S
 b+ZKtrQ8RNeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="440961837"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 17 Aug 2020 11:47:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8C6E946E; Mon, 17 Aug 2020 21:47:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 8/8] usb: early: xhci-dbc: Move asm/* headers after linux/*
Date:   Mon, 17 Aug 2020 21:46:59 +0300
Message-Id: <20200817184659.58419-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

asm/* are less generic and should be included after linux/* ones.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: moved only asm/* and preserved ordering of the rest (Greg)
 drivers/usb/early/xhci-dbc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index c5761ea9394d..104b932a9c93 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -16,8 +16,6 @@
 #include <linux/memblock.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <asm/pci-direct.h>
-#include <asm/fixmap.h>
 #include <linux/bcd.h>
 #include <linux/export.h>
 #include <linux/module.h>
@@ -25,6 +23,9 @@
 #include <linux/kthread.h>
 #include <linux/usb/xhci-dbgp.h>
 
+#include <asm/fixmap.h>
+#include <asm/pci-direct.h>
+
 #include "../host/xhci.h"
 #include "xhci-dbc.h"
 
-- 
2.28.0

