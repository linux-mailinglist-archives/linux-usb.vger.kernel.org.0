Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADAF7C23B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 14:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbfGaMwB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 08:52:01 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:20645 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728588AbfGaMwB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Jul 2019 08:52:01 -0400
Received: from localhost.localdomain ([176.167.121.156])
        by mwinf5d70 with ME
        id jQrw2000P3NZnML03QrxTn; Wed, 31 Jul 2019 14:51:59 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 31 Jul 2019 14:51:59 +0200
X-ME-IP: 176.167.121.156
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] usb: xhci: dbc: Use GFP_KERNEL instead of GFP_ATOMIC in 'xhci_dbc_alloc_requests()'
Date:   Wed, 31 Jul 2019 14:52:02 +0200
Message-Id: <557765ac7a028fa77f0e1ac6148ef2c0904f8ab7.1564577335.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
References: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to use GFP_ATOMIC to allocate 'req'. GFP_KERNEL should be
enough and is already used for another allocation juste a few lines below.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I've done my best to check if a spinlock can be hold when reaching this
code. Apparently it is never the case.
But double check to be sure that it is not the kmalloc that should use
GFP_ATOMIC.
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
2.20.1

