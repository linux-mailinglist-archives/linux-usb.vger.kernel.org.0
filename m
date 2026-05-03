Return-Path: <linux-usb+bounces-36854-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPuqNYtY92mbgQIAu9opvQ
	(envelope-from <linux-usb+bounces-36854-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:15:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B164B5F7C
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07C4D3003705
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 14:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1189F3CCFAC;
	Sun,  3 May 2026 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnhGm6rq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DE2727E2
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817731; cv=none; b=GJ2fxsH5YNOZizG44ffE4E6T/NOkZLxdBFRA4C8pD3UoOnF6yIkksHZh08ZUEAetRoiPfz9r9N54WuM6Cm78v3DZ/QPaLI/l8QeeMHYs9bDiUuDuTKHqc3SEJm0pyWCJfgfd13FzXS+8LhlbbgZF1fi+BQFzuj1arm/TmXgwEHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817731; c=relaxed/simple;
	bh=da761sZYS8Qfcqjx7tTH+rDqBWoz2Abmcj82tsKx624=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkdxXBCSym5mpQWrT3bowgKh/zFxRVdiz8r46LgCfuUk7pxvsYDWlykitfPHjD6hNlbE/6FPElX6ZhnTJglEwgD17Zl32UoIMbB3aJG/qzdwJTCA4VL1hXOgzVEf1MkYr56h5sz2qavl9B8FfxSEfueAW2KlQtYK0zESEd1QTfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnhGm6rq; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d65f4073bfso466625685a.3
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777817728; x=1778422528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iAjdO9SNYauCKwr63OH+1/upS4pxxHhAek9kVw0MsI=;
        b=hnhGm6rqI4DTXlq8Mp0qa3Bsbzg00s1PC2VPqxMF2kvB36iyUs/XiSAOfC2xouV6Jy
         pOhT4UdO6mRDZbkqpbfRoYRQQH+NKwBHEYxePpvx7Ag24Ibn2U92pR5S0F+mYz0UYF1x
         mDtyPTLkWeqB+kniyYFZRdEWdc+ZRkVkgBraaArLYCPwYqBEUannh6aan6ZfExdGuGdh
         98VZ16k5SAOudSEuMK0OiT0euem8iFNoKXtDk4QwUpj+AJL5uW1Xht7ihKIK7mubZ9DV
         rQPrWB8ojVRZ4E8S/zhZmjDKu8DqY0iVO88qn/38laEFxAYG6oKIAhjOyHZCFyuzjuLX
         asgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777817728; x=1778422528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9iAjdO9SNYauCKwr63OH+1/upS4pxxHhAek9kVw0MsI=;
        b=Wz74mO/TsEJXQMdZrXqbDFQriwPm5HFfQgtkCKvsWQuH4y8pN+nxyx2lpYBdVBrhiH
         dEC1doXxm0UPrP/m41dQu5sWpTO3JyZYSJpki7VAjJZSvN8yGosEvKWlRfSvGP9Ju3uk
         EIn6gQygn6mIdji7XuYTW2qLbYEa+MVTQfX4Nh0VtRsXKMBFYwbI5Xe20evao6C8sIN6
         cfkw32AANMhdeUUHY+DrIA0iV9o0Pzj3PtT4U6fdo6L/4d4bNU1bqwom/1Ac2KjyUKgl
         23GUPy0MG0ub+36fNawpyu2CP4oZTlwKOC1hB4EmV5xD2o/6mysS6UMHirDQq02kqVq5
         Wdlw==
X-Forwarded-Encrypted: i=1; AFNElJ8wd0YMba+6lK8RLfvrjlfxC7ETcmMQntQ7zleN8m8ipLY8bkfsgSrOZ6+x3ETbHJk0ONhUNVRruyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX+MQMD1cpwleVFpzVHMwBpf7J+gI0sLRcKgIk/MAClLRYvSlB
	qNZGhOFB5LbbQ/qpXVkhNaetMeaZ7G6Onmuy5uGNq31ZGki4/geacn+mszkBwhHm
X-Gm-Gg: AeBDiev4VNQZzjd687lI7gTuuWCASzR0QDW2QlnX+XnD1dHEMCBHuggoEmvaaGyFA0X
	nIjxIAUtN1SYTXgm38D1izCmwqSCEKHEQL6QNWagyo1+SyE505BZp4VWfb565JIsxA4g0fApaxS
	gzbThKByQgVT6LjB8aRmtVr/fu9NPorVWoN2tlt/aJ6aUHBls00xRZRw2cCS5NkTOFYiuLh6JL6
	V0pyExPRKN9P65cHpA6c5iVdcmx4Vj4JLRQZJL7crhfAL0WI7QKACM9+3oXB4rM3QjwRcqTu8Db
	NsX8CB6e6xZFe6UJ5Mo91pM2iZCJlmL9tG0MeIm1RKbL7rJPQXCwhKHfSiTeT9PlNWjVvqliLpP
	DZ/e9Mbz19YjacBs11WwH+a8nfkV8S0e48de7DQ8k+saqOEEYEux90vP9QlH6ZMncpfTpyyne9t
	JXfiFx0RJKxXcI+fm2gz6z/MNoOXcYtVQ93qKidGTa3BrwodrDjwOz5PEP5fhkmxrzZt3kA4rxG
	YcE9/X9IyPsWlk+XPFtvQtnt7ZbaQ0=
X-Received: by 2002:a05:620a:2a0c:b0:8ee:630e:351d with SMTP id af79cd13be357-8fd15ade400mr1019838985a.12.1777817728309;
        Sun, 03 May 2026 07:15:28 -0700 (PDT)
Received: from server1 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938e0b9sm766261985a.9.2026.05.03.07.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:15:27 -0700 (PDT)
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
Subject: [PATCH v3 1/4] thunderbolt: property: reject u32 wrap in tb_property_entry_valid()
Date: Sun,  3 May 2026 10:15:05 -0400
Message-ID: <eeedf1e42fd71d3686b352b402466a70482f8b22.1777817011.git.michael.bommarito@gmail.com>
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
X-Rspamd-Queue-Id: E0B164B5F7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36854-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,intel.com,linuxfoundation.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]

entry->value is u32 and entry->length is u16; the sum is performed in
u32 and wraps.  A malicious XDomain peer can pick
value = 0xffffff00, length = 0x100 so the sum 0x100000000 wraps to 0
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

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
v2 -> v3 (no code changes):
- Lowercase 0xffffff00 in commit message.
- Fix Fixes: SHA (was e69b6c02b4c3, "net: Add support for
  networking over Thunderbolt cable"; correct is cdae7c07e3e3).

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


