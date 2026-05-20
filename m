Return-Path: <linux-usb+bounces-37795-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CfKFVm+DWrH2wUAu9opvQ
	(envelope-from <linux-usb+bounces-37795-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 15:59:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BE058F345
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 15:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8872B304676E
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE76B3DA5CF;
	Wed, 20 May 2026 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uy9aekX3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C21F5437;
	Wed, 20 May 2026 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285377; cv=none; b=m84BQHyYnKAF6pRsTx4yhzc0Llt0sKNeKHXg92sRNY6OhCObMn7JjxAbOmpytALMSRIOlfxwTT5hZraGS4ng9QHL2WBayRLe2Ryawkxn2/51NZtiD5Ds5dlp/pzfcLti34PQBHfVKx0iYpoZb4+4zHJPDti6FJQNueZRUfy8D90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285377; c=relaxed/simple;
	bh=rSbKxFjMEZKKYblfqSYzlmb3tbIYkvA+ym76FXRP0po=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S7cArHdDN8jRIPIaOp45XqzIqh4HakG4kQEJ+AvGKONU1Jhe8suM7YV/NhLsAenxi9g1vpH8Nu4CWWNd0w5EY36jBniN/hKToQ5LG313bwWmuoF0tPWEvv35lvdgXSQNjDkJu5e2paS81PBw3iOxJSbx33fjdQFv68gyZ7X+tVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uy9aekX3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A851F000E9;
	Wed, 20 May 2026 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779285376;
	bh=8NvvzJnCXRhB+mYPdvSICHd7eZLL1eV6p7fZb5gWhrk=;
	h=From:To:Cc:Subject:Date;
	b=Uy9aekX3AVTYowuvBErkwwyDVyNQc4Ul6R5M4+NNqnQU41F42axy1lhQySFFfVcUt
	 eEICzfUo0QOrZcyo6QFZp9ElsxJB2j6Z2dMfxrJX4hs1+X3d/Y/H3bv+NChIPgNai4
	 3/fNQze2nkZ0CS4VQ3fvWA0Ctot1QeI6unXcQhdSLhfCkBwnD8nLKXOYrF8V3KBz+m
	 tRRdq6niJef7WeM8Sy1OmqXyWqDu0XEHg4VxMMqj7wfRS4iyt+/14bg68bZ/MMUr0X
	 XaNgXyMPinVpg7sF62zJy4N7Itfz5xXALTz8KBEvYI8Lso3v/j/WekqoAZvx4YGod5
	 POt+w05IP5ZkA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc2: remove WARN in dwc2_hcd_save_data_toggle
Date: Wed, 20 May 2026 21:37:11 +0800
Message-ID: <20260520133711.14410-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37795-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jszhang@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 57BE058F345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The WARN() in dwc2_hcd_save_data_toggle() was introduced in
commit 62943b7dfa35 ("usb: dwc2: host: fix the data toggle error in
full speed descriptor dma"), it looks like the WARN() is to ensure
proper usage of dwc2_hcd_save_data_toggle(): either qtd is provided
for control eps or qh is provided for non-control eps. This check is
good even if there's no such improper usage in current code. But the
WARN() usage in driver is discouraged nowadays: imagine there is an
improper usage, then kernel panic due to warn if 'panic_on_warn' is
enabled.

While emitting the err msg for improper usage is still valueable, so
let's replace the WARN with check and dev_err().

At the same time, it looks a bit strange we check !chan after
dereference of this pointer with
"if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL)".

In fact, when entering the dwc2_hcd_save_data_toggle(), the chan won't
be NULL, because its caller or indirect caller has ensured this,
specifically, it's checked with below line in dwc2_hc_n_intr()

if (!chan) {
    dev_err(hsotg->dev, "## hc_ptr_array for channel is NULL ##\n");
    return;
}

This addresses the following issue reported by klocwork tool:
  - Suspicious dereference of pointer 'chan' before NULL check at
    line 518

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/usb/dwc2/hcd_intr.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
index 5c7538d498dd..f380275ac696 100644
--- a/drivers/usb/dwc2/hcd_intr.c
+++ b/drivers/usb/dwc2/hcd_intr.c
@@ -515,18 +515,20 @@ void dwc2_hcd_save_data_toggle(struct dwc2_hsotg *hsotg,
 	u32 pid = (hctsiz & TSIZ_SC_MC_PID_MASK) >> TSIZ_SC_MC_PID_SHIFT;
 
 	if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL) {
-		if (WARN(!chan || !chan->qh,
-			 "chan->qh must be specified for non-control eps\n"))
+		if (!chan->qh) {
+			dev_err(hsotg->dev, "chan->qh must be specified for non-control eps\n");
 			return;
+		}
 
 		if (pid == TSIZ_SC_MC_PID_DATA0)
 			chan->qh->data_toggle = DWC2_HC_PID_DATA0;
 		else
 			chan->qh->data_toggle = DWC2_HC_PID_DATA1;
 	} else {
-		if (WARN(!qtd,
-			 "qtd must be specified for control eps\n"))
+		if (!qtd) {
+			dev_err(hsotg->dev, "qtd must be specified for control eps\n");
 			return;
+		}
 
 		if (pid == TSIZ_SC_MC_PID_DATA0)
 			qtd->data_toggle = DWC2_HC_PID_DATA0;
-- 
2.53.0


