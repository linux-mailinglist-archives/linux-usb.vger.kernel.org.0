Return-Path: <linux-usb+bounces-36789-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FXuJ6mG82kY4wEAu9opvQ
	(envelope-from <linux-usb+bounces-36789-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:43:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE824A5E5D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCB74302429B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 16:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702BB477E20;
	Thu, 30 Apr 2026 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dYCPvYtv"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25155217F33;
	Thu, 30 Apr 2026 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567229; cv=none; b=I5tzjb/VcK7ldyOT5g5kRO74jYvl5VNs3QmXdNPb2f+OOFIfxhvWYnuG1k+3nghjRXhZqXboxvKF2WqynsH5EcDdMqMUfP6urpwU4iUukHW1mbiMxTA0ct+TE61ruZgWvgrwX3k9u4SgDI840/wxixXTZiHsyemIEhiJJ1SWaeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567229; c=relaxed/simple;
	bh=BPPMxRD2SSp6eDfvsK4p400r4gcT5Cp2ESrsOWEkukw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jG6xrRdTnYm4Q0mkkfs7+t5BwoFHOfFZYEhaZIl5JXOBE9hMsMu7t3lJbWYgSoXChQanbvWgvzp/su66eDNx7Zhf50Bb76KDgv+R0cG/2sUwzAWNIw6f1DOfxFfgeaR/9E63aVEO/leHEsIUHaS7Prq1F0j3ya8sg8UicXR8mO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dYCPvYtv; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8L
	R2nmJ62loXDtxlHutXhsVIE0IN6VZYRDDuR+Lj7rE=; b=dYCPvYtvGlhcQPpKyi
	69+S6+sI3KzxYSFm1SLj0ihlOiYuQkqwdCRnUuYlp7/EyjE/HOEx8xA8LFWix+mJ
	P2vDM+TBBFCwIszaC/SckWPh3hRyIiIZvTDGXw4L64gP+7eZha4lIMwFtEIHTshT
	/D5F6Kiz52GfApUlOjZtE/mTY=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S7;
	Fri, 01 May 2026 00:39:31 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 5/6] usb: xhci-mtk: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:18 +0800
Message-Id: <20260430163919.47372-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnUmm+hfNptZrZCg--.19910S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4rtFyftFyruw15Arb_yoWfXrg_Cr
	95Cr1xJas0kwsxCr4DCF15ArWqkrykXw48ZasFqrW3Ka4Utr1Sqryvkry8tFy3ZF4fGrn5
	GanIgry8Kw4FvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMTmS3UUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7APojGnzhcPaBgAA3L
X-Rspamd-Queue-Id: 3CE824A5E5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[synopsys.com,linuxfoundation.org,linaro.org,intel.com,mediatek.com,gmail.com,collabora.com,google.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-36789-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.988];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,163.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/host/xhci-mtk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 06043c7c3100..d9b865546a67 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -185,9 +185,9 @@ static void xhci_mtk_rxfifo_depth_set(struct xhci_hcd_mtk *mtk)
 		return;
 
 	value = readl(hcd->regs + HSCH_CFG1);
-	value &= ~SCH3_RXFIFO_DEPTH_MASK;
-	value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK,
-			    SCH_FIFO_TO_KB(mtk->rxfifo_depth) - 1);
+	FIELD_MODIFY(SCH3_RXFIFO_DEPTH_MASK, &value,
+		     SCH_FIFO_TO_KB(mtk->rxfifo_depth) - 1);
+
 	writel(value, hcd->regs + HSCH_CFG1);
 }
 
-- 
2.34.1


