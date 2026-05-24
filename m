Return-Path: <linux-usb+bounces-37989-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JkqOID4Emob5wYAu9opvQ
	(envelope-from <linux-usb+bounces-37989-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:09:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5D5C27BE
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CE87302A7E0
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 13:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02975395AEC;
	Sun, 24 May 2026 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ggUr4SOb"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACDC397E89;
	Sun, 24 May 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628018; cv=none; b=VPjFAD1emV4cMT21f8+JEN6Ii0BX30pPBgBWerFws3nA8ZVFKtSEdeT6+eYvsHKCuM6XvN0WGrMgjUYaFf7s0FoQ1MzC5zIDqCYs/xqKmP8VrEW8HiujHhYqlGZvB4s+LNFKACUGoPuaPsiKgaIUD99yXMAQ+z2G5jInBOVDb6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628018; c=relaxed/simple;
	bh=/Vtaxk+1WG7zj3pzj6DjjKr4B5prkrZSAYDSjnycjHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpQ+fscGReovu9tjmWhmPNI5MKKy/aqZd8+/R4kZpy5nQ+oIwD6ysyGOqA7j+V91C5v2LxM18Dw0mWnJQl2QGntJ6aZ4hga+fdQw7zHD+PfPdqexK1cEIbnyapaFrA3GBpgDLXwvGLjTuxqQaqc0/XB0puHev8Ff1OkWRgFGwYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ggUr4SOb; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779628008;
	bh=/Vtaxk+1WG7zj3pzj6DjjKr4B5prkrZSAYDSjnycjHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ggUr4SObUHGmm2ODMrfdo/wK2QXiyrqNqFI4e4VQa948nhn4dAwchaPClwPX+oppT
	 IOd0S59vwd1Rm+xfjHCq93L8+QH1Jz8fY9qjGcAG6hl4CbsevmeLPsSYb9BxwP/5d1
	 FokL7zrbz24OlFexJXQhkoeRjrt6TChBzWJC8ez8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 24 May 2026 15:06:47 +0200
Subject: [PATCH 5/6] thunderbolt: property: Unify
 parse_dwdata()/format_dwdata()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260524-thunderbolt-big-endian-v1-5-6044edca78e7@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779628007; l=3600;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=/Vtaxk+1WG7zj3pzj6DjjKr4B5prkrZSAYDSjnycjHw=;
 b=c1RRqN5R/S1GU1mvZPL7AdVBbG4s41iUitpT5fWHqru8GylPdKAresbBONxYwA+SHWiqHHno6
 FW2PHoLu0eoBc4f8m6+/TQIigQaSaN/9hljdqqR2KgFlCmFrXNRtmc2
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37989-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 50D5D5C27BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both functions do the same. Unify them.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/thunderbolt/property.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 0cdf1c03efc6..961efcec1795 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -41,17 +41,12 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	size_t block_len, unsigned int dir_offset, size_t dir_len,
 	bool is_root, unsigned int depth);
 
-static inline void parse_dwdata(void *dst, const void *src, size_t dwords)
+static inline void convert_dwdata(void *dst, const void *src, size_t dwords)
 {
 	for (size_t i = 0; i < dwords; i++)
 		((u32 *)dst)[i] = swab32(((u32 *)src)[i]);
 }
 
-static inline void format_dwdata(void *dst, const void *src, size_t dwords)
-{
-	return parse_dwdata(dst, src, dwords);
-}
-
 static bool tb_property_entry_valid(const struct tb_property_entry *entry,
 				  size_t block_len)
 {
@@ -110,7 +105,7 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 	if (!tb_property_entry_valid(entry, block_len))
 		return NULL;
 
-	parse_dwdata(key, entry, 2);
+	convert_dwdata(key, entry, 2);
 	key[TB_PROPERTY_KEY_SIZE] = '\0';
 
 	property = tb_property_alloc(key, entry->type);
@@ -139,9 +134,9 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 			kfree(property);
 			return NULL;
 		}
-		parse_dwdata(property->value.data,
-			     block + le32_to_cpu(entry->value),
-			     le16_to_cpu(entry->length));
+		convert_dwdata(property->value.data,
+			       block + le32_to_cpu(entry->value),
+			       le16_to_cpu(entry->length));
 		break;
 
 	case TB_PROPERTY_TYPE_TEXT:
@@ -151,9 +146,9 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 			kfree(property);
 			return NULL;
 		}
-		parse_dwdata(property->value.text,
-			     block + le32_to_cpu(entry->value),
-			     le16_to_cpu(entry->length));
+		convert_dwdata(property->value.text,
+			       block + le32_to_cpu(entry->value),
+			       le16_to_cpu(entry->length));
 		/* Force null termination */
 		property->value.text[property->length * 4 - 1] = '\0';
 		break;
@@ -452,7 +447,7 @@ static ssize_t __tb_property_format_dir(const struct tb_property_dir *dir,
 	list_for_each_entry(property, &dir->properties, list) {
 		const struct tb_property_dir *child;
 
-		format_dwdata(entry, property->key, 2);
+		convert_dwdata(entry, property->key, 2);
 		entry->type = property->type;
 
 		switch (property->type) {
@@ -469,16 +464,16 @@ static ssize_t __tb_property_format_dir(const struct tb_property_dir *dir,
 			break;
 
 		case TB_PROPERTY_TYPE_DATA:
-			format_dwdata(&block[data_offset], property->value.data,
-				      property->length);
+			convert_dwdata(&block[data_offset], property->value.data,
+				       property->length);
 			entry->length = cpu_to_le16(property->length);
 			entry->value = cpu_to_le32(data_offset);
 			data_offset += property->length;
 			break;
 
 		case TB_PROPERTY_TYPE_TEXT:
-			format_dwdata(&block[data_offset], property->value.text,
-				      property->length);
+			convert_dwdata(&block[data_offset], property->value.text,
+				       property->length);
 			entry->length = cpu_to_le16(property->length);
 			entry->value = cpu_to_le32(data_offset);
 			data_offset += property->length;

-- 
2.54.0


