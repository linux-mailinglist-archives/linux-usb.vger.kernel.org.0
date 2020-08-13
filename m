Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE26243405
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 08:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgHMGZx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 02:25:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgHMGZw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:52 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D73492078D;
        Thu, 13 Aug 2020 06:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299951;
        bh=XqBNb/nUTdIvLeD6DiA78f2UoG4UXyYLikbj5H38YGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JMcbXcUwuBdjcEaRLTGeM4QE18uT59O32g1jaPO96VK5rTRIsucAXPhMFkZASbGC4
         EoZW7TkcLysA1nODFyMaQdnmYy2hpaDvXk5ZH4LU6+EYuDpNHpP5qp8HZHyDCsurp/
         EPpPvsmO5zX6OId2+5ItAsBBv772wx09fI5Y+P4M=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 11/11] dwc3: debugfs: fix checkpatch warnings
Date:   Thu, 13 Aug 2020 09:25:32 +0300
Message-Id: <20200813062532.829720-11-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813062532.829720-1-balbi@kernel.org>
References: <20200813062532.829720-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

no functional changes

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/debugfs.c | 56 ++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 2c7b6dd79cdf..608639a0dea7 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -397,13 +397,13 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 
 	switch (DWC3_GCTL_PRTCAP(reg)) {
 	case DWC3_GCTL_PRTCAP_HOST:
-		seq_printf(s, "host\n");
+		seq_puts(s, "host\n");
 		break;
 	case DWC3_GCTL_PRTCAP_DEVICE:
-		seq_printf(s, "device\n");
+		seq_puts(s, "device\n");
 		break;
 	case DWC3_GCTL_PRTCAP_OTG:
-		seq_printf(s, "otg\n");
+		seq_puts(s, "otg\n");
 		break;
 	default:
 		seq_printf(s, "UNKNOWN %08x\n", DWC3_GCTL_PRTCAP(reg));
@@ -464,22 +464,22 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
 
 	switch (reg) {
 	case 0:
-		seq_printf(s, "no test\n");
+		seq_puts(s, "no test\n");
 		break;
 	case USB_TEST_J:
-		seq_printf(s, "test_j\n");
+		seq_puts(s, "test_j\n");
 		break;
 	case USB_TEST_K:
-		seq_printf(s, "test_k\n");
+		seq_puts(s, "test_k\n");
 		break;
 	case USB_TEST_SE0_NAK:
-		seq_printf(s, "test_se0_nak\n");
+		seq_puts(s, "test_se0_nak\n");
 		break;
 	case USB_TEST_PACKET:
-		seq_printf(s, "test_packet\n");
+		seq_puts(s, "test_packet\n");
 		break;
 	case USB_TEST_FORCE_ENABLE:
-		seq_printf(s, "test_force_enable\n");
+		seq_puts(s, "test_force_enable\n");
 		break;
 	default:
 		seq_printf(s, "UNKNOWN %d\n", reg);
@@ -760,27 +760,26 @@ static int dwc3_transfer_type_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	if (!(dep->flags & DWC3_EP_ENABLED) ||
-			!dep->endpoint.desc) {
-		seq_printf(s, "--\n");
+	if (!(dep->flags & DWC3_EP_ENABLED) || !dep->endpoint.desc) {
+		seq_puts(s, "--\n");
 		goto out;
 	}
 
 	switch (usb_endpoint_type(dep->endpoint.desc)) {
 	case USB_ENDPOINT_XFER_CONTROL:
-		seq_printf(s, "control\n");
+		seq_puts(s, "control\n");
 		break;
 	case USB_ENDPOINT_XFER_ISOC:
-		seq_printf(s, "isochronous\n");
+		seq_puts(s, "isochronous\n");
 		break;
 	case USB_ENDPOINT_XFER_BULK:
-		seq_printf(s, "bulk\n");
+		seq_puts(s, "bulk\n");
 		break;
 	case USB_ENDPOINT_XFER_INT:
-		seq_printf(s, "interrupt\n");
+		seq_puts(s, "interrupt\n");
 		break;
 	default:
-		seq_printf(s, "--\n");
+		seq_puts(s, "--\n");
 	}
 
 out:
@@ -798,11 +797,11 @@ static int dwc3_trb_ring_show(struct seq_file *s, void *unused)
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	if (dep->number <= 1) {
-		seq_printf(s, "--\n");
+		seq_puts(s, "--\n");
 		goto out;
 	}
 
-	seq_printf(s, "buffer_addr,size,type,ioc,isp_imi,csp,chn,lst,hwo\n");
+	seq_puts(s, "buffer_addr,size,type,ioc,isp_imi,csp,chn,lst,hwo\n");
 
 	for (i = 0; i < DWC3_TRB_NUM; i++) {
 		struct dwc3_trb *trb = &dep->trb_pool[i];
@@ -884,7 +883,7 @@ static void dwc3_debugfs_create_endpoint_files(struct dwc3_ep *dep,
 		const struct file_operations *fops = dwc3_ep_file_map[i].fops;
 		const char *name = dwc3_ep_file_map[i].name;
 
-		debugfs_create_file(name, S_IRUGO, parent, dep, fops);
+		debugfs_create_file(name, 0444, parent, dep, fops);
 	}
 }
 
@@ -929,21 +928,18 @@ void dwc3_debugfs_init(struct dwc3 *dwc)
 	root = debugfs_create_dir(dev_name(dwc->dev), usb_debug_root);
 	dwc->root = root;
 
-	debugfs_create_regset32("regdump", S_IRUGO, root, dwc->regset);
+	debugfs_create_regset32("regdump", 0444, root, dwc->regset);
+	debugfs_create_file("lsp_dump", 0644, root, dwc, &dwc3_lsp_fops);
 
-	debugfs_create_file("lsp_dump", S_IRUGO | S_IWUSR, root, dwc,
-			    &dwc3_lsp_fops);
-
-	if (IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)) {
-		debugfs_create_file("mode", S_IRUGO | S_IWUSR, root, dwc,
+	if (IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE))
+		debugfs_create_file("mode", 0644, root, dwc,
 				    &dwc3_mode_fops);
-	}
 
 	if (IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE) ||
 			IS_ENABLED(CONFIG_USB_DWC3_GADGET)) {
-		debugfs_create_file("testmode", S_IRUGO | S_IWUSR, root, dwc,
-				    &dwc3_testmode_fops);
-		debugfs_create_file("link_state", S_IRUGO | S_IWUSR, root, dwc,
+		debugfs_create_file("testmode", 0644, root, dwc,
+				&dwc3_testmode_fops);
+		debugfs_create_file("link_state", 0644, root, dwc,
 				    &dwc3_link_state_fops);
 		dwc3_debugfs_create_endpoint_dirs(dwc, root);
 	}
-- 
2.28.0

