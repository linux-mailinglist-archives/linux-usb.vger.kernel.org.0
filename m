Return-Path: <linux-usb+bounces-35810-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIeGI/2SzWklfAYAu9opvQ
	(envelope-from <linux-usb+bounces-35810-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 23:49:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A758380B62
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 23:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82DC03064205
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 21:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273F939D6EE;
	Wed,  1 Apr 2026 21:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pU/EYg0k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84134311969
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 21:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080066; cv=none; b=kYj3vWiQexKxsUaSG+weXpzht9wpTMAHOcX5V6eFPkMfD7yvZDzQEug0GP/R/gjlyKoabbsgxnGY/u/WNJvGe8OY18XXZPXzUpCTmv+k3qZ5V3gMT+hEKftlT7GMSTcTANhVVDJuF7rkgl19fbWCJI0p5LpRbnUTQ0a1cLbtbyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080066; c=relaxed/simple;
	bh=ZOD32CPLt9QK3aMBProd892mYoMeBAWfZ1nsyKYtZeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q0ACIzkDujCvoau9liUpcIks/pARcqpBiwqA3ZELMzrhjoKlJZLam/Dbm7IKaOFYL5Kl5wv570Gbp2PIeYG7mgeRBiJ0+pdnd70icnEAVeJzo99fy1Ej3FftC0ew9+XYTWokn6zyS2yssjS6mebz7lo88maKYAqIOpIQz2e+lME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pU/EYg0k; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab46931cf1so9622475ad.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 14:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775080064; x=1775684864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iGt1a4sLfrhxByIJ29j9DQkf7gSkmMPtiPiOxDIoUcA=;
        b=pU/EYg0kUPUWlpO4fh8GHmk3QM1FrO+JuYtA9VDMZC2Gtx5GKXRzbEXikPJ3SJs53Z
         0fMG1cbT1BjkwHLIWOt5Y9w0fBnrwp0j7tKvnv+Yt4H3E/N6KzrBMi4Le0StwGMjxkOW
         hKlx/8c9uFIJOocDiTXWkAzC2n3Gy70ryFtHvut7QY4l4Nu4q5U985acrp2Ar2/k7kqO
         Zo5onLx281aXWs4gWpOu3k6uPlwMXAtOuouNj2rLhDq3zGu9fcfGSbz1OdoxVBBlCuUm
         rFkS3cpAbvUVn0471pUlQhz1c94IhVWBI2+sHUK5/nS0hsk0eR02IEudD2fQnjwo76Zh
         CQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775080064; x=1775684864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGt1a4sLfrhxByIJ29j9DQkf7gSkmMPtiPiOxDIoUcA=;
        b=KijkUTxvvVIfFsF76IGVz26bCo2f3Rrsp0nzfbLFGw6JtKndwuWQkeU1jPLUhrCG2V
         Jcz3RUQeBIAOnZqVVrFTAc/J7fDqF5ndtyG5YZHEVC0UFMkpgM7ixRStqg1a5HDCVZYK
         tFVed1uhrztweDTM+bsOuWqmIH4L7+piG04Qc8oN6bePzA8hkGytPzPbcZOTn+M84pQ9
         tVs8gXwhr+MmNJ2LuNJN+3lRk8luBdoTp/S2VmTH5I3ioelWv1tn+ZQVjeN270zp+Qfp
         0DXKaxUnWPSo6u75MJa6flRZppbBmLehBN/Ng/Gpcpn9P6VNLA3g6PfzrhOzmoEqFIgx
         qlow==
X-Gm-Message-State: AOJu0Yz4cPk53lQTh3lL+3FHCnCBccPjj/YX4RPwMZvoTivfLI/nWTZ3
	LROfUG1fUP+PAc5tRbEZ0lyQOMsDmteIcS0ckO1qsfM3zT4VlRP5AEJOhZCsGRWa
X-Gm-Gg: ATEYQzxTxNt7Aw+XpXHPNIFhRrqEzJ4V2sA2L/fYQ4FizUHCvqHJDMLSPZ0VzJOCZTP
	KGxwXmRK4zTefGyJsIqhbmmU4xRSnfmu+0Q6cfHysctnlXRr7CsXKxFJzM2k/tesCZ0jLzYtoh1
	D0ZvHHlRF0V3Bqv14uip7ow81ZTA1If2ye/fVCX1HAdE56Jl48anVoHjPcrULZG8+BAFfU8uP9t
	R7ZEr7ZqOFBPXNCnheUM/V/Vvo3sJVRF7iFin0yJ581DL0TL6IN06UE98s8hFecd70jlBrdDShJ
	n8y+Xoq5mgP6+TFA/skwkDTFIH9VBXOd8d12kcwKA/4GxWZuNzDMWBRWB+Nqg7dKjhvD2BwgEj/
	OX+d33h9HH1XEauj5D9Eoz26mBkgW/O3Rw9/scmoOG6bNMrxC9ulSvvWekGn5daAQ+NDav6v6kR
	EK2bPjYufZPBa24en5cczel6qYUMtRgWbxDGqjBR4g5P96lJ6YVaoMFtA=
X-Received: by 2002:a17:903:24e:b0:2b0:6ba2:3d78 with SMTP id d9443c01a7336-2b277d62983mr342125ad.3.1775080064337;
        Wed, 01 Apr 2026 14:47:44 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm7777625ad.29.2026.04.01.14.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:47:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] thunderbolt: tunnel: simplify allocation
Date: Wed,  1 Apr 2026 14:47:26 -0700
Message-ID: <20260401214726.3911-1-rosenp@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35810-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A758380B62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member and kzalloc_flex to combine allocations.

Add __counted_by for extra runtime analysis. Move counting variable
assignment after allocation. kzalloc_flex with GCC >= 15 does this
automatically.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: move kernel-doc and reword slightly.
 drivers/thunderbolt/tunnel.c | 10 ++--------
 drivers/thunderbolt/tunnel.h |  5 +++--
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 89676acf1290..f38f7753b6e4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -180,19 +180,14 @@ static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 {
 	struct tb_tunnel *tunnel;

-	tunnel = kzalloc_obj(*tunnel);
+	tunnel = kzalloc_flex(*tunnel, paths, npaths);
 	if (!tunnel)
 		return NULL;

-	tunnel->paths = kzalloc_objs(tunnel->paths[0], npaths);
-	if (!tunnel->paths) {
-		kfree(tunnel);
-		return NULL;
-	}
+	tunnel->npaths = npaths;

 	INIT_LIST_HEAD(&tunnel->list);
 	tunnel->tb = tb;
-	tunnel->npaths = npaths;
 	tunnel->type = type;
 	kref_init(&tunnel->kref);

@@ -219,7 +214,6 @@ static void tb_tunnel_destroy(struct kref *kref)
 			tb_path_free(tunnel->paths[i]);
 	}

-	kfree(tunnel->paths);
 	kfree(tunnel);
 }

diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 2c44fc8a10bc..4878763a82b3 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -37,7 +37,6 @@ enum tb_tunnel_state {
  * @src_port: Source port of the tunnel
  * @dst_port: Destination port of the tunnel. For discovered incomplete
  *	      tunnels may be %NULL or null adapter port instead.
- * @paths: All paths required by the tunnel
  * @npaths: Number of paths in @paths
  * @pre_activate: Optional tunnel specific initialization called before
  *		  activation. Can touch hardware.
@@ -69,13 +68,13 @@ enum tb_tunnel_state {
  * @dprx_work: Worker that is scheduled to poll completion of DPRX capabilities read
  * @callback: Optional callback called when DP tunnel is fully activated
  * @callback_data: Optional data for @callback
+ * @paths: All paths required by the tunnel
  */
 struct tb_tunnel {
 	struct kref kref;
 	struct tb *tb;
 	struct tb_port *src_port;
 	struct tb_port *dst_port;
-	struct tb_path **paths;
 	size_t npaths;
 	int (*pre_activate)(struct tb_tunnel *tunnel);
 	int (*activate)(struct tb_tunnel *tunnel, bool activate);
@@ -107,6 +106,8 @@ struct tb_tunnel {
 	struct delayed_work dprx_work;
 	void (*callback)(struct tb_tunnel *tunnel, void *data);
 	void *callback_data;
+
+	struct tb_path *paths[] __counted_by(npaths);
 };

 struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
--
2.53.0


