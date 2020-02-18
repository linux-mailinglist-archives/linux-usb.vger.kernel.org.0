Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045E916377A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 00:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgBRXu2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 18:50:28 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42695 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbgBRXu2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 18:50:28 -0500
Received: by mail-pl1-f196.google.com with SMTP id e8so8740420plt.9
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 15:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cU6rRL+fEDBZEUh1M3w8jP2C2tvvBigE0EFoKql4LUY=;
        b=kY7giRTxGQhDcNA/rBhbEMYcBnWiiqIOxzlFTADE7SW7U1IA7U7dKQjm61LAsdQEfu
         /sJ+DoCAzXkqg/c1AuIvUzILO45xUXRRTn2rlwCIcySGoQlC3yuVEiPXqplN41peB5ua
         04P9AB04XajEtdCyMjM/ZfkflXwrls4iuXFdBQ187bfEBSfwueQdI9sAgmFklPPb5b9G
         c+7PfMmO63L1bW2PAgCfJvslWmhXNjjQSqZ4mqfbNEGTZcg5cukOnH9GeewnltlLQsG3
         ypru9jyJtwtuwfz79P7dsbRu+iSBguVPTxVn8beAY6B7xnkEjcE8uGxzmkprgPMnVidk
         FYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cU6rRL+fEDBZEUh1M3w8jP2C2tvvBigE0EFoKql4LUY=;
        b=PAM4pBPhr43Z6XcVtZW/Tnoy/AU4JiNtV49cehhMQIuTZc5oT+hflkpnUmTvVmI0Cc
         WdP4Ny1V+tHyvToJAJ/gsDNmj3eRzTuXlBnXU1IwnRO0rRCZb+O5xx94Oe9fNQqm4W97
         tt4GfmhOAIucboiDg4LC/TwuhY3r0WlsGK0exscwGjgOAkNIXdHOC48YbkDAmCT7o5Ps
         wolA3NPlUeSqi7U+faBYv/9ClL4CLd/ajsMOWQ8pJyu4nt2T+Jc42rki9CBu+xRnZDS8
         oSgVAClym0vhpcrLbyzafdSRRo+IN44u5rxM/2ZjLdHTdqX/4kNcjstNBYuMWVegnVnJ
         oFAQ==
X-Gm-Message-State: APjAAAW3jCTQ20dGc6uJ98eKzaIzu5+gyVzHukArtJu8JqiPLIFqd1yy
        bTKeN/0/4eO+07PMiY9j+DA=
X-Google-Smtp-Source: APXvYqz1mHolmHyfQEVcv9FBKCJt8XbDqaXSlXI0OzmwN3Tu0orc1QDDraVYXNMympTB0yrCKtS7WQ==
X-Received: by 2002:a17:902:8b81:: with SMTP id ay1mr21409529plb.275.1582069827421;
        Tue, 18 Feb 2020 15:50:27 -0800 (PST)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id f3sm113766pfg.115.2020.02.18.15.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 15:50:26 -0800 (PST)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH] usb: xhci: enable interrupt only after xhci_start()
Date:   Tue, 18 Feb 2020 15:50:24 -0800
Message-Id: <20200218235024.15266-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Xhci interrupt must be enabled only after controller is
initialized and started. Currently interrupt is enabled
first in xhci_run() and later hcd state is set to running
in xhci_run_finished().

On a slow system (such as FPGA based platform) the time
difference between enabling interrupt and setting the hcd
state becomes huge enough where interrupt is triggered but
controller initialization is not complete yet.

Fixing the same by moving the interrupt enable (CMD_EIE)
part of code snippet from xhci_run() to xhci_run_finished().

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/host/xhci.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index dbac0fa9748d..ee2877fe0a58 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -604,6 +604,8 @@ static int xhci_init(struct usb_hcd *hcd)
 
 static int xhci_run_finished(struct xhci_hcd *xhci)
 {
+	u32 temp;
+
 	if (xhci_start(xhci)) {
 		xhci_halt(xhci);
 		return -ENODEV;
@@ -611,6 +613,13 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	xhci->shared_hcd->state = HC_STATE_RUNNING;
 	xhci->cmd_ring_state = CMD_RING_STATE_RUNNING;
 
+	/* Set the HCD state before we enable the irqs */
+	temp = readl(&xhci->op_regs->command);
+	temp |= (CMD_EIE);
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+			"// Enable interrupts, cmd = 0x%x.", temp);
+	writel(temp, &xhci->op_regs->command);
+
 	if (xhci->quirks & XHCI_NEC_HOST)
 		xhci_ring_cmd_db(xhci);
 
@@ -664,13 +673,6 @@ int xhci_run(struct usb_hcd *hcd)
 	temp |= (xhci->imod_interval / 250) & ER_IRQ_INTERVAL_MASK;
 	writel(temp, &xhci->ir_set->irq_control);
 
-	/* Set the HCD state before we enable the irqs */
-	temp = readl(&xhci->op_regs->command);
-	temp |= (CMD_EIE);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Enable interrupts, cmd = 0x%x.", temp);
-	writel(temp, &xhci->op_regs->command);
-
 	temp = readl(&xhci->ir_set->irq_pending);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"// Enabling event ring interrupter %p by writing 0x%x to irq_pending",
-- 
2.17.1

