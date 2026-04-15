Return-Path: <linux-usb+bounces-36252-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLNYEkCG32nSUgAAu9opvQ
	(envelope-from <linux-usb+bounces-36252-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:36:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B574044E3
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB1373105DEE
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 12:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B932DECBA;
	Wed, 15 Apr 2026 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcqa7Pwj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0674594A
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256354; cv=none; b=Ur+Nh/sNFnM+4aqdRz2y7+SXxrLmuE3LZr29wb/6/sHx1Ud+3wgl59l7BYm5qhVX2GcrLmdHsQAxDebawE1p7hhCiNnj/XimsUyo6fYg7yLcIcaQMDYUzRjQiZnN8zDIVntAm89ceXiyI9nNkpbkZHPlqTCPyA/gTds39s5TYOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256354; c=relaxed/simple;
	bh=1l1cR5VAlx5dYOZdHqtWbaulDQgqIiBgksHXnCKMkfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fata2U2lSNkFIYrToQ2zUuwBKcJDTWxtb9j9f8bM34V/4Ztj14B08AgedxdOWIe8dgrnoqE9CUC4gUwYz7FJ63qxtDCNOkB5UqE69IQg3cSn4nh94B4FZ0IA85wshe9p5J4Ye+h/fbSP3vK/2M2Utpgc0OIBhiGUUbGT+6cG9FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcqa7Pwj; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d8e11b948so66699181cf.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 05:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256351; x=1776861151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbvHAqDnj9FXaNRW0EKEP6rCGAhHRS/crPKa3pni2fo=;
        b=pcqa7PwjdoDlpQQwtix7b4biwESJAexwOb5Eqlx8QHmWXx7r5dpfC9OCXJZhcJkylF
         Y/aRxJbmgYF80u7udoSOT+8r9rt6fLr3L3twcShTFL9EFJlTl7koLCVV2RKQHyYqWHO/
         3rzba7QskLYeryHW3WuiNHbLzs0yGyVuhMnNfnwe3ABg50UjEdf7miNDrk9vWMxbAwxe
         q2pPrMZa2GyT3QlbgVQCsiFXMe5p8Qc0IyFNxmta/HTI9iGaj5UP3HtXgECjnoQ88Hfs
         UPlVbQcY36x0TWjXL6KimKNGjGTw4SFejnyDIP9CZlszdRokEVzt0pig4ieCfa7d25EK
         nzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256351; x=1776861151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbvHAqDnj9FXaNRW0EKEP6rCGAhHRS/crPKa3pni2fo=;
        b=RRDAG1nuunS28hXJtF6WnpRNKm3L+OhF0WhdlW4iePjLOBKLvJB2MJkNA59MW/pOLv
         zXAQisjAj8rXKKD0lIp5EIAQQPbFMEm7nWkkuLCy8/vv5tYcoVG6MrOEqhXMn59ar0OT
         bPR/r3JUnahBn5TnID9CLIE7dgdpOyyrCSxV86ohnVswfRVH7QzVh7R2ZPb1hANsrxRy
         Inoq0+z9gnhN0+9i6Ywu5ZS0btstz0m/kfmFWmM8nfCGkTSEHm/1HNSw8ETZnS2Dp0J1
         Os/lfvl1pk5UROVzvV1hk4V6CJB6G0vnXm7R7taBXCREuWxQg7WVaiXtt+vO1GuUYa8e
         0dng==
X-Gm-Message-State: AOJu0YygnVhq1HZCgY0j7ixqzWTso8YKaDLiTGewo+mpBlU4Yh+t/+rN
	DneLs2S90GHKBuEx95omz4bBxsUjSm4DoIftwBVYULF4iG5/t6C+bRW0SNS3sg==
X-Gm-Gg: AeBDiesJn18FhpADxlP1GH8NUFTeUvtsQLgl5YHNeEPpzhnsyKBB6deR0HaPxJzqstj
	VDt3OJiUBEr/oLSm2lOevOvpw31swq0sOFgUQQFgpE1AVCWqkGLEqUp4zgrXsy14A/73I7QzmDU
	W/AzzLIEOAS+nBx44KaYAAYVWRDiOwZYChbAgnzTkxqOAEd1rQYRwMHoitpAHRcN7iOpo+zZT6d
	AeryLC+slT9f6whWEUJjTy9R13Yt1n1d3gs5ar0322nUuuraZPQpN1nZadKaD1rbzWDCPG1nmDS
	upxV4GqTZ2WXcnUUHI/+9E31c9eTqMUkmBK/+bTiVJhOr42GdOfru6aapP1THz9XYA3o1i7Zgy5
	AHQcH7nqWCr9rufUsp8aa04x+gMLwcD97F/5L0aFSEcWqrVlazI9fYn/3wdVCQkAR/fM3OitMjk
	5QwSevTCVv9nL+geIQIZAiuraqbxUuHDcehLXK6LPDFxjpEn8xD+YizIQjlIdnWNVuIAn4smquR
	m0bTlhlXT6X8fuMflBUPEHrSckthyhgR3I1+I/AdbKNZ/fHufMbx/KdS3krJKmi
X-Received: by 2002:ac8:7c41:0:b0:50d:7f91:6bd8 with SMTP id d75a77b69052e-50dd5aef77emr311172841cf.28.1776256351143;
        Wed, 15 Apr 2026 05:32:31 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1af9dc5fsm11747771cf.16.2026.04.15.05.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:32:30 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: linux-usb@vger.kernel.org,
	Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] thunderbolt: test: add KUnit regression tests for XDomain property parser
Date: Wed, 15 Apr 2026 08:32:20 -0400
Message-ID: <20260415123221.225149-5-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415123221.225149-1-michael.bommarito@gmail.com>
References: <20260415032335.2826412-1-michael.bommarito@gmail.com> <20260415045246.GR3552@black.igk.intel.com>
 <20260415123221.225149-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-36252-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7B574044E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add three KUnit cases that exercise the defects fixed by the sibling
commits in this series by feeding crafted XDomain property blocks to
tb_property_parse_dir():

  tb_test_property_parse_u32_wrap - entry->value = 0xFFFFFF00 and
    entry->length = 0x100 so their u32 sum 0x100000000 wraps to 0
    under the block_len guard; without the fix the subsequent
    parse_dwdata() reads attacker-directed OOB memory.

  tb_test_property_parse_recursion - two DIRECTORY entries pointing
    at each other, driving __tb_property_parse_dir() recursion;
    without the fix the kernel stack is exhausted.

  tb_test_property_parse_dir_len_underflow - a DIRECTORY entry with
    length < 4 so non-root content_len = dir_len - 4 wraps size_t;
    without the fix nentries is huge and the entry walk runs OOB.

Each test asserts tb_property_parse_dir() returns NULL on the
crafted input.  With CONFIG_KASAN=y, running these on the pre-fix
kernel reproduces an oops inside __tb_property_parse_dir (KASAN
shadow-memory fault for the u32_wrap case, stack-guard trip for
recursion, OOB read past block for dir_len underflow).  Post-fix
they pass cleanly.

Run with:
  ./tools/testing/kunit/kunit.py run --arch=x86_64 \\
    --kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_NVMEM=y \\
    --kconfig_add CONFIG_USB4=y --kconfig_add CONFIG_USB4_KUNIT_TEST=y \\
    --kconfig_add CONFIG_KASAN=y 'thunderbolt.tb_test_property_parse_*'

Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/test.c | 127 +++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 1f4318249c22..22f4107fcb8d 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -2852,7 +2852,134 @@ static void tb_test_property_copy(struct kunit *test)
 	tb_property_free_dir(src);
 }
 
+/*
+ * Reproducers for three memory-safety defects in
+ * drivers/thunderbolt/property.c reached from a crafted XDomain
+ * PROPERTIES_RESPONSE payload.  Without the fix these trip KASAN or
+ * smash the kernel stack; with the fix each returns NULL cleanly.
+ */
+static void tb_test_property_parse_u32_wrap(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 500 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+	struct {
+		u32 key_hi, key_lo;
+		u16 length;
+		u8 reserved;
+		u8 type;
+		u32 value;
+	} *e;
+
+	/* Root header: magic + length=6 (single entry body of 4 dwords +
+	 * 2 slack, keeps walk within block[]). */
+	block[0] = 0x55584401;
+	block[1] = 6;
+
+	/* Crafted DATA entry at block[2..5]: value = 0xFFFFFF00 and
+	 * length = 0x100 are u32/u16 such that the u32 sum 0x100000000
+	 * wraps to 0, passing the sum <= block_len guard even though
+	 * the real offset is block + 0xFFFFFF00 * 4 (~16 GiB past the
+	 * block).  The subsequent parse_dwdata() at property.c:132
+	 * copies entry->length*4 = 1024 bytes from that wild address
+	 * into a fresh kcalloc buffer.
+	 */
+	e = (void *)&block[2];
+	e->key_hi = 0x61616161;
+	e->key_lo = 0x61616161;
+	e->length = 0x100;
+	e->type   = 0x64;		/* TB_PROPERTY_TYPE_DATA */
+	e->value  = 0xFFFFFF00;
+
+	dir = tb_property_parse_dir(block, 500);
+	/* With the fix this returns NULL; without it, KASAN splats in
+	 * be32_to_cpu_array() / memcpy reading block + value*4 out of
+	 * bounds.  Assert on the safe outcome: a NULL dir. */
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
+static void tb_test_property_parse_recursion(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 500 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+	struct entry {
+		u32 key_hi, key_lo;
+		u16 length;
+		u8 reserved;
+		u8 type;
+		u32 value;
+	} *e, *child_e;
+
+	block[0] = 0x55584401;
+	block[1] = 4;		/* rootdir length = one entry */
+
+	/* DIRECTORY entry pointing at dir_offset=2 with length=16.
+	 * When parsed as non-root: content_offset = 6, content_len = 12,
+	 * nentries = 3.  The child's first entry at block[6] is also
+	 * DIRECTORY pointing at 2, so the recursion oscillates between
+	 * two dir_offsets until the kernel stack is exhausted.
+	 */
+	e = (void *)&block[2];
+	e->key_hi = 0x61616161;
+	e->key_lo = 0x61616161;
+	e->length = 16;
+	e->type   = 0x44;		/* TB_PROPERTY_TYPE_DIRECTORY */
+	e->value  = 2;
+
+	child_e = (void *)&block[6];
+	child_e->key_hi = 0x62626262;
+	child_e->key_lo = 0x62626262;
+	child_e->length = 16;
+	child_e->type   = 0x44;
+	child_e->value  = 2;
+
+	dir = tb_property_parse_dir(block, 500);
+	/* With the fix this returns NULL at TB_PROPERTY_MAX_DEPTH (8).
+	 * Without it, the kernel stack-guard fires ~50-80 frames in
+	 * and the kunit thread oopses. */
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
+static void tb_test_property_parse_dir_len_underflow(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 500 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+	struct entry {
+		u32 key_hi, key_lo;
+		u16 length;
+		u8 reserved;
+		u8 type;
+		u32 value;
+	} *e;
+
+	block[0] = 0x55584401;
+	block[1] = 4;
+
+	/* DIRECTORY entry with length=3.  When parsed as non-root,
+	 * content_len = dir_len - 4 underflows size_t to ~SIZE_MAX,
+	 * nentries = SIZE_MAX/4.  The for-loop walks entries past the
+	 * block, reading OOB on each iteration.
+	 */
+	e = (void *)&block[2];
+	e->key_hi = 0x61616161;
+	e->key_lo = 0x61616161;
+	e->length = 3;
+	e->type   = 0x44;
+	e->value  = 6;
+
+	dir = tb_property_parse_dir(block, 500);
+	/* With the fix: NULL.  Without: KASAN splat on
+	 * block[content_offset + i*4] for i > 124 (past the 500-dword
+	 * block). */
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
 static struct kunit_case tb_test_cases[] = {
+	KUNIT_CASE(tb_test_property_parse_u32_wrap),
+	KUNIT_CASE(tb_test_property_parse_recursion),
+	KUNIT_CASE(tb_test_property_parse_dir_len_underflow),
 	KUNIT_CASE(tb_test_path_basic),
 	KUNIT_CASE(tb_test_path_not_connected_walk),
 	KUNIT_CASE(tb_test_path_single_hop_walk),
-- 
2.53.0


