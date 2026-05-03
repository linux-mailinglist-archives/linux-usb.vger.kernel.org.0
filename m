Return-Path: <linux-usb+bounces-36856-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN6bM6hY92mEgQIAu9opvQ
	(envelope-from <linux-usb+bounces-36856-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:16:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7B4B5FB4
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1010E3016493
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 14:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0093CEB89;
	Sun,  3 May 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqUGr8//"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C0F3CCA03
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817735; cv=none; b=DzBscEDHqT/+kKUyWFnls9Y59kXixGHkeon5adrJhOQk4SfEZbP6bh19yPChf8dBl4+6otLAILe0SmaxtloaRUtvb5ekzSciozJm7/gvjIzBDV6xjm27pmJnlkmUtL9tOjfFuZXo0pADZIs0Li9VZlFVCTfuqtZXkAhdvAQFXGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817735; c=relaxed/simple;
	bh=DJX8ceKuZncvVsVqGihXF8M5N6EDLWVTekpwhupNHa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGfxS5AQydd0vy4zJ/kKv0dAYhQ+IEmdvZ0BHxqdzDL+R4A0UQMOwCFk0nf3QdRed/6PpzKGE21yYwSDbRgfNL1ktW5JxJ18YDbZLTp/pgt/1Jx5wN0qiOozNEEMnUNtNjiKS8BfqDsybT13qkCMW5TV0Ek1+gGupzNxJMXnaQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqUGr8//; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8ec9f099fc6so381836385a.0
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777817732; x=1778422532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Dz71hQc8J8ElMRCoaWUAkz9HmQbH5aLVTYzizz+yMo=;
        b=RqUGr8//Wj3a9VELBdVmZpLUQflfTvDuQezU/yypkbdrse5QeNfQPDiNB0BSQJWRO+
         3AA0gYif/+bNPJy5y5VZPzJIdZzFTa5fSBBGrBxdA1J55Na70KCbAvCfsh/vaCPUAzh+
         9FhejfY1F32Fgq/iHABQwQTavdFF3l1TGvfWXXwVM7kH7WmVBw5c1etNdAESeYexziac
         h7YgUFafO2F8l0ditWikIYk5cZnAmpPH7UPyrP712Eucq2fBphytFaNJxmsTfI41WJOd
         I7wmFn5gFBSa1ZMXPztNI9RvKNxX00zMTLA0VbtBTRMmmhC7skymgBSvxeoGSs2xwBzr
         +2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777817732; x=1778422532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Dz71hQc8J8ElMRCoaWUAkz9HmQbH5aLVTYzizz+yMo=;
        b=Yu0JstDTMdXC4j99vS8X1UfJIIrjrrH119MFuUu983tzQAlXaEcs/zriR+yquXP80b
         yJ4501jlHONSfvql1TGM+p+/CwTdq3RuXIX6DLMPxynCRUxXpTn5V6ApVwciYJm3rFY4
         Gx6ZiSZb6PPtzMllKknYkaMLOspNbi0mnOgz+9QEYUwjJtMobwF/9nj6pyEvXTyimW7F
         +IfqyW0lYcLt2UggQWzjR/qc9R1C+X4T488Ab5Af7v4JCwMmBEQh09eIKpgOSWsW3Qdv
         vU2OoWhKp9m27jMlr135jaP+uefluG9xYNJmiUiuaUoKn68Y7w8AfUmg27s0f1rlwSK/
         WdHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CGz6mIZitbU9n8quaEDrh1jLGP5hyugnjuFE4SgPywUJexsLXqxUhaQFZ+JyIB2I3m9xs/vI4xiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdpJbjshSEL9NJZrdEy0BJxCbed7O+psKWoBFCOTRxDZldiAq/
	1lMmU3jLTLS4WdH+0Qm0xL1HAgb0Y21tKHyh+DC4cnuPT2WXDjc8RW9h
X-Gm-Gg: AeBDievstP7bEysuDpeKruhu4HMHOmDKkJC8z03kyHowvtupRWIFfBoRXL836BwOVum
	MyZNReJFMhhmPFikT93hGIsw5uHdT+eXpJ9bRslC2ZEastNdJnyzPjBD4m8qxY8pncqtDUTO1hy
	6A/I6rpvAilPGcCmme5rnQjndYzVWsL5iEAc5PugxmbofF+tAG4gpirHNP5zMSYhDatkFHAUvPX
	mGUC/Nw7A7jUw2B6t1iP2yXEOAMbUyXTGtNq4J5WPUYOPZ7rzQ5V8dI6lTwXwdwPKGXZWUPAzrU
	zQsUBFs6uIcs8KLAw6OQTwNjbk+6dGOmMF88ACsJ4pcB9eOUWesFaKJHZCyFV23Hh9etdM4QqCR
	ExAY/8jUYl0IozfJ9UCRsIEao4/xamGpYYeKr8J1v4CXd25iXsEbTGg9uJkY15ydkvllCwYXniv
	6oNPjdtDSfY7kNxedfTtmLiyFxuwtO80el00354T7wpi1eunads1x6NgqiJMvHkgLya4NKS5vhD
	o+yfh1EazVE2Kse
X-Received: by 2002:a05:620a:4613:b0:8da:cfe6:c67c with SMTP id af79cd13be357-8fd17c4f15fmr981271585a.28.1777817732086;
        Sun, 03 May 2026 07:15:32 -0700 (PDT)
Received: from server1 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938e0b9sm766261985a.9.2026.05.03.07.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:15:30 -0700 (PDT)
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
Subject: [PATCH v3 3/4] thunderbolt: property: cap recursion depth in __tb_property_parse_dir()
Date: Sun,  3 May 2026 10:15:07 -0400
Message-ID: <ce8ca06ea5f7a9aa1bf4a82a5aa764b22256f908.1777817011.git.michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777817011.git.michael.bommarito@gmail.com>
References: <20260415123221.225149-1-michael.bommarito@gmail.com> <cover.1777817011.git.michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 57E7B4B5FB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36856-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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
v2 -> v3:
- Fix Fixes: SHA (was e69b6c02b4c3; correct is cdae7c07e3e3).

 drivers/thunderbolt/property.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 90fa6f760963..8db56922011b 100644
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
@@ -199,7 +205,8 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	for (i = 0; i < nentries; i++) {
 		struct tb_property *property;
 
-		property = tb_property_parse(block, block_len, &entries[i]);
+		property = tb_property_parse(block, block_len, &entries[i],
+					     depth);
 		if (!property) {
 			tb_property_free_dir(dir);
 			return NULL;
@@ -238,7 +245,7 @@ struct tb_property_dir *tb_property_parse_dir(const u32 *block,
 		return NULL;
 
 	return __tb_property_parse_dir(block, block_len, 0, rootdir->length,
-				       true);
+				       true, 0);
 }
 
 /**
-- 
2.53.0


