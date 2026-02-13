Return-Path: <linux-usb+bounces-33341-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJsPNF96j2mWRAEAu9opvQ
	(envelope-from <linux-usb+bounces-33341-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:24:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7C1392B7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8CE63099312
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FF3288510;
	Fri, 13 Feb 2026 19:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qrk9arAq"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98F827FB18;
	Fri, 13 Feb 2026 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010613; cv=none; b=LXtqbz2beniB9A5LXOh40eqF1g3AXkBUodjXsAx/xvsZgTbQfPg3dBGyYoEWCEaIpSMEznMoY2eUOFCgP0j67NBqddvGfKOh0x/E1pTKsmDIqp4y6vuF5d3qzJP+VJJKcC4VCnKOsUuAhmCN1DUP0jjqOXix+5VmqqAPpyAmfxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010613; c=relaxed/simple;
	bh=M+WLPqbnlvkdrK7+r+T1xzP3XzAmnVGjqP9vT+jSuFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSYMj3acMWuMbT2mqPTjZoUfDuXVals4Aypresmi4St0rWaHq5lVxkPj8+aL/Gd/+po8K+umkCb/iC8pgHa1T4puZVQgp0YEwKANOPnp2QPQE345BELCvBMd+BzXJWTST7utykSDZroZf5xmmy1CZP4N3AIO266HGp0UP5eYbHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qrk9arAq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771010610;
	bh=M+WLPqbnlvkdrK7+r+T1xzP3XzAmnVGjqP9vT+jSuFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qrk9arAqOKjfK7Zoo6GBGaLw7yCzoeMpkyz8oNfRsfuo0GYGPRo1L5nGDVi3LObvP
	 CEHBEJj1IvBxAixS2Ghb95JNFTgHPYmJOVtnW4U12bKtr8+k/ShgqCeDUCMsY2l1NH
	 PtzznVd4AdFeL2Eo7kTR11Lifjwfx+I9BE3ZcL55d48dmQPBY5r/HqHhBxp/h8yDoR
	 K6LaHPnID8k14+RikeePOJ7K126AdEwPKS2c6e1tb9Z0koQChX9LChmIhhjA7vcpJ7
	 hot1Vd/Uxb2N27gtbUlrcQ0BMGCOcQ+rKnGorldnrq+tqL09rJ3yBfRvf3CCG+N65z
	 fbpmKp499jEiw==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23A7517E0C21;
	Fri, 13 Feb 2026 20:23:30 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D0DB6480026; Fri, 13 Feb 2026 20:23:29 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 20:23:29 +0100
Subject: [PATCH 2/2] usb: typec: mux: avoid duplicated mux switches
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-typec-mux-duplication-fix-v1-2-70076a7c5691@collabora.com>
References: <20260213-typec-mux-duplication-fix-v1-0-70076a7c5691@collabora.com>
In-Reply-To: <20260213-typec-mux-duplication-fix-v1-0-70076a7c5691@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=M+WLPqbnlvkdrK7+r+T1xzP3XzAmnVGjqP9vT+jSuFY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPejHBuJRulD+JZiy2b436nL5C+jYNipJI6
 C64SuRIuwsoQIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpj3oxAAoJENju1/PI
 O/qa+CIP+wRvR/qbmvwsKYSI7kEiJsh8df74ID+xdDyHxh8L04nzMXYrXSMAxVqkph2eBPJPDua
 0IcUptWZaLi7OYAwwj4W7hIgyYVCKaycqwmBnKVLcAYV6GFnkUguiW8WrwMetNs4TXd4dtC+sJS
 T5RAXD/djc02/a+YRQ5A0fnm00nC4qMXioDCWVsG25WWmHMF2T93870JRAWDKnsBGBSTFuu4mA0
 q274mySLQS3z4L2OF/92WdIywGMeXzGtRlUGpY8q3dWD86EKSAOJuHQsPn94XPKmSs5viCPFP8A
 maTW+uAUXROYY0FfHUKLZoww1BZ+s5XV0gHDEOCuiWWJIAnM0wtH03GjEbtQODFRImdgEmPZX/j
 TXBPwkYy8io9AA/jqSHNNmrvrrcqoKru/Sl8YeBHwRvzQmPMlAv9qD3YBCemGvLmj4ZK2y/3kW+
 EHhd46W9VrRcpXe4mQRB2I8LkfYTI5u6YoNijQG8nWT5Sb7esozip7bquZcoe6pwLB7v4Tkwqcx
 jSJrr7toyFRj0X/tpj50+OpwDqJlraqNMefELsRluY4fM4UoMktwNZQRoAFRWcVUPAcl36G9jfJ
 0juSjXe1IFje+7/HeRQLUqb1+Kq/2tgnAT3c+UgZx4rkVFwup+jFeoId3XWkAvSlHZqgf0MiNZi
 aNImpOpaQ5Geq+rWhRYAt+w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_FROM(0.00)[bounces-33341-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 34F7C1392B7
X-Rspamd-Action: no action

Some devices use combo PHYs (i.e. USB3 + DisplayPort), which also
handle the lane muxing. These PHYs are referenced twice from
the USB-C connector (USB super-speed lines and SBU/AUX lines)
resulting in the mux being configured twice. Avoid this by
dropping duplicates.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/mux.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index db35b7398343..6a394326f236 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -309,9 +309,9 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
 {
 	struct typec_mux_dev *mux_devs[TYPEC_MUX_MAX_DEVS];
 	struct typec_mux *mux;
+	int i, j, k;
 	int count;
 	int err;
-	int i;
 
 	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -333,6 +333,18 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
 		}
 	}
 
+	/* eliminate duplicates */
+	for (i = 0; i < count; i++) {
+		for (j = i + 1; j < count; j++) {
+			if (mux_devs[j] == mux_devs[i]) {
+				put_device(&mux_devs[j]->dev);
+				for (k = j; k < count; k++)
+					mux_devs[k] = mux_devs[k+1];
+				count--;
+			}
+		}
+	}
+
 	for (i = 0; i < count; i++) {
 		WARN_ON(!try_module_get(mux_devs[i]->dev.parent->driver->owner));
 		mux->mux_devs[i] = mux_devs[i];

-- 
2.51.0


