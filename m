Return-Path: <linux-usb+bounces-36151-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e8lxLGXE2WnFswgAu9opvQ
	(envelope-from <linux-usb+bounces-36151-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 05:47:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4864A3DE441
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 05:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18D42300FA25
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 03:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6452D97BB;
	Sat, 11 Apr 2026 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAuQ4R+h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE321E091
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 03:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775879258; cv=none; b=m/Z1zQUIOBHd/yk/fy1mciteJWNaw0UjOi5cU5cKVDZ67I58YZ8RWeZQK27qmyJk5INyAQJvaF/cbibzq2wI1DUPKYeqbh1FKqv8VF/YT/y4/BeIqrjn3RB0arJVmpnneGm0zXFwHIy58CuetrS4O+B2EBfJKdIjxi+cXhIkmus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775879258; c=relaxed/simple;
	bh=tR1X5bTvGMCjFYa5yAHh3yNIfn6edk4tK53EiK4iKFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BhQcbgdwxhJNfi2PcwNHGJ4jMeGAkNEdbrqp/XbkvA4lW+HDLSogENn9Bymnrxbq4v7oOF6oPxL/E8kPifYPus+eyRlPIrMkVpd9sBf6/WBp34HDDpMf9MGAYBCR5Axy+JPQmzOiAPNCwHI+MeO0vEBSBDnjLXI9dk3n9Uy5W6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAuQ4R+h; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a58057d7baso30511216d6.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775879256; x=1776484056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GTrg3tEJ6M09HWK3Sh9RrgU4ykgP07OdBKz3FVnDC70=;
        b=rAuQ4R+hBVXNUYXwLV3egXNAwgQgy5f5tFh89hh2Gc/mb4TPA+2ntCDx9IXSt/axIk
         gU07B1uiRF5/MGeFHZ7pyl7V9Uc8ArBil7T5EW2dGfPiCCqL6BrR1deX8Lj1iCiIwmDT
         Ipv8kyPcbrKxT2jO6v3oLDGugw9YMWPlMwawvBEeKmb7wvHd1Jp/QTqKzs1HQSAnKRdu
         D0jA3Nsic9wsUjgYWTMgBl0yU/yk3P3c8b1EfTmSS0xIDRpdINHZJC98W4SFxDmOphvI
         xud+fiOE0KWi2spx3AM7ca9xzzRKTlKfj7Nyk6OYBz5dydto2ZMEQ7wtuBTT2ssDSfql
         J1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775879256; x=1776484056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTrg3tEJ6M09HWK3Sh9RrgU4ykgP07OdBKz3FVnDC70=;
        b=LlT41qEnv2xV0lakkEiTGUcoe6cbeJb8QROBdiwuSzylFOfPLDA1XAIFW4iZkByLu7
         CHIatdP2l3Kmuz1SBVoh+8W9Sg2UWoeYm0xktZAlwUWOof4+5ghUJxvCQ1eqx5RGLaPH
         78uXc1U7AMu+BES0o2OBMW2Q/yAuy929erJgaJLIijSA7wkHwARPLq32pwskKlCTcBjV
         QHz0pQs/rdO9bmbzfALcSEwhlFlHKMAL9IKc/6HvZxFARlHOXWAXWuxUDwDb66m/kpaT
         xQt28w9J1i1I/jaR+G/aT1UTvBTOJa/nlgOQCuBcyPLsMF83YGEoUzQfyb6BFC4iIKOB
         /KQA==
X-Gm-Message-State: AOJu0Yw4M7td2PQCwb8FkiV5SbzZ9K3jv/3x0UItt/NsJEBxv1Yr6yi1
	Ja2ywFyaCKxt+/Dwc69gEKsBMmNaghMNg/SLSN88SOnnz2zIfMBKJz++y3cPHw==
X-Gm-Gg: AeBDievchdKGS/bU8s/cKnGFn3mzQQpIzy/57o2X33XfQ3OVdJdrn1VZ04Cd/k8aeEa
	TtxSiBDQU7SbY1gnfraq2FXHGb28tlXC7SkgbA4K3RDZUWP8WE607gbk3sC/BgiO5TBcdZJurMi
	BOstI0A4zgWoFU9IAIj5japwE6tlgTp9puZ56yggiEyqpBTPmSjq0ablP+KilD5gre9BD1LRuj2
	PCDleStMDoN3CbZdHNH3930S5kV9IMY1yMNyj9Vu5pjeBmVvVjXGDoVHa7lZdM6a9D4UqEjvlND
	vc50+umf/mXfIJ3+EZIXDP4o5GHyBtLJeZ+5sU5uTW7y+jzbe1JrxVH96f6ajZwzFxLaq/gEhCk
	T/j5zdHQTsIlLshUfpxbspslJ1iCLCZY2loiEZlRRjuX4uBBFgbGmwwilyXLQpLMgGr7aSg3oK/
	pPyCM/+n7LZws+QoGE0MQPWrq+uToZaFb+JQiooWCBJyreJu9lJES1f10=
X-Received: by 2002:a05:6214:590a:b0:8a0:f8b7:3921 with SMTP id 6a1803df08f44-8ac862b616fmr101986536d6.41.1775879255892;
        Fri, 10 Apr 2026 20:47:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84a10e7esm39355356d6.16.2026.04.10.20.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 20:47:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: dwc3: qcom: allocate clks with main struct
Date: Fri, 10 Apr 2026 20:47:19 -0700
Message-ID: <20260411034719.161736-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36151-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4864A3DE441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member to combine allocations.

Add __counted_by for extra runtime analysis.

Change dwc3_qcom_clk_init to a single parameter. No need to pass count
separately now.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/dwc3/dwc3-qcom-legacy.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom-legacy.c b/drivers/usb/dwc3/dwc3-qcom-legacy.c
index d3fad0fcfdac..565d03eb01b8 100644
--- a/drivers/usb/dwc3/dwc3-qcom-legacy.c
+++ b/drivers/usb/dwc3/dwc3-qcom-legacy.c
@@ -74,7 +74,6 @@ struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
 	struct platform_device	*dwc3;
-	struct clk		**clks;
 	int			num_clocks;
 	struct reset_control	*resets;
 	struct dwc3_qcom_port	ports[DWC3_QCOM_MAX_PORTS];
@@ -90,6 +89,7 @@ struct dwc3_qcom {
 	bool			pm_suspended;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
+	struct clk		*clks[] __counted_by(num_clocks);
 };
 
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
@@ -653,10 +653,11 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	return 0;
 }
 
-static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
+static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom)
 {
 	struct device		*dev = qcom->dev;
 	struct device_node	*np = dev->of_node;
+	int			count = qcom->num_clocks;
 	int			i;
 
 	if (!np || !count)
@@ -665,13 +666,6 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	if (count < 0)
 		return count;
 
-	qcom->num_clocks = count;
-
-	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
-				  sizeof(struct clk *), GFP_KERNEL);
-	if (!qcom->clks)
-		return -ENOMEM;
-
 	for (i = 0; i < qcom->num_clocks; i++) {
 		struct clk	*clk;
 		int		ret;
@@ -736,13 +730,18 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
 	int			ret, i;
+	int			num_clocks;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
 
-	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
+	num_clocks = of_clk_get_parent_count(np);
+	qcom = devm_kzalloc(&pdev->dev, struct_size(qcom, clks, num_clocks),
+			GFP_KERNEL);
 	if (!qcom)
 		return -ENOMEM;
 
+	qcom->num_clocks = num_clocks;
+
 	platform_set_drvdata(pdev, qcom);
 	qcom->dev = &pdev->dev;
 
@@ -766,7 +765,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto reset_assert;
 	}
 
-	ret = dwc3_qcom_clk_init(qcom, of_clk_get_parent_count(np));
+	ret = dwc3_qcom_clk_init(qcom);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to get clocks\n");
 		goto reset_assert;
-- 
2.53.0


