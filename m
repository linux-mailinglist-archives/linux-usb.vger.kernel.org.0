Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED812499E9
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 12:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgHSKMF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 06:12:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:40676 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgHSKMD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 06:12:03 -0400
IronPort-SDR: ScjRcO43rgeeRK0JPFxr5fwVk73z4VIYx+cvF1gEy+PEFuWlvsVBOnBwh8AE/UAYuJCMYj/ErL
 0earN4m8/bzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="155050073"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="155050073"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 03:12:03 -0700
IronPort-SDR: I+nPJSGpFyxvtH2NxlicmxF+dehoAxG8dcGv8P7VAkcU9xuPU/My7CbLeJdjz6ocY9/MRlL4Ym
 9wkosGzrblKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="497702617"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 19 Aug 2020 03:12:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 67AAB1FD; Wed, 19 Aug 2020 13:11:58 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: xhci-dbgtty: convert tasklets to use new tasklet_setup() API
Date:   Wed, 19 Aug 2020 13:11:57 +0300
Message-Id: <20200819101157.74147-1-andriy.shevchenko@linux.intel.com>
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
 drivers/usb/host/xhci-dbgtty.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index b8918f73a432..94ce58c3a469 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -288,14 +288,14 @@ static const struct tty_operations dbc_tty_ops = {
 	.unthrottle		= dbc_tty_unthrottle,
 };
 
-static void dbc_rx_push(unsigned long _port)
+static void dbc_rx_push(struct tasklet_struct *t)
 {
+	struct dbc_port		*port = from_tasklet(port, t, push);
 	struct dbc_request	*req;
 	struct tty_struct	*tty;
 	unsigned long		flags;
 	bool			do_push = false;
 	bool			disconnect = false;
-	struct dbc_port		*port = (void *)_port;
 	struct list_head	*queue = &port->read_queue;
 
 	spin_lock_irqsave(&port->port_lock, flags);
@@ -382,7 +382,7 @@ xhci_dbc_tty_init_port(struct xhci_dbc *dbc, struct dbc_port *port)
 {
 	tty_port_init(&port->port);
 	spin_lock_init(&port->port_lock);
-	tasklet_init(&port->push, dbc_rx_push, (unsigned long)port);
+	tasklet_setup(&port->push, dbc_rx_push);
 	INIT_LIST_HEAD(&port->read_pool);
 	INIT_LIST_HEAD(&port->read_queue);
 	INIT_LIST_HEAD(&port->write_pool);
-- 
2.28.0

