Return-Path: <linux-usb+bounces-37870-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDoxCLXlDmopDAYAu9opvQ
	(envelope-from <linux-usb+bounces-37870-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 13:00:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 045035A3B27
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 13:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52EA3117AA1
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659A23A7189;
	Thu, 21 May 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgiqsspP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B093A48F6;
	Thu, 21 May 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360017; cv=none; b=S2tdn2FZlz2hKuRHACrK+n2b9PJMxpiYzaGKyo+2Cclqd4/DWENhP+zLWDhNPfpJJiooxus6HUaGP4bssL+iQ4TYRcbIM5upDd99POfLQbEWLzNTAWsgCxO9AGIx+WZVqxWClfDifJBhPKje/rGdYlX8reU6BoDK6OvA4fJqrYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360017; c=relaxed/simple;
	bh=I/Xt6d4iR45qyEckmSPTuuSkWT+3rINe6MgQZeXrUBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+p1hcc1/eRfPeIem8psMDCfHPMLfon2X5oeLAKWY9avoH9PNVMP0DWRh1ElmScVOW8DNxKqW/FVGdzhP3RBxW4FFuUMhr1o7zpkLpmQV8Seag0CPhOgKXc4anoxCTzsKumYxdA+6X7cw8ocS9w29HWP1giK3Q3jQclOK3aWcY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgiqsspP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38851F00A3B;
	Thu, 21 May 2026 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779360015;
	bh=Jr+RVvbL4RTlx2wZW/d+flujLSWgf/sEJDkfTHmzDBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hgiqsspPL+fgVvLkM+ZX3rSrOf2cdcBLACK5QUA/L0NPoyAZlCB94aGmflM+b5pFt
	 xL94KhqHhuQccxCkCVi7xpTJy/5aexxsgAsnuxNY/fuBcK/T7K9YuRRo8v48FdN593
	 7uZz8Acm+uOLKb9z6Q2BYvRrsb1n7uDQIAt4qXeu0BwDz14MAj8gWJg5WD4JizZlU3
	 CZfXQ8tWtQvn8i94EyRcygoyYE1mLBa59coHSKspxq1ztYjHaGnWTP9QLqHspJoYQA
	 18O8KM2AMbB3tlr1e/yLXem7I++EtIc5n2I9lkY9hhwaYRTlJXb213Ylgc8cZDoM1l
	 KAsgnxpLCP3ZQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 21 May 2026 12:40:02 +0200
Subject: [PATCH v5 3/4] thunderbolt: Require nhi->ops be valid
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-usb4_nonpcie_prepwork-v5-3-b67dbe7508e8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779360003; l=5128;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tBsmdWiIIj1w8dOoMRPcuFwDNVnr3/l3/cZ1IcarDSQ=;
 b=r3IMMPNiRWSD6QjD69fBw6O3YcnQnbAbXoJMnUX8vGefCOsjOawCnqopR23wMVaSsf8f56s99
 ukfqxdzGfDPBxsazQmjkVGdwmk56yfZvvxLP46RY3ZoQy9EcGd9oory
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
	TAGGED_FROM(0.00)[bounces-37870-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 045035A3B27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index be00ffb04766..e9ba8ffbe349 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -568,7 +568,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	if (!ring->descriptors)
 		goto err_free_ring;
 
-	if (nhi->ops && nhi->ops->request_ring_irq) {
+	if (nhi->ops->request_ring_irq) {
 		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
 			goto err_free_descs;
 	}
@@ -579,7 +579,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	return ring;
 
 err_release_msix:
-	if (nhi->ops && nhi->ops->release_ring_irq)
+	if (nhi->ops->release_ring_irq)
 		nhi->ops->release_ring_irq(ring);
 err_free_descs:
 	dma_free_coherent(ring->nhi->dev,
@@ -813,7 +813,7 @@ void tb_ring_free(struct tb_ring *ring)
 	}
 	spin_unlock_irq(&ring->nhi->lock);
 
-	if (nhi->ops && nhi->ops->release_ring_irq)
+	if (nhi->ops->release_ring_irq)
 		nhi->ops->release_ring_irq(ring);
 
 	dma_free_coherent(ring->nhi->dev,
@@ -982,7 +982,7 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 	if (ret)
 		return ret;
 
-	if (nhi->ops && nhi->ops->suspend_noirq) {
+	if (nhi->ops->suspend_noirq) {
 		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
 		if (ret)
 			return ret;
@@ -1045,7 +1045,7 @@ static int nhi_resume_noirq(struct device *dev)
 	 */
 	if ((nhi->ops->is_present && !nhi->ops->is_present(nhi))) {
 		nhi->going_away = true;
-	} else if (nhi->ops && nhi->ops->resume_noirq) {
+	} else if (nhi->ops->resume_noirq) {
 		ret = nhi->ops->resume_noirq(nhi);
 		if (ret)
 			return ret;
@@ -1086,7 +1086,7 @@ static int nhi_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (nhi->ops && nhi->ops->runtime_suspend) {
+	if (nhi->ops->runtime_suspend) {
 		ret = nhi->ops->runtime_suspend(tb->nhi);
 		if (ret)
 			return ret;
@@ -1100,7 +1100,7 @@ static int nhi_runtime_resume(struct device *dev)
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
-	if (nhi->ops && nhi->ops->runtime_resume) {
+	if (nhi->ops->runtime_resume) {
 		ret = nhi->ops->runtime_resume(nhi);
 		if (ret)
 			return ret;
@@ -1125,7 +1125,7 @@ void nhi_shutdown(struct tb_nhi *nhi)
 	}
 	nhi_disable_interrupts(nhi);
 
-	if (nhi->ops && nhi->ops->shutdown)
+	if (nhi->ops->shutdown)
 		nhi->ops->shutdown(nhi);
 }
 
@@ -1189,6 +1189,12 @@ int nhi_probe(struct tb_nhi *nhi)
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
 
@@ -1204,11 +1210,9 @@ int nhi_probe(struct tb_nhi *nhi)
 	/* In case someone left them on. */
 	nhi_disable_interrupts(nhi);
 
-	if (nhi->ops && nhi->ops->init_interrupts) {
-		res = nhi->ops->init_interrupts(nhi);
-		if (res)
-			return dev_err_probe(dev, res, "cannot enable interrupts, aborting\n");
-	}
+	res = nhi->ops->init_interrupts(nhi);
+	if (res)
+		return dev_err_probe(dev, res, "cannot enable interrupts, aborting\n");
 
 	spin_lock_init(&nhi->lock);
 
@@ -1216,7 +1220,7 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (res)
 		return dev_err_probe(dev, res, "failed to set DMA mask\n");
 
-	if (nhi->ops && nhi->ops->init) {
+	if (nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
 			return res;
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a29b9887cd6b..a830c82bb905 100644
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


