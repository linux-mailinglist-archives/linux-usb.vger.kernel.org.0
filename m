Return-Path: <linux-usb+bounces-37512-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAzxFkkYB2qQrgIAu9opvQ
	(envelope-from <linux-usb+bounces-37512-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:57:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD27D550069
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D3C1302E796
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DFD47F2FF;
	Fri, 15 May 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfeuFiA1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063BF379C30;
	Fri, 15 May 2026 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848746; cv=none; b=kDxu292VLYq/DCjugNSRCA2+EPSkoOmMB3FJPcRMzvNBIp5Lj4FvfA3Cpgdx0PcHATWwpOFmTXrj1KpW+4EAXnkcDDjWKmjH2sGHhJ0jJc42Co4bBGhzLdLT5nD6jmz4hkPBCAKA7T7BJZBe0+xMrinouAPboOffqHXoVtUueEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848746; c=relaxed/simple;
	bh=0iAI9FSAozOAmDi/mkdo6ZguXsojYo5XXO0vthZ0IQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5C1mWX9OHkO9yW+clzGeV/fGoqw4ITvpqZUZiWjfYByDbobdo/utu+J0563bm1ehlPIzaXHm0rWX2V8sFM+0OfGV0e45fnUvNyRMUq5vY7JS9p4zJe+ZnLhuL6M8G7YxLG50Nh9ezZ2rrrleMYLkQLiy+8DoV4upe39qJ8Yas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfeuFiA1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE11BC2BCB7;
	Fri, 15 May 2026 12:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778848745;
	bh=0iAI9FSAozOAmDi/mkdo6ZguXsojYo5XXO0vthZ0IQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IfeuFiA1/rJSeI9NvdzQk7ljv8r7dMerh7qarp2TXhKqN98DISmerOsw5i1sB4br/
	 MJ8yapVzLdl+FxbylE9cImlUPFMduqhLBagxkF4gw6/XzLXnB2oZUTWX3LyF1893dV
	 H3uajMBjz1bQ+1PzotdOUZPKmObB5NwY68txHcUJ1WAhpYG/JV30myPZTz5VNB1gpP
	 8GB4xQj7+lLDm7ngvcFBNomhuAorB4QNmJP+ACkk0++1AelSv1AIn7oUSpDhVl2EWT
	 RhlX7iwuVNtyWUNvf/WKpOsFIyK+usq/VdYudfz+R+HqpYMHFFj0pyjh1ZQhLSmYSY
	 3+i9WGyHi6eMw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 15 May 2026 14:38:43 +0200
Subject: [PATCH v4 3/4] thunderbolt: Require nhi->ops be valid
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-topic-usb4_nonpcie_prepwork-v4-3-5c818378243e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778848734; l=5120;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=qLDp9xdLf2zRPG0jEGvw3bvDjIdy31+9siuOZtDuFuY=;
 b=GwXrSF1W0PmdPBoFDqaD/WvPtG9ilQQUsCVkTOZWEE2je+su0Ag5DQWm0w3kQfv2bimz+yO9T
 VZB282a4tsSD2HG/jIoNqCbke6AfqDSdujqnwtquY1+7qc/D/2aGQXg
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: BD27D550069
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
	TAGGED_FROM(0.00)[bounces-37512-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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


