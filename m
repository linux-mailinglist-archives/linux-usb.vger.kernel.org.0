Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8922E6BAC
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 00:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730581AbgL1Wzu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 17:55:50 -0500
Received: from mga05.intel.com ([192.55.52.43]:7113 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729361AbgL1UDx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 15:03:53 -0500
IronPort-SDR: mbyKSObUvD2cZxXtsnfQbPQpQoas7vHTem83PpyamkezLT3NddOjVxThndanQyESLoVF15xjLt
 ju6qWtAUq+bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="261169971"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="261169971"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 12:02:07 -0800
IronPort-SDR: nfUHiCb070WzvU8nzZevkzJVy6YgeSU/87xHyXxck+g3DMW5/OTWyXGOPh1j63YVNq5K2NXmkr
 iVW+iXw7aWYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="418917991"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 28 Dec 2020 12:02:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 56AFDDE; Mon, 28 Dec 2020 22:02:04 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: gadget: u_serial: use %*ph to print small buffer
Date:   Mon, 28 Dec 2020 22:02:03 +0200
Message-Id: <20201228200203.58525-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use %*ph format to print small buffer as hex string.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/gadget/function/u_serial.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 2caccbb6e014..768f883f486c 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -258,9 +258,7 @@ __acquires(&port->port_lock)
 		list_del(&req->list);
 		req->zero = kfifo_is_empty(&port->port_write_buf);
 
-		pr_vdebug("ttyGS%d: tx len=%d, 0x%02x 0x%02x 0x%02x ...\n",
-			  port->port_num, len, *((u8 *)req->buf),
-			  *((u8 *)req->buf+1), *((u8 *)req->buf+2));
+		pr_vdebug("ttyGS%d: tx len=%d, %3ph ...\n", port->port_num, len, req->buf);
 
 		/* Drop lock while we call out of driver; completions
 		 * could be issued while we do so.  Disconnection may
-- 
2.29.2

