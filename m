Return-Path: <linux-usb+bounces-37212-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJXLLgoSAWq4QQEAu9opvQ
	(envelope-from <linux-usb+bounces-37212-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 01:17:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91310506C79
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 01:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77089301544B
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 23:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2E43A544C;
	Sun, 10 May 2026 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQUksigC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE7413B58A
	for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 23:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778455038; cv=none; b=RbyPCoIOSkhlRIHeUd3iaI+cbJm90P7L/haVFRqWaoRzH9/XkGrDqiqHmKHr7xPOnDu+GgPnfWHDt04voznsN8dXn38Cj6SJxeTfr4cZnF0ta4o90IS2NtJhL34Z8d+e3MyakSqAsHIVH1QjLGQhLB2f0dVnoLcsBR0HBgFMJqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778455038; c=relaxed/simple;
	bh=YZII72Oick9IeAiiaT/UnCAg+UD6smbLqUSA0eLyeIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dc7Ix4rYoIOO9P/uUzGN3I7HHe2Slh73HmNb1lA6ikMnNlioMBfpNyXoKpjourIKS9Fp/FYgu3hJmAxv0HBG8pOSofDNhRR53Nj4MzZXqnnmo7ARWyJJK2sQUdUmKMObsyE30VuOo44NNVS+Qji4G0P3JOqw7vjMBX2TjuR4SLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQUksigC; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50faeb8317bso27277971cf.2
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 16:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778455036; x=1779059836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5zjnDrUiSkYFu0TKawgtoTzPZ8uHjh+BGUiMJGyQLk=;
        b=OQUksigCEJ8SKvHMEQitSXdRtuM1VQkvtBZTZE5KtHS6gnfPEqyH5z1JZZj4xJkRAL
         VioUvrblo1UxzQ/OzclGdPJOCuNKALGPxzh0ewV71ZcPNQyNYHyUL7YtRcCfBODAIwWg
         9TilibBEP0rJAk0s8MPWA4QlUO0Y2ndpO+7kYOc1uxk1J8P6qoYnYoECl5uQZAecCwlh
         4mbcJnRpeKqHuGNyPOqVKjhcqHPE/AjFi/Z0aw4Cbo+HQqFsuO4yBSL8TWdNqBpn0VwT
         0p29C4j4+WcaVvZPxVK2AhzS7p8fek2b7D+uOuZ41DhMFbBqCmX/FedoFsCiQS2D/9BA
         wq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778455036; x=1779059836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5zjnDrUiSkYFu0TKawgtoTzPZ8uHjh+BGUiMJGyQLk=;
        b=qUyEMEHuSMGb9ufl7OFYlcPxnI1Dyql4wEG/WKVmuN6mntWmP9ulO9REnm2bqXT2n0
         1SbD6BtuWoI/K3sWWDZ2FjIb4kx4Gg37nctQdw06/BAP+cttwFz4FE7GVAgrfvbpiw2Q
         +OrzCc0dRLNw14F1BS3bBxHMahGnuSFdcUyenvnkqmOn3dCQGY7nudv0PasqyYx/JrQl
         cZJOhfjNSPu1m5VPqfLhbD5a+1vBelNxkBUhbPMLig9kxVFbx8pgKluwtA7TGuEi2wkZ
         s0rAF6dU7hoNNs6dytI8jl5tq+Ae0VTqQUW+ujL6hRaSJFNGIexiZDZizr5guEdEqzqy
         4E0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/W6IeeKLkgWhs28VUBvIkNkua88MnQxmnjyG/k/44te8Vfn5P11h3olnRjeCt1pSX9vUDB+gDDMe4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj6HUo8ybbjr5/1pTC7HG7RdNvk8mEuFODOuF85kjwrf3N9154
	z0JGd8XkodQY89dK49k12zoZKGcrBGvL3qaDYyW6Gb+5Wu+xr1GiA3EV
X-Gm-Gg: Acq92OFi3DsLghgmD1Xrx+lY3TNM61G68C+xOedMaCK8AcEmmoVD+vt6UPX9iQyRggx
	2RPdN59mnPh7GtimevZhWosrpullaJvdoPFrGpTFu+17orUCxp6p6/Lo86KYvCMn7whelS3GJKt
	r8sQhW9ZyX6hUgxuFL10srh7VHTbWFT968K+dTpaOSux+rpkZYRVC58VGyZS//1wjpI4+f4etMC
	BMV6TwL/Twd7z1WiiHVmbwUGtEYNqZSZ5pFxc1q9Hp1+jvogaKO8NG2n+vpCIvKGzsbfKDqnyUz
	VQnqwYKpKew21OYAJZOtODAI4nO1YeiKoxrTtDqsNG3VEh+3O3fOfofY1emWPltoi6kjf3XkgNq
	eg2chcENvN466b/xRvsiZciOMfUIowmmX8GJ1llr2hK1Xlq68SzsjOHG7TaQ2OsGcMFPcV77bDK
	3LhkALOAzCY8LO9zN2gDkp4l4G2ZibMXmf+JZW1gvq4tuTqs39ldfYZx+SHDd7VIHnCdVuL0a/I
	QhzWj8ENgWumR0d2n8HRBufEeiTKKbsf3SHV6KYQU+o0p8uc7iDbw==
X-Received: by 2002:ac8:700e:0:b0:510:1b61:d103 with SMTP id d75a77b69052e-5148e95028bmr124590681cf.36.1778455035680;
        Sun, 10 May 2026 16:17:15 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e830ddfsm75015031cf.27.2026.05.10.16.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 16:17:15 -0700 (PDT)
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
Subject: [PATCH v4 0/4] thunderbolt: harden XDomain property parser
Date: Sun, 10 May 2026 19:16:55 -0400
Message-ID: <cover.v4.git.michael.bommarito@gmail.com>
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
X-Rspamd-Queue-Id: 91310506C79
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-37212-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Style cleanups only on top of v3.  Andy's three nits on 1/4, 2/4,
3/4 are applied; Mika's request to drop the duplicated on-wire
entry struct in 4/4 is applied.  No behavioural change to any
patch; the bug analysis and the gating in patches 1-3 are
unchanged.

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

Changes since v3
----------------

Cosmetic (per v3 review):

  - Patch 1/4 (Andy Shevchenko): drop the redundant (u32) cast on
    entry->length in check_add_overflow().  __builtin_add_overflow
    handles mixed width via implicit promotion; the cast was noise.

  - Patch 2/4 (Andy Shevchenko): insert a blank line between the
    !dir error return and the new INIT_LIST_HEAD(&dir->properties).

  - Patch 3/4 (Andy Shevchenko): keep the four-argument
    tb_property_parse(block, block_len, &entries[i], depth) on a
    single line (>80 col) instead of wrapping the trailing argument.

  - Patch 4/4 (Mika Westerberg): drop the private
    struct tb_test_property_entry overlay.  Populate the crafted
    blocks by writing u32 dwords directly, matching the existing
    root_directory[] style used elsewhere in this file.  Each test's
    kunit_kzalloc is right-sized to the dwords needed to actually
    exercise the bug (0x102 for u32_wrap, 10 for recursion, 7 for
    dir_len_underflow); the 500-dword allocation v3 used has been
    dropped.

    u32_wrap retains length=0x100 / value=0xffffff00 from v3 so
    the entry's length field clears the "entry->length > block_len"
    gate (block_len = 0x102 dwords) and the wrap check is what
    actually fires.  recursion uses length=8 (was 16 in v3) so the
    smaller block can hold both the parent UUID kmemdup and the
    single child entry that drives the recursion.  All three
    pre-fix scenarios are still observable: u32_wrap page-faults
    on the KASAN shadow lookup for the wild OOB offset, recursion
    trips a KASAN out-of-bounds report in __unwind_start as the
    per-task kernel stack is consumed, dir_len_underflow trips
    KASAN slab-out-of-bounds in kmemdup_noprof.  Post-fix all
    three pass.

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
  - Patch 4/4: use TB_PROPERTY_TYPE_DATA / TB_PROPERTY_TYPE_DIRECTORY
    constants from <linux/thunderbolt.h> instead of bare 0x64 / 0x44.
    (v4 reverts to bare hex in the u32 dword that packs (type <<
    24), since the type byte is now part of a packed dword literal;
    each dword carries a `/* type=... */` comment.)
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

 drivers/thunderbolt/property.c |  32 ++++++---
 drivers/thunderbolt/test.c     | 126 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+), 9 deletions(-)

--
2.53.0


