Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A0422B1AD
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbgGWOm4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729016AbgGWOmz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:55 -0400
IronPort-SDR: g6EE+Bv3hEMWzjJ0jzmQb3PsDVX7fCn1jqLaQ+45WdaS1nwww3BOgeR8P+8SvnypO6jbhGgOkj
 OA56kWJ6RFJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607485"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:55 -0700
IronPort-SDR: qwfiApNN1r2bMcarPL4a65Lxj1ATHLxmdTzZhNmiPSVGvLRN/OR5vtMpnrHcFNL0uZb2CElrYf
 /vcNlcmpIufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672497"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:53 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 23/27] xhci: dbc: remove endpoint pointers from dbc_port structure
Date:   Thu, 23 Jul 2020 17:45:26 +0300
Message-Id: <20200723144530.9992-24-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dbctty no longer needs references directly to dbc endpoints,
so remove them

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.h | 2 --
 drivers/usb/host/xhci-dbgtty.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index fe360cf712c1..796cf2808be8 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -110,8 +110,6 @@ struct dbc_port {
 	struct kfifo			write_fifo;
 
 	bool				registered;
-	struct dbc_ep			*in;
-	struct dbc_ep			*out;
 };
 
 struct xhci_dbc {
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 9886d42e1ff2..ab2b82aa04be 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -426,8 +426,6 @@ xhci_dbc_tty_init_port(struct xhci_dbc *dbc, struct dbc_port *port)
 	INIT_LIST_HEAD(&port->read_queue);
 	INIT_LIST_HEAD(&port->write_pool);
 
-	port->in =		get_in_ep(dbc);
-	port->out =		get_out_ep(dbc);
 	port->port.ops =	&dbc_port_ops;
 	port->n_read =		0;
 }
-- 
2.17.1

