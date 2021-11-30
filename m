Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E217462ABE
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 03:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhK3C4m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 21:56:42 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53370 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232245AbhK3C4m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Nov 2021 21:56:42 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 190A8C16A2;
        Tue, 30 Nov 2021 02:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638240804; bh=kxeki4Umpfj/JW8TpGmRhxgrQngXn5T+hHnIjOcmrQk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GHzBqTdH+FOoNmZqgY9xWBT2vyRbZgjLle5uc1/4hGDYJ9eGV9smsc/V2D/6qB+dT
         RfYW6W1sRAqsp6DBusPUaJ03KIqnJFfyXA/XIFl861xTzlPJaRRYZC4rw5NxjoI9F2
         6c3yte5EFSaPCBW8h//acryfJQx2L8sp/aLtu9koKGqpdeev5ki8O0rFnRegLe+hTc
         LUsRQC7R697g0FDHWut89NpNBpFfLdzmiaJGMfSWcadV8p+es3LuQV4XlaPzodDLKz
         +LNDKP2BLwghYIuSIutsVzs+yjAsHJkPbHG4Y4Y0oUn/M4fdHd+yn00ri8rBqWDy90
         t+Jj3xmFkAa1w==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D83EBA0096;
        Tue, 30 Nov 2021 02:53:22 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Mon, 29 Nov 2021 18:53:22 -0800
Date:   Mon, 29 Nov 2021 18:53:22 -0800
Message-Id: <efddf4ee5821c4bc5ae7ad90d629ec7a0ebcbf9a.1638240306.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1638240306.git.Thinh.Nguyen@synopsys.com>
References: <cover.1638240306.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/3] usb: dwc3: gadget: Skip reading GEVNTSIZn
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver knows what it needs to set for GEVNTSIZn, and the controller
doesn't modify this register unless there's a hard reset. To save a few
microseconds of register read in read-modify-write operation, simply do
register write with the expected values. This can improve performance
when there are many interrupts generated, which the driver needs to
check and handle.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f66baaef8a40..c0c89374716b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4082,7 +4082,6 @@ static irqreturn_t dwc3_process_event_buf(struct dwc3_event_buffer *evt)
 	struct dwc3 *dwc = evt->dwc;
 	irqreturn_t ret = IRQ_NONE;
 	int left;
-	u32 reg;
 
 	left = evt->count;
 
@@ -4114,9 +4113,8 @@ static irqreturn_t dwc3_process_event_buf(struct dwc3_event_buffer *evt)
 	ret = IRQ_HANDLED;
 
 	/* Unmask interrupt */
-	reg = dwc3_readl(dwc->regs, DWC3_GEVNTSIZ(0));
-	reg &= ~DWC3_GEVNTSIZ_INTMASK;
-	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0), reg);
+	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
+		    DWC3_GEVNTSIZ_SIZE(evt->length));
 
 	if (dwc->imod_interval) {
 		dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUNT_EHB);
@@ -4145,7 +4143,6 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	struct dwc3 *dwc = evt->dwc;
 	u32 amount;
 	u32 count;
-	u32 reg;
 
 	if (pm_runtime_suspended(dwc->dev)) {
 		pm_runtime_get(dwc->dev);
@@ -4172,9 +4169,8 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	evt->flags |= DWC3_EVENT_PENDING;
 
 	/* Mask interrupt */
-	reg = dwc3_readl(dwc->regs, DWC3_GEVNTSIZ(0));
-	reg |= DWC3_GEVNTSIZ_INTMASK;
-	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0), reg);
+	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
+		    DWC3_GEVNTSIZ_INTMASK | DWC3_GEVNTSIZ_SIZE(evt->length));
 
 	amount = min(count, evt->length - evt->lpos);
 	memcpy(evt->cache + evt->lpos, evt->buf + evt->lpos, amount);
-- 
2.28.0

