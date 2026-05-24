Return-Path: <linux-usb+bounces-37986-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id czDuKv73EmoY5wYAu9opvQ
	(envelope-from <linux-usb+bounces-37986-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD65C272F
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A31E830041E1
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 13:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A105A39769A;
	Sun, 24 May 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DBW9ec3P"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4E03955FF;
	Sun, 24 May 2026 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628014; cv=none; b=FEtuEF/DD2bBCOz2L9HswNYQCcD9h7weGxx/e0dW52lRmZAzBsl2PnvCxVTOpIcPKxvuQSKxO1tq6AsXNpJvQOEzNSNX/m7XevvQ6ofOmXTqQ90Dtgl6K6TKLQdLpS/GxnVlTokmD1ZFJTwSEUAsVfdbO8UJmxN/AvCFtOiooHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628014; c=relaxed/simple;
	bh=wuEPiBeRZL1CQrVYEoBhtUX5fd2eCjhw/OhLyxncI8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3Sb5s9kuYthokIc0mg4LPRF7Paqq/v39OobyvNJrJd0CGY2YAttnGKEQALyHhNoUMgKeQYXEKGdFNTwD96v/YP6YiIojplPRn28MZR2sOMvx8EhCrUwOyG1pgEe+amhfcnxu0OE7OdX/+KYKtMoW3IgG10xU8mD8GHYIVAegGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DBW9ec3P; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779628008;
	bh=wuEPiBeRZL1CQrVYEoBhtUX5fd2eCjhw/OhLyxncI8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DBW9ec3PNbkt9GB1tYVbZ0yp2SOlh4Qa+jVrFta0OTu11frSIQex6JkM7cS7t77LK
	 WZm4CD5Z9yVuwN+8e0Wde+TYy9hmSZFl1e45JXXk0q1bfRJvNpoAZOYQOGbqtPzWhX
	 31LTgjlBSHJwOkByDyYHKM0G5EqBT2+kJS83dsNI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 24 May 2026 15:06:46 +0200
Subject: [PATCH 4/6] thunderbolt: property: Convert byte order of numeric
 fields
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260524-thunderbolt-big-endian-v1-4-6044edca78e7@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779628007; l=5898;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=wuEPiBeRZL1CQrVYEoBhtUX5fd2eCjhw/OhLyxncI8E=;
 b=xU1xnLp2GCRm0/BDLr3w1EdP3belohnpEnPR0nJWRx9LWd+HrZt/UXJDgRmRdVAc4ufDc+qqb
 j4A0bcAI4h5DempukSxDBYYPt3qYQ1GOqP6LftNBho9vdn0TNeX5ZcN
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37986-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3CBD65C272F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On big-endian system the numeric fields need to be converted after
reading them from the wireformat before they can be used.

Add the necessary conversion.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/thunderbolt/property.c | 72 +++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 94314fa07d23..0cdf1c03efc6 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -15,17 +15,17 @@
 #include <linux/thunderbolt.h>
 
 struct tb_property_entry {
-	u32 key_hi;
-	u32 key_lo;
-	u16 length;
+	__le32 key_hi;
+	__le32 key_lo;
+	__le16 length;
 	u8 reserved;
 	u8 type;
-	u32 value;
+	__le32 value;
 };
 
 struct tb_property_rootdir_entry {
-	u32 magic;
-	u32 length;
+	__le32 magic;
+	__le32 length;
 	struct tb_property_entry entries[];
 };
 
@@ -61,15 +61,16 @@ static bool tb_property_entry_valid(const struct tb_property_entry *entry,
 	case TB_PROPERTY_TYPE_DIRECTORY:
 	case TB_PROPERTY_TYPE_DATA:
 	case TB_PROPERTY_TYPE_TEXT:
-		if (entry->length > block_len)
+		if (le16_to_cpu(entry->length) > block_len)
 			return false;
-		if (check_add_overflow(entry->value, entry->length, &end) ||
+		if (check_add_overflow(le32_to_cpu(entry->value),
+				       le16_to_cpu(entry->length), &end) ||
 		    end > block_len)
 			return false;
 		break;
 
 	case TB_PROPERTY_TYPE_VALUE:
-		if (entry->length != 1)
+		if (le16_to_cpu(entry->length) != 1)
 			return false;
 		break;
 	}
@@ -116,12 +117,14 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 	if (!property)
 		return NULL;
 
-	property->length = entry->length;
+	property->length = le16_to_cpu(entry->length);
 
 	switch (property->type) {
 	case TB_PROPERTY_TYPE_DIRECTORY:
-		dir = __tb_property_parse_dir(block, block_len, entry->value,
-					      entry->length, false, depth + 1);
+		dir = __tb_property_parse_dir(block, block_len,
+					      le32_to_cpu(entry->value),
+					      le16_to_cpu(entry->length),
+					      false, depth + 1);
 		if (!dir) {
 			kfree(property);
 			return NULL;
@@ -136,8 +139,9 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 			kfree(property);
 			return NULL;
 		}
-		parse_dwdata(property->value.data, block + entry->value,
-			     entry->length);
+		parse_dwdata(property->value.data,
+			     block + le32_to_cpu(entry->value),
+			     le16_to_cpu(entry->length));
 		break;
 
 	case TB_PROPERTY_TYPE_TEXT:
@@ -147,14 +151,15 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 			kfree(property);
 			return NULL;
 		}
-		parse_dwdata(property->value.text, block + entry->value,
-			     entry->length);
+		parse_dwdata(property->value.text,
+			     block + le32_to_cpu(entry->value),
+			     le16_to_cpu(entry->length));
 		/* Force null termination */
 		property->value.text[property->length * 4 - 1] = '\0';
 		break;
 
 	case TB_PROPERTY_TYPE_VALUE:
-		property->value.immediate = entry->value;
+		property->value.immediate = le32_to_cpu(entry->value);
 		break;
 
 	default:
@@ -240,12 +245,13 @@ struct tb_property_dir *tb_property_parse_dir(const u32 *block,
 	const struct tb_property_rootdir_entry *rootdir =
 		(const struct tb_property_rootdir_entry *)block;
 
-	if (rootdir->magic != TB_PROPERTY_ROOTDIR_MAGIC)
+	if (le32_to_cpu(rootdir->magic) != TB_PROPERTY_ROOTDIR_MAGIC)
 		return NULL;
-	if (rootdir->length > block_len)
+	if (le32_to_cpu(rootdir->length) > block_len)
 		return NULL;
 
-	return __tb_property_parse_dir(block, block_len, 0, rootdir->length,
+	return __tb_property_parse_dir(block, block_len, 0,
+				       le32_to_cpu(rootdir->length),
 				       true, 0);
 }
 
@@ -438,8 +444,8 @@ static ssize_t __tb_property_format_dir(const struct tb_property_dir *dir,
 		struct tb_property_rootdir_entry *re;
 
 		re = (struct tb_property_rootdir_entry *)&block[start_offset];
-		re->magic = TB_PROPERTY_ROOTDIR_MAGIC;
-		re->length = dir_len - sizeof(*re) / 4;
+		re->magic = cpu_to_le32(TB_PROPERTY_ROOTDIR_MAGIC);
+		re->length = cpu_to_le32(dir_len - sizeof(*re) / 4);
 		entry = re->entries;
 	}
 
@@ -456,31 +462,31 @@ static ssize_t __tb_property_format_dir(const struct tb_property_dir *dir,
 						       block_len);
 			if (ret < 0)
 				return ret;
-			entry->length = tb_property_dir_length(child, false,
-							       NULL);
-			entry->value = dir_end;
+			entry->length = cpu_to_le16(
+				tb_property_dir_length(child, false, NULL));
+			entry->value = cpu_to_le32(dir_end);
 			dir_end = ret;
 			break;
 
 		case TB_PROPERTY_TYPE_DATA:
 			format_dwdata(&block[data_offset], property->value.data,
 				      property->length);
-			entry->length = property->length;
-			entry->value = data_offset;
-			data_offset += entry->length;
+			entry->length = cpu_to_le16(property->length);
+			entry->value = cpu_to_le32(data_offset);
+			data_offset += property->length;
 			break;
 
 		case TB_PROPERTY_TYPE_TEXT:
 			format_dwdata(&block[data_offset], property->value.text,
 				      property->length);
-			entry->length = property->length;
-			entry->value = data_offset;
-			data_offset += entry->length;
+			entry->length = cpu_to_le16(property->length);
+			entry->value = cpu_to_le32(data_offset);
+			data_offset += property->length;
 			break;
 
 		case TB_PROPERTY_TYPE_VALUE:
-			entry->length = property->length;
-			entry->value = property->value.immediate;
+			entry->length = cpu_to_le16(property->length);
+			entry->value = cpu_to_le32(property->value.immediate);
 			break;
 
 		default:

-- 
2.54.0


