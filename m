Return-Path: <linux-usb+bounces-24577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82BAD169F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 04:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 367E91686E7
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 02:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295ED18CBFC;
	Mon,  9 Jun 2025 02:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S97QLR3v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A366F17D346
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 02:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749434550; cv=none; b=YtJTeqwtafkbAn0KdVlFbnsrzYcOiQ6KQhZ3wyA+SduYlDMv30Tc8Ol/VF2uLRpgHZ3oIm25oR8R/5ko4QSKwoIVAkiAqCv5E2pT0/lINZvRUVy1QFgrX3aXVFRSRzJ2yvuMUjV2FZq5L5gZg3aDSIcx3ZzpQtp90F8nsJswZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749434550; c=relaxed/simple;
	bh=Q0vWS7gcm1V0GLNI8LlX0ba8va3fmQxLElqs6/Z6R/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwisbTJXcwnRotHQw6kgTlxrecf9QtP3FMFkNdL77ktZ9vcHvfYVPa3JaZ9kYUO097TLhFUYP5nbmJgWHtOEPYC6fN+wAg7AdXxgUPjQIEG8A6JqBH8yHns82GFaqQPc3SaigFHB4ptP4Q97y5NwB6RDV+pRhsyONHAViaAUOII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S97QLR3v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9C3C4CEF3;
	Mon,  9 Jun 2025 02:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749434550;
	bh=Q0vWS7gcm1V0GLNI8LlX0ba8va3fmQxLElqs6/Z6R/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S97QLR3v8HlsY14fVZCqTXK2iO4hwzv0DHaniFTPQTD+38jIgI8+W1gzW9AjVBqLB
	 cVleL75mGoxEw3sNWSazaVZI8iKGX4rvr6v/IVP5wlEvFg9p+LrOnj/V1h/ee6PdnJ
	 caZogmiyPb19ZR6vn6V8rKK42pDCN/9I8NudP6a11fmZYdGa8L8a97ThOGeJF077Kb
	 fzKMUU63uXnKpOVyiQFy2dVtpFmNWZ0ffeiAjWBMQ8XBN1UnW8gYW33e+9nfq3+o4C
	 w8b9bLOqNgfnGnGsEFr4Ewev/BLRsdE2LdgB3KhiVoDNeKDuiw/kQ2f+XpHZJqouIZ
	 6+sME6jmSdfqw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 3/4] usb: xhci: Avoid showing errors during surprise removal
Date: Sun,  8 Jun 2025 20:58:03 -0500
Message-ID: <20250609020223.269407-4-superm1@kernel.org>
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
being removed as well.

When that flag is set don't show messages in the cleanup path for
marking the controller dead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/usb/host/xhci-ring.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e038ad3375dc9..997628f8d06e5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1377,12 +1377,15 @@ static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci,
  */
 void xhci_hc_died(struct xhci_hcd *xhci)
 {
+	bool notify;
 	int i, j;
 
 	if (xhci->xhc_state & XHCI_STATE_DYING)
 		return;
 
-	xhci_err(xhci, "xHCI host controller not responding, assume dead\n");
+	notify = !(xhci->xhc_state & XHCI_STATE_REMOVING);
+	if (notify)
+		xhci_err(xhci, "xHCI host controller not responding, assume dead\n");
 	xhci->xhc_state |= XHCI_STATE_DYING;
 
 	xhci_cleanup_command_queue(xhci);
@@ -1396,7 +1399,7 @@ void xhci_hc_died(struct xhci_hcd *xhci)
 	}
 
 	/* inform usb core hc died if PCI remove isn't already handling it */
-	if (!(xhci->xhc_state & XHCI_STATE_REMOVING))
+	if (notify)
 		usb_hc_died(xhci_to_hcd(xhci));
 }
 
-- 
2.43.0


