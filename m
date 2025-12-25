Return-Path: <linux-usb+bounces-31764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 390CACDDED9
	for <lists+linux-usb@lfdr.de>; Thu, 25 Dec 2025 17:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCBF33005ABE
	for <lists+linux-usb@lfdr.de>; Thu, 25 Dec 2025 16:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBCE2405EC;
	Thu, 25 Dec 2025 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="O4u4TlbE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m158191.netease.com (mail-m158191.netease.com [47.251.158.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC5E226CF7;
	Thu, 25 Dec 2025 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.251.158.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766680615; cv=none; b=uE1xM2U1aEXFS5paPTBq1Tky/tggQmiRkDS31yImnthawemi7LfNDav8sGhtPI1MwSEC/l1h4z9N1bUsAkcafw8od25f8gsALKPQpnAGyiImmRHhd7OTggV/KfhaIgyRQyq7ucGLdxp2G73Tf3tSg2G7a/NSY1Q9OlrFWIzDIo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766680615; c=relaxed/simple;
	bh=vrBm04ogLik7exZ1LurMJVQQIMh1eKnhieDDuGwlHBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BnNUsP5n38KToUiK/IjhKdVVwFCXtlmTAurR2EyxK72wrjegRBRZFiEShfPbIshBhQhwYM1sax+VJDbz7j2FfYSul8yVRSoOfMny8edKDJW7kxXkpL8gD6d5f1ntayznvuaRormLuzf5cH5OCKkjUa9T6aWXVKQNcVeKaa9Srww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=O4u4TlbE; arc=none smtp.client-ip=47.251.158.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2e924276e;
	Fri, 26 Dec 2025 00:21:22 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] usb: xhci: Fix memory leak in xchi_disable_slot()
Date: Thu, 25 Dec 2025 16:21:19 +0000
Message-Id: <20251225162119.1184703-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b56509d2303a1kunmed6f17af954b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaShpIVk9PHRhKHkkYTk4fQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0xVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=O4u4TlbERsHrcCaJIpNBwglC9HAD8l7rjZpbPmTfJrd3eFqGW5UrxzfCYW6WiWc7PT8nt16v/LO79trKbGwCGRzODG3LAXRbJqRxFqrMeOkBmCYpS3xRKCO2EhykkM75Lbzpmi6ppEot4IMXjb2kbaWZLRtmy5cjAEWAIqiQlZQ=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=s20Jw+BNOVSKf+24padwKbuMoHm9lXDTECTDrR+0lg8=;
	h=date:mime-version:subject:message-id:from;

xhci_alloc_command() allocates a command structure and, when the
second argument is true, also allocates a completion structure.
Currently, the error handling path in xhci_disable_slot() only frees
the command structure using kfree(), causing the completion structure
to leak.

Fix this by using xhci_free_command() instead of kfree(). This function
correctly frees both the command and the completion structure.

Fixes: cd3f1790b006d ("usb: xhci: Fix potential memory leak in xhci_disable_slot()")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/usb/host/xhci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 02c9bfe21ae2..f0beed054954 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4137,7 +4137,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
 	if (state == 0xffffffff || (xhci->xhc_state & XHCI_STATE_DYING) ||
 			(xhci->xhc_state & XHCI_STATE_HALTED)) {
 		spin_unlock_irqrestore(&xhci->lock, flags);
-		kfree(command);
+		xhci_free_command(xhci, command);
 		return -ENODEV;
 	}
 
@@ -4145,7 +4145,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
 				slot_id);
 	if (ret) {
 		spin_unlock_irqrestore(&xhci->lock, flags);
-		kfree(command);
+		xhci_free_command(xhci, command);
 		return ret;
 	}
 	xhci_ring_cmd_db(xhci);
-- 
2.34.1


