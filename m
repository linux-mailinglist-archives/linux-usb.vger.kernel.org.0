Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6322499D7
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 12:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgHSKIa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 06:08:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:50844 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbgHSKI3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 06:08:29 -0400
IronPort-SDR: iFY+gwXVrAI2egCVhqV6V+L5ViQOSRaSfcEbTI3jOl3N2W5vEkJOaU7ykraXqUEUZtX1cL4TKj
 jqk+owAygYLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="152496720"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="152496720"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 03:08:29 -0700
IronPort-SDR: srYUXLhJQNyYKmWTjOl+D4+TG6gypXF81FBBkKVKrE+LrLbVPPyLwdPctUGwTSOXp/YiVNRfXl
 z9QFPPyA0xeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="371199628"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 19 Aug 2020 03:08:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 197461FD; Wed, 19 Aug 2020 13:08:27 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: hcd: convert tasklets to use new tasklet_setup() API
Date:   Wed, 19 Aug 2020 13:08:26 +0300
Message-Id: <20200819100826.69716-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation for unconditionally passing the struct tasklet_struct
pointer to all tasklet callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/core/hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a33b849e8beb..2c6b9578a7d3 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1657,9 +1657,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 	usb_put_urb(urb);
 }
 
-static void usb_giveback_urb_bh(unsigned long param)
+static void usb_giveback_urb_bh(struct tasklet_struct *t)
 {
-	struct giveback_urb_bh *bh = (struct giveback_urb_bh *)param;
+	struct giveback_urb_bh *bh = from_tasklet(bh, t, bh);
 	struct list_head local_list;
 
 	spin_lock_irq(&bh->lock);
@@ -2403,7 +2403,7 @@ static void init_giveback_urb_bh(struct giveback_urb_bh *bh)
 
 	spin_lock_init(&bh->lock);
 	INIT_LIST_HEAD(&bh->head);
-	tasklet_init(&bh->bh, usb_giveback_urb_bh, (unsigned long)bh);
+	tasklet_setup(&bh->bh, usb_giveback_urb_bh);
 }
 
 struct usb_hcd *__usb_create_hcd(const struct hc_driver *driver,
-- 
2.28.0

