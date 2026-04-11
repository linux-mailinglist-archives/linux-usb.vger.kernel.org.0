Return-Path: <linux-usb+bounces-36150-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EunHNuz2WkasQgAu9opvQ
	(envelope-from <linux-usb+bounces-36150-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 04:37:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3DA3DE0BC
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 04:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D93F7302835B
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 02:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C51028980F;
	Sat, 11 Apr 2026 02:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM+94tUo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A425C239E63
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 02:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875022; cv=none; b=oCLsRNNHp6aXi7zu2TFDJ5cO9sCk5pGtnIUwX8JXf+8u+S9dFajtX1NPF4uFeTsnxF+8yMzd05B1R/EF6Y26jzDhaxnkyXAJj/mIF4q6l97vyJx9Odr21d00I/SnuPXQr82Tw6yRuf8G6vzB7+BGQ7ON53grcFW32Wayua+pEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875022; c=relaxed/simple;
	bh=BFjWHuj38Nm56Fk+D4b3tbNLGWBYO5SNEW3mNCYAvSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtrfG8iDSyMMv67AFeg/meKN18nWnQ37qYy9I36aYfPPgA5++q/CyczpHSQnGAZIrTXWSVgK8mSA4WSQZ9IZkqYlRb/68Zbo5lAbL0FMpMnJxmRiR0RB7vaReTUo8XffUnDT7mz7W8DR+rzrfolaZMRxcVUmrtEZqPno1YrthQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM+94tUo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso12991615ad.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 19:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775875021; x=1776479821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWU5hmGaOyknlwANldU6S4LDvr9Qn1n8t583iXoLjWU=;
        b=QM+94tUo84GzWzsd3sRrwPaqDpTEROqcLFLUG7svM5+hibTO4re2PkQZw8FhyE0mib
         XG1LtG6yK5HVsXy6XE/pW94hhc63zNdioE9fVUWxrFoxzH2enuN/hKfBtx+7eRmgexFZ
         0oB92elTWHzRmIa+KJ9EMq4k+Md/lJDObtFxSemu/6qCgGwmxnuH5cG8ufekZ9CH6Knu
         TqP2wIiXreOMxPBsKe3n13Nw+wZIebdTTWf2PSnwlGszqz/J1zzITp+IZOJlYutGSQcx
         UwifUOQjuC7byGzx0nnLI2WXotxAHRwUgiLZvuFpmgOtZa3Xz4EoUsFnVO8AGjjU7Spm
         v7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775875021; x=1776479821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWU5hmGaOyknlwANldU6S4LDvr9Qn1n8t583iXoLjWU=;
        b=qKDiGYU+4qrlveQhIRt7ZB9fYOHm0xL2yp+UC/LZ6bL8EbfDFh63mnBDmFNCtGUMH+
         S2ujnj9b/oW3sorncLzLPnHhnGdcyVawYT6HLx+Bx4hdrVV4460HemAEi6S3ZASxdcU1
         ebPDaIT1MOhbT9h8fONUZjtfMUUyyZi4wERPe1OJa0iea5f67A+x+KeRDuEcIH1sRby/
         EKPxK4J6/yY+evwB04v04fCpcetk1EYcsqH0YQSvBryehCu3I/aEjmmfqBhsId79Vdok
         cJHooMbuQ9eG5Tf+nOtaToO25mGOdQj7rFcNh1ojz4SzWhh99vIEDzdYQLrpC886OE54
         0HgQ==
X-Gm-Message-State: AOJu0Yw9oCA3tVWkp+CXkq1sen4ZPrMPGRz9EqSLliSMZWNniY33BXkN
	ysiSvpOtJ7Fab9shOk++fSME2qNNuekj/KQcBhCP5UHsYzr5HsVVDptbeX7QrA==
X-Gm-Gg: AeBDietFcgkljLvLuo0CgEU6xix4CU8prftoGMHaLk2Omgpy9xQuShBZquxA1iQvtcF
	Wy8bKiZJ2mTqSLWghIlOEnMLC1wpjuIHhTintSxs41qpkJFiopudIdgVHEpm+I5A+w7cIgGSIe4
	1aJ60ZeqwQe1I1P4GfL+Iy1dLDouQi9hM+iSnO0HvrL8wBbsubCvOTbQ4+DCnce6rZ5GG1ZMY7e
	mRb7i67Fy2aWYprQhwMjeSMyGUDLm1G6ErQwiw8ADQGasU75kTPa4z9DP7boxSimyUjshr73OkK
	0c+GPX8s7sISd1M8yA7YJNytUz7nh9rhN/sZnahr8/4b38DJTOwpAuwCduM+7ry9Ewl4WdVmanf
	wn9ZPHFbPlp78KNnZWg9ZDm/QORX4eHn/UDCpHZ2v3gLQVTY/MltnhUrRPYsI/B6ZDlPMb/NwXr
	Egu/uqwGCXdAWPoO7qn+hV8T0uckAsMI09qqX+kwqVulscJnpP2b2fvIg=
X-Received: by 2002:a17:902:ce0f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b2d5a2a1a4mr58818985ad.29.1775875020669;
        Fri, 10 Apr 2026 19:37:00 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dae27asm42432295ad.7.2026.04.10.19.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 19:37:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
Date: Fri, 10 Apr 2026 19:36:42 -0700
Message-ID: <20260411023642.146890-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36150-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CA3DA3DE0BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A flexible array member can be used to combine allocations and simplify
handling slightly.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 1698428654ab..8b0a3dd3f940 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -151,13 +151,14 @@ struct pmc_usb {
 	u8 num_ports;
 	struct device *dev;
 	struct intel_scu_ipc_dev *ipc;
-	struct pmc_usb_port *port;
 	struct acpi_device *iom_adev;
 	void __iomem *iom_base;
 	u32 iom_port_status_offset;
 	u8 iom_port_status_size;
 
 	struct dentry *dentry;
+
+	struct pmc_usb_port port[] __counted_by(num_ports);
 };
 
 static struct dentry *pmc_mux_debugfs_root;
@@ -731,27 +732,26 @@ static int pmc_usb_probe(struct platform_device *pdev)
 {
 	struct fwnode_handle *fwnode = NULL;
 	struct pmc_usb *pmc;
+	u8 num_ports;
 	int i = 0;
 	int ret;
 
-	pmc = devm_kzalloc(&pdev->dev, sizeof(*pmc), GFP_KERNEL);
-	if (!pmc)
-		return -ENOMEM;
-
 	device_for_each_child_node(&pdev->dev, fwnode)
-		pmc->num_ports++;
+		num_ports++;
 
 	/* The IOM microcontroller has a limitation of max 4 ports. */
-	if (pmc->num_ports > 4) {
+	if (num_ports > 4) {
 		dev_err(&pdev->dev, "driver limited to 4 ports\n");
 		return -ERANGE;
 	}
 
-	pmc->port = devm_kcalloc(&pdev->dev, pmc->num_ports,
-				 sizeof(struct pmc_usb_port), GFP_KERNEL);
-	if (!pmc->port)
+	pmc = devm_kzalloc(&pdev->dev, struct_size(pmc, port, num_ports),
+			GFP_KERNEL);
+	if (!pmc)
 		return -ENOMEM;
 
+	pmc->num_ports = num_ports;
+
 	pmc->ipc = devm_intel_scu_ipc_dev_get(&pdev->dev);
 	if (!pmc->ipc)
 		return -EPROBE_DEFER;
-- 
2.53.0


