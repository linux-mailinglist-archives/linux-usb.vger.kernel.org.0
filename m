Return-Path: <linux-usb+bounces-36857-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD+fB65Y92mbgQIAu9opvQ
	(envelope-from <linux-usb+bounces-36857-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:16:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A44B5FC2
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB6CF300CFFE
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 14:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF5C3CCA16;
	Sun,  3 May 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4OZm5fB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E143CD8B5
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817735; cv=none; b=QMSJODKdv6UwOLZk5/6xxJnnCVuQoC3hfp+mUV7yLrP+SEYyXFTC0VzgrK03Af4JwSZFhCiNXf3P0klyn1jnSqGJIjUecw5If/cVATgLOwaxoIew6im8Nv5zGklvl4DyGFRw4dPHbZuuf+eycvDN6ZmjKt5ddcoaOFuUwX4jY6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817735; c=relaxed/simple;
	bh=sNYg3v35X3Zb6ai1EEiwl45wwE7v2/fvnp/4sYLMCpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXHzJVoIDqSLNxqUK0D1RMc/9PvF3Bk6UED5srpyrauBdsRlrj6+cNIA+BbyFNEeYT6SoCTQYzPMeaeqvzmR5u0VWGG6Wi3mnD+laFKICKONRDl0DsXowv/IRRwlwrgYu2yVYtUB77SRp1edH5bpCLocrhfkvJmRS0eCBBBEQho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4OZm5fB; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ee62a19730so367679485a.3
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777817732; x=1778422532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+ka8zjHbzrAJc7Li4EgptLPQUFhFF6o2unBqDH+EWo=;
        b=N4OZm5fBSV3d40wA+/gFKdacCBK6iqA8fy7trjJrmUP4dRQA7fmYPnXeAs1A9bVQY9
         E7NbdUNv7A/FxerTZFSI3du2E4zHhbczBeb609Dcf1GkWuSvLSUv2LUSe4zw3Rd+bfbj
         8b2giS4luaKrFSY3gwc7R+JF+c6Ww7sCIh0xybWrOA6P5DtqEJRUdb/ZKYet8QmVQ+UE
         PdhGbkRe2SCUMoFx2Ud0xnE+FQYqigDaQIcMnLcMrXZEastvivnqgSvk5x2Z6sAa1Qxj
         jnTHZQ4iVuNDD0+TmVJDA/4I2sySGXFKIvxZDv1whb/9D2ipl1detkOGGTHTmkkKU6iU
         qHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777817732; x=1778422532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+ka8zjHbzrAJc7Li4EgptLPQUFhFF6o2unBqDH+EWo=;
        b=VgZhtWlKNkL6hybyeUtP1t+RMMp+bczcaywlG4jCkgk0JGjQ7MunAfIifQuLWSypQz
         6b9pIzm4ZXx6rd4lAwpKPnHj5zY8B/WzMsaNoWSvRfTuonFwq4pd8RRrRnE9wVW1Xfhy
         a6d29FQ7FtOhH+jD7tdzL9IoTHkfCHFGKp4cSuCzBOkEiDY8SXzLY8dpfyWbsIhLYOIs
         uwQN9ovxpk46col9157bdDzOePCCazU6uHf0ypGYsSPw4zM8bASDTcnVwQ6AEPVAl8Cf
         vSI33Td/LD1WPZC3aybLg6qPPk92FN9cwH6XCCk8xBE0LUyoBxdAnMNReCZ0R5/9kecF
         1crw==
X-Forwarded-Encrypted: i=1; AFNElJ914L6CTipxT1adpMG4tFNM0wg18t31R9HGwNGEoqkKasaaUXBDDwSHuOdHDRMxqKsQOsfhNH+J344=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU3hQVPY2lRISZV3B87er0+tGN4Jp+ksZFFIv4Iqb4ftaPaIX8
	SJsUPy6KyaOsH70kK8jEPJ7ihaRU3oU0dABHQQ++qeRpiCELoImqsoGO
X-Gm-Gg: AeBDieskjf5Yc5f5FgNyc067N58lqH3BeLyurVoNorPXT2bN/L02nFXPQ5FHxuo/wNk
	LOBlIiRmVeZapgLT+gz8a3sBt8g7OCKBT7hbJpU6pPhp13mx4lnJfcHwz7dpQrnTq1Csx7Q7mrt
	57lXOKYRO7ZHUetRkD2u3CR7KmDU8CGRKr5Pa4D0wJWgmt6Xmi8ECHcbYZr8sumk43cjCYmY99R
	jt6hvCmq+4yDSns6pbbq6JSFHE/pSBhXrjc8etvNpeBBX2p9s89/HQmFn4+hLE0Hb/O6MEznzde
	gLCU4hXxGRpXmkWtWwQ8gshgAlpDCbQI9lweU3W9CgtOP57jw9ZmqQbMVsEG5SGt7wFo7NacYgb
	FCVmZwNf7LzEVqLnjtYm9rXpqyJYuXvgSjpBK6HIKmOVh03XITeDHTwY7bftrz/I+Q5zqlaT5ez
	ak5wTDveEbXQiDtTjwkgLu59mwzgiji1wxxJ68iGJL1gy6geyZJPKvSTc4Umf/MpV/Pn8yDft1B
	uJA2x2KvaCXTeKINlQ7p4LW1d/H4FM=
X-Received: by 2002:a05:620a:450c:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-8fd1824178bmr976368885a.41.1777817730017;
        Sun, 03 May 2026 07:15:30 -0700 (PDT)
Received: from server1 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938e0b9sm766261985a.9.2026.05.03.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:15:29 -0700 (PDT)
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
Subject: [PATCH v3 2/4] thunderbolt: property: reject dir_len < 4 to prevent size_t underflow
Date: Sun,  3 May 2026 10:15:06 -0400
Message-ID: <e3c84da6e0c1defbb07e712939df0db1b2019fff.1777817011.git.michael.bommarito@gmail.com>
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
X-Rspamd-Queue-Id: C86A44B5FC2
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
	TAGGED_FROM(0.00)[bounces-36857-lists,linux-usb=lfdr.de];
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

On the non-root path, __tb_property_parse_dir() takes dir_len from
entry->length (u16 widened to size_t).  Two distinct OOB conditions
follow when entry->length < 4:

1. The non-root path begins with kmemdup(&block[dir_offset],
   sizeof(*dir->uuid), ...) which always reads 4 dwords from
   dir_offset.  tb_property_entry_valid() only enforces
   dir_offset + entry->length <= block_len, so a crafted entry
   with dir_offset close to the end of the property block and
   entry->length in 0..3 passes that gate but lets the UUID copy
   run off the block (e.g. dir_offset = 497, dir_len = 3 in a
   500-dword block reads block[497..501]).

2. After the kmemdup, content_len = dir_len - 4 underflows size_t
   to ~SIZE_MAX, nentries becomes SIZE_MAX / 4, and the entry
   walk runs OOB on each iteration until an entry fails
   validation or the kernel oopses on an unmapped page.

Reject dir_len < 4 on the non-root path *before* the UUID kmemdup,
which closes both holes.

Also move INIT_LIST_HEAD(&dir->properties) up to immediately after
the dir allocation so the new error-return path (and the existing
uuid-alloc failure path) calling tb_property_free_dir() sees a
walkable list rather than the zero-initialized NULL next/prev that
list_for_each_entry_safe() would oops on.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
v2 -> v3 (material):
- Move dir_len < 4 reject before the UUID kmemdup in the non-root
  branch.  v2 ordering let dir_offset near end of block + dir_len
  in 0..3 OOB-read the kmemdup before the reject ran
  (dir_offset=497, dir_len=3, block_len=500 passes
  value+length<=block_len but kmemdup reads block[497..501]).
- Fix Fixes: SHA (was e69b6c02b4c3; correct is cdae7c07e3e3).

 drivers/thunderbolt/property.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index f5ee8f531300..90fa6f760963 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -173,11 +173,16 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	dir = kzalloc_obj(*dir);
 	if (!dir)
 		return NULL;
+	INIT_LIST_HEAD(&dir->properties);
 
 	if (is_root) {
 		content_offset = dir_offset + 2;
 		content_len = dir_len;
 	} else {
+		if (dir_len < 4) {
+			tb_property_free_dir(dir);
+			return NULL;
+		}
 		dir->uuid = kmemdup(&block[dir_offset], sizeof(*dir->uuid),
 				    GFP_KERNEL);
 		if (!dir->uuid) {
@@ -191,8 +196,6 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	entries = (const struct tb_property_entry *)&block[content_offset];
 	nentries = content_len / (sizeof(*entries) / 4);
 
-	INIT_LIST_HEAD(&dir->properties);
-
 	for (i = 0; i < nentries; i++) {
 		struct tb_property *property;
 
-- 
2.53.0


