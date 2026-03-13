Return-Path: <linux-usb+bounces-34766-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IVlDK+EtGkHpQAAu9opvQ
	(envelope-from <linux-usb+bounces-34766-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 22:42:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3B28A2BA
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 22:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E207030AC4F0
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 21:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC18D383C6F;
	Fri, 13 Mar 2026 21:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLEqCmJz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556EB36EAAB
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773438118; cv=none; b=P+6pb/9nh+0fakaHO4rtCjkr4fHShJyXFF2nSKXOPOr9dP9C53z2ahiS51PbGrFu86KA5vl8GYotxsY/nW1GbYOyBga/7P8qThhT3kD4eq2q8HuUs5m50qmen1UzAp8JKuPWEjn83XY/YoE1cQBZqd9tDLgA+NrreTy7tlUzt48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773438118; c=relaxed/simple;
	bh=BBpW0etnw/hP2LVL19ojEZLuEJCEt7FBQzOYplr9sN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fz8h3jVIUs9R9Zt7OBb/BzefmH2nTqZEeEZMJNVRZDvkZuxY3TrFtOGT5maHy1jH0ym1q7mrR3fPCHBOVIdm1JT7e1q/8F0ascMSf2NanvLghOQDDiI27KSKWr6/Y3WjOng8U2sDpHI+UIovK96usBOAPYl2SZZSrYaa1NdYm9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLEqCmJz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35a08ce49dcso2466390a91.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 14:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773438116; x=1774042916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bqQlPXXejS+24lEbQNIXHwAsb1GxMI+RcGZK0IPx/X0=;
        b=hLEqCmJzOJC+UE+I5n9oYY5PEqlCuWPKrh2g1axgr6wZmHACoBqKy5djPmF7VAyHMy
         gjZHickbkw7LhpjzY3PYx01yzZ/b9pugGvXOjdX6PyjTaqC8zJkRqb9OAC0XCSSijjcn
         lycelo52hP5kXI6sqQ1p/DgBkBIR+D9c/Tn0i0tRPoyZG3JsR40tQLwVtEUgLIDo59k6
         FsdfV5F8lKvNcTNLkkKPGbBTp205ctBsNennuKfALFNWzunMNdR1PfW6SgkiW4f0Wfvh
         BDCJNLgpgHw0LV+57eWewQEo0T87AgbMcSS/0b8J32Gv/xCl4chZdmHh0k3mr3IOpF3h
         BTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773438116; x=1774042916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqQlPXXejS+24lEbQNIXHwAsb1GxMI+RcGZK0IPx/X0=;
        b=tUPkt6nI2RwEvG73URLp2ai8Oq46f4cC1VfWbpkE2NZeDZeGmbmoIaaOiTRAzpHO9l
         iq7reMmwiOsjJq6p4pPXqhwenw1iO3gDpMOUU0qGHQHWmNMggLGj1TzzQLw7phuK83VN
         6agQmsGg6ILe+F0Kh4hZvjD2MGxHZIThop4xjW2dIlUQWi0fTzqZicthnt7axuBlPald
         oFFdod8ISzwCxi67aHHXdaE8TRHV+b+/Ic3/zBAHHE9KfDDQMduCIiP/+ooc+Ecvbgmx
         9JfWSjl7uad23dezV9jSdwtKUAHjrhmKh3vF7wr37ddxFUlFDEEkJrhvAfWsM5QnBqlE
         Qlhw==
X-Gm-Message-State: AOJu0Ywxhc+KMlIHib/zZZW5jog7foF+4XwM3S/sl7F/52dPxZCbdPam
	gLsFaDnuKLAEqqc+2X6AkWqQOr7rxQ5RW1UsnVmQwrIVRtAgpYhvJGQ6njRr1VqU
X-Gm-Gg: ATEYQzzDqMij/6SFf4ctvrVBgRreQjW0C22mR219jnA2G24XlLup+0A5iy2Ae0qHNgG
	Sn32ax6hO7ZK9FYmgOiFb5mBWAT1d7933Gdb8xFSBtwIG8WFaDAt4myF7CYW8/JNt8A+3PdeAB1
	82nef0bZ2BRB4vbP9QxB7I0dxPIOztYcRORdH9gYa66lQgmba3EQ1bcMsbv9Wec/t+xYefdLyjd
	FoUtq9oSQCrliALDFHzLZHv9bPMnfAMciEQSKMYIe82kaqe2xlVtdI+pJBgg3PS2rxdfLiYV6ey
	/GtzbxEZhAECs3g9Xbu5L2fyT0H39PB19rhEiJIFu9dt+JSEgu7bfSBt67fGnpk2yqxoeSfCX7k
	geAKwHrzP8DT7Ew6aG+wQ38oKa3cVL6IxqHNbIWwCTHJniuAR7lCcYZUDlxsF+FqKCYzqVHRRZA
	V4gkcUkpZLlwONWTLZugpJA8gpvJMoSeg2+1n27tWrBd2910NwFeK3Wg==
X-Received: by 2002:a17:90a:d88b:b0:359:fd9a:c513 with SMTP id 98e67ed59e1d1-35a220a8903mr4382138a91.24.1773438116333;
        Fri, 13 Mar 2026 14:41:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ffe078sm9766832a91.13.2026.03.13.14.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 14:41:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] thunderbolt: dma_port: kmalloc_array + kzalloc to flex
Date: Fri, 13 Mar 2026 14:41:37 -0700
Message-ID: <20260313214137.4257-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34766-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5B3B28A2BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a single allocation with a flexible array member. Simplifies
allocation and freeing.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/thunderbolt/dma_port.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/dma_port.c b/drivers/thunderbolt/dma_port.c
index 334fefe21255..c7c2942fa7be 100644
--- a/drivers/thunderbolt/dma_port.c
+++ b/drivers/thunderbolt/dma_port.c
@@ -55,7 +55,7 @@ struct tb_dma_port {
 	struct tb_switch *sw;
 	u8 port;
 	u32 base;
-	u8 *buf;
+	u8 buf[];
 };
 
 /*
@@ -209,16 +209,10 @@ struct tb_dma_port *dma_port_alloc(struct tb_switch *sw)
 	if (port < 0)
 		return NULL;
 
-	dma = kzalloc_obj(*dma);
+	dma = kzalloc_flex(*dma, buf, MAIL_DATA_DWORDS);
 	if (!dma)
 		return NULL;
 
-	dma->buf = kmalloc_array(MAIL_DATA_DWORDS, sizeof(u32), GFP_KERNEL);
-	if (!dma->buf) {
-		kfree(dma);
-		return NULL;
-	}
-
 	dma->sw = sw;
 	dma->port = port;
 	dma->base = DMA_PORT_CAP;
@@ -232,10 +226,7 @@ struct tb_dma_port *dma_port_alloc(struct tb_switch *sw)
  */
 void dma_port_free(struct tb_dma_port *dma)
 {
-	if (dma) {
-		kfree(dma->buf);
-		kfree(dma);
-	}
+	kfree(dma);
 }
 
 static int dma_port_wait_for_completion(struct tb_dma_port *dma,
-- 
2.53.0


