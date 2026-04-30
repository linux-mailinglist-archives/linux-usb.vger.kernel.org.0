Return-Path: <linux-usb+bounces-36792-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJiOIFCH82kY4wEAu9opvQ
	(envelope-from <linux-usb+bounces-36792-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:46:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F64A5F08
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A3CC30CB1C8
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 16:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDB347A0B5;
	Thu, 30 Apr 2026 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="O+xAUzPs"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DBF32BF4B;
	Thu, 30 Apr 2026 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567238; cv=none; b=EsN+l6V946OOzJsRt4EwJwXWPTbWc38ieVTi4qik2u37aLVsuFco2WTxjfFFfCfzGqR1n8KgUNPrn1lngPQwMs04gLMCGDwtRD7AvVO54+p9y5tYsY7BbzsUpfSTekCo/GL0/4MJFWOfn0GhRBtC4rolhOjMpcHmb0KzSHFWt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567238; c=relaxed/simple;
	bh=HOK2E82bYiFCp2M7RC7/7SO+QWrc4znNEYJzpgMaGMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QYjG4JtMZePn27aoisCJTwCAEbz75gEDo3C3o6aDoERoymQJC9qWnsKD/Au7INZTKHmPREH48NQtOKt1qoLfKDwz+OuJaqgQgdl+sqMtaYZebTSOZpHypbaLl8KnlajaGFpS9eHOiyamnBtUblMmou/jFPLZDRXzaI3O3hw1FLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=O+xAUzPs; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Oq
	h8i/elFvAb7pieKkMXZjCnLslrNZI7sqbGtv3hqdU=; b=O+xAUzPs/HDqUs+ikB
	G7hjOUUaYIL9PKznoKTNCYL5WTzIrgt5QOApfGz4JuT8sC3sSOQ2qXcuRZf9z1kG
	wq8gV3ShKjLYMoXRxAYb6wQqSHAgqXbMoozitRj+0Bd4DfaN1qjczAsKe4UJ+CkO
	G5Q5TraabNFT57OsF9RwU7nro=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S6;
	Fri, 01 May 2026 00:39:30 +0800 (CST)
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
Subject: [PATCH 4/6] usb: xhci: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:17 +0800
Message-Id: <20260430163919.47372-5-18255117159@163.com>
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
X-CM-TRANSID:_____wDnUmm+hfNptZrZCg--.19910S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4rtFyftFy7Xr1fWFg_yoWDGrXEyF
	y5uw4fJ34kKr1YkF18ur97tr9Ykr95Xws5ZF1qgr1fWr18JFyxXwn7Xrn0qa45CFs7JrZ3
	A3ykWry8ZF4vyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMfQRPUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wLojGnzhcLQVwAA3X
X-Rspamd-Queue-Id: D26F64A5F08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-36792-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,163.com];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/host/xhci-hub.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index bacd0ddd0d09..3830d4123961 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -226,9 +226,8 @@ static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
 					   USB_SSP_SUBLINK_SPEED_ST_SYM_RX);
 			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
 
-			attr &= ~USB_SSP_SUBLINK_SPEED_ST;
-			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
-					   USB_SSP_SUBLINK_SPEED_ST_SYM_TX);
+			FIELD_MODIFY(USB_SSP_SUBLINK_SPEED_ST, &attr,
+				     USB_SSP_SUBLINK_SPEED_ST_SYM_TX);
 			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
 			break;
 		case PLT_ASYM_RX:
-- 
2.34.1


