Return-Path: <linux-usb+bounces-36858-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEi4EthY92mEgQIAu9opvQ
	(envelope-from <linux-usb+bounces-36858-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:16:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B114B5FDF
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22308301FC9D
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 14:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B5B3CF691;
	Sun,  3 May 2026 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2qMPCZw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE0C3CEBA9
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817737; cv=none; b=KoHrcJiRPuZ4sL6HfPsTh29Y6Fou25bbwlMIyq7LAzW7rZqY+0KPxxQh1QdJMRfbKK+y0URYK4pThYSPCKLF1auElkEUTIG/gXhteW0bcADhFZs5n8rD0KokM9muH9+0iGnriOBMgBkcICNIbtItQq1ztYP4Y/Im3HnuzEI/9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817737; c=relaxed/simple;
	bh=4/h2g963/WH6kbfJPLMHWdhyI3Xrwf9EoPjbsxH/wb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCmW7/NAZa8mExhgNbf+XHrSKBC//OP1P61nLFCJXgv5wvVSlLqIAsfv9AHKHD8bldK970g1QOXRC8dkSbI6OoxDFRPYR+KEki3GNNz4kGIG4/XDZI3l0mpKtG2fleC4ZVZj4C2RH73dzmuw2UdIp2TJUHUzABNEN4s9pW4W5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2qMPCZw; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8f15e900586so156975885a.1
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777817735; x=1778422535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnlk5QlW8PilWssNRBG7k8CDN0LxAxtZ/pUfiIBMymg=;
        b=e2qMPCZw3AoXjSc6SMZNPc/19BQ7M6JHdXBAxYrhtTlHP4BOUiqqNycwyeDx831o8L
         HhngwUNu3+/6kVw7ebBodrU4y3Kh7Bbne8gp5+Qor6PaRuHkDosIYxRh4bVLPPxpPgaJ
         fax9yv6oCTni+KZxhlnDleDAFXJwcAbIXX7SilGlikWbBtuOh+LFB8x129w/YtteYu/C
         gu3Syk4u/sgfk7SN8PvQay//YkVEO6risxcv7eEcKRgZRIrPADk8QjBSUXxuksdItrX6
         KvvWuJ05qNwJ/uFUwadZ/SbeN1e01IcimKhFr7XoQlNhWutci9kRWbiiDUBlgcHebFES
         SlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777817735; x=1778422535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnlk5QlW8PilWssNRBG7k8CDN0LxAxtZ/pUfiIBMymg=;
        b=h8rgij2xO28XJg2vYcgT8y+WojaSv3zGNoS4WxW0XKCws8URdGSYBmpshOMuKMIVED
         iEmC01zTpDidHzZ2NaVbWMRPkRG1uyTNcPDEcfWp/+xXn9v7uLJlQhHV2NSedmwanSrR
         q4/qHZFkwYf55GpKYkWHWvbzQq8ERd0+kjHpqlha1M5YzW5/d5KGKavCvbD1g5BfobvG
         WXifnvFGqpRsIsFpsr1cHH5pvjNj3kZLEhAD+KAE57vtgfPH3BoIHKup8dlC8rGMwn6W
         W32FHFmeyyJG7eoi7W5pBe2JUkyKv4rO5c1XDMWJPgoVC9F3X69L2eUihiSPpri0pO8y
         z3Pw==
X-Forwarded-Encrypted: i=1; AFNElJ/riq/QHf4B+KEEDhxiDYfWi/Nm+oaGnTXMFbdZ1DK3qiMg+qsdFsNYEbbW47C/CWlIgM0P4UA8ReA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNJfM8BXnLvGo3Hmnvrwe/UcIBExhEhAKm1xAnsG3Z42bpW+/
	1aAQJIhuVTHVvNxQu14C/rSvbCGVit4dhTsDEa8CQ1Of43u2cU9H6KEC
X-Gm-Gg: AeBDiet8GyMiULCosNEdp6jXMp506QpV1ciTls5MnSDfl3uR9WCPiYqpGP/YGsCvUPP
	OHkCApfW7/FgLrgdDCDoizSKK7uafFrimHsty/Xcr+KUUue+CrmMQLOflwx6n0QXAofwYpQvIdK
	/rviBk2/cm2JkhCPVjZjAbaaZRvERLRDjpkgzeYGAs1wWxPOHdx21re/evn+7BmO0Mm+kjDvRgH
	6YGMgSvLqhZ2qtzPFRwdIJK3CdyWFc4cAiawuWf8SYtH2zVBaiyVg+PFRxmvJzjZ2t439Bm3EEQ
	hYJl5+LvJtHjPSs0R2LRKuumM4BPo6qYVnZIlRJBGW73SYbQbua9odb/TTXB898JMtfs7taKmmX
	Naewd6ri2sqsQ+/M4onihC7IaEgvntutS8gCZn6pJBxl0q2B+mEMP+nBBTUnHw2Yyjcd0g9Qmc/
	Amhe+KsPpslSpxN8/0o4x/Kq1kGp2d7foZFQ/kPu+OpYMiv5YrKqFTD7xq+46mawJ9EpuZJvwDC
	dz8NwfTq5jNTWYmWGTMAK8LNlIom9I=
X-Received: by 2002:a05:620a:4109:b0:8ec:c4a7:f8fc with SMTP id af79cd13be357-8fd1863370emr991452685a.43.1777817734572;
        Sun, 03 May 2026 07:15:34 -0700 (PDT)
Received: from server1 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938e0b9sm766261985a.9.2026.05.03.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:15:32 -0700 (PDT)
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
Subject: [PATCH v3 4/4] thunderbolt: test: add KUnit regression tests for XDomain property parser
Date: Sun,  3 May 2026 10:15:08 -0400
Message-ID: <5caddc2abbec9d4215dfc9041ab18f84eb7bbc58.1777817011.git.michael.bommarito@gmail.com>
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
X-Rspamd-Queue-Id: C3B114B5FDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36858-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add three KUnit cases that exercise the defects fixed by the sibling
commits in this series by feeding crafted XDomain property blocks to
tb_property_parse_dir():

  tb_test_property_parse_u32_wrap - entry->value = 0xffffff00 and
    entry->length = 0x100 so their u32 sum 0x100000000 wraps to 0
    under the block_len guard; without the fix the subsequent
    parse_dwdata() reads attacker-directed OOB memory.

  tb_test_property_parse_recursion - two DIRECTORY entries pointing
    at each other, driving __tb_property_parse_dir() recursion;
    without the fix the kernel stack is exhausted.

  tb_test_property_parse_dir_len_underflow - a DIRECTORY entry with
    length < 4 so the non-root UUID kmemdup of 4 dwords from
    dir_offset reads past the block, and the downstream content_len
    = dir_len - 4 size_t underflow drives the entry walk OOB.

Each test asserts tb_property_parse_dir() returns NULL on the
crafted input.  On a pre-fix kernel with CONFIG_KASAN=y, u32_wrap
trips a KASAN report inside __tb_property_parse_dir() (the parser
reads ~16 GiB past the block) and recursion trips an Oops on
RIP=0 via the stack-guard.  dir_len_underflow returns NULL on
pre-fix via the downstream content_len underflow path; the UUID
kmemdup over-read happens silently because KASAN-Generic's slab
redzones do not flag a 4-byte over-read into the kmalloc-chunk
tail, so this case is the post-fix invariant pin rather than an
active pre-fix detector.  Post-fix all three pass cleanly.

Run with:
  ./tools/testing/kunit/kunit.py run --arch=x86_64 \
    --kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_NVMEM=y \
    --kconfig_add CONFIG_USB4=y --kconfig_add CONFIG_USB4_KUNIT_TEST=y \
    --kconfig_add CONFIG_KASAN=y 'thunderbolt.tb_test_property_parse_*'

Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
v2 -> v3:
- De-duplicate the on-wire entry layout: define a single
  struct tb_test_property_entry shared across all three tests
  instead of re-declaring an anonymous struct in each.
- Use TB_PROPERTY_TYPE_DATA / TB_PROPERTY_TYPE_DIRECTORY
  constants from <linux/thunderbolt.h> instead of bare 0x64 /
  0x44.
- Convert all multi-line block comments to put the opening "/*"
  on its own line per the thunderbolt subsystem's coding style.
- Lowercase 0xffffff00 in commit message + code + comments.
- Tighten dir_len_underflow: use a 7-dword (28-byte) buffer so
  the non-root kmemdup over-read targets the kmalloc-32 tail
  rather than slab slop within a kmalloc-2048 chunk.  KASAN-
  Generic still does not flag the 4-byte over-read here (slab
  redzones cover next-chunk metadata, not in-chunk tail), so
  the test remains a post-fix invariant pin; documented
  explicitly above.

 drivers/thunderbolt/test.c | 132 +++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 1f4318249c22..73de7292ee21 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -2852,7 +2852,139 @@ static void tb_test_property_copy(struct kunit *test)
 	tb_property_free_dir(src);
 }
 
+/*
+ * Reproducers for three memory-safety defects in
+ * drivers/thunderbolt/property.c reached from a crafted XDomain
+ * PROPERTIES_RESPONSE payload.  Without the fix these trip KASAN or
+ * smash the kernel stack; with the fix each returns NULL cleanly.
+ *
+ * The on-wire entry layout mirrors struct tb_property_entry in
+ * property.c (private to that translation unit).
+ */
+struct tb_test_property_entry {
+	u32 key_hi, key_lo;
+	u16 length;
+	u8 reserved;
+	u8 type;
+	u32 value;
+};
+
+static void tb_test_property_parse_u32_wrap(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 500 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+	struct tb_test_property_entry *e;
+
+	/*
+	 * Root header: magic + length=6 (single entry body of 4 dwords +
+	 * 2 slack, keeps walk within block[]).
+	 */
+	block[0] = 0x55584401;
+	block[1] = 6;
+
+	/*
+	 * Crafted DATA entry at block[2..5]: value = 0xffffff00 and
+	 * length = 0x100 are u32/u16 such that the u32 sum 0x100000000
+	 * wraps to 0, passing the sum <= block_len guard even though
+	 * the real offset is block + 0xffffff00 * 4 (~16 GiB past the
+	 * block).  The subsequent parse_dwdata() copies entry->length*4
+	 * = 1024 bytes from that wild address into a fresh kcalloc
+	 * buffer.
+	 */
+	e = (void *)&block[2];
+	e->key_hi = 0x61616161;
+	e->key_lo = 0x61616161;
+	e->length = 0x100;
+	e->type   = TB_PROPERTY_TYPE_DATA;
+	e->value  = 0xffffff00;
+
+	dir = tb_property_parse_dir(block, 500);
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
+static void tb_test_property_parse_recursion(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 500 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+	struct tb_test_property_entry *e, *child_e;
+
+	block[0] = 0x55584401;
+	block[1] = 4;		/* rootdir length = one entry */
+
+	/*
+	 * DIRECTORY entry pointing at dir_offset=2 with length=16.
+	 * When parsed as non-root: content_offset = 6, content_len = 12,
+	 * nentries = 3.  The child's first entry at block[6] is also
+	 * DIRECTORY pointing at 2, so the recursion oscillates between
+	 * two dir_offsets until the kernel stack is exhausted.
+	 */
+	e = (void *)&block[2];
+	e->key_hi = 0x61616161;
+	e->key_lo = 0x61616161;
+	e->length = 16;
+	e->type   = TB_PROPERTY_TYPE_DIRECTORY;
+	e->value  = 2;
+
+	child_e = (void *)&block[6];
+	child_e->key_hi = 0x62626262;
+	child_e->key_lo = 0x62626262;
+	child_e->length = 16;
+	child_e->type   = TB_PROPERTY_TYPE_DIRECTORY;
+	child_e->value  = 2;
+
+	dir = tb_property_parse_dir(block, 500);
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
+static void tb_test_property_parse_dir_len_underflow(struct kunit *test)
+{
+	/*
+	 * Request 28 bytes (7 dwords) so KASAN-Generic tags the
+	 * 4 trailing bytes of the underlying kmalloc-32 chunk as a
+	 * slab redzone.  With block_len=7, dir_offset=4, dir_len=3,
+	 * the non-root UUID kmemdup reads 16 bytes from byte 16, so
+	 * bytes 28..31 fall in the redzone and trip a KASAN
+	 * slab-out-of-bounds report on the pre-fix kernel.  Sizing
+	 * the buffer at a power of two (32, 64, ... bytes) puts the
+	 * over-read into the slab cache tail where KASAN's generic
+	 * shadow does not flag it, and the test reduces to a
+	 * tautology because the downstream content_len = dir_len - 4
+	 * underflow also returns NULL.
+	 */
+	u32 *block = kunit_kzalloc(test, 7 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+	struct tb_test_property_entry *e;
+
+	block[0] = 0x55584401;
+	block[1] = 4;		/* rootdir length = one entry */
+
+	/*
+	 * DIRECTORY entry with length=3 pointing at dir_offset=4.
+	 * tb_property_entry_valid() permits value+length=7 <=
+	 * block_len=7.  Non-root parse begins with a kmemdup of 4
+	 * dwords from dir_offset for the UUID; with the v2 ordering
+	 * that kmemdup runs before the dir_len < 4 reject and reads
+	 * past the buffer.  With the v3 ordering the reject sits
+	 * before the kmemdup and the read never happens.
+	 */
+	e = (void *)&block[2];
+	e->key_hi = 0x61616161;
+	e->key_lo = 0x61616161;
+	e->length = 3;
+	e->type   = TB_PROPERTY_TYPE_DIRECTORY;
+	e->value  = 4;
+
+	dir = tb_property_parse_dir(block, 7);
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


