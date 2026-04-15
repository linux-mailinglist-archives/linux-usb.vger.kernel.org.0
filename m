Return-Path: <linux-usb+bounces-36250-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPyKC+6F32nSUgAAu9opvQ
	(envelope-from <linux-usb+bounces-36250-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:34:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F404044BD
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A7E130D63BE
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 12:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA521303A0A;
	Wed, 15 Apr 2026 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRuL/Sls"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E116C2EDD40
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256351; cv=none; b=HVyFaHFqScXNMa9fsaYtKNY3CszNVVaClSmhcz7Dj66632hPw8VRSsvrukpV9BUD80JYtsFGyEjrEsh1DXjuaxtqCDVPlSZgczbQRzGPHpvaBdWqvQZu1x0fktPNC1W664j85FMb3JhVZ1pS6hnzDSJx3kUKlkn/6ynqNQIThT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256351; c=relaxed/simple;
	bh=G4Iv3OWeIHGXB+LraZ3MVrzNrWpsbA5Z8zV9UrKVmV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YELD2AzhBNagO4o23z0+2dLhaYojUBJYeOWuDEBp2pm6aAtg2dhY79KVpjVmp4nac5ei9u/p5i1WK7bbKZcab0KdvYFiQXfiCq/NaRuRp20tqCn6CzXlOxDPk/ZDr/P4l7nhHpXZYvT4Po/U9Xi5FSWSyxjEqiS8JhiF8z4zxOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRuL/Sls; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50d87610513so66024971cf.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 05:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256348; x=1776861148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXoMF+reUIolfhLax07DDnj0adinknHFiCZenjJxIWg=;
        b=IRuL/SlsPFU86CK8TE13g8EZvGyCAE5MSGSyrSKYp1vt9LZWr5MTC+1UrVdcQ/FI/8
         EiDCdUUaauQplbDkpxoh9UUoB4k6l6Y8SwrRWABsuDzHLLGwl/n63U59ndqHPihelyfd
         WVk7svX3aVKjnyu/8Z+olnL/pJ+EAynjy3vgEgO0izRsNXQ4sTipkpfgzR2bHKEsqdjo
         kCw7EZZymg8mU5/oJIoqcxTyeHbwK3V6+CAm4zwUSffVYYLUfFzxrEvd7WEeMHYmiepN
         9g98KkDEbySn/P7QOg5hE37WJtQyl3eSyDTv9Qs+z2Pl16jmIl/vjGyK1GshtTy9y8ys
         ggLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256348; x=1776861148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXoMF+reUIolfhLax07DDnj0adinknHFiCZenjJxIWg=;
        b=KIyr0UE+RWvU/J6XmeKOsAt5vSAaJgvxsZrfm0ZV2wvEQD9mFnOYJmxhpK/+FpGKVF
         8q2zGyCHSVgGwgplN5MS/cndSDYGMOozX9DnTMSQebB9pcwfQw/2KOPgkCWVMP5FHXcN
         WZHqfHJjfQlFN67bgmcAbuNiMWCinrtL0NcGiU4uWcOQPhBMUbmC6TBBBvGSt6/7EIOk
         hiMw+TgIxqvSIhThLKgG9hCr5JCaIgNFE6yPCvdiDf8oBJNSnWrp7neMOzhTN2TRZ36A
         lKpgO3jo3W9MsBqnS3F4oALOF3rbo7cFL9g3WPzgsV9rHmJ4Q479hjOQJu80XGaiLnjZ
         OiMQ==
X-Gm-Message-State: AOJu0YxomtfIwZgUPkIpCx1a8094OXBvmHwQguUl7RIFHTLJWgbNzNLv
	mvSc87v3xtYGVr3SnJ4qNJPbwqo4jyaHo73vLyNtXzQjqxVSM6WedQx9Q25IYw==
X-Gm-Gg: AeBDievNn4d8rhXBNvep1O6l5s6WyvZpLzZsgvST2Ds4D+DPUJg3lJuOvZqZtwLfkhw
	7zkB0ZInTeHV4E4+NA04QC+zwzLsZu+PeH8R7MAqOxyRzLISbnuVawOi7BMhjHqBuuMTGk8ugNY
	c3+ow5i/Qm0ocdhPyYkRpJF943dVtHPMY50pMSkoC8RM5kJNAil6m0qfwUQVvtslRb2549ANZla
	lXDQJz36dqpNnHNab4spQN0PJwFfU2Ho8HcN3aqmUM+B1vuyK7IcJpAY7moJqQ0InNAYSCwGmNA
	c1uP4VRBFMcqL3l0XtA+KalzqJC4hAJd1B6aXw8QWz6w5Ml60A0mWf53emPqZTSEtNfvKCVyDuH
	DV81pWtv3bXvsoIBer4M5TjQt8HI52PglqLDeATBOF5gckut56kM3DWbx4eVLYGgzUrMCAnNLBI
	mcG5AMPRWkHYFTW5yTRk3OKEX7OJk/PEwrcX0zafMb+6pWzUqrXc0Dg43csG+MzItJ41mOICS8H
	V4Ur+f1WyCuKfzcfwM/q+sq4JCmmoafigsEfhjsORSPgks7nP/bOw==
X-Received: by 2002:a05:622a:1a8e:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-50dd5c6cd3amr313880951cf.43.1776256348536;
        Wed, 15 Apr 2026 05:32:28 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1af9dc5fsm11747771cf.16.2026.04.15.05.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:32:27 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: linux-usb@vger.kernel.org,
	Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] thunderbolt: property: reject dir_len < 4 to prevent size_t underflow
Date: Wed, 15 Apr 2026 08:32:18 -0400
Message-ID: <20260415123221.225149-3-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36250-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.983];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74F404044BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On the non-root path, __tb_property_parse_dir() takes dir_len from
entry->length (u16 widened to size_t) and computes
content_len = dir_len - 4.  If a crafted peer supplies
entry->length < 4, the subtraction underflows size_t to ~SIZE_MAX,
nentries becomes SIZE_MAX / 4, and the entry walk runs off the
property block, reading OOB on each iteration until either an entry
fails validation or the kernel oopses on an unmapped page.

Reject dir_len < 4 explicitly before the subtraction.

Also move INIT_LIST_HEAD(&dir->properties) up to immediately after
the dir allocation so every error-return path that calls
tb_property_free_dir() (the new dir_len reject and the existing
uuid-alloc failure path) sees a walkable list rather than the
zero-initialized NULL next/prev that list_for_each_entry_safe()
would oops on.

Fixes: e69b6c02b4c3 ("thunderbolt: Add functions for parsing and creating XDomain property blocks")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/property.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index f5ee8f531300..274b555d27c8 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -173,6 +173,7 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	dir = kzalloc_obj(*dir);
 	if (!dir)
 		return NULL;
+	INIT_LIST_HEAD(&dir->properties);
 
 	if (is_root) {
 		content_offset = dir_offset + 2;
@@ -184,6 +185,10 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 			tb_property_free_dir(dir);
 			return NULL;
 		}
+		if (dir_len < 4) {
+			tb_property_free_dir(dir);
+			return NULL;
+		}
 		content_offset = dir_offset + 4;
 		content_len = dir_len - 4; /* Length includes UUID */
 	}
@@ -191,8 +196,6 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	entries = (const struct tb_property_entry *)&block[content_offset];
 	nentries = content_len / (sizeof(*entries) / 4);
 
-	INIT_LIST_HEAD(&dir->properties);
-
 	for (i = 0; i < nentries; i++) {
 		struct tb_property *property;
 
-- 
2.53.0


