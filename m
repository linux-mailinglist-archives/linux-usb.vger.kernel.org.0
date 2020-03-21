Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4078F18E26A
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2020 16:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgCUP3m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Mar 2020 11:29:42 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:25826 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbgCUP3l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Mar 2020 11:29:41 -0400
Received: from localhost.localdomain ([93.22.37.29])
        by mwinf5d09 with ME
        id H3Ve2200H0djkx1033VeBP; Sat, 21 Mar 2020 16:29:39 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Mar 2020 16:29:39 +0100
X-ME-IP: 93.22.37.29
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] usbip: vhci_hcd: slighly simplify code in 'vhci_urb_dequeue()'
Date:   Sat, 21 Mar 2020 16:29:38 +0100
Message-Id: <20200321152938.19580-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The allocation of 'unlink' can be moved before a spin_lock.
This slighly simplifies the error handling if the memory allocation fails,
aligns the code structure with what is done in 'vhci_tx_urb()' and reduces
potential lock contention.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/usbip/vhci_hcd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 65850e9c7190..b909a634260c 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -905,17 +905,16 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* tcp connection is alive */
 		struct vhci_unlink *unlink;
 
-		spin_lock(&vdev->priv_lock);
-
 		/* setup CMD_UNLINK pdu */
 		unlink = kzalloc(sizeof(struct vhci_unlink), GFP_ATOMIC);
 		if (!unlink) {
-			spin_unlock(&vdev->priv_lock);
 			spin_unlock_irqrestore(&vhci->lock, flags);
 			usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_MALLOC);
 			return -ENOMEM;
 		}
 
+		spin_lock(&vdev->priv_lock);
+
 		unlink->seqnum = atomic_inc_return(&vhci_hcd->seqnum);
 		if (unlink->seqnum == 0xffff)
 			pr_info("seqnum max\n");
-- 
2.20.1

