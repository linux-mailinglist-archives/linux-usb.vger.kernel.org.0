Return-Path: <linux-usb+bounces-32648-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEO5EYOIc2krxAAAu9opvQ
	(envelope-from <linux-usb+bounces-32648-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:41:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7349772F1
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D91D301FA91
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 14:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6C0321F5F;
	Fri, 23 Jan 2026 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+OQqKTE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C7B3161B7;
	Fri, 23 Jan 2026 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179244; cv=none; b=BEaO+k/VQ8gBlUq3d8A2Rk771kQednCN8NjJx4VZqzRhaXJyrdKvDy9ON8leZCXdFOji8uDe+AXL99LqC9B11CSQw1K+FmbYbMExPz7Dq++E8kWGqZ05h9OuEnnpqoqTWnc3xaXvfWJcMhR8o3quic0XXpOjui8WJdyzefCr0mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179244; c=relaxed/simple;
	bh=R2CAiDfcDP3Eo61qh/HUCedZo29HtW7cEMWCjEHbQKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezqi+m72WL64kxdI8JITGURCvBoApBcrhTlKBQWbAnGBPSl17xkTxI430Bmj0A1wmiCmEGgNBH7UVx8fJslj3Mp7Gsw9uA//qlSuUvU7mL0GN87YaC81FXcpsx5d8QqPY9VnBBX9R/fU4txegrJlEuKVFNj9di6dM/lous9cAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+OQqKTE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C988C19421;
	Fri, 23 Jan 2026 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769179244;
	bh=R2CAiDfcDP3Eo61qh/HUCedZo29HtW7cEMWCjEHbQKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+OQqKTETREMXZ6UYfihncl40OaEA9QXJSvbzBJyrbtFkdAnt8mWyG4o6TCbIahib
	 Vgru5jGBKbJRpQwRRgBPwsP1AhVDuV8wmTiEG3edViO7UK6pOLvuePDEwYhjFGztjh
	 fh+TEdJl1/PPi7D/YR2f7O7cUfS9HcWo6t+KddvfKiyMlT21iJTgdOK2KJ4gR+Q+Hw
	 gqSiZf4C+t8JQ5jSThZc1oRRpuubZHsn8U2T3a+yDu22qne9ww9UN9kTjSPXu4yhHr
	 p6nG+qGIHgglM3outB3AtACLUUW4KiVZvMDMDrbY74URcAXG3+VK8sqheSivsi+nb3
	 PuI5fEzZjkyuw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: gadget: f_fs: Add a prefix to log messages
Date: Fri, 23 Jan 2026 22:22:19 +0800
Message-ID: <20260123142221.14285-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123142221.14285-1-jszhang@kernel.org>
References: <20260123142221.14285-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32648-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jszhang@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7349772F1
X-Rspamd-Action: no action

I met some log as below:
[  581.262476] read descriptors
[  581.265558] bcdVersion must be 0x0100, stored in Little Endian order...

To be honest, if I'm not familiar with the usb gadget framework, I dunno
which component is complaining. Add a prefix to log messages, so the
above messages will look like:

[  581.262476] usb_f_fs: read descriptors
[  581.265558] usb_f_fs: bcdVersion must be 0x0100, stored in Little Endian order...

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/usb/gadget/function/f_fs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 05c6750702b6..97c7f0052327 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -14,6 +14,8 @@
 /* #define DEBUG */
 /* #define VERBOSE_DEBUG */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/blkdev.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence.h>
-- 
2.51.0


