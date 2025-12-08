Return-Path: <linux-usb+bounces-31294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F800CAE570
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35988307DC70
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE652FD68A;
	Mon,  8 Dec 2025 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="NMHBW4Ng"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5A2D7DE2;
	Mon,  8 Dec 2025 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233793; cv=none; b=pE1rfoVcBsnrAda/W+w2kjygm4saZTUt2iLVViREgnpaHfA+9XlCrhbQecrSpA3x3h3hFtmmqmA/Z0BC8Rt5vEkfwJFk2r5wUtABtRwFlqmF3+wxUAJ1bfWcnFY858jAXM15hmLq0jZOAVhh+szaZbbNXjxHLZDQYoxbP0PhTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233793; c=relaxed/simple;
	bh=rP9m/rvG+prYCOhaV5Vk15KN9R/2YCE3Pl0ckBAm7Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hW8EN208ErQVkPytzlOZ3JaHld8XmxSc6zzlIe7cvNmDu5dIkiXZb/Is71BXkjSPVY1m3MPZF84cjvj8QdXYi/4Te+BIPbIedbbN1ZqxJRl9kocUQ7fKY8ObPjGhzIobgqcS3d95R6Y8MA387PS8tSo4t3B4kA5EpQcRt/IaT5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=NMHBW4Ng; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjwh-00EpuF-S7; Mon, 08 Dec 2025 23:43:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=H2G28ggF6h59sr0IjReK2Fd4VYXjVxOwedV//eDOpk8=; b=NMHBW4NgTQsxASpJrFw/dpx5PA
	IQp+kFQzedem1dkH2qxKKnxjY+b1G8wyM15CCaBx6W1j09smX1J193Nw68Cn9NalsZTg2dzQ0rN9j
	yKJgK+LTCTcyADHBfGbKyzasV7NKpyiExaNvrjNIOyECYiGVfK2MPfLlwKbuwB4XOdB7MgYhOZzGY
	KQ/qQEPG54wdDh+xPpGu5C0btsprM8s+NrYkqqvr5spZVIMgrrz18/q1NIhdNBqGOdluENpZnz/lU
	aLihliPBjnOP2Fxum5ZWcl5P9ElMH8JUw9xMH6qVIMzF5rnY9BhlMN4LITGIP0Zykpd+3zwGYbJyc
	sv4ZsClQ==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjwh-0001td-4V; Mon, 08 Dec 2025 23:43:07 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSjwf-00Ay0v-Ua; Mon, 08 Dec 2025 23:43:06 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 1/9] nfp: Call FIELD_PREP() in NFP_ETH_SET_BIT_CONFIG() wrapper
Date: Mon,  8 Dec 2025 22:42:42 +0000
Message-Id: <20251208224250.536159-2-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251208224250.536159-1-david.laight.linux@gmail.com>
References: <20251208224250.536159-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

Rather than use a define that should be internal to the implementation
of FIELD_PREP(), pass the shifted 'val' to nfp_eth_set_bit_config()
and change the test for 'value unchanged' to match.

This is a simpler change than the one used to avoid calling both
FIELD_GET() and FIELD_PREP() with non-constant mask values.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 .../ethernet/netronome/nfp/nfpcore/nfp_nsp_eth.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp_eth.c b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp_eth.c
index 5cfddc9a5d87..4a71ff47fbef 100644
--- a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp_eth.c
+++ b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp_eth.c
@@ -509,8 +509,7 @@ int nfp_eth_set_configured(struct nfp_cpp *cpp, unsigned int idx, bool configed)
 
 static int
 nfp_eth_set_bit_config(struct nfp_nsp *nsp, unsigned int raw_idx,
-		       const u64 mask, const unsigned int shift,
-		       u64 val, const u64 ctrl_bit)
+		       const u64 mask, u64 shifted_val, const u64 ctrl_bit)
 {
 	union eth_table_entry *entries = nfp_nsp_config_entries(nsp);
 	unsigned int idx = nfp_nsp_config_idx(nsp);
@@ -527,11 +526,11 @@ nfp_eth_set_bit_config(struct nfp_nsp *nsp, unsigned int raw_idx,
 
 	/* Check if we are already in requested state */
 	reg = le64_to_cpu(entries[idx].raw[raw_idx]);
-	if (val == (reg & mask) >> shift)
+	if (shifted_val == (reg & mask))
 		return 0;
 
 	reg &= ~mask;
-	reg |= (val << shift) & mask;
+	reg |= shifted_val;
 	entries[idx].raw[raw_idx] = cpu_to_le64(reg);
 
 	entries[idx].control |= cpu_to_le64(ctrl_bit);
@@ -571,12 +570,9 @@ int nfp_eth_set_idmode(struct nfp_cpp *cpp, unsigned int idx, bool state)
 	return nfp_eth_config_commit_end(nsp);
 }
 
-#define NFP_ETH_SET_BIT_CONFIG(nsp, raw_idx, mask, val, ctrl_bit)	\
-	({								\
-		__BF_FIELD_CHECK(mask, 0ULL, val, "NFP_ETH_SET_BIT_CONFIG: "); \
-		nfp_eth_set_bit_config(nsp, raw_idx, mask, __bf_shf(mask), \
-				       val, ctrl_bit);			\
-	})
+#define NFP_ETH_SET_BIT_CONFIG(nsp, raw_idx, mask, val, ctrl_bit)	  \
+	nfp_eth_set_bit_config(nsp, raw_idx, mask, FIELD_PREP(mask, val), \
+			       ctrl_bit)
 
 /**
  * __nfp_eth_set_aneg() - set PHY autonegotiation control bit
-- 
2.39.5


