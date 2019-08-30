Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5269AA37DC
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 15:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfH3Nhj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 09:37:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:23363 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbfH3Nhj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Aug 2019 09:37:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 06:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="332860296"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2019 06:37:37 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/4] usb: xhci: dbc: Use GFP_KERNEL instead of GFP_ATOMIC in 'xhci_dbc_alloc_requests()'
Date:   Fri, 30 Aug 2019 16:39:14 +0300
Message-Id: <1567172356-12915-3-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567172356-12915-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1567172356-12915-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to use GFP_ATOMIC to allocate 'req'. GFP_KERNEL should be
enough and is already used for another allocation juste a few lines below.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgtty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 845939f8a0b8..be726c791323 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -139,7 +139,7 @@ xhci_dbc_alloc_requests(struct dbc_ep *dep, struct list_head *head,
 	struct dbc_request	*req;
 
 	for (i = 0; i < DBC_QUEUE_SIZE; i++) {
-		req = dbc_alloc_request(dep, GFP_ATOMIC);
+		req = dbc_alloc_request(dep, GFP_KERNEL);
 		if (!req)
 			break;
 
-- 
2.7.4

