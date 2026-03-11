Return-Path: <linux-usb+bounces-34627-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLmHOJv5sWl3HgAAu9opvQ
	(envelope-from <linux-usb+bounces-34627-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:24:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A395F26B598
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1200B302A3A8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91FE3A5451;
	Wed, 11 Mar 2026 23:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVHIAo0O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B88391832
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 23:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271448; cv=none; b=cOAK1IHwFAA1ttCmInlQch4kkjEpwiVuygabL3QcfSGobFWCB3iTFqhmQmtMwR/eSE5u+dP8pol6QC+6kUBs+8T+fTjdt791SB2WKrkWrcWJ8er5xg/idX5HMrbwxBS6lQoknDeNrfPfAmCKQsSkf42/e14YfprsN0l6ws9cyX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271448; c=relaxed/simple;
	bh=5x6P8nJwDE2dMBktvCxCL7MxySCiJKpx1mSlB5k2l7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Osa4uTiIbx0I4OQkgZ8lSVkHVT2YtbUeqyuFRNzfkKVwTkBdnWcA1azDWN5E7Hip5U27sMAD0IRpmjh5hneGfvuO7bED7q1b20agDhTARFxhaOc0HcYU5382fd7bQK9U9N/7p5at+Fu9MVJt8z4GZ1+AFdQp5EYFkVIQA7GyyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVHIAo0O; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c738aa3cbbcso245411a12.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271446; x=1773876246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KKV6gzPWKf+kdTy1HFMh1iXAwf/N5tjFhknniuMmlF8=;
        b=FVHIAo0OTs0xVexbwy8CQFqCNz43JIoI8zD5/kMBuvUv/Qtx6KDiuyccMFCsOObpLR
         lOdbab3AV0RzpzOhjtEb3coKW2qnXwLNeGfdfybix5L7itKGndSKgEZVqMLqF3LyhKYr
         2EzPsB9to0k/DRdt9dwYEL1uSRSyLHYJrHpewDJVrfIaVtaMBYQg4yBo9XW8rEgY+Vsp
         EnZV4HYG/O2bTlHbbzeFZa3qK9w6GljdVKpWTe+8UTSJrqm+KlDIftMQeCbFPS57ag3p
         MKEDDP+lS5AM3rUpoY10oLWXLW/tpjK7af5E4Vdsgt7SQIVdpyF466IjaXCRsJaoOjxk
         yV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271446; x=1773876246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKV6gzPWKf+kdTy1HFMh1iXAwf/N5tjFhknniuMmlF8=;
        b=Ra8YqRy2qe3ktqJu0/oOjitWmhRKh0K59yM4XUZQhqu69id7aLoZ9uIOYBxxHpp+NK
         0K1M4XtlUm7slwdDLxM7HfwWNFu4S0Vso+lWz0ByZR3YHU9nir4m+1xl+J/nZlzrouNd
         o3x7vtOYtEK8U4jGzKchRXWnbWTeheNepUgpHn5cdwjGAFkgkAxWkKDgLbbEXAS82rPh
         yfiPswQnqpi+J8xLzcQ6IPsEXvy127ri5BItUVIY4POPDqCqGSOs9zLH7mSBwBmJOGYL
         TtEG/a7PJaKLLZxJnp1BypeavlO8I1dfORi29cUOGpFhbTFlc/fTBnIFdDFMd1v3IjEZ
         mGjw==
X-Gm-Message-State: AOJu0YyRd4ofslKo2viB39CrCWYYGagfZBfKl33v7m5sRLPjQRHYRdKg
	HVp57h8xensE048/AsT15fGuEpCwwsLGsPJKd3AyzD3HowmQSp7KtiBDhn83AqPf
X-Gm-Gg: ATEYQzxIh4D3qHM/1q7sGWPfN0XrsK7D5aRTaWcaEsvV6uffY+eiZ5sddEA+bEJt3Ug
	6XuNs/SmFsWfowX1VOTyvN8mrMzYe2Bscn2DdwmaNsuV17x9hRdTdJsyk4yFA7bCabHyPbv/EJY
	kzodKvdQv8pvQMMGZZKq7IFt0vRWFPlfCWUMwOa69mxxAkesYjk+F73beIJU1RzzgpdXbYIbYLW
	t4Bvaiba9KyJR+lUWL3Q06xAaFm8uSVAC2Mu20J8D/DyGxfq31395pdRo+WedTrS6/pkMuOhVxk
	3ULdFrfBKOH5522J8S2zfLg4qrgrt5rf/TRXlEOSDLc5y4W/X5w/H5hgaUtqd3iGUMt44BOjsOU
	YqG5bFzaz1AfcfG2/lP/GKgXYXRkW8ckBlJF0vrNkMfJy97MDa1duWxW+rJ2SefB4mpR1n1iunA
	ja5ekNYBPqFNT0i1VDPH7OZ1Qn2giuOz0JyjGqZxY6X82MklNjuVZ6tFPYVgqGtb87
X-Received: by 2002:a05:6300:6705:b0:398:7667:b2e5 with SMTP id adf61e73a8af0-398c6178160mr3760195637.68.1773271446144;
        Wed, 11 Mar 2026 16:24:06 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072603c0sm755037b3a.22.2026.03.11.16.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:24:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM TYPEC PORT MANAGER DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] usb: typec: qcom-pmic-typec: simplify allocation
Date: Wed, 11 Mar 2026 16:23:47 -0700
Message-ID: <20260311232347.18257-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34627-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A395F26B598
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Change kzalloc + kcalloc to just kzalloc with a flexible array member.

Add __counted_by for extra runtime analysis when requested.

Move counting assignment immediately after allocation as required by
__counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: reduce chaanges only to needed ones.
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 23 ++++++++-----------
 .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 22 ++++++++----------
 2 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index c8b1463e6e8b..a1d9315994de 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -95,13 +95,13 @@ struct pmic_typec_pdphy {
 	struct regmap			*regmap;
 	u32				base;

-	unsigned int			nr_irqs;
-	struct pmic_typec_pdphy_irq_data	*irq_data;
-
 	struct work_struct		reset_work;
 	struct work_struct		receive_work;
 	struct regulator		*vdd_pdphy;
 	spinlock_t			lock;		/* Register atomicity */
+
+	unsigned int			nr_irqs;
+	struct pmic_typec_pdphy_irq_data	irq_data[] __counted_by(nr_irqs);
 };

 static void qcom_pmic_typec_pdphy_reset_on(struct pmic_typec_pdphy *pmic_typec_pdphy)
@@ -560,18 +560,16 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
 	struct pmic_typec_pdphy_irq_data *irq_data;
 	int i, ret, irq;

-	pmic_typec_pdphy = devm_kzalloc(dev, sizeof(*pmic_typec_pdphy), GFP_KERNEL);
-	if (!pmic_typec_pdphy)
-		return -ENOMEM;
-
 	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
 		return -EINVAL;

-	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
-				GFP_KERNEL);
-	if (!irq_data)
+	pmic_typec_pdphy = devm_kzalloc(dev,
+			struct_size(pmic_typec_pdphy, irq_data, res->nr_irqs), GFP_KERNEL);
+	if (!pmic_typec_pdphy)
 		return -ENOMEM;

+	pmic_typec_pdphy->nr_irqs = res->nr_irqs;
+
 	pmic_typec_pdphy->vdd_pdphy = devm_regulator_get(dev, "vdd-pdphy");
 	if (IS_ERR(pmic_typec_pdphy->vdd_pdphy))
 		return PTR_ERR(pmic_typec_pdphy->vdd_pdphy);
@@ -579,12 +577,11 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
 	pmic_typec_pdphy->dev = dev;
 	pmic_typec_pdphy->base = base;
 	pmic_typec_pdphy->regmap = regmap;
-	pmic_typec_pdphy->nr_irqs = res->nr_irqs;
-	pmic_typec_pdphy->irq_data = irq_data;
 	spin_lock_init(&pmic_typec_pdphy->lock);
 	INIT_WORK(&pmic_typec_pdphy->reset_work, qcom_pmic_typec_pdphy_sig_reset_work);

-	for (i = 0; i < res->nr_irqs; i++, irq_data++) {
+	for (i = 0; i < res->nr_irqs; i++) {
+		irq_data = &pmic_typec_pdphy->irq_data[i];
 		irq = platform_get_irq_byname(pdev, res->irq_params[i].irq_name);
 		if (irq < 0)
 			return irq;
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 8051eaa46991..6c6401187f58 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -169,8 +169,6 @@ struct pmic_typec_port {
 	struct tcpm_port		*tcpm_port;
 	struct regmap			*regmap;
 	u32				base;
-	unsigned int			nr_irqs;
-	struct pmic_typec_port_irq_data	*irq_data;

 	struct regulator		*vdd_vbus;
 	bool				vbus_enabled;
@@ -181,6 +179,9 @@ struct pmic_typec_port {
 	struct delayed_work		cc_debounce_dwork;

 	spinlock_t			lock;	/* Register atomicity */
+
+	unsigned int			nr_irqs;
+	struct pmic_typec_port_irq_data	irq_data[] __counted_by(nr_irqs);
 };

 static const char * const typec_cc_status_name[] = {
@@ -706,18 +707,16 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	struct pmic_typec_port *pmic_typec_port;
 	int i, ret, irq;

-	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
-	if (!pmic_typec_port)
-		return -ENOMEM;
-
 	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
 		return -EINVAL;

-	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
-				GFP_KERNEL);
-	if (!irq_data)
+	pmic_typec_port = devm_kzalloc(dev,
+			struct_size(pmic_typec_port, irq_data, res->nr_irqs), GFP_KERNEL);
+	if (!pmic_typec_port)
 		return -ENOMEM;

+	pmic_typec_port->nr_irqs = res->nr_irqs;
+
 	mutex_init(&pmic_typec_port->vbus_lock);

 	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
@@ -727,8 +726,6 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	pmic_typec_port->dev = dev;
 	pmic_typec_port->base = base;
 	pmic_typec_port->regmap = regmap;
-	pmic_typec_port->nr_irqs = res->nr_irqs;
-	pmic_typec_port->irq_data = irq_data;
 	spin_lock_init(&pmic_typec_port->lock);
 	INIT_DELAYED_WORK(&pmic_typec_port->cc_debounce_dwork,
 			  qcom_pmic_typec_port_cc_debounce);
@@ -737,7 +734,8 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	if (irq < 0)
 		return irq;

-	for (i = 0; i < res->nr_irqs; i++, irq_data++) {
+	for (i = 0; i < res->nr_irqs; i++) {
+		irq_data = &pmic_typec_port->irq_data[i];
 		irq = platform_get_irq_byname(pdev,
 					      res->irq_params[i].irq_name);
 		if (irq < 0)
--
2.53.0


