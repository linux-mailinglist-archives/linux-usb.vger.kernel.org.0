Return-Path: <linux-usb+bounces-38005-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KOxCqgWFGqFJgcAu9opvQ
	(envelope-from <linux-usb+bounces-38005-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:30:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724C5C89C5
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2AB5301BECA
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC24D3E63AF;
	Mon, 25 May 2026 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slEtP1tM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923725F988
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701342; cv=none; b=sgls/JZqior8qXbaMZvHl09Pr5n2cvOe/J2e0Wc6hwFdVnx7A7hv3YpKd0cj4+IFAaAGtMyeajxt0nw6SDf6iBRYWcm9N4KBHFPLdjknpdmybAvOGWYT+Ve7Klhd0MWgLRo0nN0RzQd798eSNZoRiOcWo3ggZUbR2SaGOji/ddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701342; c=relaxed/simple;
	bh=oRcRReuuL2uOsa8tofODlTfTr2wFpNOKYmsL6dymuwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIFNZLwpPpRAXaGfLO3ziAVeas4dVm0n31vRMDZN5/VkdIRTUrI4ZIf0MYuo8mLmN9nIQ/fs5IhtFxuIOvx7l9PRqQQirpsQIusoM453xz0vZ2Bp0KbIUedFZRp4ur5kDe6AnGtLASDg281XBy/fF8QroDRUMjJxHcgFnSoV4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slEtP1tM; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8b6c9fdb68cso87416456d6.2
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701340; x=1780306140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs/GTZf77euP8CWwg6koAQaKj3q73D7iZ013TlHvejo=;
        b=slEtP1tMOWiJaZUTZsMksdc0PjOqGDLsMuFcY+45DkSNxiem5aS+KNzJ5DveQq3e9z
         zcW+u3S3bG96VSYxbpRcL5WgfG5vXwiZiwXClI4e+AMbdujhNBoVjU3+SKLj+1lVkjaR
         nHAwDv5rMRLM8efEhUEm4+a0tBtrmeqKMMrFk3NrixqstA8CIkvL67O+7QcMpE1StxVa
         7FbI9QAMpoq9SUxcaVJIvSh58nJ060LJiBexutIYVoTwSmNGRG5fbS/Tu0c6+R7/1n4b
         s608vswccEIwfJYABl1YXRjUA+ZypYrj4lteu32rDh1dFED2wwXdvQVJzrfCUBcnfAaR
         nEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701340; x=1780306140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rs/GTZf77euP8CWwg6koAQaKj3q73D7iZ013TlHvejo=;
        b=ogKNgxRpKMTk24Sm8T6Y7G9ZQVZSH3XGL2M2c/O2AIV+Iqo7GgiERvZqw8ljGoBNtn
         Rd4k+0a+cRqvf1lJFmjIQP5rWki04pYmboyopsaUjXq2HeUZpDznm/F6FT9kim+YjleV
         joICZDvZINrM1eMK3m6SvUTjyHdsrhJxFzMBFDExJPC/0nEkxFbBGmB378CH+XPaJGcV
         W3tfRJISHkTM6xHxdQr7tqnSNkEjEBgPhwfsisx1AnwoimfX5Rvrhr5WcIpXL3BTPwLS
         WQE4LrrYgwrx0I/dA4AhLtSA/sQ/xZ3TO8GSWnLeOepjUm561gJhiSaIeAm70iQFW9yZ
         RfqA==
X-Gm-Message-State: AOJu0YxT9hJTP63CNoyVnZOJDXxUBIpJcqtNcqkaG/uqNSxEPWFMmvPV
	qiMLyZV0icqcxfEZ5yi33KCaGNsTEmCsaJPO6AB8LYq59Fnu3elLAZ+2
X-Gm-Gg: Acq92OFUFSv8K6BmZ+/qUUEVqv1wZ4CQXe0DxHhCg8PYGu7Cua9BWM3YA7t1Yzo7T5r
	leXk6L1+2m0POh78sTys8/iZ0acLHurtgaUYjw4p+FU9b2cUKYfvYpVRiUXyd2QyCCwk+yjl1Nt
	on/5Ew3maWpTccg8Oa6PhK2treQMaBuEqYVYsFGya+lJf7aAt/Xqd54HkU3u3QTX5/SVDYxKBYY
	0qEFdnUFwxkTHWVqUy3/loCayGFVwQKEBJJVxeVkLUTb9yBBAYGU0RYQoDtpGDQ6U346OlEoS6b
	Bk1GjCNSS9juB7pmJH12tDrHd8QcuXTIOyjKczjB9EKUyi3HFYK6Tci4u4eFi8MKcuaz1UHUxdB
	V1r/oitOmDNbnN91ffWhu5bu58/JxOspFw7BLLjQmjxeWtoTxoWJYxQkKODTxEOEp4RVIUPzFB6
	wd73GagFKojuLdLt0IIGYUzRcHdahXZiwnvQS5iSZbErkyoFK7rHPDvMo/4mDujpwZzPs5bgV/n
	vKNzKDyNY4IGldcJmqkH1togjsBK3bnRi4Vhe8xu18=
X-Received: by 2002:a05:6214:300e:b0:8ca:164c:a861 with SMTP id 6a1803df08f44-8cc7b4ec38emr247568386d6.2.1779701339783;
        Mon, 25 May 2026 02:28:59 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf4a9sm104255826d6.2.2026.05.25.02.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:28:59 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] thunderbolt: reject zero-length property entries in validator
Date: Mon, 25 May 2026 05:28:25 -0400
Message-ID: <20260525092830.735472-2-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38005-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 9724C5C89C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tb_property_entry_valid() accepts entries with length == 0 for
DIRECTORY, DATA, and TEXT types.  A zero-length TEXT entry passes
validation but causes an underflow in the null-termination logic:

  property->value.text[property->length * 4 - 1] = '\0';

When property->length is 0 this writes to offset -1 relative to
the allocation.

Reject zero-length entries early in the validator since they have no
valid representation in the XDomain property protocol.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index da2c59a17db5c..5cbc1c4f159c2 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -60,6 +60,8 @@ static bool tb_property_entry_valid(const struct tb_property_entry *entry,
 	case TB_PROPERTY_TYPE_DIRECTORY:
 	case TB_PROPERTY_TYPE_DATA:
 	case TB_PROPERTY_TYPE_TEXT:
+		if (!entry->length)
+			return false;
 		if (entry->length > block_len)
 			return false;
 		if (check_add_overflow(entry->value, entry->length, &end) ||

base-commit: 928abe19fbf0127003abcb1ea69cabc1c897d0ab
-- 
2.53.0


