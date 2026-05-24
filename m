Return-Path: <linux-usb+bounces-37983-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MRfEf/3EmoY5wYAu9opvQ
	(envelope-from <linux-usb+bounces-37983-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B42C25C2731
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54698300E257
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 13:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBB1397332;
	Sun, 24 May 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="BbVWijOl"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F0C395AEC;
	Sun, 24 May 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628014; cv=none; b=G9vvrWFPMMDSNDDqgdz5FIvYw4cA3XRvwfHn9wqUW2gld5NsQDKwwEP2dwsidYJhhRtl+Zgp1iWpRcoYzhgHE3wBMEK5i2IumMItevigr8gB/C5wjxKags+invtKwwuITNC8i/wYo0l882/Z7Q6SoJoyA8hrP3v/ot73ObSOgxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628014; c=relaxed/simple;
	bh=6X8NR0jeE8pCWr2zrAvPWg9ZdkccDuB8rGmEkJD1jnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+pawkqVW9dv/+ys1FzklgigynMBMMB9U6unw2ChWwp8sheQHB0aKOZMH/MqaVVOR0bT3rC2cRl+KqcznGadrICgnHTwANFVxw7LTJkralqbfoRQfy9nXl+Adexg6x3JoFvlpR7gmkNBt8Fq/zfK8MsiMxQ0gvciSGkLJhsBmsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=BbVWijOl; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779628008;
	bh=6X8NR0jeE8pCWr2zrAvPWg9ZdkccDuB8rGmEkJD1jnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BbVWijOly2br8AG9ZIMUkXE6BYuJTsM16oYP7K3Ee1TloksD8FsOFYvRRPBKylj1x
	 nP0sS+raBOC2X5ORVZAKmRKj8Of1GxLS71ELvDVjI2OR8Q4Zj8j7PfiQIiK+riQVjV
	 Slj4vG0FAlrcMQl94YisFy+ITbHMB09rd1K2XtdQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 24 May 2026 15:06:45 +0200
Subject: [PATCH 3/6] thunderbolt: property: Make format_dwdata() work on
 big-endian systems
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260524-thunderbolt-big-endian-v1-3-6044edca78e7@weissschuh.net>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
In-Reply-To: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yehezkel Bernat <yehezkel.bernat@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779628007; l=952;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6X8NR0jeE8pCWr2zrAvPWg9ZdkccDuB8rGmEkJD1jnU=;
 b=y05lb92ef4IGCyHxE2upeNuGhoycJdkqU20QO4PSaPAByfVmx7X8bjmMjEEJcNyJKQeNuHzWB
 +kSimBUOdfaA8nsoT3KZR5FYUEccBTJSHyP9BcpbBc/SZr5v7gR5cAE
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37983-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B42C25C2731
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The data also needs to be swapped on big-endian systems.

Use swab32() which works independently from the host byte order.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/thunderbolt/property.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index fb96608ca471..94314fa07d23 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -43,7 +43,8 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 
 static inline void parse_dwdata(void *dst, const void *src, size_t dwords)
 {
-	be32_to_cpu_array(dst, src, dwords);
+	for (size_t i = 0; i < dwords; i++)
+		((u32 *)dst)[i] = swab32(((u32 *)src)[i]);
 }
 
 static inline void format_dwdata(void *dst, const void *src, size_t dwords)

-- 
2.54.0


