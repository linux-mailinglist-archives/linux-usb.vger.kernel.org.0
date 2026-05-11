Return-Path: <linux-usb+bounces-37244-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BbjNT+vAWrXiAEAu9opvQ
	(envelope-from <linux-usb+bounces-37244-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 994C050BE22
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8E933025F4C
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3AC3D7D96;
	Mon, 11 May 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md1mDP6l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C83D75C7
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495274; cv=none; b=oNei5Dgr5/7n93rym0bvPqhlq8lK6j7dyuVWxDiHTtPVAuFFFVSH2JcgY35Z0bqW/CzKDMyZuOGcoX+StzD00TruPu271JDmE6OVp+iYknbCyMNR51pKIZTuZoMT2VnTQU4jlMKOcjWzHGAOCSxkX9WXVR9jHfd4wNKoWcNQBsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495274; c=relaxed/simple;
	bh=gKY+m2RtVcXm2VZoNIYMq/+KxJ4h9LPXmk9s/YJksto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cvm/Td/WBMq1cUGewOWa+4KYMq7mx5wxbkg62yiAcIyM4rG7IFtmlsFAgQjvxOx9o4FIOVvCQ9jKtaVc4x+hdiYpzQ0VhAHUIpd5rgIP77b26eUSz+Vci5WpesdpojZSzYN7P6SF6SNl3NGvMiAr0bHFiS6d4GwvRmBgkBTwpnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md1mDP6l; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495272; x=1810031272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gKY+m2RtVcXm2VZoNIYMq/+KxJ4h9LPXmk9s/YJksto=;
  b=Md1mDP6lcrGPmDO7MKnh11FFj6I2xbzBv3oZz5Cf/6emovNFY2CzuG7f
   RMH5+a51vTu34HdHnRWJf7AFRmvz/krE39kejg5K32b7pPsemi57jnfO+
   KqPwQGwcu98iaHeyTyvED5oIaTJG9taM8o14XkAforchIiiKrd/Xg/J3E
   r2QK8D1KyJqrJd2i58zoYExwsXhzwdz+l+Frjca8Wp2PlVK1N1FcOdiEJ
   ucZa7npheWy4juE/fQSfhqS3MeKDN1y07GIZjh3YP3MyHwCBFbIiT0QyK
   FgLnqqRB0GppSuu2MaYYYV67sa7M8vh1W3OyvNpPSwb19ES8XxKwNOB8/
   w==;
X-CSE-ConnectionGUID: nywk050uQLC5x8fzeYcWGg==
X-CSE-MsgGUID: aHhKbmCBTLWJSTNHOb/izA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79479097"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79479097"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:48 -0700
X-CSE-ConnectionGUID: G++d/9crQYqU2dvuxE7/VA==
X-CSE-MsgGUID: Gdo+ZntuTg2XZZwjUaBo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234358531"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 03:27:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8DD4198; Mon, 11 May 2026 12:27:44 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 01/10] thunderbolt: Add tb_property_merge_dir()
Date: Mon, 11 May 2026 12:27:35 +0200
Message-ID: <20260511102744.1867485-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 994C050BE22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,lunn.ch,lwn.net,linuxfoundation.org,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37244-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

This allows merging one XDomain property directory into another. We are
going to use this in the subsequent patch.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/property.c | 154 ++++++++++++++++++++++++---------
 include/linux/thunderbolt.h    |   3 +
 2 files changed, 114 insertions(+), 43 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 50cbfc92fe65..6b9666b61181 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -38,6 +38,7 @@ struct tb_property_dir_entry {
 static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	size_t block_len, unsigned int dir_offset, size_t dir_len,
 	bool is_root);
+static struct tb_property *tb_property_copy(const struct tb_property *property);
 
 static inline void parse_dwdata(void *dst, const void *src, size_t dwords)
 {
@@ -507,17 +508,9 @@ ssize_t tb_property_format_dir(const struct tb_property_dir *dir, u32 *block,
 	return ret < 0 ? ret : 0;
 }
 
-/**
- * tb_property_copy_dir() - Take a deep copy of directory
- * @dir: Directory to copy
- *
- * The resulting directory needs to be released by calling tb_property_free_dir().
- *
- * Return: Pointer to &struct tb_property_dir, %NULL in case of failure.
- */
-struct tb_property_dir *tb_property_copy_dir(const struct tb_property_dir *dir)
+static struct tb_property_dir *copy_dir(const struct tb_property_dir *dir)
 {
-	struct tb_property *property, *p = NULL;
+	struct tb_property *property, *p;
 	struct tb_property_dir *d;
 
 	if (!dir)
@@ -528,56 +521,131 @@ struct tb_property_dir *tb_property_copy_dir(const struct tb_property_dir *dir)
 		return NULL;
 
 	list_for_each_entry(property, &dir->properties, list) {
-		struct tb_property *p;
-
-		p = tb_property_alloc(property->key, property->type);
+		p = tb_property_copy(property);
 		if (!p)
 			goto err_free;
+		list_add_tail(&p->list, &d->properties);
+	}
 
-		p->length = property->length;
+	return d;
 
-		switch (property->type) {
-		case TB_PROPERTY_TYPE_DIRECTORY:
-			p->value.dir = tb_property_copy_dir(property->value.dir);
-			if (!p->value.dir)
-				goto err_free;
-			break;
+err_free:
+	tb_property_free_dir(d);
+	return NULL;
+}
 
-		case TB_PROPERTY_TYPE_DATA:
-			p->value.data = kmemdup(property->value.data,
-						property->length * 4,
-						GFP_KERNEL);
-			if (!p->value.data)
-				goto err_free;
-			break;
+static struct tb_property *tb_property_copy(const struct tb_property *property)
+{
+	struct tb_property *p;
 
-		case TB_PROPERTY_TYPE_TEXT:
-			p->value.text = kzalloc(p->length * 4, GFP_KERNEL);
-			if (!p->value.text)
-				goto err_free;
-			strcpy(p->value.text, property->value.text);
-			break;
+	p = tb_property_alloc(property->key, property->type);
+	if (!p)
+		return NULL;
 
-		case TB_PROPERTY_TYPE_VALUE:
-			p->value.immediate = property->value.immediate;
-			break;
+	p->length = property->length;
+	switch (property->type) {
+	case TB_PROPERTY_TYPE_DIRECTORY:
+		p->value.dir = copy_dir(property->value.dir);
+		if (!p->value.dir)
+			goto err_free;
+		break;
 
-		default:
-			break;
-		}
+	case TB_PROPERTY_TYPE_DATA:
+		p->value.data = kmemdup(property->value.data,
+					property->length * 4,
+					GFP_KERNEL);
+		if (!p->value.data)
+			goto err_free;
+		break;
 
-		list_add_tail(&p->list, &d->properties);
+	case TB_PROPERTY_TYPE_TEXT:
+		p->value.text = kzalloc(p->length * 4, GFP_KERNEL);
+		if (!p->value.text)
+			goto err_free;
+		strcpy(p->value.text, property->value.text);
+		break;
+
+	case TB_PROPERTY_TYPE_VALUE:
+		p->value.immediate = property->value.immediate;
+		break;
+
+	default:
+		break;
 	}
 
-	return d;
+	return p;
 
 err_free:
 	kfree(p);
-	tb_property_free_dir(d);
-
 	return NULL;
 }
 
+/**
+ * tb_property_copy_dir() - Take a deep copy of directory
+ * @dir: Directory to copy
+ *
+ * The resulting directory needs to be released by calling tb_property_free_dir().
+ *
+ * Return: Pointer to &struct tb_property_dir, %NULL in case of failure.
+ */
+struct tb_property_dir *tb_property_copy_dir(const struct tb_property_dir *dir)
+{
+	return copy_dir(dir);
+}
+EXPORT_SYMBOL_GPL(tb_property_copy_dir);
+
+/**
+ * tb_property_merge_dir() - Merges directory into parent
+ * @parent: Directory to merge @dir
+ * @dir: Directory that is merged
+ * @replace: Replace existing entries
+ *
+ * This will merge @dir into @parent. Both must have same UUID. The
+ * properties in @dir will overwrite overlapping properties in @parent
+ * if @replace is %true. Contents of @dir is copied (so if it is not
+ * needed afterwards it needs to relesed by calling tb_property_free_dir()).
+ */
+int tb_property_merge_dir(struct tb_property_dir *parent,
+			  const struct tb_property_dir *dir,
+			  bool replace)
+{
+	const struct tb_property *property;
+
+	if (WARN_ON(parent == dir))
+		return -EINVAL;
+
+	if (!uuid_equal(parent->uuid, dir->uuid))
+		return -EINVAL;
+
+	list_for_each_entry(property, &dir->properties, list) {
+		struct tb_property *p, *tmp;
+
+		tmp = tb_property_copy(property);
+		if (!tmp)
+			return -ENOMEM;
+
+		p = tb_property_find(parent, property->key, property->type);
+		if (p) {
+			if (replace) {
+				/*
+				 * Found existing property in parent so
+				 * replace with the new one.
+				 */
+				list_replace(&p->list, &tmp->list);
+				tb_property_free(p);
+			} else {
+				tb_property_free(tmp);
+				continue;
+			}
+		} else {
+			list_add_tail(&tmp->list, &parent->properties);
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tb_property_merge_dir);
+
 /**
  * tb_property_add_immediate() - Add immediate property to directory
  * @parent: Directory to add the property
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index bbdbbc84c999..e98d569779f9 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -153,6 +153,9 @@ struct tb_property_dir *tb_property_parse_dir(const u32 *block,
 ssize_t tb_property_format_dir(const struct tb_property_dir *dir, u32 *block,
 			       size_t block_len);
 struct tb_property_dir *tb_property_copy_dir(const struct tb_property_dir *dir);
+int tb_property_merge_dir(struct tb_property_dir *parent,
+			  const struct tb_property_dir *dir,
+			  bool replace);
 struct tb_property_dir *tb_property_create_dir(const uuid_t *uuid);
 void tb_property_free_dir(struct tb_property_dir *dir);
 int tb_property_add_immediate(struct tb_property_dir *parent, const char *key,
-- 
2.50.1


