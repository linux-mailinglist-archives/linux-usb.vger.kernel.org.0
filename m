Return-Path: <linux-usb+bounces-38011-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO4QJ9sWFGqFJgcAu9opvQ
	(envelope-from <linux-usb+bounces-38011-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:31:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5755C8A07
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD4B23036CF2
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9156D3E6DCE;
	Mon, 25 May 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSLrPc/Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2067E3E5A3B
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701358; cv=none; b=dhxuTx5UuzanjXsRs0Ebp/lRwe0U2ui7a8JCpyUcj1Wwgndh0mQIIjH2ooLPpN5sA0rW6UzTm7Kumg8UsZXCs178eU5MFhwA9+kjR8wRgct3jkFwSAf3Zd2NV0v3HkGZypvPhQT6k+0PrXi4rspybcuZ6C3Izs3+6ioLYG/yZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701358; c=relaxed/simple;
	bh=fe/hnE8GZQrLciu77A+fejlNUzSNd3LNX6x61CvRXJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpwdlZOcEYgMdHAaHNbVTCbLotRxoYCkrQBVWHdOM3qXLui3jjYJSjun97fR4Xy4ItLByutH/hI9srmotvq9k831Ry/C3YNukTYMYNb//R/sv+a9tPYZJu0vZjuDzKgiBYZrmhpa8KgpJtqf2dCFVXGiGT6UPvIs3ChNghIwjAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSLrPc/Q; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b5cda2dab9so97197416d6.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701354; x=1780306154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Iq5ZhrKPSPdMYnMkmpf5M3ZZW+Mtt1BsX+A9zE8LaQ=;
        b=DSLrPc/Qkl3XH3dpdXhcnRsDVMdnL8wegbTK76CGQYkDboZ7EYX6HynOuzeGsEXTkN
         IktzssZabdShUltgqMfQCGI1G+K40PsxbkambMslgKA8PpDH3GnmICVxiPaQNnOZkTbc
         XxpvThOsl3z8TOC2p/14GU2mqD0f/fDTV2my6+woccEkr+r+Zf4h5Fb8fHHkgu57I/G/
         JQc+sFTwTU1cEYq2Xh9H+VardGiGEUnK/qxoTmQ2Ir89Y7mvz1mhf0W+hv0DOzOudXYu
         +rtihGDVeER5hIIQTb2yj6NT3B1io+KrbXppIq53wJSvWw2U5fossyxqqhK+iqwE6fjH
         xWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701354; x=1780306154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Iq5ZhrKPSPdMYnMkmpf5M3ZZW+Mtt1BsX+A9zE8LaQ=;
        b=MvLUzNvD9TePqPm3NRYslLVAeWbuURyPrw972JAAEdmohgzLHhr8O37lGQ/j0S/5SG
         gWZDUoBbBe1QfOhXkkakLMCW+F7sjs1dKzUMNEjLtfE5sPC+0IJmg/Ouu/T3XVevCoAA
         ZAy8l67vwnbBD1u+kBlPO3QDXKTNzi7sK4z4v35QDVK0P2CjmNbPP2i1FDnG81Tt3FUI
         efqW+ecyJm355B9KpBlbkQKMjcERAG9w9Lk5JIK+xZvQWhHE8ZbY0xLrM4UdDL8wxfV4
         BoBjxMJjzWWVPPVmI9IpVr7H+afjwrFtrD/BadJUG7ljwE6XdmF+1Et5fFkSqbhwk/He
         rA1A==
X-Gm-Message-State: AOJu0YzTvopszMv13+8ylMSLWKF6cNmKRZ1m2n5HIt1xMEXNQgszZjYG
	6fIMODOsF65V/g8pfYi88C85kec5aEBxZZbBCQ0I4NuTFXcwmIB302vR6iSOwaar
X-Gm-Gg: Acq92OHC9j/0Acq2LzggN8nbIn0wBDBVQRcoe5l0nTrSl3uRS9NI3ZYolGr3vTls19I
	pJHJKi+3FB5qOJEKcW67CaG02dcr6HJGgD5J6hXD7MoybJbTntIqJsY/WMwH6Tt/E4PTzzNhVB5
	XCXqynwYnpnEy37AaksJOYLxdyWdoKPQyDbASXbcyvsih9OIfjFBeOF0ssKlXvHinesjSaSvaeF
	G9rMYtWid/CCtzZ6w2pyWQh565r2qKknj/RBLLZ8sHkBKlHVteMvU8rNTx29G7JsDyST6dR6cvQ
	KLVKapHXSOXGgdDunYQlYMF6ZzYGvxcOIXgZHuFQITkpvuYtJFT/nmJ6BI0eL7kStssDIm+b3An
	Io1pMeIo5p95jjLx37quX2DCcr5Xr5hVHthfcL7nJDpeUFWESGHK10LB6XrtD4Xes9/cBc6U6VV
	ZDwLlvTdnMvFDpRLAX/9uF6Gg/ldlHW+P5eqE7OkLUCOpXYEBb0EQ1LjESuKHnlXed2qk/j1kt0
	vDUKhpB0qCnxZQNK19/hNZ6C4M1MEddQr7R2GLyIKc=
X-Received: by 2002:a05:6214:5882:b0:8a7:164c:d5c8 with SMTP id 6a1803df08f44-8cc7bf194acmr185185226d6.24.1779701344361;
        Mon, 25 May 2026 02:29:04 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf4a9sm104255826d6.2.2026.05.25.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:29:03 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] thunderbolt: test: add KUnit tests for property parser bounds checks
Date: Mon, 25 May 2026 05:28:30 -0400
Message-ID: <20260525092830.735472-7-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525092830.735472-1-michael.bommarito@gmail.com>
References: <20260525092830.735472-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38011-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1F5755C8A07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add regression tests for the zero-length entry and root directory
bounds fixes:

- tb_test_property_parse_zero_length: TEXT entry with length 0
  must be rejected by the validator.

- tb_test_property_parse_rootdir_overflow: root directory whose
  content_offset + content_len exceeds block_len must be rejected.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/test.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 1f4318249c226..345f39ecd233f 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -2852,6 +2852,44 @@ static void tb_test_property_copy(struct kunit *test)
 	tb_property_free_dir(src);
 }
 
+static void tb_test_property_parse_zero_length(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 6 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+
+	KUNIT_ASSERT_NOT_NULL(test, block);
+
+	block[0] = 0x55584401;	/* rootdir magic */
+	block[1] = 0x00000004;	/* root length: one entry */
+
+	block[2] = 0x61616161;	/* key_hi */
+	block[3] = 0x61616161;	/* key_lo */
+	block[4] = 0x74000000;	/* type=TEXT, reserved=0, length=0 */
+	block[5] = 0x00000000;	/* value */
+
+	dir = tb_property_parse_dir(block, 6);
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
+static void tb_test_property_parse_rootdir_overflow(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 4 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+
+	KUNIT_ASSERT_NOT_NULL(test, block);
+
+	block[0] = 0x55584401;	/* rootdir magic */
+	block[1] = 0x00000004;	/* root length claims 4 dwords of content */
+	block[2] = 0x61616161;
+	block[3] = 0x61616161;
+
+	/* content_offset(2) + content_len(4) = 6 > block_len(4) */
+	dir = tb_property_parse_dir(block, 4);
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
 static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_path_basic),
 	KUNIT_CASE(tb_test_path_not_connected_walk),
@@ -2892,6 +2930,8 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_property_parse),
 	KUNIT_CASE(tb_test_property_format),
 	KUNIT_CASE(tb_test_property_copy),
+	KUNIT_CASE(tb_test_property_parse_zero_length),
+	KUNIT_CASE(tb_test_property_parse_rootdir_overflow),
 	{ }
 };
 
-- 
2.53.0


