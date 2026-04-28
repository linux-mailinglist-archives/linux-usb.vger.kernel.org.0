Return-Path: <linux-usb+bounces-36649-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JgZEKoB8WnubgEAu9opvQ
	(envelope-from <linux-usb+bounces-36649-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:51:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C570E48ADB7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B577230CE8E6
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 18:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D5947CC65;
	Tue, 28 Apr 2026 18:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePGbcbTJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75447CC72;
	Tue, 28 Apr 2026 18:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402196; cv=none; b=mVnqAf7jslA/jZufPeXSHhfh2KZr+E/Fu4YsMuFMhDVOJqCTZFoq0c8q4ixckgsDlhtE3jAxW2AOdQvqZt3DeKD/Sgo8QbomotuLN3/h/bQq6Vwpg5k9+w+kPlLn8wCEXR7ywTzUnxzE8y4CxK7lLYQwmsfQ3AvRF4HHWlZUuaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402196; c=relaxed/simple;
	bh=s0dxJpQpLSIqaUJJMgpAB7jcC+EZoCvzaDxWnDN/kuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFN/YiH8W24eFe4D6nMIRDP4dW4PxxcOf0SGFIDnJPwz0KE/Uefc+O9UlyAkNPCjgBiECBQCLUb/UO8m/ie4Wv5eRFQLmqd270SyiL7l8xty7zHhDE4n6snycUPhQAn7Z599H3awq4dwVDRSPiwwrK5Ibx4BjUkF009+h29O6c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePGbcbTJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9549C2BCAF;
	Tue, 28 Apr 2026 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777402196;
	bh=s0dxJpQpLSIqaUJJMgpAB7jcC+EZoCvzaDxWnDN/kuk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ePGbcbTJQwEZpfP7PZEUCSLOE5JM5qQBF2Gs/W+Ool1RxS+hYsKUvejSjlGqEV2sy
	 up7CjdLT5AHu99ss8Qoi7JReh96u9bLKk0vTb3yzl/br70WUqgJ19ELW3lWHqeDAJT
	 PDbpBZrxR390O8PMWd/3h5z3GP5e0xsWpv2V9zr6fFxPtsJJfqgGTFSq8MAlNVKK+M
	 TYT5iUzUW7/f/r3ZYbe0A4J0n2mwTpXwKl/2A9pbPq6RuSINYGyvLB233P7bjm2Ttq
	 mvS5hV81zSQhd3TrNjPWXFmdFjZz6gbNq97Z2zk+5lI1PnGV+LFlV6JJfNfnheh8Oy
	 GdUobedAKe+7w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 28 Apr 2026 20:49:46 +0200
Subject: [PATCH v2 3/4] thunderbolt: Require nhi->ops be valid
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-usb4_nonpcie_prepwork-v2-3-452fb9d63f77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777402187; l=5120;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tJwqRAaPdi/f7Fy3Un9ziBWH8/RCh3myC34hz35dAdc=;
 b=dpnFnjiOSzGEqsDDEYk0PP+JlydzLV23tVzF2U99wU64b+KHt8XQ/wTmFcq9ZmsQJ4j4biOtP
 2E9k100udU2DTAE+I+ZuckBWF/c7bgAHMEB26O8z71hznbU1q8VRyA2
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: C570E48ADB7
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
	TAGGED_FROM(0.00)[bounces-36649-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

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
index 3ceca434155d..917069726a9f 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -560,7 +560,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	if (!ring->descriptors)
 		goto err_free_ring;
 
-	if (nhi->ops && nhi->ops->request_ring_irq) {
+	if (nhi->ops->request_ring_irq) {
 		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
 			goto err_free_descs;
 	}
@@ -571,7 +571,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	return ring;
 
 err_release_msix:
-	if (nhi->ops && nhi->ops->release_ring_irq)
+	if (nhi->ops->release_ring_irq)
 		nhi->ops->release_ring_irq(ring);
 err_free_descs:
 	dma_free_coherent(ring->nhi->dev,
@@ -780,7 +780,7 @@ void tb_ring_free(struct tb_ring *ring)
 	}
 	spin_unlock_irq(&ring->nhi->lock);
 
-	if (nhi->ops && nhi->ops->release_ring_irq)
+	if (nhi->ops->release_ring_irq)
 		nhi->ops->release_ring_irq(ring);
 
 	dma_free_coherent(ring->nhi->dev,
@@ -931,7 +931,7 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 	if (ret)
 		return ret;
 
-	if (nhi->ops && nhi->ops->suspend_noirq) {
+	if (nhi->ops->suspend_noirq) {
 		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
 		if (ret)
 			return ret;
@@ -1011,7 +1011,7 @@ static int nhi_resume_noirq(struct device *dev)
 	if ((nhi->ops->is_present && !nhi->ops->is_present(nhi))) {
 		nhi->going_away = true;
 	} else {
-		if (nhi->ops && nhi->ops->resume_noirq) {
+		if (nhi->ops->resume_noirq) {
 			ret = nhi->ops->resume_noirq(nhi);
 			if (ret)
 				return ret;
@@ -1054,7 +1054,7 @@ static int nhi_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (nhi->ops && nhi->ops->runtime_suspend) {
+	if (nhi->ops->runtime_suspend) {
 		ret = nhi->ops->runtime_suspend(tb->nhi);
 		if (ret)
 			return ret;
@@ -1068,7 +1068,7 @@ static int nhi_runtime_resume(struct device *dev)
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
-	if (nhi->ops && nhi->ops->runtime_resume) {
+	if (nhi->ops->runtime_resume) {
 		ret = nhi->ops->runtime_resume(nhi);
 		if (ret)
 			return ret;
@@ -1094,7 +1094,7 @@ void nhi_shutdown(struct tb_nhi *nhi)
 	}
 	nhi_disable_interrupts(nhi);
 
-	if (nhi->ops && nhi->ops->shutdown)
+	if (nhi->ops->shutdown)
 		nhi->ops->shutdown(nhi);
 }
 
@@ -1158,6 +1158,12 @@ int nhi_probe(struct tb_nhi *nhi)
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
 
@@ -1174,11 +1180,9 @@ int nhi_probe(struct tb_nhi *nhi)
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
 
@@ -1186,7 +1190,7 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (res)
 		return dev_err_probe(dev, res, "failed to set DMA mask\n");
 
-	if (nhi->ops && nhi->ops->init) {
+	if (nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
 			return res;
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 9647650ee02d..5f09460af1b8 100644
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


