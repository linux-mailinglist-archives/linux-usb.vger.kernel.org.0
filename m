Return-Path: <linux-usb+bounces-37660-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPT7JZIDDGojTwUAu9opvQ
	(envelope-from <linux-usb+bounces-37660-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 08:30:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F765781DF
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 08:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22D53154E21
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 06:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD0E384CCC;
	Tue, 19 May 2026 06:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXyG0tyI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD937C906;
	Tue, 19 May 2026 06:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171544; cv=none; b=SjfBSqr/Vm9KQU1nAKHoic5LeGYbGSi1/YP7Rigy3rgpqN9mjWVnWl3DziBOKBe0z4tskcHJKeU6sVV/Ehn1myElwt+e2akHZyFfJclTbYjGLP959OtIF+bPGksn2ZjhNW6gvaGXy3fs9Gbe4vVk8eNkJmAyZB3wKzuMNYhonYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171544; c=relaxed/simple;
	bh=pTfMdLEX3/TgmNGrh43gyxUelcsFohQX9tp8XWAIJf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHpiQFEr86yORCUXAlWnDVH1tzzmpKazxLR0y+9MSu3ZpfFN/9H204E3GPvH64M0e7iQGviUmue3SYd4HU8YsZDx+s7ouLhYZ7/FR8jMMUECqm2znoA8+h31dj7ZAxfg5asyfZJL8GYZnC6WWOzUmPjKhalY8eytMsdP6qikrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXyG0tyI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22709C2BCB3;
	Tue, 19 May 2026 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171544;
	bh=pTfMdLEX3/TgmNGrh43gyxUelcsFohQX9tp8XWAIJf0=;
	h=From:To:Cc:Subject:Date:From;
	b=uXyG0tyIvhm7t+H7XSiz1sk85zrAWCy1+Sj2syW5bUX37uf1kBOAQkVq+Hk63UXZQ
	 wj8qcAE/MrqlZ6Qpt7q+TbroH4Pf0xgWiRdV8yDMrG6ZgZMIkEXjJi6jgpDQ/WQnPA
	 jqA2Ay11ZQsVkcvndXfy2d6c+m78YxcD9fcMg6VKu/ASagNlqC9VbOKkb84te1ZRU6
	 KaRbiWzumVMsrFqVTT8FzLCC/8NHJ3nQ0F5mVXYrOXlHn1qv6MkNU7wQpdMID9DTXN
	 5A/hf/O+vXPKW/ntSsUmv4230qhXkSlvH/X08rbecqIaUKzMQKLtii1NLe8aNwp8cP
	 +/n0n17cDiGxQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc2: remove useless check of !chan
Date: Tue, 19 May 2026 14:00:01 +0800
Message-ID: <20260519060001.13199-1-jszhang@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37660-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jszhang@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 14F765781DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It looks a bit strange we check !chan after dereference of this pointer
with "if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL)".

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

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/usb/dwc2/hcd_intr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
index 5c7538d498dd..397c63393c7f 100644
--- a/drivers/usb/dwc2/hcd_intr.c
+++ b/drivers/usb/dwc2/hcd_intr.c
@@ -515,7 +515,7 @@ void dwc2_hcd_save_data_toggle(struct dwc2_hsotg *hsotg,
 	u32 pid = (hctsiz & TSIZ_SC_MC_PID_MASK) >> TSIZ_SC_MC_PID_SHIFT;
 
 	if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL) {
-		if (WARN(!chan || !chan->qh,
+		if (WARN(!chan->qh,
 			 "chan->qh must be specified for non-control eps\n"))
 			return;
 
-- 
2.53.0


