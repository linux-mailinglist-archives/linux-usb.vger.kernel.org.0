Return-Path: <linux-usb+bounces-24578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772EAD16A0
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 04:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F47B1889E1B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 02:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB3C192B66;
	Mon,  9 Jun 2025 02:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOHadOOK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653BC1917F9
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 02:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749434551; cv=none; b=i4B+i9GAHsaquzK5BZc/H6KFqd/QdkGc43lJhCYBUG4qgMdSfh6LAgugTg9PHQWoUP7A2peNl1B7hEZMI59SJ52Pk38B65UIjra7FfS92O4aF0R0T9rwm6gpZ0o7VoTkH5AM0VjxvuMgqVfuT0u87zEerovX51bBIbn7ETY5iug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749434551; c=relaxed/simple;
	bh=SWQT8sENw4NwT9lDBHuUxJ8UaAXCQ1R60yGTayrXJwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyRCoO/77BP8NlhE/GxOM5warVfQgaZUIZlpeVjhoH2d6+sUu7+TTygv9DfJj4xOmFdys8usUeO04vTlu7+Oi8Ew3X/irqKdSEL4oHi2s40Tcim7q/1wym+Sw8WwIeknSeY0rJL+BTPFrHBHTg0ynAtm1G6F0QUFJFG5/gpiNoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOHadOOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCB4C4CEEE;
	Mon,  9 Jun 2025 02:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749434551;
	bh=SWQT8sENw4NwT9lDBHuUxJ8UaAXCQ1R60yGTayrXJwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOHadOOKnDVUIn2C1eVnVfNZPPQzWA3Dw0WB8NUJwf6Zwe9J3q2lMnBMiD77JirdK
	 690Rq2Y0KFv3YBZv6EG2aFkbZNfO5QpWtqLo1a4HI1yfkr49RSvp7a8s/xbDXPxXDn
	 MFTydVaDAzkL8jdljQogEL9tRPAcng6PgXO8ZDh/HG4DrKJnRdChtXS5ptXXV8USWG
	 pP2azs2sh0m8HfiCutOmsxLGtMg5VwUmw+MCjzf3hlOp5R8EO8ufxR+CgsM92mZfVr
	 tu8MLHCN9plETBd744+3mxwhkl8zTxGTFgxy75mk+kVTnM22VHYUMmYJWnkRouCSRx
	 LiDvCV8KHnlng==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 4/4] usb: xhci: Avoid showing warnings for dying controller
Date: Sun,  8 Jun 2025 20:58:04 -0500
Message-ID: <20250609020223.269407-5-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609020223.269407-1-superm1@kernel.org>
References: <20250609020223.269407-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

When a USB4 dock is unplugged from a system it won't respond to ring
events. The PCI core handles the surprise removal event and notifies
all PCI drivers. The XHCI PCI driver sets a flag that the device is
being removed, and when the device stops responding a flag is also
added to indicate it's dying.

When that flag is set don't bother to show warnings about a missing
controller.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/usb/host/xhci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 4e6dbd2375c3f..86d4bcc5faaf0 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -144,7 +144,8 @@ int xhci_halt(struct xhci_hcd *xhci)
 	ret = xhci_handshake(&xhci->op_regs->status,
 			STS_HALT, STS_HALT, XHCI_MAX_HALT_USEC);
 	if (ret) {
-		xhci_warn(xhci, "Host halt failed, %d\n", ret);
+		if (!(xhci->xhc_state & XHCI_STATE_DYING))
+			xhci_warn(xhci, "Host halt failed, %d\n", ret);
 		return ret;
 	}
 
@@ -203,7 +204,8 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 	state = readl(&xhci->op_regs->status);
 
 	if (state == ~(u32)0) {
-		xhci_warn(xhci, "Host not accessible, reset failed.\n");
+		if (!(xhci->xhc_state & XHCI_STATE_DYING))
+			xhci_warn(xhci, "Host not accessible, reset failed.\n");
 		return -ENODEV;
 	}
 
-- 
2.43.0


