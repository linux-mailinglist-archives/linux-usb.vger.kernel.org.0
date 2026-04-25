Return-Path: <linux-usb+bounces-36475-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMDkGggc7GkzUgAAu9opvQ
	(envelope-from <linux-usb+bounces-36475-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 03:42:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E2464767
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 03:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D1A330234F9
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 01:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62AA221275;
	Sat, 25 Apr 2026 01:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtNcuHTq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B702204F93
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 01:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777081341; cv=none; b=FU2ZeWdn1pkCNI5eRXkZw8XhHj7t0VWoYk6xMwkRBOkqyam3A4IP2tHSNOSgstk3qWFKJ5DdhQdydpXmeYUcky6+7nE/LcTS93FN9d6Pbe1lIJGS8AQLjOEaqOcbPW8zK55k+xo45jJAaDr6DTkKYfft4JJhPcb//gZYYLCT+Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777081341; c=relaxed/simple;
	bh=mj3qfGYlr+bMveVNY0NmGwQ8Jz+/4iRwZC+w+LJ21Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/IIYVdQ93+yiNxOuuaDm+vGIjGL3CzTQjKLZwfdGeLQG7rxcmLzZjDNGaeXzba4sMHUO7Ljgto5Lk2rGMlK/Pv3JI3n2TIr9wfSF8Wuo+Pbuw6heZgrJL7SWS+UiPT12WKAIclBg4Z45+ro4m8+Cc+aHUpAeHADI5fe/9qa7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtNcuHTq; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so6715622a91.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 18:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777081339; x=1777686139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4OxYR+RFt6UrbmMauhFwdJjJ5w7Lq82SA2vzvpVn2KI=;
        b=TtNcuHTqY8iR0xBAIn/qlkWOiuLT3CMqmKxEL0x6cgAXG7sP0QN2htCPZc5KeZxjE8
         cQJy02bNPs+jD5Fh7W7vIO09kChXVTkMcKbrg+uDd1hRPplxoP95eYi+PM7qxgmbUv1S
         G12G0LI0yVSlb7NZfwhk1ckzgZNGet6Z/UoiTIX1eyB2hD5/xN4+uY+/jNEDeBcQvgci
         InTnxYPGIvl1gDB+ds1VHXkEt5P9Hb6q7Lb0y5lB6TmL5KFyG0pXlgUpBEGM8Zyovigj
         waJRvO02yIwlWF9f+cjszwDpdkh0AdnUIg/R5ntxH860gzUOogPREcUzO9ZjFGdCdAOf
         KRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777081339; x=1777686139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OxYR+RFt6UrbmMauhFwdJjJ5w7Lq82SA2vzvpVn2KI=;
        b=WekDTgE9yT94mXkM40VEjb0/xvorGVL2ApIYBkBJbQojlz62Mk0vdD2dZeEK5I0RgK
         gpBJljdTa26UxObwOoG6d2m7GGThyAwOjp0ij2vbKqK907IQWdjQZuLcKdUc/WHVgQT+
         I6dagcj/J/yOBX6k2X3VodMSU4pIT5sLwpQtDLqwhURHflAHvgzxGp2yvvXcW3OljggX
         eDB7WnZ0LpD5Mti61kztQVYMV7vdgj0+//bkXcOhMGtQ68p7T93OGgmMKGOThGgd+RQH
         jWYBocgPN+wL0pQecKVeZmjVrYOsvZkVDCXgAx8xr/wRzf78PPz3jy+HlL0RntsE+Bjs
         jzFw==
X-Gm-Message-State: AOJu0YzE/7URwYNfulM2iEOrTJzzlv8OartPVmmh25WR5XZ/EsPQCrC3
	U/aMifCB5LZGpln29PH2BYTb8sZlPVR2o/augmMhDQx/xymby5VyMsshP+nAOA==
X-Gm-Gg: AeBDieu2hEuhNUg8gltW144JTstaxaI6aCDKSjysNbGmB8AXXTxmeGenkvIUriEm9L2
	zGYjMpZkAkyZM+9KnK2LyQxE0KBsyZrCNBOI/2HDDW4henA1PleCRmYS+ty7wycc7oglkJBA8QU
	6rKOqTvgVt0uvqrZZD7KjBSwZBvuvrgrOuDoBgQCAHXqE/Qj/MfBYFY5HgZD0cblZ9vW/coToDK
	m78PfLSQLGnj2XLqJbpN47zU7Upx5s8GKebE5fN2bEua1UrbV9cdncnD6NWDIpFRzkAsspDGyNm
	j6PNWVgQo+vTN0XKoddy3t+SP25CGmG0PbQumBIkvhNHxEdCPFKJDkLjsfEOMa5mJj51uyI/rni
	1U3hqgH07YoOQJ6AAin+FrloME0mowN6kpEIu871l6SVFjhxS3Mp11CEbxbvmWlaKkBXA4Iab+X
	HA62g/IOwleseqfkgNWP/6WITgUd+AzlJTrHiK1CcvmB62h7g+KJjg6rb/RGlIQlAcG+cfXd1Mm
	KUxBlGEtmRQO00aBquUWg5MAnS63Qm4b3Xk
X-Received: by 2002:a17:90b:4fcc:b0:35f:b293:7ac6 with SMTP id 98e67ed59e1d1-361403bd8camr37022135a91.6.1777081339252;
        Fri, 24 Apr 2026 18:42:19 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362c69b8257sm9967412a91.7.2026.04.24.18.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 18:42:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
Date: Fri, 24 Apr 2026 18:42:01 -0700
Message-ID: <20260425014201.439251-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2D1E2464767
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36475-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

A flexible array member can be used to combine allocations and simplify
handling slightly.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 1698428654ab..e22b070a140f 100644
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
@@ -731,27 +732,25 @@ static int pmc_usb_probe(struct platform_device *pdev)
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
+	pmc = devm_kzalloc(&pdev->dev, struct_size(pmc, port, num_ports), GFP_KERNEL);
+	if (!pmc)
 		return -ENOMEM;
 
+	pmc->num_ports = num_ports;
+
 	pmc->ipc = devm_intel_scu_ipc_dev_get(&pdev->dev);
 	if (!pmc->ipc)
 		return -EPROBE_DEFER;
-- 
2.54.0


