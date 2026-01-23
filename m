Return-Path: <linux-usb+bounces-32649-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE/yDpiIc2krxAAAu9opvQ
	(envelope-from <linux-usb+bounces-32649-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:41:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DDF772F9
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EB64300BE1B
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 14:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F742FF151;
	Fri, 23 Jan 2026 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgjMbDwW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5541D328B70;
	Fri, 23 Jan 2026 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179246; cv=none; b=hudSCiZbhX8d9h9ux+mkhQn4efYuC4dOL7CqJVKokKhVI/H/lr5tBiwx5DgCVw/UZj7Ly6bi+xoTilRGSE/M7xGBvrvppP1xm88AndlabGbu2bhLxqGGGbuCVovOLrDVnVT4DqePI6n3pPlcsy8ZNupCQzxKggjRo2/DoIRg5oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179246; c=relaxed/simple;
	bh=qXIAL+NMnUWPsVVSlF8kvbM85s6akqh6vsNXD2HZ/BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mi7+H577+2y9YzYYR6SbeR4WFXBNt6e6pGOQfaa9dcInnSC+AQLKoqhY62X6xYyn0W//rVPX79krfIbAI5I+r8DFqt3v+DQlUdoE7sR6zJNMG+oXmeQvmxsX7frqPLFfHyQzAyVCIEpSXzdZe3dciQ2eXffXNrFxO+MRixKXJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgjMbDwW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E2DC4CEF1;
	Fri, 23 Jan 2026 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769179245;
	bh=qXIAL+NMnUWPsVVSlF8kvbM85s6akqh6vsNXD2HZ/BE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgjMbDwWtzbG9gy4BJLr1VaenCtf/A1vKCwqJkZXBjOYkmYFXhO712nNwgsPARVqe
	 OKlLcGLxmxWME94gf1X/ZMDkV2TSMws5mjvaFhiIOty5p0xJPueYmNWP20Yd7pjv9l
	 HeeO9V27EHbkq938ms2y8/jHjsCxml6QHCWRwDNhJIUORt1lnx2ORYL/uDmQhlXom1
	 4+3KjDg5LGWrFwmEYb8X3A/Ff82nK5ORBFPAQoszPih5NUOFMu9/Sg60hE1xdlvwYd
	 btO02AnZUvplHJB3do2aCsrOrdVx/r2dWewTMXgrHKdzBlEpKsjuryOEPEqJFkJY8J
	 ryXsPxKT4qhAQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: gadget: f_mass_storage: Add a prefix to log messages
Date: Fri, 23 Jan 2026 22:22:20 +0800
Message-ID: <20260123142221.14285-3-jszhang@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32649-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jszhang@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 65DDF772F9
X-Rspamd-Action: no action

Similar as last patch, add a prefix to log messages so that users can
convienently know where's the msg from.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/usb/gadget/function/f_mass_storage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 94d478b6bcd3..d7ae076705c4 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -168,6 +168,8 @@
 /* #define VERBOSE_DEBUG */
 /* #define DUMP_MSGS */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/blkdev.h>
 #include <linux/completion.h>
 #include <linux/dcache.h>
-- 
2.51.0


