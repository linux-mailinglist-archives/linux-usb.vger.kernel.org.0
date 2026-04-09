Return-Path: <linux-usb+bounces-36107-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGMIGMu912mdSQgAu9opvQ
	(envelope-from <linux-usb+bounces-36107-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 16:55:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF9C3CC41B
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 16:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DF7E300B54B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 14:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50183BFE3C;
	Thu,  9 Apr 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="l5LQYsCG"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BC7340A51;
	Thu,  9 Apr 2026 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746502; cv=none; b=qTIfnQX3t1yfWyX9emTZdfFcBxLwLrzkWtQ7qazCdiHjlhiOMhI/d2vHh2gWum39cKSXnPLWhtJjUQE4IqGgXm1PhGY8sy+MGJJlhzGtRmheqheZSlQumF3Af7tq56qXWeOe7ZG6URb6QYsgMHpwN8Etd0Wl2O4lmr7otNJvo2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746502; c=relaxed/simple;
	bh=yzwPTE5MKaYHBiB4o7KBwAEHYjGONVQS8lSAdLZQLQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PhEc5rTYnSMbDB96AqvrBwRnoZyXff2vbShyfF2RRSA2Tr2kKA7KIw4KYZMOn6irYbCeWE//GGRTxHaOm7dpWlm/eEClAtlbBZbGG2IdWzi2CQOg7VFsH5o5PByjcgAJX9VI77Icl1CmHI/vi9OG4/LaSQGpAfPwKuEzMxem3nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=l5LQYsCG; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=13
	8VvlJ74lzOymbjmQL1MiEdr+2ViSb0rbhlnL8K0p4=; b=l5LQYsCGIs0TzfCQqK
	rkUNT1+RYjNA68g6gN/FPTicQwJLtoni1NTjyBd3qZQfj1nMILpccEj4MGHa9rVW
	2p9wrolVS3EHRTxUQpoN0sxQtKgbfudhJfXA6Bickg8Dyt3ZiV/MVAITOaHhDDUN
	OeJsXmoTAJxPdNwESNuwyjAIM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3d8KnvddpkrI9BA--.10494S2;
	Thu, 09 Apr 2026 22:54:32 +0800 (CST)
From: Qinghua Zhao <zqh1630@126.com>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Qinghua Zhao <zqh1630@126.com>
Subject: [PATCH] drivers/usb/host: Fix spelling error 'seperate' -> 'separate'
Date: Thu,  9 Apr 2026 22:54:28 +0800
Message-Id: <20260409145428.18130-1-zqh1630@126.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3d8KnvddpkrI9BA--.10494S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyfAr43Gw4xWr47Zw4UCFg_yoW3Jrg_Cr
	y5Wrn7t34DKF909w4aya4SvrWIkwn8urs7ZFsYvw15uw1UZr1UAa4kW3srtasYvF40yr9x
	Crs8XryFy39rZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJpnPJUUUUU==
X-CM-SenderInfo: p2tkilitq6ij2wof0z/xtbBrQjpYGnXvajdVAAA3O
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[126.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[126.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36107-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[126.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linux.intel.com,vger.kernel.org,126.com];
	DKIM_TRACE(0.00)[126.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zqh1630@126.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CAF9C3CC41B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix typo in comment where 'seperate' should be 'separate'.

Signed-off-by: Qinghua Zhao <zqh1630@126.com>
---
 drivers/usb/host/xhci-mvebu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mvebu.c b/drivers/usb/host/xhci-mvebu.c
index 257e4d799..f91c5004f 100644
--- a/drivers/usb/host/xhci-mvebu.c
+++ b/drivers/usb/host/xhci-mvebu.c
@@ -30,7 +30,7 @@ static void xhci_mvebu_mbus_config(void __iomem *base,
 		writel(0, base + USB3_WIN_BASE(win));
 	}
 
-	/* Program each DRAM CS in a seperate window */
+	/* Program each DRAM CS in a separate window */
 	for (win = 0; win < dram->num_cs; win++) {
 		const struct mbus_dram_window *cs = &dram->cs[win];
 
-- 
2.40.1


