Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517C4246D0C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 18:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388946AbgHQQmo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 12:42:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:22172 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388938AbgHQQm3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 12:42:29 -0400
IronPort-SDR: SvOZJKzj+fnDkQbhX3YT09JVb8wR/ZYFhRTEPMu/dVPYFKNwgQqAS5OKm3JimQVC2checcrVeL
 WeIvwh5/UOxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142578215"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="142578215"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:42:29 -0700
IronPort-SDR: TbqGDeVe/8Ll/k0wRK+S2/KlarPNUYIO2LxlA9xqXVoYL1mNd5QwRASDhlFKBpmT2PbcVKEv06
 eLgGtFCVP47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="471485912"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2020 09:42:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BFA411C5; Mon, 17 Aug 2020 19:42:26 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] usb: early: xhci-dbc: Sort headers alphabetically
Date:   Mon, 17 Aug 2020 19:42:26 +0300
Message-Id: <20200817164226.49119-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817164226.49119-1-andriy.shevchenko@linux.intel.com>
References: <20200817164226.49119-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For better maintenance sort headers alphabetically.
While at it, move asm/*.h to be included after linux/*.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/early/xhci-dbc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index c5761ea9394d..2ae9b28de424 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -9,22 +9,23 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ":%s: " fmt, __func__
 
+#include <linux/bcd.h>
 #include <linux/byteorder/generic.h>
 #include <linux/console.h>
-#include <linux/pci_regs.h>
-#include <linux/pci_ids.h>
-#include <linux/memblock.h>
+#include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <asm/pci-direct.h>
-#include <asm/fixmap.h>
-#include <linux/bcd.h>
-#include <linux/export.h>
-#include <linux/module.h>
-#include <linux/delay.h>
 #include <linux/kthread.h>
+#include <linux/memblock.h>
+#include <linux/module.h>
+#include <linux/pci_ids.h>
+#include <linux/pci_regs.h>
 #include <linux/usb/xhci-dbgp.h>
 
+#include <asm/fixmap.h>
+#include <asm/pci-direct.h>
+
 #include "../host/xhci.h"
 #include "xhci-dbc.h"
 
-- 
2.28.0

