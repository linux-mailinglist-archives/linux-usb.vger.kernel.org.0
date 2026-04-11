Return-Path: <linux-usb+bounces-36152-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ1nDOLG2WkGtAgAu9opvQ
	(envelope-from <linux-usb+bounces-36152-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 05:58:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D123DE487
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 05:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A51F2302768A
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 03:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F11A2DCBE3;
	Sat, 11 Apr 2026 03:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jsu1go2A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B42286891
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 03:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775879872; cv=none; b=W711JPdZ1HtFjVqf+YXnmKaeVFFpnB4oJoHLTgOYHfEx9v6lh9yZPtii16burUljSohdvEQiQ/giWX5WJ8Rm05YlJnKMzYtBHVS86YZC4CGmpXERzeyR9gvIskt87N8aGNUKTGfzt5Lq1rSrhA4ZsbMD7Z1xQ8Z9Dq8OgZBaiG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775879872; c=relaxed/simple;
	bh=Uu58r8/wIiXvJnAqLv2l6SozLHrd5sRl1mot2FjDAEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHlD6RBzOrHmaxD7ggtA92oydnOiARJrpK3nUuV7n/xUD2XRHhahxWOu3yD+bHIlB7oj8bpxz5JAdXU4Xhe2C0Y0GQMW89bD6y9e0UeR00sPR6Ulsdrxb06151FhQLNNgCxDN2sXtKvWUSTbx8cE8LYx1aeO1k1ytKGv2yslAd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jsu1go2A; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82ce49785a0so1257742b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 20:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775879870; x=1776484670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwxR3TEzggrqwnYhCtbksF3x2HjY5X8G0vLpnWNk5pY=;
        b=Jsu1go2A2PT8KmRl13UO/C4grpWQ8pAfaAVROhSOsIi1Rd1hajzXq04RtHWXIN6y98
         iqfYf6Phs8bWGpX+m/q482fCTlAo3jU7t7hZfbjSs6QufaWqmoVbJz7eWuhF9yYK00by
         n5DvUOI2fCxyozQlae5pjZAQXmHrrl8dbg+tItHBZvKVZ5Ib/9VCuPZICp164aXcUEj1
         Vy+FD7ZJAIPqZyeea4vM3X24JRf8qhqPDeZfhd8UK/loVWp51PgHRf2htPcvad/1f7nm
         RenZ7l2eFBANUqjfTzEAeWVydX7xen/od4pjxi4EVMGhEy8ctctDw7heKatNx2p7UiKI
         4bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775879870; x=1776484670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwxR3TEzggrqwnYhCtbksF3x2HjY5X8G0vLpnWNk5pY=;
        b=XboP5lTg6QuV/IcBty9MYElmpNVIts9KPhrbGb7nsuzSEbkoiWkwqOYf4qUVD8iruF
         ctkFYVyUXlvWJ5lcy7dqJWwtTqLkGwOCRzbFsJWNZ5rWUoMQLFI9oy/rz/PCLvaGnAdH
         xigSMlP6QgHToKIoap/ZljC1fVNJeEh6hucKjjl1HN5SinCssq8dYFsUNNFfUR5IC9nk
         V0X1/5ICUAwrhC+xnw72PH4+VyJSqZR3AELIBEtWs8JjgwJ9Pgwob4kgbddOA2u0wIyc
         pKR/DSTQ+oo8YrQgK2ubW0YJV3f0ozk6BMMnUdX+eR/RwCM690ry4uGfe/ww2jSpYx2i
         /xmQ==
X-Gm-Message-State: AOJu0YyRhAGcqbzxK2m6veEq2PigmhZGU4Cq9g8PqQgh9mpAjo+o3XP7
	S83FH2DnyTXUEschcYkYytmiVDXK6Cd670Gk5HVDXthFqkZG42OwfIAJfeoDHA==
X-Gm-Gg: AeBDievbWqNs+QbMWNwJs1cwoal9QRP/fIm0iyNI5NhY4grRtYapUu9HUIR0MkXh7vK
	yK+jZmeSbMxJ0wHzRvC9LcaYmyf32jIkpevj2cU6BY9+9u/0x2eQcCXGhQ3LNiYyB/DUydMdOKi
	Ban9QdolUkgFeDRrbH8MvpEN5IjiW4994ZtD6Iek0xgdGrwiEa3nTHYwKURvCkLwaUNU8UoKhqB
	JX/OIROsq00fE2CveRXkEWUCWSZXvGHSbpDAr1eLhE5HYmQiqTx08/xdlBUCWnb7oKOh8OCoD5n
	s+d2F0JxJh7FOhxKEbTHyTdLhZECzpmSqOXDofPqtJMU3da5V8QMy/i7tcR29ievcf8cxoU6ysJ
	IPnl7gT+eMIch+u0urhokJseqkw/O3TTqAkaKaaeiBOBmPS0qCnLUqV3QLbwqeP6X6fR+/umFFB
	noJ+e4pTKMmGIDNK7SWBxdgwe7NBMJBW9ZZvuX4NtE519oCQ885oIjY8I=
X-Received: by 2002:a05:6a20:3d12:b0:39c:bf48:11db with SMTP id adf61e73a8af0-39fe3f3d83cmr6340981637.38.1775879869733;
        Fri, 10 Apr 2026 20:57:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216fff97sm3986596a12.7.2026.04.10.20.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 20:57:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: mtu3: allocate phys with ssusb
Date: Fri, 10 Apr 2026 20:57:31 -0700
Message-ID: <20260411035731.163580-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36152-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 89D123DE487
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member to combine allocations. Allows removal of a
pointless branch. A size of 0 means phys are not allocated.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/mtu3/mtu3.h      |  2 +-
 drivers/usb/mtu3/mtu3_plat.c | 18 ++++++------------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..d71849388602 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -252,7 +252,6 @@ struct ssusb_mtk {
 	struct mtu3 *u3d;
 	void __iomem *mac_base;
 	void __iomem *ippc_base;
-	struct phy **phys;
 	int num_phys;
 	int wakeup_irq;
 	/* common power & clock */
@@ -272,6 +271,7 @@ struct ssusb_mtk {
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
+	struct phy *phys[] __counted_by(num_phys);
 };
 
 /**
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index cc8a864dbd63..11a919fc3d47 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -240,17 +240,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	if (ret)
 		return ret;
 
-	ssusb->num_phys = of_count_phandle_with_args(node,
-			"phys", "#phy-cells");
-	if (ssusb->num_phys > 0) {
-		ssusb->phys = devm_kcalloc(dev, ssusb->num_phys,
-					sizeof(*ssusb->phys), GFP_KERNEL);
-		if (!ssusb->phys)
-			return -ENOMEM;
-	} else {
-		ssusb->num_phys = 0;
-	}
-
 	for (i = 0; i < ssusb->num_phys; i++) {
 		ssusb->phys[i] = devm_of_phy_get_by_index(dev, node, i);
 		if (IS_ERR(ssusb->phys[i])) {
@@ -330,12 +319,17 @@ static int mtu3_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ssusb_mtk *ssusb;
 	int ret = -ENOMEM;
+	int num_phys;
 
+	num_phys = of_count_phandle_with_args(dev->of_node,
+			"phys", "#phy-cells");
 	/* all elements are set to ZERO as default value */
-	ssusb = devm_kzalloc(dev, sizeof(*ssusb), GFP_KERNEL);
+	ssusb = devm_kzalloc(dev, struct_size(ssusb, phys, num_phys), GFP_KERNEL);
 	if (!ssusb)
 		return -ENOMEM;
 
+	ssusb->num_phys = num_phys;
+
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "No suitable DMA config available\n");
-- 
2.53.0


