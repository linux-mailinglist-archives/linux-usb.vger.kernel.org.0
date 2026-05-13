Return-Path: <linux-usb+bounces-37407-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM8LBYGpBGqRMgIAu9opvQ
	(envelope-from <linux-usb+bounces-37407-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:40:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A12537418
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA85E30B236F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C074C9577;
	Wed, 13 May 2026 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O396L9C3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC34C9008;
	Wed, 13 May 2026 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689433; cv=none; b=hMN3m+t7aaKhHNFME9gi2GM2IQ9oxLj/Hs71wUwI+NruPgXQtxSwdZmdKSFuUUmCFKALechXXsmTGzTOUF4bP+erXtwG9OzlZrPzAWZqoCU7pYDUpfnTKrqCMtY14K55css5FwJPkVfX5op+9Yk2IR1uTWteJtPmTUsXimIqoMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689433; c=relaxed/simple;
	bh=0iAI9FSAozOAmDi/mkdo6ZguXsojYo5XXO0vthZ0IQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iktkZrgShsvs7aSfA/L8M1LfaC7fn8K9qZ1uJZ7YaByuhqpFGs+I2sS2s7wMqlZHlhRtnCMHmBGN8UwzTtEHRtxW7iPFLBuFfTceJyqbu560vXdC0cPacS+Xmi5D7vv7okNKte/SmJH3MHNceUQHUn02r7fGGcb5+C1osRjAufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O396L9C3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B2AC2BCB7;
	Wed, 13 May 2026 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778689433;
	bh=0iAI9FSAozOAmDi/mkdo6ZguXsojYo5XXO0vthZ0IQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O396L9C3Ose+tp1B0AnaRyIi0e+J8kwjb28c21+7N/ay+OEIHu3sKiY6ZkDm3Xi2U
	 8ZyStDCIQoG5YXCeqksVNzmonDOU9v0bCLFOOAcbgtEPGL2NqI/OMPZ3iS1AVJoaZV
	 T+fm2OcQWcSHa1dPECAEGAqnKi/WLG7QoMY0QIDnmwDiJ49tAoFa02aY+KDgdyWnDA
	 SnUDApMUi8W1hi9ooA8qEwddqUXgl7r/mL+B5vKfQ9oAeqOlNnYVCQXw19sYnah5Q3
	 bM4oKNGSxsaQ5pHjH8ystrjuF/Ip3aJ013aRqrTJvxyCpoTgNK5dk6F+qI3R1dgPkP
	 AVtCA+jgdldDA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 13 May 2026 18:23:34 +0200
Subject: [PATCH v3 3/4] thunderbolt: Require nhi->ops be valid
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-topic-usb4_nonpcie_prepwork-v3-3-b87b5e408ac7@oss.qualcomm.com>
References: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
In-Reply-To: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778689422; l=5120;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=qLDp9xdLf2zRPG0jEGvw3bvDjIdy31+9siuOZtDuFuY=;
 b=WYP4v3WOMCYhgCpb+ffdhCQlDHq6/XEvmcGGoY0t3Xz97QyTjXZRGFFw5yDB2UAH17H8PC4yN
 ++3e7FGMomlBXTuuFaYSLp5q9TL2g3sIs6v5G2Gi4SL2c2yW2gmE4vC
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 08A12537418
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37407-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Because of how fundamental ops->init_interrupts() is, it no longer
makes sense to consider cases where nhi->ops is NULL.

Drop some boilerplate around it and add a single sanity-check in
nhi_probe() instead.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c    | 32 ++++++++++++++++++--------------
 drivers/thunderbolt/switch.c |  6 +++---
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 740c10ee852b..2a8d1b3716c0 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -559,7 +559,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	if (!ring->descriptors)
 		goto err_free_ring;
 
-	if (nhi->ops && nhi->ops->request_ring_irq) {
+	if (nhi->ops->request_ring_irq) {
 		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
 			goto err_free_descs;
 	}
@@ -570,7 +570,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	return ring;
 
 err_release_msix:
-	if (nhi->ops && nhi->ops->release_ring_irq)
+	if (nhi->ops->release_ring_irq)
 		nhi->ops->release_ring_irq(ring);
 err_free_descs:
 	dma_free_coherent(ring->nhi->dev,
@@ -779,7 +779,7 @@ void tb_ring_free(struct tb_ring *ring)
 	}
 	spin_unlock_irq(&ring->nhi->lock);
 
-	if (nhi->ops && nhi->ops->release_ring_irq)
+	if (nhi->ops->release_ring_irq)
 		nhi->ops->release_ring_irq(ring);
 
 	dma_free_coherent(ring->nhi->dev,
@@ -928,7 +928,7 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 	if (ret)
 		return ret;
 
-	if (nhi->ops && nhi->ops->suspend_noirq) {
+	if (nhi->ops->suspend_noirq) {
 		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
 		if (ret)
 			return ret;
@@ -1008,7 +1008,7 @@ static int nhi_resume_noirq(struct device *dev)
 	if ((nhi->ops->is_present && !nhi->ops->is_present(nhi))) {
 		nhi->going_away = true;
 	} else {
-		if (nhi->ops && nhi->ops->resume_noirq) {
+		if (nhi->ops->resume_noirq) {
 			ret = nhi->ops->resume_noirq(nhi);
 			if (ret)
 				return ret;
@@ -1051,7 +1051,7 @@ static int nhi_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (nhi->ops && nhi->ops->runtime_suspend) {
+	if (nhi->ops->runtime_suspend) {
 		ret = nhi->ops->runtime_suspend(tb->nhi);
 		if (ret)
 			return ret;
@@ -1065,7 +1065,7 @@ static int nhi_runtime_resume(struct device *dev)
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
-	if (nhi->ops && nhi->ops->runtime_resume) {
+	if (nhi->ops->runtime_resume) {
 		ret = nhi->ops->runtime_resume(nhi);
 		if (ret)
 			return ret;
@@ -1091,7 +1091,7 @@ void nhi_shutdown(struct tb_nhi *nhi)
 	}
 	nhi_disable_interrupts(nhi);
 
-	if (nhi->ops && nhi->ops->shutdown)
+	if (nhi->ops->shutdown)
 		nhi->ops->shutdown(nhi);
 }
 
@@ -1155,6 +1155,12 @@ int nhi_probe(struct tb_nhi *nhi)
 	struct tb *tb;
 	int res;
 
+	if (!nhi->ops)
+		return dev_err_probe(dev, -EINVAL, "NHI ops not set\n");
+
+	if (!nhi->ops->init_interrupts)
+		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");
+
 	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
 	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
 
@@ -1171,11 +1177,9 @@ int nhi_probe(struct tb_nhi *nhi)
 	nhi_disable_interrupts(nhi);
 	nhi_enable_int_throttling(nhi);
 
-	if (nhi->ops && nhi->ops->init_interrupts) {
-		res = nhi->ops->init_interrupts(nhi);
-		if (res)
-			return dev_err_probe(dev, res, "cannot enable interrupts, aborting\n");
-	}
+	res = nhi->ops->init_interrupts(nhi);
+	if (res)
+		return dev_err_probe(dev, res, "cannot enable interrupts, aborting\n");
 
 	spin_lock_init(&nhi->lock);
 
@@ -1183,7 +1187,7 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (res)
 		return dev_err_probe(dev, res, "failed to set DMA mask\n");
 
-	if (nhi->ops && nhi->ops->init) {
+	if (nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
 			return res;
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d24b3a086b5c..9cf37efe699a 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -251,7 +251,7 @@ static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
 
 	sw->nvm->authenticating = true;
 	if (!tb_route(sw)) {
-		if (nhi->ops && nhi->ops->pre_nvm_auth)
+		if (nhi->ops->pre_nvm_auth)
 			nhi->ops->pre_nvm_auth(nhi);
 		ret = nvm_authenticate_host_dma_port(sw);
 	} else {
@@ -2782,7 +2782,7 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
 	nvm_get_auth_status(sw, &status);
 	if (status) {
 		if (!tb_route(sw)) {
-			if (nhi->ops && nhi->ops->post_nvm_auth)
+			if (nhi->ops->post_nvm_auth)
 				nhi->ops->post_nvm_auth(nhi);
 		}
 		return 0;
@@ -2799,7 +2799,7 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
 
 	/* Now we can allow root port to suspend again */
 	if (!tb_route(sw)) {
-		if (nhi->ops && nhi->ops->post_nvm_auth)
+		if (nhi->ops->post_nvm_auth)
 			nhi->ops->post_nvm_auth(nhi);
 	}
 

-- 
2.54.0


