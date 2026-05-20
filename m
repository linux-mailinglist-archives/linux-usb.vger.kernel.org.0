Return-Path: <linux-usb+bounces-37750-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDmAFslLDWoEvwUAu9opvQ
	(envelope-from <linux-usb+bounces-37750-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 07:51:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3767587E5A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 07:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CC293041873
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 05:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679DE322768;
	Wed, 20 May 2026 05:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FBi/szF0"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA307367B9C
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 05:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256254; cv=none; b=m7kQjTKQVHHQVglNrcJ/5aiEe6Auc/bSEPD0cVKKwGKtHA1KF68t0MpeuM8vsOCCSfW7cJPZlBxbkc2A3TRb+7kOLuuTOxaOh/DTuIYwrtdCe/l9OwKFXAjo4yVsRRKp1xQ+1msqVrbqzFZhNP1qvWHSnhd1RQk27759CozW0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256254; c=relaxed/simple;
	bh=34zoeXYOQMAyz0sUm+wTvo9m/RGNFZNFta+kssNuHyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j2ers6M9XfbxrxCHwOfDgzxBjPLsZejGc/TV7QhCHsS2VvgBXCrLhI/L+Oi3vVJK/hZ9kAn6AMHtk41DUJmfERk4mEe+1MG4I+F4PMJ0R31vVs5dedxQ41FRAhwyHxdhFqnNuhIYwP/NztBbOComkO0hYp4FBhNXhMH5+qS4/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FBi/szF0; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Up
	dldvFTk6SpbygcKlhzXEyvZXB46w/pbf1wxNPRjCo=; b=FBi/szF06UbjdU5ozh
	YW27xd3Dm4oL85NbtpJLwaMe3tv7qOjIkLYeURY4wfICdnmAIYQwZUS2tg664D18
	YUMCOFaQBM6bR6TjZK/P0v3/mMOROd8FishrgjnNEQfU/zOzr8oy9LBq3qn0KaRM
	CC+qjDBW5l7u1qB0hki+39xeA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDX35KhSw1qOsK3CQ--.4561S2;
	Wed, 20 May 2026 13:50:25 +0800 (CST)
From: Shuping Bu <bushuping007@163.com>
To: Thinh.Nguyen@synopsys.com
Cc: GregKH@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Shuping Bu <bushuping007@163.com>
Subject: [PATCH] usb: dwc3: core: Fix incorrect kernel-doc comment for dwc3_alloc_event_buffers
Date: Wed, 20 May 2026 13:50:23 +0800
Message-Id: <20260520055023.2415635-1-bushuping007@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX35KhSw1qOsK3CQ--.4561S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4DJF1Duw15WFWUtry8Grg_yoWDJwcEk3
	4vgrZ7u398JrW7tryjyayaqry29w45Zw109F1qqrW5JFWayw4Fvwn2grW5J3y7AFsrJr1q
	9r4vqF48uw42gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_g4S5UUUUU==
X-CM-SenderInfo: xexvx3pslqwiiqx6il2tof0z/xtbC0gLYjWoNS6JVOwAA3l
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37750-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,163.com];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[bushuping007@163.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C3767587E5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kernel-doc comment for dwc3_alloc_event_buffers states that the
function "Allocates @num event buffers", but the function does not have
a @num parameter and only allocates a single event buffer.

Remove the misleading "@num" reference from the brief description to
accurately reflect the function's behavior.

Signed-off-by: Shuping Bu <bushuping007@163.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 65213896de99..a2587f9f0bb8 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -525,7 +525,7 @@ static void dwc3_free_event_buffers(struct dwc3 *dwc)
 }
 
 /**
- * dwc3_alloc_event_buffers - Allocates @num event buffers of size @length
+ * dwc3_alloc_event_buffers - Allocate one event buffer of size @length
  * @dwc: pointer to our controller context structure
  * @length: size of event buffer
  *
-- 
2.25.1


