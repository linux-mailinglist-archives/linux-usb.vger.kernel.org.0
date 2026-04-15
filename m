Return-Path: <linux-usb+bounces-36249-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JRaA7eF32nSUgAAu9opvQ
	(envelope-from <linux-usb+bounces-36249-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:33:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C8404490
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5402D304CE88
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 12:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706752DECBA;
	Wed, 15 Apr 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IActRP8x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E9E2D7812
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256350; cv=none; b=Bck/Fhy9UxdmsSftmFVqk14NmNJz8HCwE6YWw4IB2bjDUjpuzrgvGVRC+q6IqAwZYk6zAPdZLcBX69WS8OXYJg5MIk7v3s6Vl76VDp/poOyohb1SN3kOSQvTbRHB2rsqt8e1yj1spR/Dv6qNbgkASrGhvi3tdJ8/naxBQ8ngRqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256350; c=relaxed/simple;
	bh=V5rhUICHKrtVS+VjsbYW9zZmMYRMee5pEQyn/IO+H4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9IVT7ZQAXkEcYWHQQn+N1PHbpj2YChiAQEoy/KfYu7SdirWdJtc/xa6gXHzV19z1ZAw04ANzDa+boUH+clMJyI12pGL+JxWXn5nObeV5lAcnH3roxyaa9UKPiK1rznlL5oLFk4MxoVFlhfYDwYh72yh5OiviUtAzmAF4u4O0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IActRP8x; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50d8e11b948so66698721cf.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 05:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256347; x=1776861147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4tBTeu6/viYuFA/jm9+9NVpLFwhjRRaKWPLY9i5P/o=;
        b=IActRP8xapeA8cJ3JS9dfgHRRssqS44VtHYGLuz6Hlb+3pkCkBG9ratwxAXBa1OPJ2
         G+7+7qA9oZ7TvDqmCGnC/H+htSYWrNo5U7xQGaHAGQNmFp0Bdp13P08mna7v9FpjWifj
         gOAfdP9vrJoR/Fkvo9NZS4VOcsf6Uz9fbYuo6fhbNr3GFXxZEYF+PTKraG161LS+WUBv
         tadv/SxNfVate93ppjIlfJYfqkFVT1y/H+2ceqH9pu2hEY09sd/jHH2aQxMMEoF8ibCi
         L5LMS4WHZmvFZGoi/W5tlZwJk4S1EixWr+VWHUortmEpkBCTwyLjXQIhaKuNnE929M2l
         73vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256347; x=1776861147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4tBTeu6/viYuFA/jm9+9NVpLFwhjRRaKWPLY9i5P/o=;
        b=CSmy0TrTtlNy2evBkwCpifPp5v5NAhPvpYYqsgv8C56J4NFm/r7WVqn8eAYxruDfKY
         5BOVojbIGPGoVswCjkcDr3zWptniWEpAqgSoKk6dM4NK1SsDgzwKe++n5ihAGapcpyvF
         zZjsVFq1K+gcLo6ksJ9A+57B8Q9ItpMfiYrLUxZGvJqn1UwZO9wT7DeZ27iQkJNLv2pg
         3V87NnaNZ36dvaEbCs8WW43qPaGcu+mpg3hxuTGNjtzP1PY5GSJD36mJQC+he9HAKkeU
         APIyunpa/WaEitTawCczWCRMPYt6F08DVz3aUUWdYMPuX6Or1oqEaaSVC9q4oe3EQFn/
         mK5w==
X-Gm-Message-State: AOJu0YwpS5H9LwZ8B4mRV4PO/mYqzWvH4EenMtj9PNq9YzcK0dFNKyhZ
	EgBIC8Q2rZ6gXxhp0CxCN8hxHtbPHMtBrRNx+7P6nCriYh9/mFO8aeo+Rt/A3w==
X-Gm-Gg: AeBDietabs/bkykeK6K1QCaol6JH97Null3VgXoEoWra9zLGyQ9NOx2cUklcv+XBvAf
	apu4nba4YOl9RIbcgkIwm4uPbltsVe9mTlmr2yURofGLWuB+F58FcYTc4/yqdGBTM4ULoi+idBz
	SWYwMhtiCjQAW/sooCZmXxbbWibz9+PzY6lKZwy8xd09mtsnBv2HEFBdtJPo3+Kkg+gW9hmG4zP
	dW1kR4DMxFsGGs4E1dMdhZAMKObJxsQXg8fFV5AVcn89UzxWwVpXZ4rfOdXCvZAOvcGhWyNOXLW
	lzeRA3cVEYMWJR4wH1o4fP2C7MUTE6KKAKNRleTA2eQBE23kMuTTLXVvwoZvIuqDWo3gApVsita
	Oj9jmhDancC2wGMe4tmO3QfgvDtBeubDTzZ8Zr2yAnuF+ZHHdthZ5gIKkLTtQwyFRNULo2Qst3z
	GXv27yNqtiUCb20Ye6H7/zch1OP0GJzvC9nbb3zTcEweSbZD2YcujQpNQ6hbCWyFcQFmu5onvBh
	Er8gK+eJdN8ekkAKqfwwl/ENCTn3rBywcWPDxnJ+2hJKuG7X+3SykCvm8caZGa0
X-Received: by 2002:a05:622a:6694:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50dd5bd98c4mr217424231cf.53.1776256347106;
        Wed, 15 Apr 2026 05:32:27 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1af9dc5fsm11747771cf.16.2026.04.15.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:32:26 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: linux-usb@vger.kernel.org,
	Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] thunderbolt: property: reject u32 wrap in tb_property_entry_valid()
Date: Wed, 15 Apr 2026 08:32:17 -0400
Message-ID: <20260415123221.225149-2-michael.bommarito@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36249-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9D3C8404490
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

entry->value is u32 and entry->length is u16; the sum is performed in
u32 and wraps.  A malicious XDomain peer can pick
value = 0xFFFFFF00, length = 0x100 so the sum 0x100000000 wraps to 0
and passes the > block_len check.  tb_property_parse() then passes
entry->value to parse_dwdata() as a dword offset into the property
block, reading attacker-directed memory far past the allocation.

For TEXT-typed entries with the "deviceid" or "vendorid" keys this
lands in xd->device_name / xd->vendor_name and is readable back via
the per-XDomain device_name / vendor_name sysfs attributes; the leak
is NUL-bounded (kstrdup() stops at the first zero byte) and
untargeted (the attacker picks a delta, not an absolute address).
DATA-typed entries are parsed into property->value.data but not
generically surfaced to userspace.

Use check_add_overflow() so a wrapped sum is rejected.

Fixes: e69b6c02b4c3 ("thunderbolt: Add functions for parsing and creating XDomain property blocks")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/property.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 50cbfc92fe65..f5ee8f531300 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/uuid.h>
@@ -52,13 +53,16 @@ static inline void format_dwdata(void *dst, const void *src, size_t dwords)
 static bool tb_property_entry_valid(const struct tb_property_entry *entry,
 				  size_t block_len)
 {
+	u32 end;
+
 	switch (entry->type) {
 	case TB_PROPERTY_TYPE_DIRECTORY:
 	case TB_PROPERTY_TYPE_DATA:
 	case TB_PROPERTY_TYPE_TEXT:
 		if (entry->length > block_len)
 			return false;
-		if (entry->value + entry->length > block_len)
+		if (check_add_overflow(entry->value, (u32)entry->length, &end) ||
+		    end > block_len)
 			return false;
 		break;
 
-- 
2.53.0


