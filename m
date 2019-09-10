Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D323AE22D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2019 03:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403912AbfIJB62 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 21:58:28 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:42040 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726903AbfIJB62 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Sep 2019 21:58:28 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B3A73C2AF0;
        Tue, 10 Sep 2019 01:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1568080707; bh=tkBvqqbv+c6fV1ZD4hKjhKWB9SIPeo2sM9SkV05glEY=;
        h=Date:From:Subject:To:CC:From;
        b=RnFXUpqCVoggybNP6mWChr8WF7Jlwsc2ykHBnO6zEwVOhSnMT7RwUVlQSQmeGh5Jl
         mj5KJsnjxknp1rTpL3RBPViBjn4qLmfn6kAf7eM320Ptg5+6w9XcnJOKkFFWNZ3kXN
         6jlN4yAOBPXuXKtNiGBqjMNQYpP8n48BIre+dbgGQ77JxQDIY/5Dx2m/Pi+kfsYmKM
         /b6d0LGIAaoekyrg7VEKUyZ4RFoMdHb+tA5Bq0jiEcSNURNWhcMnfnKi0AOZ8+HUui
         JS0c7NWYapU4pKnD+r6O9p6DueTgunWCTWkfAtxxt4Odp+Dpw5BULSCImEmljpEkkd
         hGwiS9thU3PhQ==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A26F2A0091;
        Tue, 10 Sep 2019 01:58:27 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 9 Sep 2019 18:58:26 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 9 Sep
 2019 18:58:25 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 09 Sep 2019 18:58:25
 -0700
Date:   Mon, 9 Sep 2019 18:58:25 -0700
Message-ID: <47eb7d52f0e361d64547460b45e48fcc87f13ece.1568080486.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/2] usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name
To:     Felipe Balbi <balbi@kernel.org>, <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Change the macro name DWC3_GTXFIFOSIZ_TXFDEF to DWC3_GTXFIFOSIZ_TXFDEP
to match with the register name GTXFIFOSIZ.TXFDEP.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h   | 4 ++--
 drivers/usb/dwc3/gadget.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c8b349379af..6a6baadcb697 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -305,8 +305,8 @@
 
 /* Global TX Fifo Size Register */
 #define DWC31_GTXFIFOSIZ_TXFRAMNUM	BIT(15)		/* DWC_usb31 only */
-#define DWC31_GTXFIFOSIZ_TXFDEF(n)	((n) & 0x7fff)	/* DWC_usb31 only */
-#define DWC3_GTXFIFOSIZ_TXFDEF(n)	((n) & 0xffff)
+#define DWC31_GTXFIFOSIZ_TXFDEP(n)	((n) & 0x7fff)	/* DWC_usb31 only */
+#define DWC3_GTXFIFOSIZ_TXFDEP(n)	((n) & 0xffff)
 #define DWC3_GTXFIFOSIZ_TXFSTADDR(n)	((n) & 0xffff0000)
 
 /* Global Event Size Registers */
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8adb59f8e4f1..292e5e672868 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2214,9 +2214,9 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 
 	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1));
 	if (dwc3_is_usb31(dwc))
-		size = DWC31_GTXFIFOSIZ_TXFDEF(size);
+		size = DWC31_GTXFIFOSIZ_TXFDEP(size);
 	else
-		size = DWC3_GTXFIFOSIZ_TXFDEF(size);
+		size = DWC3_GTXFIFOSIZ_TXFDEP(size);
 
 	/* FIFO Depth is in MDWDITH bytes. Multiply */
 	size *= mdwidth;
-- 
2.11.0

