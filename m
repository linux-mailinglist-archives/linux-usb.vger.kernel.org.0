Return-Path: <linux-usb+bounces-36855-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EpyO4tY92mbgQIAu9opvQ
	(envelope-from <linux-usb+bounces-36855-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:15:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD24B5F7D
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 16:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47E1430055BF
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 14:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2197D3CCFCE;
	Sun,  3 May 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOIkYowp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE335839C
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817732; cv=none; b=QHQB9KvJMDTz+19S+uQUr4lknhgZK6Xr5h/4ejzRSlz57uwF6zMBDd+/ln7NRerbh5TcUBxO4d+Sbq/zyKcguw+7TSN/XY6eCQlT48BxmcZn080xFkB5lyg5GWaI2hYGQoKmk/gRnV3VTwzBqrX5MBCxxiOFEoN6ue8B46e0t7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817732; c=relaxed/simple;
	bh=/3d3YUB84LBvSg8RhpQQfhKFPCfmZHQblYjmVcQdYRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1rimYOLYGW0l2GBifup3frRLxnQyALS7d0apDMmN9g9/MIAgkwDc0f9lZljuuQ8RlIiWdkUGrN51aJVMpLW9gAIUexBMPWFlnYeXKFjm1pvaINhbf6f1PLxCaoNXz//klaNdTGTRQWWhGA5zJ/erGR1EpBt9u8h68E4lLtlqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOIkYowp; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d68f702851so382411485a.0
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777817730; x=1778422530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPYl+D5Z/0OwSvKuu86ylxC+ZLb/TAcjdwtykkm9EUA=;
        b=rOIkYowpOoO7Jc3pacQKgnoZRJpVMZesXCTv7xuRmBtGD6z5TCroZvtBC7llf8OL6R
         cVKXTwkyoDHnXL/lg5GnMtaeYLfSPJpurBqnI7sZt1eNvWK3qCeannswuNKsB+rTAXNY
         tFFkB/oDfqe/G+0zAXlMWGzfq3IM9N3FCSHCTYTa5Tt9utoXhfTjq0bkvp63aLjH19dX
         1izhf4+Vd4KRbEsDBzhiT+Kw9nY9ifFbefK0vz6knVzJkSif91vCzVOF5z1tpfDcu7jF
         /JEcXULktTIaAiDv4YnVgyzm3FnNDs6ezY05BpTgQtwH5wOtGyYV0OeFQi1+XNUZSj0n
         IQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777817730; x=1778422530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SPYl+D5Z/0OwSvKuu86ylxC+ZLb/TAcjdwtykkm9EUA=;
        b=F2KHV9qpTJbIJR53VYZ5I3lgdKObcR189NmocRjamlxjYF+Hv1Qra5wMOhqcbodha7
         9ji27t9nTodtegRSepT4PMdAxNnBJ1lOxd2yG6oaApAZa9Zz3I+OCmTMr/xK3g2yugU5
         Ex/GoHi4y8nebs/DWfP4tVk47e3o6JjdSednQqpACK51u/m5Naa31uFyOUXKAFn4zn5x
         23xiRtGGrpEZ7fj86dDNY/w81DABiTHsBM046ZI+mlPR0tuue9nTJ+WMbGlX2Rz6CKej
         zpIpyEXnNWDP5mDS8J0EQxeSDi7zQFnm6wDd4yvOKeUF8xWDDyJ4SGXbeDI2rwRU4yNq
         VkMg==
X-Forwarded-Encrypted: i=1; AFNElJ8eAP2JtGKDLtWr0gZb6zY2MUYB/+pK2IP/Hwg4cVzOswil2tUuWrc1IAqei1vGml/pV+8H8AQdCTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3P07z2KXFWz3ZLYKmfpw0uPkY0V2JasTvuKnSpRiUnnxEdw8
	4vjBdtShzu1J4DqdARlAU3BjR9cT67dLCajBo+1D5ncDESqQnlGeDATh
X-Gm-Gg: AeBDieuoGeFG/Ja1gaeTj6yCofn6kBJ7ypuyCtb1t50ifb5RAs1IRTWw7Qd/Oqs9Nsj
	vrEyIp1ImKxXtRoL8l12P3kc5Smws0Mg5YnG+Aum/agyI9M5Jo+b21iW8/gCsZRAqJfS4k7SIkp
	STTJECshtCb13jLciJSQDfrOHe7rWra8663Y6w4NgbZwaiKQRjg7BOMU1GsMT+nhsVEVyLErem2
	If6ZKiT5/Wvfz8XZwkdzYb41xRq0TF6DNgjbWwIvU4XmIZZ6q09wsp7xJpICvMPqhP1ZZL78dbf
	4UAPchM6CVhLB1s4gNWXhCzbsUOH8kXSDVans2v8rwBUshFgtbd2mqlb46emhq2r3YXPN6pW3g3
	6VjhIlrCDNgHAKf7mnwf/RDcnpMMTWfZpk14hTx3g2Ds5w2D+0VTsGM8ELQJnBekJvBSQebq8H7
	IcpqF1QFx8avEbTInwv+MF2GsQUk97IT18GcJ+VnYy3EkvupJ1MADHj6O/FwtYjdg0p4jSRxpcL
	GgxJjd5q582GwiU16eVn443E/7A2uA=
X-Received: by 2002:a05:620a:400a:b0:8ee:21b3:2eb5 with SMTP id af79cd13be357-8fd155f2302mr958377685a.6.1777817727083;
        Sun, 03 May 2026 07:15:27 -0700 (PDT)
Received: from server1 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938e0b9sm766261985a.9.2026.05.03.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:15:26 -0700 (PDT)
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
Subject: [PATCH v3 0/4] thunderbolt: harden XDomain property parser
Date: Sun,  3 May 2026 10:15:04 -0400
Message-ID: <cover.1777817011.git.michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415123221.225149-1-michael.bommarito@gmail.com>
References: <20260415123221.225149-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C1BD24B5F7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36855-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.990];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Caught a few more cases, so this addresses both your cosmetic asks
on v2 and the more material changes noted in each patch below.

Three independent memory-safety defects in drivers/thunderbolt/property.c
are reachable when an untrusted Thunderbolt/USB4 XDomain peer responds
to a PROPERTIES_REQUEST during host-to-host discovery.  The peer
supplies up to TB_XDP_PROPERTIES_MAX_LENGTH (500) dwords of attacker-
controlled property block which the local host passes to
tb_property_parse_dir() as part of the control-plane exchange that
runs before any tunnels are set up.

Patches 1-3 are one bug per patch: u32 overflow in
tb_property_entry_valid(), short-dir_len OOB+underflow in
__tb_property_parse_dir(), and unbounded recursion in the same.
Patch 4 is three KUnit regression cases exercising all three.

All three defects are OOB-read or DoS at worst.  No controlled OOB
write is reachable through the parser; parse_dwdata()'s destination
is a freshly kcalloc'd buffer sized by entry->length.

Operators who do not need XDomain host-to-host discovery can disable
the path entirely with thunderbolt.xdomain=0 on the kernel command
line.

Reproduced on v7.0-rc7 + CONFIG_KASAN=y + CONFIG_USB4_KUNIT_TEST=y
via the KUnit suite in patch 4.  Pre-fix on a v7.0-rc7 + patch 4
kernel: u32_wrap fails with a KASAN use-after-free trace in
__tb_property_parse_dir() (the parser reads ~16 GiB past the
block); recursion fails with KASAN + an Oops on RIP=0 as the
parser exhausts its guard page.  dir_len_underflow returns NULL
on pre-fix because the downstream content_len = dir_len - 4
underflow makes the entry walk bail at tb_property_entry_valid();
the UUID kmemdup over-read is silent here because KASAN-Generic's
slab redzones do not flag a 4-byte over-read into the
kmalloc-chunk tail.  Treat dir_len_underflow as the post-fix
invariant pin; u32_wrap and recursion are the active pre-fix
detectors.

Post-fix (all four patches): all three pass cleanly with KASAN
active.

Changes since v2
----------------

Material:

  - Patch 2/4: move "dir_len < 4" reject before the UUID kmemdup
    in the non-root parse path.  v2 placed it after, so a crafted
    entry with dir_offset near end of block and dir_len in 0..3
    OOB-read up to 4 dwords past the block before the reject ran
    (dir_offset=497, dir_len=3, block_len=500 reads
    block[497..501]).  Both that OOB and the original
    content_len = dir_len - 4 underflow now hit the same gate.

  - Patch 4/4: tighten dir_len_underflow's buffer (7 dwords,
    kmalloc-32) and reposition the entry (e->value=4) to focus the
    UUID kmemdup on the chunk tail.  KASAN-Generic does not flag
    the 4-byte over-read into the tail, so the test remains a
    post-fix invariant pin (documented above); v2's wider buffer
    obscured even the post-fix-pin shape.

  - Patches 1/4, 2/4, 3/4: fix Fixes: SHA.  v2 used e69b6c02b4c3
    ("net: Add support for networking over Thunderbolt cable"),
    the wrong commit.  Correct is cdae7c07e3e3 ("thunderbolt: Add
    support for XDomain properties").

Cosmetic (per v2 review):

  - Lowercase 0xffffff00 in 1/4 and 4/4 commit messages, and 4/4
    code + comments.
  - Patch 4/4: hoist the on-wire entry layout into a single shared
    struct tb_test_property_entry instead of re-declaring an
    anonymous struct in each of the three tests.
  - Patch 4/4: use TB_PROPERTY_TYPE_DATA / TB_PROPERTY_TYPE_DIRECTORY
    constants from <linux/thunderbolt.h> instead of bare 0x64 / 0x44.
  - Patch 4/4: convert all multi-line block comments to put the
    opening "/*" on its own line per the thunderbolt subsystem's
    coding style.


Michael Bommarito (4):
  thunderbolt: property: reject u32 wrap in tb_property_entry_valid()
  thunderbolt: property: reject dir_len < 4 to prevent size_t underflow
  thunderbolt: property: cap recursion depth in
    __tb_property_parse_dir()
  thunderbolt: test: add KUnit regression tests for XDomain property
    parser

 drivers/thunderbolt/property.c |  32 +++++---
 drivers/thunderbolt/test.c     | 132 +++++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 9 deletions(-)

-- 
2.53.0


