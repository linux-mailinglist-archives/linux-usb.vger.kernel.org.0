Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825FB440C94
	for <lists+linux-usb@lfdr.de>; Sun, 31 Oct 2021 04:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhJaDRd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Oct 2021 23:17:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:48298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229887AbhJaDRc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Oct 2021 23:17:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F33760F4A;
        Sun, 31 Oct 2021 03:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635650101;
        bh=JFurVHKZY98JyT5vHZHnmf3bCV41zqJUXol1KUL6mB4=;
        h=From:To:Cc:Subject:Date:From;
        b=q0gKe8W1k8axFRab2cdDL8ycLZqvTCU6IdCOHv7mQwpq7Q8FB09muCX6Vt/rG0HQC
         xMh0JFUd64COv0w/+RgR0e7Wb/WnlTaCMWSoYibtMmDTjRXwJ1GZXOVRGmG3EOTbKt
         GDDirG6K71QU7J5mQyJB6Dt5fFHENvIwdtBvT136Yh4XbMIJGdge5kiXeyaReeZWqS
         hCCGg/ddA25tje2lpw1J9uOzhzNb3btUe+6nTw5EE+bTtODpEs3vyMFqHNgxd8yf/F
         d5wD0W1wckWyoV4GKppIpFTfzW9KSiP0bDz6qTUqyEZPgILiDAaExcEwK+3Y3s7Uhh
         RPf04CYbuwiNQ==
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Piyush Mehta <piyush.mehta@xilinx.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH 1/1] usb: chipidea: udc: make controller hardware endpoint primed
Date:   Sun, 31 Oct 2021 11:14:53 +0800
Message-Id: <20211031031453.6670-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Piyush Mehta <piyush.mehta@xilinx.com>

Root-cause:
There is an issue like endpoint is not recognized as primed, when bus
have more pressure and the add dTD tripwire semaphore (ATDTW bit in
USBCMD register) that can cause the controller to ignore a dTD that is
added to a primed endpoint.
This issue observed with the Windows10 host machine.

Workaround:
The software must implement a periodic cycle, and check for each dTD,
if the endpoint is primed. It can do this by reading the corresponding
bits in the ENDPTPRIME and ENDPTSTAT registers. If these bits are read
at 0, the software needs to re-prime the endpoint by writing 1 to the
corresponding bit in the ENDPTPRIME register.

Added conditional revision check of 2.20[CI_REVISION_22].

Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
Signed-off-by: Peter Chen <peter.chen@kernel.org>
---
 drivers/usb/chipidea/udc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8834ca613721..f9ca5010f65b 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -49,6 +49,8 @@ ctrl_endpt_in_desc = {
 	.wMaxPacketSize  = cpu_to_le16(CTRL_PAYLOAD_MAX),
 };
 
+static int reprime_dtd(struct ci_hdrc *ci, struct ci_hw_ep *hwep,
+		       struct td_node *node);
 /**
  * hw_ep_bit: calculates the bit number
  * @num: endpoint number
@@ -599,6 +601,12 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 
 		prevlastnode->ptr->next = cpu_to_le32(next);
 		wmb();
+
+		if (ci->rev == CI_REVISION_22) {
+			if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
+				reprime_dtd(ci, hwep, prevlastnode);
+		}
+
 		if (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
 			goto done;
 		do {
-- 
2.25.1

