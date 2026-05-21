Return-Path: <linux-usb+bounces-37871-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I45EmTlDmopDAYAu9opvQ
	(envelope-from <linux-usb+bounces-37871-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:58:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F95A3B08
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ED67311D0A9
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659EC3A759B;
	Thu, 21 May 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdQmJtjo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF6B3A6B79;
	Thu, 21 May 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360021; cv=none; b=dUZsAmwtYTj6eucY8YWHRjiRPDh9tFc+wo6c+0aI4UIGCzPjYVy8gF4xyTg2wM2kWedayssMhnzgJEOGqjrDlWNKJScQWh4pF1DYm+pPJ1TlREk3KUZkz4iRoArWYmQpLq+WypN0m7SGSeK3c3CBOFtCTU5Aln2fu+L2xRUTPhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360021; c=relaxed/simple;
	bh=YKG2I5Ye+PEmL7SgovX5Fpu45L73pXq+g3d6KbZ4phU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nhxutfyq64P4wBDsUH9M5Sv1uhG2rOoICUXSGE9b75oTT2ISKgnWFZwJdpR8sgWsrK7egls6AqDcogdh5fXWugGWfaBonrXejOgeZZBStYMEEXM0e+8eycz7M/2kvMLH3eWSR2fY7JiqWHe0nKnCVu4VObo5wsgPrGIV5lvj3T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdQmJtjo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B80B1F00A3C;
	Thu, 21 May 2026 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779360018;
	bh=0O6eGxDI0nRTjN8Do+d0PEQxQ8yU+QBrFbzUtaRWDZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WdQmJtjop85sL71yJFYnOBdzuFb1mrDgEiLAhJv/yEIexlvZD2yAC6INezXOqE+2s
	 82o/L59pVUrFEHUfkMDr4R/PEhBvhiVACe7C00KWBFLjvtRUmpifD2TWgmx+svVqrx
	 QowIPFEcLe7VKCcCaSRLAkrORq1s5XZ3zB3GNBCCxH+0ex+gA+ingAgTtUueVx7s3F
	 6g6c7uS62wtN4sVAlUQqe1tMvR7AC66Mi3cRDHCt4jDLVkiOnp8NvYbNsUb10wNAJc
	 90jgCYpq7IKvnDV2ws/kYJdCGiDgoaNpi7B1Um98BffmeGvmYqeN4mjISnKBT6h7vR
	 SHwpgNev/fEKw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 21 May 2026 12:40:03 +0200
Subject: [PATCH v5 4/4] thunderbolt: Add some more descriptive probe error
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-usb4_nonpcie_prepwork-v5-4-b67dbe7508e8@oss.qualcomm.com>
References: <20260521-topic-usb4_nonpcie_prepwork-v5-0-b67dbe7508e8@oss.qualcomm.com>
In-Reply-To: <20260521-topic-usb4_nonpcie_prepwork-v5-0-b67dbe7508e8@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779360003; l=2134;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=g+9UmJ5Kxr3c3vUsPb/WU1552j0lDGwePrP2BuX9dLM=;
 b=gHbZYjGRyNDVv3Jbq3PzxuRzdkWf9g1P7HuqbAQvBQ2+qj9lcs2HDOOAUBe519DAe7pI3yc4g
 /VIgehFvd4OA0hDFzzlvrDbiDjbecDvze7+zHrl3OsGL9X/DEhlsgkW
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37871-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: B34F95A3B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently there's a lot of silent error-return paths in various places
where nhi_probe() can fail. Sprinkle some prints to make it clearer
where the problem is.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 4 ++--
 drivers/thunderbolt/tb.c  | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e9ba8ffbe349..0f795ea58756 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1223,7 +1223,7 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
-			return res;
+			return dev_err_probe(dev, res, "NHI specific init failed\n");
 	}
 
 	tb = nhi_select_cm(nhi);
@@ -1244,7 +1244,7 @@ int nhi_probe(struct tb_nhi *nhi)
 		tb_domain_put(tb);
 		wait_for_completion(&nhi->domain_released);
 		nhi_shutdown(nhi);
-		return res;
+		return dev_err_probe(dev, res, "failed to add domain\n");
 	}
 	dev_set_drvdata(dev, tb);
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index d60c0b8eb390..76323255439a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3000,7 +3000,8 @@ static int tb_start(struct tb *tb, bool reset)
 
 	tb->root_switch = tb_switch_alloc(tb, &tb->dev, 0);
 	if (IS_ERR(tb->root_switch))
-		return PTR_ERR(tb->root_switch);
+		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
+				     "failed to allocate host router\n");
 
 	/*
 	 * ICM firmware upgrade needs running firmware and in native
@@ -3017,14 +3018,14 @@ static int tb_start(struct tb *tb, bool reset)
 	ret = tb_switch_configure(tb->root_switch);
 	if (ret) {
 		tb_switch_put(tb->root_switch);
-		return ret;
+		return dev_err_probe(tb->nhi->dev, ret, "failed to configure host router\n");
 	}
 
 	/* Announce the switch to the world */
 	ret = tb_switch_add(tb->root_switch);
 	if (ret) {
 		tb_switch_put(tb->root_switch);
-		return ret;
+		return dev_err_probe(tb->nhi->dev, ret, "failed to add host router\n");
 	}
 
 	/*

-- 
2.54.0


