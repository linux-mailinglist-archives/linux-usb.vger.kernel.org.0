Return-Path: <linux-usb+bounces-36650-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFR4HNAB8WnubgEAu9opvQ
	(envelope-from <linux-usb+bounces-36650-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:52:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B90F348ADCD
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3292830E0BA8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 18:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825D147CC8E;
	Tue, 28 Apr 2026 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXGpRWzI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0465847CC83;
	Tue, 28 Apr 2026 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402199; cv=none; b=nfzUefP54+nSihR9JL0QFOfgP3RbX8b3wY990FUiDO8VkE3GPnePa7+n8g+O2UWwHYMLiRqK2PUAwIC8AiLm2k1emYUJZhi/nHTay350wPYU++GWNzU8TnbBYlZrKI0xUAfNwzTbnquaQIanXgaRESZzpVKErj7sSoWUi7wvGNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402199; c=relaxed/simple;
	bh=APx3QYG6UuuJDt6aE74VRq7ylE3veOsvgcmZT0qY1Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DpFglOfZcUkoCMVppM2hAwnPDMFva7VnUI91H+RyUmtWyDKcrOAqPFy1fu+cHac25cp75sSZV1fccPGEDluICsXH867PV3yKNmMQO8dg6wDZfMb9ZNISZvjbkan5wY+qDTNgtNTYhjRiMBhQRybNtZgesY8X13itATvLJ/LH2o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXGpRWzI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F181DC2BCAF;
	Tue, 28 Apr 2026 18:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777402198;
	bh=APx3QYG6UuuJDt6aE74VRq7ylE3veOsvgcmZT0qY1Tg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pXGpRWzI0BwRZHVhOY1WOUiuIeamf868URGVF/bj7zVLYn3Fqm6BHw9gtuod4QuYc
	 S+uuTumZKn/4pqOyyLSxKh8MV++aLW+MqUuTvWW3xTgg9mS8wbmim9tODS5BHlh5+B
	 gSok+PgrRAockhNYaLhZnbtpVF5rmjJGlIXikr3LRve7+FUFNeE7qpcZ/OjVDlZM3K
	 OubNk3CxcQ0UlFqcb6RNc8hozHXc0Hlh+8L+JjX7LyHM+Ws0GUnx7RTCIkdIgsDCzD
	 GFYamyJ2jaL1PVoiamdpBsmW4cYZY0y3ILnIhwN7A2Ocr6ATXKF+BHdKEdFGrVo8Bn
	 KvGhhyBbT3d/w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 28 Apr 2026 20:49:47 +0200
Subject: [PATCH v2 4/4] thunderbolt: Add some more descriptive probe error
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-usb4_nonpcie_prepwork-v2-4-452fb9d63f77@oss.qualcomm.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
In-Reply-To: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777402187; l=2094;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=MC79/k20FvYKb7El3uFWSty8AlddCEsVXPR1D7a8BkI=;
 b=KGfp4EBfvz1cvv/bbc3+W7KtU5TPttmzQJmzVccPG8eP+YnCE5ewhV0jz5FbGNZTv0ENvc9Cm
 +pKdfEO3GZgBDl/EtHmOS4xJrj+k9c/x3cPVFT2yHLcPsHPNCtngdy2
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: B90F348ADCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36650-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

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
index 917069726a9f..28376a6f914b 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1193,7 +1193,7 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
-			return res;
+			return dev_err_probe(dev, res, "NHI specific init failed\n");
 	}
 
 	tb = nhi_select_cm(nhi);
@@ -1211,7 +1211,7 @@ int nhi_probe(struct tb_nhi *nhi)
 		 */
 		tb_domain_put(tb);
 		nhi_shutdown(nhi);
-		return res;
+		return dev_err_probe(dev, res, "failed to add domain\n");
 	}
 	dev_set_drvdata(dev, tb);
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 0126e38d9396..b8b4b925fe8c 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2990,7 +2990,8 @@ static int tb_start(struct tb *tb, bool reset)
 
 	tb->root_switch = tb_switch_alloc(tb, &tb->dev, 0);
 	if (IS_ERR(tb->root_switch))
-		return PTR_ERR(tb->root_switch);
+		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
+				     "failed to allocate host router\n");
 
 	/*
 	 * ICM firmware upgrade needs running firmware and in native
@@ -3007,14 +3008,14 @@ static int tb_start(struct tb *tb, bool reset)
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


