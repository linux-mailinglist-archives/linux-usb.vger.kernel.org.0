Return-Path: <linux-usb+bounces-36153-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG4hHGLK2WlqtAgAu9opvQ
	(envelope-from <linux-usb+bounces-36153-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 06:13:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 144563DE4EA
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 06:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3014302457B
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 04:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846B02E0914;
	Sat, 11 Apr 2026 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GouuZMGH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D4421E091
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 04:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775880792; cv=none; b=cdiDMpb0IR03avlZWWP/Q9sKpx5Adnmdkmkb8wv083tNkC72kIOcxqJb/4mg3eTejvNBMpvBK2d2uyXNFxWJl9QJDEY0BwFHlfa8Qu3G33hjnvyO7HHX6vi6hD2UlpsPqxz2z9VFFIwlst2MlTcSwTgNheUlsIS9zvipKFGs6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775880792; c=relaxed/simple;
	bh=/9YbK/4p7k0dCS+xImCu5bILIgLPbfTY9eo105YUH80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DN9TkLGIaa2W2V+RppJuDZDLYLVwMLcfGDrYMEtRP9Tsk2eqf7NkByH8ZRlXVdxV3x/pFgwsINm1K9efq4jDYkR6pCA6cIl/Bqu6cGI/HmaGWN+nOPRKSlehVFWHTz+t/8um4NN5VdtiFpV8R9QOLC/6BlvvEj+KwqkBJXQsJuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GouuZMGH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso13130445ad.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775880790; x=1776485590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rb4KLPpojEy3CtRqR7RKIVuXI1C4jejvtMhj2fQsK0=;
        b=GouuZMGHEnz3Qv+Bo9UmsKdEFPBlQMXmykJ/4uuGLGAr7baUJ1lEhKPwi5190oABFj
         LOWhmz5qONPYYB1y35N/pdOH28CI7uPC3DGPTrtaJsa3NdHRG658JtEpOUlpe5Z7brN0
         CF1fPyOHkEbwi9hK3+4xIyttBTLH6boCf4S9YI3reTDQOHDHHOfgDBoVy3FDlDazCyKT
         b1od7NB/D45BTjfEbDgACwXeQPOa/uJ2BF36YKOtmU/pfDOy/Y11HyL9A+guymhOXOax
         o2uZj70sJsEhcvWo8CjtzPmMiJYwqPX3GZ9hOFzedxkMMrI4Qt+Bkp5DRl6zLp4LzTtP
         FvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775880790; x=1776485590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rb4KLPpojEy3CtRqR7RKIVuXI1C4jejvtMhj2fQsK0=;
        b=isFza9mIlfkKfKS+qtgopVr3IIEcX8xzy4/z3lb3G+qGwbwR7kSXKe2h6Gb46LW5GP
         oai7qWqAWX4YzCHCFS11NHuopmc4o+FrLjgoMVuWUF9ve7SidDWij/ipJiLrylvYT9cQ
         geNeFnako/ohIz6jfZ1SjBm2j7ZzbhCphGm/pmZthdIWDz9QD1s1kf0cO5cfWOg5FB+B
         MfqqwBamVFdaCTqQK9Dtf0+g1W98npRbVmuu6SJnNwP7GEmbQ8HOtYwsBliBiFWEbZsl
         WBRJYuHc8vuZs/DvLmSujHMWpGBIiwD8QPx+eTxfQYs8Wkrzzf8ZD/hjvV+KKydaJHg5
         1Z7g==
X-Gm-Message-State: AOJu0YyzPL3+EQCHlLyvC4xlY5DuLT8hWkqkmt9eAp4Pmdm9skAhXlgl
	ADF7FxMkMj0T9y1fsZywJ4TRvPiL0qpU+Lj6/xA6FJiV/WYLpfReBDcPewwOGQ==
X-Gm-Gg: AeBDieuNlrBiawH0i/DUYaVHmFQBVv5/Yg9aYJnfC8zj9Cj7sVKyRLprtQGnHCBi7LI
	jlkWX5vKb4i4PW/B5bpxdjUJ/BYtSEcKPP11SrazK+2TKRuf138WxPPMYf8dQPh4bLalxhb45iv
	0InngzoQb45q53wADBqeM9bmJH+jekL7Y56Ra675mYePOsynnH+981ZZwAwDOYmqqZapbh9IgM2
	OVlOh8o0cLwB8GXE6eFWLk7TVf6vlTWwrFm9xV2R2You/DerMit61FibM9IcZISY7bgVJrGgunk
	9/4pzFnQUgV01cAUmG6HLSFK7/xgBUNLcB/gvtLv08txflCJXwt1baBMp03c0A7biZx8dPrbBxG
	8b++j9O9qAoGWfPQ+8qVSzFTMFZnOpu7ZLefPs096CgVjsGM20VNdv/CTf3BA8Ee8SH2rAJ37mE
	oc88LtfbRDS5SpQLffVzHQkB94Y30ZtAjjL6eypA7BdKAPLDSD4gLw7wSLDpl1Hku43Q==
X-Received: by 2002:a17:902:cf11:b0:2b0:beb4:3bb with SMTP id d9443c01a7336-2b2d593bd65mr61241285ad.10.1775880789965;
        Fri, 10 Apr 2026 21:13:09 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e036f3sm48523235ad.31.2026.04.10.21.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 21:13:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Justin Chen <justin.chen@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: bdc: allocate phys with main struct
Date: Fri, 10 Apr 2026 21:12:52 -0700
Message-ID: <20260411041252.166816-1-rosenp@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36153-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 144563DE4EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member to combine allocations and simplify code
slightly. No need for a branch deciding whether to allocate or not.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc.h      |  2 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c | 20 +++++++-------------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 2f4abf6f8f77..cc961161eb46 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -409,7 +409,6 @@ struct bdc {
 	spinlock_t	lock;
 
 	/* generic phy */
-	struct phy      **phys;
 	int num_phys;
 	/* num of endpoints for a particular instantiation of IP */
 	unsigned int num_eps;
@@ -453,6 +452,7 @@ struct bdc {
 	 */
 	struct delayed_work	func_wake_notify;
 	struct clk		*clk;
+	struct phy		*phys[] __counted_by(num_phys);
 };
 
 static inline u32 bdc_readl(void __iomem *base, u32 offset)
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 438201dc96ca..4b16b85da450 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -487,14 +487,20 @@ static int bdc_probe(struct platform_device *pdev)
 	int irq;
 	u32 temp;
 	struct device *dev = &pdev->dev;
+	int num_phys;
 	int phy_num;
 
 	dev_dbg(dev, "%s()\n", __func__);
 
-	bdc = devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
+	num_phys = of_count_phandle_with_args(dev->of_node,
+						"phys", "#phy-cells");
+	bdc = devm_kzalloc(dev, struct_size(bdc, phys, num_phys), GFP_KERNEL);
 	if (!bdc)
 		return -ENOMEM;
 
+	bdc->num_phys = num_phys;
+	dev_info(dev, "Using %d phy(s)\n", bdc->num_phys);
+
 	bdc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdc->regs))
 		return PTR_ERR(bdc->regs);
@@ -508,18 +514,6 @@ static int bdc_probe(struct platform_device *pdev)
 	bdc->dev = dev;
 	dev_dbg(dev, "bdc->regs: %p irq=%d\n", bdc->regs, bdc->irq);
 
-	bdc->num_phys = of_count_phandle_with_args(dev->of_node,
-						"phys", "#phy-cells");
-	if (bdc->num_phys > 0) {
-		bdc->phys = devm_kcalloc(dev, bdc->num_phys,
-					sizeof(struct phy *), GFP_KERNEL);
-		if (!bdc->phys)
-			return -ENOMEM;
-	} else {
-		bdc->num_phys = 0;
-	}
-	dev_info(dev, "Using %d phy(s)\n", bdc->num_phys);
-
 	for (phy_num = 0; phy_num < bdc->num_phys; phy_num++) {
 		bdc->phys[phy_num] = devm_of_phy_get_by_index(
 			dev, dev->of_node, phy_num);
-- 
2.53.0


