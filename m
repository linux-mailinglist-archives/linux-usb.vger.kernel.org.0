Return-Path: <linux-usb+bounces-37513-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAOWKKYUB2rgrQIAu9opvQ
	(envelope-from <linux-usb+bounces-37513-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:42:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090954FC64
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0205D300D77A
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D32480353;
	Fri, 15 May 2026 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXq0MCae"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9447ECDF;
	Fri, 15 May 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848749; cv=none; b=hlpYgu840CLmvCakEfK46hLf5J6+ghp2wNlxnHVaRgEu5X7/YruGMetx7pZZSrAdqp48AFd5+cGeBctMWXNDl6BJVjDLhr64HJTGsaTjnWr9+TQXrzTpRxGKLID60MTftKoMxW1UUkJlYUFaZ1gfaBxDWY3iFCaQVN6r6YmUhJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848749; c=relaxed/simple;
	bh=i298VvOeIoBdmUK+OD0uLYAyhZ6aEH4cZba+F0pO2Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzdqvV2B9zDu9ikkwBQVwbWAcI8b9SYgIecqJjXGcJlgTUH9xCnG3hK5xu2u/uyi1Ch+ab/qZqrPxhMxkMPVFk1ZrNflATHfv9hGewAsgsP5zJLpET7sI6Fk1jltqp6sh15VH4WBmCjNo9RCgMmNkXX6397DP0Kqyf0g/MEccHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXq0MCae; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D985C2BCB0;
	Fri, 15 May 2026 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778848748;
	bh=i298VvOeIoBdmUK+OD0uLYAyhZ6aEH4cZba+F0pO2Jk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZXq0MCae7wqp13U47Eu3au0PbQT6JLlPxcKzhES4gBFA2CRSbsi9d0GBHmQ/s0Fzj
	 QO56+AwOFwdMm4VG+FZ5BZ7CpsWjqX4CDVzS81crqDcRT0kmP109XoQRUzsa2n9g4q
	 DHdW6LpTGgX/cu2SE3OWP4pFAXNKlDZ3SKSu3OAylvKEzk91Vx/OqnQk7PYt1s3Mij
	 yOnDCrx9nmmiV+x4sqO0cdRrZpr0RtaVbBchSY4VUfsT98nggOzf7PsW4Sk4iJnYyo
	 F/1accmnqaAynb4mjsDJ3ZTqpID2YtOq0l+i9jRTkdc1mzoJwjefLAlkUWYiUyuXCg
	 zC564ICLqfcAQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 15 May 2026 14:38:44 +0200
Subject: [PATCH v4 4/4] thunderbolt: Add some more descriptive probe error
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-topic-usb4_nonpcie_prepwork-v4-4-5c818378243e@oss.qualcomm.com>
References: <20260515-topic-usb4_nonpcie_prepwork-v4-0-5c818378243e@oss.qualcomm.com>
In-Reply-To: <20260515-topic-usb4_nonpcie_prepwork-v4-0-5c818378243e@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778848734; l=2134;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=pqu2VCWMefuVciX3P7frQNj4MipGgNMMNqP0pkNkivk=;
 b=LZAAigxMzvqYAvHS+I/CqGd7VqnuwVdPcFBxgGwYS/HpUtVFWtf7ZkmcOjUtGsG50+YsheYdR
 zQdxELkpb8JANR7vTXuchNdMZxQC3EJdoDpM+fCfsv9qTt6Avs5mfpV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 4090954FC64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37513-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

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
index 2a8d1b3716c0..2491e08bbd24 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1190,7 +1190,7 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
-			return res;
+			return dev_err_probe(dev, res, "NHI specific init failed\n");
 	}
 
 	tb = nhi_select_cm(nhi);
@@ -1211,7 +1211,7 @@ int nhi_probe(struct tb_nhi *nhi)
 		tb_domain_put(tb);
 		wait_for_completion(&nhi->domain_released);
 		nhi_shutdown(nhi);
-		return res;
+		return dev_err_probe(dev, res, "failed to add domain\n");
 	}
 	dev_set_drvdata(dev, tb);
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index e09259b35d40..4fd052e6552e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2997,7 +2997,8 @@ static int tb_start(struct tb *tb, bool reset)
 
 	tb->root_switch = tb_switch_alloc(tb, &tb->dev, 0);
 	if (IS_ERR(tb->root_switch))
-		return PTR_ERR(tb->root_switch);
+		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
+				     "failed to allocate host router\n");
 
 	/*
 	 * ICM firmware upgrade needs running firmware and in native
@@ -3014,14 +3015,14 @@ static int tb_start(struct tb *tb, bool reset)
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


