Return-Path: <linux-usb+bounces-36291-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BgfJeTt4WmKzgAAu9opvQ
	(envelope-from <linux-usb+bounces-36291-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 10:23:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB7418984
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 10:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B3DB301651D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 08:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50B23A1E67;
	Fri, 17 Apr 2026 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0qQwZW0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3297927CB35;
	Fri, 17 Apr 2026 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414171; cv=none; b=MxhPg+r4GygtZ2n+myxAarRJg9mGNf6tDyp0MmbbBRt+GKxCOvo+2jB3ia6p0nvaPgJNKSNE0Cdcj1pvfjuKuKPWQMyTvxbXCqopanZBrJpr7v7qON7TTDuC+XNvFblwj2vZRc5iu1GWcGhbFUZT00aN3QjH5NomSh0j9CpEang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414171; c=relaxed/simple;
	bh=F9Pvp+FmfdY156GEhXA2b6keHQVjCHBaTs5i6a1wkA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hgKxNdh9H4J7oThls+KG+H2rMSCdh59zPd4yl4jJjO+JJ7LFa60GXjvpM6ELfLQPXMbxWPfUFOHEkIaUiVQteDVBn8k1lnYlAFulikFHT2hCrfF5JETMaN1jTytVvoBtR9I9rvJGkJIpaju34BILV7zx1DqLg9D4PZRI04XYdY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0qQwZW0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4321C19425;
	Fri, 17 Apr 2026 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776414170;
	bh=F9Pvp+FmfdY156GEhXA2b6keHQVjCHBaTs5i6a1wkA4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=l0qQwZW02a0WZdfA/GdEo8LxBRSqnlOhqMfg/UNmPk0CWgB+P+tsJaxjVrVuH90Kg
	 AGPOnkeNRep2ZWGAAvuL92synuGZDlW384cx1/fCtc5mU8zdzD1G9BdQp+VI09c7/p
	 KRJcdwYNQarMm4OD/BALD6RgtL/YXYyZMeWxoiOIjxciUh+Oz/Ql/0aHuVRk99F5dK
	 1kUz5lj0gItVHkDX2NcwIqOmzdFP8hJkEEQdQhYbwLQiuPFo+Tx/zQqHXnX4jq8QlK
	 4N2/tWJ1ypDcPCt640tcV4vFyuaqs4ADzyL1RpB3aJQxUmxCsMcShC4bdpAVtkeIXQ
	 BHNzvDtgvqvDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1594F8DFCE;
	Fri, 17 Apr 2026 08:22:50 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Fri, 17 Apr 2026 10:37:31 +0200
Subject: [PATCH] usb: cdnsp: add support for eUSB2v2 port
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-eusb2v2_upstream-v1-1-3340d9d9bf0e@cadence.com>
X-B4-Tracking: v=1; b=H4sIAErx4WkC/yXMTQqDMBBA4avIrBuIg3/1KqWUTBzbEWolY0QQ7
 26sy2/x3gbKQVihzTYIvIjKb0zIbxn4jxvfbKRLBrRY2SKvDUclXPAVJ50Du69prC8J764mcpC
 yKXAv63/5eF7WSAP7+fzAvh9soh6UdAAAAA==
X-Change-ID: 20260417-eusb2v2_upstream-80c5b29a7bba
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 peter.chen@kernel.org, Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776415060; l=10626;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=6of1fBEPgMT5L74JUJ70rK/fgrEplBcDd1Odp7kO/AM=;
 b=5Lhb1pypb278XqXBWLw/AqwELnBZbv6L9rq7bYAFjFqQfZq30+5u1nOm3Jj5Xc8MVCOcRWHgx
 oGva0fhgFwbCe0cC4OrR8dt/SCbV3RkmZihYWk+y244uD1C8PDX1tVh
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36291-lists,linux-usb=lfdr.de,pawell.cadence.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pawell@cadence.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64DB7418984
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pawel Laszczak <pawell@cadence.com>

The Cadence CDNSP controller optionally supports eUSB2 (embedded USB2)
port. While this port type operates logically like high-speed USB 2.0,
it utilizes a different physical layer signaling.

This patch:
- Extends the port detection logic to recognize the eUSB2 protocol.
- Tracks the eUSB2 port offset in the cdnsp_device structure.
- Ensures that eUSB2 ports are correctly handled during Link State
  transitions, specifically forcing L0 when LPM is capable, similar
  to standard USB 2.0 ports.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/cdnsp-gadget.c | 49 ++++++++++++++++++---------
 drivers/usb/cdns3/cdnsp-gadget.h |  1 +
 drivers/usb/cdns3/cdnsp-mem.c    | 73 +++++++++++++++++++++++++++-------------
 drivers/usb/cdns3/cdnsp-ring.c   |  9 +++--
 4 files changed, 90 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 6b3815f8a6e5..2c71c77e6ec3 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -124,20 +124,28 @@ void cdnsp_set_link_state(struct cdnsp_device *pdev,
 }
 
 static void cdnsp_disable_port(struct cdnsp_device *pdev,
-			       __le32 __iomem *port_regs)
+			       struct cdnsp_port *port)
 {
-	u32 temp = cdnsp_port_state_to_neutral(readl(port_regs));
+	u32 temp;
+
+	if (!port->exist)
+		return;
 
-	writel(temp | PORT_PED, port_regs);
+	temp = cdnsp_port_state_to_neutral(readl(&port->regs->portsc));
+	writel(temp | PORT_PED, &port->regs->portsc);
 }
 
 static void cdnsp_clear_port_change_bit(struct cdnsp_device *pdev,
-					__le32 __iomem *port_regs)
+					struct cdnsp_port *port)
 {
-	u32 portsc = readl(port_regs);
+	u32 portsc;
+
+	if (!port->exist)
+		return;
 
+	portsc = readl(&port->regs->portsc);
 	writel(cdnsp_port_state_to_neutral(portsc) |
-	       (portsc & PORT_CHANGE_BITS), port_regs);
+	       (portsc & PORT_CHANGE_BITS), &port->regs->portsc);
 }
 
 static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
@@ -944,7 +952,7 @@ void cdnsp_set_usb2_hardware_lpm(struct cdnsp_device *pdev,
 				 struct usb_request *req,
 				 int enable)
 {
-	if (pdev->active_port != &pdev->usb2_port || !pdev->gadget.lpm_capable)
+	if (pdev->active_port == &pdev->usb3_port || !pdev->gadget.lpm_capable)
 		return;
 
 	trace_cdnsp_lpm(enable);
@@ -1310,20 +1318,26 @@ static int cdnsp_run(struct cdnsp_device *pdev,
 		break;
 	}
 
-	if (speed >= USB_SPEED_SUPER) {
+	if (pdev->usb3_port.exist && speed >= USB_SPEED_SUPER) {
 		writel(temp, &pdev->port3x_regs->mode_addr);
 		cdnsp_set_link_state(pdev, &pdev->usb3_port.regs->portsc,
 				     XDEV_RXDETECT);
 	} else {
-		cdnsp_disable_port(pdev, &pdev->usb3_port.regs->portsc);
+		cdnsp_disable_port(pdev, &pdev->usb3_port);
 	}
 
-	cdnsp_set_link_state(pdev, &pdev->usb2_port.regs->portsc,
-			     XDEV_RXDETECT);
+	if (pdev->usb2_port.exist) {
+		cdnsp_set_link_state(pdev, &pdev->usb2_port.regs->portsc,
+				     XDEV_RXDETECT);
+		writel(PORT_REG6_L1_L0_HW_EN | fs_speed, &pdev->port20_regs->port_reg6);
+	}
+
+	if (pdev->eusb_port.exist)
+		cdnsp_set_link_state(pdev, &pdev->eusb_port.regs->portsc,
+				     XDEV_RXDETECT);
 
 	cdnsp_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 
-	writel(PORT_REG6_L1_L0_HW_EN | fs_speed, &pdev->port20_regs->port_reg6);
 
 	ret = cdnsp_start(pdev);
 	if (ret) {
@@ -1469,8 +1483,10 @@ static void cdnsp_stop(struct cdnsp_device *pdev)
 			cdnsp_ep_dequeue(&pdev->eps[0], req);
 	}
 
-	cdnsp_disable_port(pdev, &pdev->usb2_port.regs->portsc);
-	cdnsp_disable_port(pdev, &pdev->usb3_port.regs->portsc);
+	cdnsp_disable_port(pdev, &pdev->usb2_port);
+	cdnsp_disable_port(pdev, &pdev->usb3_port);
+	cdnsp_disable_port(pdev, &pdev->eusb_port);
+
 	cdnsp_disable_slot(pdev);
 	cdnsp_halt(pdev);
 
@@ -1479,8 +1495,9 @@ static void cdnsp_stop(struct cdnsp_device *pdev)
 	temp = readl(&pdev->ir_set->irq_pending);
 	writel(IMAN_IE_CLEAR(temp), &pdev->ir_set->irq_pending);
 
-	cdnsp_clear_port_change_bit(pdev, &pdev->usb2_port.regs->portsc);
-	cdnsp_clear_port_change_bit(pdev, &pdev->usb3_port.regs->portsc);
+	cdnsp_clear_port_change_bit(pdev, &pdev->usb2_port);
+	cdnsp_clear_port_change_bit(pdev, &pdev->eusb_port);
+	cdnsp_clear_port_change_bit(pdev, &pdev->usb3_port);
 
 	/* Clear interrupt line */
 	temp = readl(&pdev->ir_set->irq_pending);
diff --git a/drivers/usb/cdns3/cdnsp-gadget.h b/drivers/usb/cdns3/cdnsp-gadget.h
index a91cca509db0..c44bca348a41 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.h
+++ b/drivers/usb/cdns3/cdnsp-gadget.h
@@ -1474,6 +1474,7 @@ struct cdnsp_device {
 	unsigned int link_state;
 
 	struct cdnsp_port usb2_port;
+	struct cdnsp_port eusb_port;
 	struct cdnsp_port usb3_port;
 	struct cdnsp_port *active_port;
 	u16 test_mode;
diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index a2a1b21f2ef8..932071818d1e 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -1088,11 +1088,9 @@ void cdnsp_mem_cleanup(struct cdnsp_device *pdev)
 			  pdev->dcbaa, pdev->dcbaa->dma);
 
 	pdev->dcbaa = NULL;
-
-	pdev->usb2_port.exist = 0;
-	pdev->usb3_port.exist = 0;
-	pdev->usb2_port.port_num = 0;
-	pdev->usb3_port.port_num = 0;
+	memset(&pdev->usb2_port, 0, sizeof(struct cdnsp_port));
+	memset(&pdev->eusb_port, 0, sizeof(struct cdnsp_port));
+	memset(&pdev->usb3_port, 0, sizeof(struct cdnsp_port));
 	pdev->active_port = NULL;
 }
 
@@ -1133,6 +1131,18 @@ static void cdnsp_add_in_port(struct cdnsp_device *pdev,
 	port_offset = CDNSP_EXT_PORT_OFF(temp);
 	port_count = CDNSP_EXT_PORT_COUNT(temp);
 
+	if (port == &pdev->eusb_port) {
+		/*
+		 * If controller has usb2 + eusb port then eusb is as
+		 * second port
+		 */
+		if (port_count == 2)
+			port_offset++;
+
+		if (port_count == 1 && pdev->usb2_port.exist)
+			return;
+	}
+
 	trace_cdnsp_port_info(addr, port_offset, port_count, port->maj_rev);
 
 	port->port_num = port_offset;
@@ -1152,13 +1162,10 @@ static int cdnsp_setup_port_arrays(struct cdnsp_device *pdev)
 	base = &pdev->cap_regs->hc_capbase;
 	offset = cdnsp_find_next_ext_cap(base, 0,
 					 EXT_CAP_CFG_DEV_20PORT_CAP_ID);
-	pdev->port20_regs = base + offset;
-
-	offset = cdnsp_find_next_ext_cap(base, 0, D_XEC_CFG_3XPORT_CAP);
-	pdev->port3x_regs =  base + offset;
+	if (offset)
+		pdev->port20_regs = base + offset;
 
 	offset = 0;
-	base = &pdev->cap_regs->hc_capbase;
 
 	/* Driver expects max 2 extended protocol capability. */
 	for (i = 0; i < 2; i++) {
@@ -1173,26 +1180,46 @@ static int cdnsp_setup_port_arrays(struct cdnsp_device *pdev)
 			cdnsp_add_in_port(pdev, &pdev->usb3_port,
 					  base + offset);
 
-		if (CDNSP_EXT_PORT_MAJOR(temp) == 0x02 &&
-		    !pdev->usb2_port.port_num)
-			cdnsp_add_in_port(pdev, &pdev->usb2_port,
-					  base + offset);
+		if (CDNSP_EXT_PORT_MAJOR(temp) == 0x02) {
+			if (!pdev->usb2_port.port_num && pdev->port20_regs)
+				cdnsp_add_in_port(pdev, &pdev->usb2_port,
+						  base + offset);
+
+			if (!pdev->eusb_port.port_num)
+				cdnsp_add_in_port(pdev, &pdev->eusb_port,
+						  base + offset);
+		}
 	}
 
-	if (!pdev->usb2_port.exist || !pdev->usb3_port.exist) {
-		dev_err(pdev->dev, "Error: Only one port detected\n");
+	if (!pdev->usb2_port.exist && !pdev->eusb_port.exist &&
+	    !pdev->usb3_port.exist) {
+		dev_err(pdev->dev, "Error: No port detected\n");
 		return -ENODEV;
 	}
 
-	trace_cdnsp_init("Found USB 2.0 ports and  USB 3.0 ports.");
+	if (pdev->usb2_port.exist) {
+		pdev->usb2_port.regs = (struct cdnsp_port_regs __iomem *)
+				       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
+					(pdev->usb2_port.port_num - 1));
+		trace_cdnsp_init("Found USB 2.0 port.");
+	}
 
-	pdev->usb2_port.regs = (struct cdnsp_port_regs __iomem *)
-			       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
-				(pdev->usb2_port.port_num - 1));
+	if (pdev->eusb_port.exist) {
+		pdev->eusb_port.regs = (struct cdnsp_port_regs __iomem *)
+				       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
+					(pdev->eusb_port.port_num - 1));
+		trace_cdnsp_init("Found eUSB 2.0 port.");
+	}
+
+	if (pdev->usb3_port.exist) {
+		offset = cdnsp_find_next_ext_cap(base, 0, D_XEC_CFG_3XPORT_CAP);
+		pdev->port3x_regs =  base + offset;
 
-	pdev->usb3_port.regs = (struct cdnsp_port_regs __iomem *)
-			       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
-				(pdev->usb3_port.port_num - 1));
+		pdev->usb3_port.regs = (struct cdnsp_port_regs __iomem *)
+				       (&pdev->op_regs->port_reg_base + NUM_PORT_REGS *
+					(pdev->usb3_port.port_num - 1));
+		trace_cdnsp_init("Found  USB 3.x port.");
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/cdns3/cdnsp-ring.c b/drivers/usb/cdns3/cdnsp-ring.c
index 0758f171f73e..715658c981ff 100644
--- a/drivers/usb/cdns3/cdnsp-ring.c
+++ b/drivers/usb/cdns3/cdnsp-ring.c
@@ -259,7 +259,7 @@ static bool cdnsp_room_on_ring(struct cdnsp_device *pdev,
  */
 static void cdnsp_force_l0_go(struct cdnsp_device *pdev)
 {
-	if (pdev->active_port == &pdev->usb2_port && pdev->gadget.lpm_capable)
+	if (pdev->active_port != &pdev->usb3_port && pdev->gadget.lpm_capable)
 		cdnsp_set_link_state(pdev, &pdev->active_port->regs->portsc, XDEV_U0);
 }
 
@@ -763,6 +763,8 @@ static int cdnsp_update_port_id(struct cdnsp_device *pdev, u32 port_id)
 
 	if (port_id == pdev->usb2_port.port_num) {
 		port = &pdev->usb2_port;
+	} else if (port_id == pdev->eusb_port.port_num) {
+		port = &pdev->eusb_port;
 	} else if (port_id == pdev->usb3_port.port_num) {
 		port  = &pdev->usb3_port;
 	} else {
@@ -779,7 +781,8 @@ static int cdnsp_update_port_id(struct cdnsp_device *pdev, u32 port_id)
 		cdnsp_enable_slot(pdev);
 	}
 
-	if (port_id == pdev->usb2_port.port_num)
+	if ((pdev->usb2_port.exist && port_id == pdev->usb2_port.port_num) ||
+	    (pdev->eusb_port.exist && port_id == pdev->eusb_port.port_num))
 		cdnsp_set_usb2_hardware_lpm(pdev, NULL, 1);
 	else
 		writel(PORT_U1_TIMEOUT(1) | PORT_U2_TIMEOUT(1),
@@ -808,7 +811,7 @@ static void cdnsp_handle_port_status(struct cdnsp_device *pdev,
 
 	port_regs = pdev->active_port->regs;
 
-	if (port_id == pdev->usb2_port.port_num)
+	if (port_id == pdev->usb2_port.port_num || port_id == pdev->eusb_port.port_num)
 		port2 = true;
 
 new_event:

---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20260417-eusb2v2_upstream-80c5b29a7bba

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>



