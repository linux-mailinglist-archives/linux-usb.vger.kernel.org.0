Return-Path: <linux-usb+bounces-37215-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEmsBU8SAWq4QQEAu9opvQ
	(envelope-from <linux-usb+bounces-37215-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 01:18:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FDD506CA7
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 01:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4BBC3013A49
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 23:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDA73ACA70;
	Sun, 10 May 2026 23:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcuNx532"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899FC30E847
	for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 23:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778455042; cv=none; b=G+NcPGGZdj7BXFbB/iAkhqKeNy+Dw5aCUvfxdp5KwLfsxhOuwvw+f8ZgljKATTliMmuBJ4mZb0z6rPMOHCF13vdkCwarNbyiU4avtpGGD3sU723b7jbk9iQ9IfOKX1tdaP+sh87LI6eQkPXSfjXkBLUhsu08xCCok8kbQ84bCLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778455042; c=relaxed/simple;
	bh=yCeRqCqV/OuDGj8AxgSGkFPw7mgtyvM8WobSjT8OE+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzEkeSmXfijeW9iI3L7JOSRCm4FXLCfDglt/X7cEAnvo1uU+Vq3ELRDXWccpesdOGWd3sXHcZUI7xRwEG2L20gyhnB+pUixVyuVB+f7ZFi0VE33ouWbqrx11fUgaTGUQPJB694Mcal0gDVwBsyDyADlUQ8TjvjSA6Pd8L1HFlH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcuNx532; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50e63771eb0so35362331cf.3
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 16:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778455039; x=1779059839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OOx8AfJKBXD4a8uWQ5sr/40g6B5/Qyw4VyuwfwX8dw=;
        b=hcuNx532i9KbR5N2F9qHc0SfssLjMmZi5vNP9MOfnwWxjwdSstSpu9KNZ1RTf/M1Vc
         p3bkff8f4kybBPePK2fWFCbdY8p+zNt1J8qycCiTmQY1g0Ir1YRh3dpWQrEdGJhMftcc
         ILWF1QFCXev3jzADC1QDVxrZCNePIvg82BciefwXBliKP067TBGZmDSLH9I1T3dq1ptd
         UR+O9Ou59RgZFyUWKbf6TO5y419iD9Mlr0c3Rzw4r8LpY3GDoM/CR5PpERgizh7rVmMU
         8Th7Q2djzpSGmb1P8hGC2cLl9RVZEVr5ffDloDR3uoPZg5yCkoR7cXwazT1/9SWtsp8j
         GVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778455039; x=1779059839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1OOx8AfJKBXD4a8uWQ5sr/40g6B5/Qyw4VyuwfwX8dw=;
        b=pRKSzvN5LtMg6b2USrgAPBsX8x/wSagXjshaZ1Bo90QAdcr832m0Vk7YZd6zQDtt/+
         8/SYBRIsWKwGVek6yUCMgA8BYwlSuvoyF8stM+Yd0cRiZ6/pfgbAOxvr/elbaWAt+moZ
         p0/CzuCXjINtkyNgXfSHaTsqm4XBrb9B/HASH/rt7lcS0Nr94wUbAHK30f8iZvCoWRFU
         xe2uHQRPZ0MmsLynVVdQvyYh6mIvOmUpefOXSTsqOMz87ZKCP5YAK1O6W5W7Phh6+H6L
         ndCAWoOHIoAv9bA49FytKyBo+sXTTVt9ngrwWyJeDq/T8Ljvc0tjI42TURtUJv0ohAfl
         4bug==
X-Forwarded-Encrypted: i=1; AFNElJ9u4xc3JJ4xfghWBeeTN0YAOXIbO/852H+REajAS8xnwfsnnDIP2QIA4hmN6uZZG/CRYrtAxUG4ZXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/zfHswKBnFWFnQpP7blkhMaLdTtqQ18gZuXs4EAhJTxbYHZy
	v5D4eUAkiBMYarh4xemTBlO6udy1KzHefdMmakDzTnULT7Ad0u1UDllO
X-Gm-Gg: Acq92OGqWag/RumkR9YzmKmLn9zJtmgfKeeRcNs2ZsoVzLCITiBxEWyIR12toz9vid9
	RThAKb3pguq4EAamzKIsSNlJYeZBagAp2VKvc1jT6gN27T5+44FEkUYVr3o3AgWhFp4PNixD+uw
	gKuGHqUG1DGrA0pZF23uGsN1+Y+I+wbjZjLqTTpOsFJzSkXiQXvFROJQIKxhWkB2kJGNrAiTEbQ
	ft95QUHps6Y5gk4I80R6JX5OFkxeo1pp5+JUL1nJPs+zMS8ksUWdEkQw3IaArcTfjy0LoK6u8xe
	VOE/lJkmkdDHw8Fp4A7duqHhIk4Fr4igL1BDQetb714+KwR92sTsgIYo6OVHy1XG0CcVEKqTaBO
	8aAbiNQye+IJupPHlZ9z3tZFWWMwRqfWDxsgIE2LcSM5hOOPvZhnEA74GY3Zv8/GQx9ry1PC8Eh
	KQF+k+CPx9eVMnHSW3Wn207Am84XXN19KuzyImL/3BVAUPNsSQuqxD9jxSTv1Tc5sov0uo9SDgc
	fIg2XrNu9WI5qJXWvUcz5khNt8J3iHgHKrlytpwHoo=
X-Received: by 2002:a05:622a:480b:b0:50b:2876:586 with SMTP id d75a77b69052e-514619ddc56mr310925521cf.5.1778455039551;
        Sun, 10 May 2026 16:17:19 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e830ddfsm75015031cf.27.2026.05.10.16.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 16:17:19 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 3/4] thunderbolt: property: cap recursion depth in __tb_property_parse_dir()
Date: Sun, 10 May 2026 19:16:58 -0400
Message-ID: <20260510231715.2215605-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.v4.git.michael.bommarito@gmail.com>
References: <20260415123221.225149-1-michael.bommarito@gmail.com> <cover.1777817011.git.michael.bommarito@gmail.com> <cover.v4.git.michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A8FDD506CA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37215-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,intel.com,linuxfoundation.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

A DIRECTORY entry's value field is used as the dir_offset for a
recursive call into __tb_property_parse_dir() with no depth counter.
A crafted peer that chains DIRECTORY entries into a back-reference
loop drives the parser until the kernel stack is exhausted and the
guard page fires.  Any untrusted XDomain peer (cable, dock, in-line
inspector, adjacent host) that reaches the PROPERTIES_REQUEST
control-plane exchange can trigger this without authentication.

Thread a depth counter through tb_property_parse() and
__tb_property_parse_dir(), and reject blocks that exceed
TB_PROPERTY_MAX_DEPTH = 8.  That is comfortably larger than any
observed legitimate XDomain layout.

Operators who do not need XDomain host-to-host discovery can disable
the path entirely with thunderbolt.xdomain=0 on the kernel command
line.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/property.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 74c92f9801ff..da2c59a17db5 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -35,10 +35,11 @@ struct tb_property_dir_entry {
 };
 
 #define TB_PROPERTY_ROOTDIR_MAGIC	0x55584401
+#define TB_PROPERTY_MAX_DEPTH		8
 
 static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	size_t block_len, unsigned int dir_offset, size_t dir_len,
-	bool is_root);
+	bool is_root, unsigned int depth);
 
 static inline void parse_dwdata(void *dst, const void *src, size_t dwords)
 {
@@ -97,7 +98,8 @@ tb_property_alloc(const char *key, enum tb_property_type type)
 }
 
 static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
-					const struct tb_property_entry *entry)
+					const struct tb_property_entry *entry,
+					unsigned int depth)
 {
 	char key[TB_PROPERTY_KEY_SIZE + 1];
 	struct tb_property *property;
@@ -118,7 +120,7 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 	switch (property->type) {
 	case TB_PROPERTY_TYPE_DIRECTORY:
 		dir = __tb_property_parse_dir(block, block_len, entry->value,
-					      entry->length, false);
+					      entry->length, false, depth + 1);
 		if (!dir) {
 			kfree(property);
 			return NULL;
@@ -163,13 +165,17 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 }
 
 static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
-	size_t block_len, unsigned int dir_offset, size_t dir_len, bool is_root)
+	size_t block_len, unsigned int dir_offset, size_t dir_len, bool is_root,
+	unsigned int depth)
 {
 	const struct tb_property_entry *entries;
 	size_t i, content_len, nentries;
 	unsigned int content_offset;
 	struct tb_property_dir *dir;
 
+	if (depth > TB_PROPERTY_MAX_DEPTH)
+		return NULL;
+
 	dir = kzalloc_obj(*dir);
 	if (!dir)
 		return NULL;
@@ -200,7 +206,7 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	for (i = 0; i < nentries; i++) {
 		struct tb_property *property;
 
-		property = tb_property_parse(block, block_len, &entries[i]);
+		property = tb_property_parse(block, block_len, &entries[i], depth);
 		if (!property) {
 			tb_property_free_dir(dir);
 			return NULL;
@@ -239,7 +245,7 @@ struct tb_property_dir *tb_property_parse_dir(const u32 *block,
 		return NULL;
 
 	return __tb_property_parse_dir(block, block_len, 0, rootdir->length,
-				       true);
+				       true, 0);
 }
 
 /**
-- 
2.53.0

