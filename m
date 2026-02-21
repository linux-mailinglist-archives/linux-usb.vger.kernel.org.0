Return-Path: <linux-usb+bounces-33537-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7+vZDNnFmWmfWgMAu9opvQ
	(envelope-from <linux-usb+bounces-33537-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 15:48:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A8C16D0D3
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 15:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 298D730104B1
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 14:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21301E8329;
	Sat, 21 Feb 2026 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0ahzpOPS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263723C0C
	for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771685332; cv=none; b=g1T5lBBltCFLRY21r7bAG+XrcbNsKAKvhawosQVlxMPXhwhVbsYPlydpsdPUEpXHeJ4lStlgVYFFTfEb4++PRx/C4uiz/s8WJG5X0O5/0mLJDSExwfo0lhJ/RnTRsiaBxpsxrg9GRrt6KJ41av5ZPQx8gYfUm8EVgQJuTwxlwOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771685332; c=relaxed/simple;
	bh=pa1l00BGp2sFEpVEWaG6S/kk96F25r1m65GdPTUCQOo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=s7Yp/Asv2dMK9ok3w7rvs4z49Ga7Cv1WnspfnYl10Ihu2KJZjGyaP7FuI5PBi1m8wXOe/+2LCJpl1tZMEknr6yyq6asC/SUHdkzfUtJ7V6ociev6LBKeuCGUmrIGMRVpofU+w+xDZrYNteH1Bjemm3EEm/grNYB3iXcDMQw/Itc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0ahzpOPS; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ad44941ea2so19066865ad.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 06:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771685329; x=1772290129; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Du+384ZedRT+x/jKj8fIov0gzI7zT0YnlZm4cqc7XM=;
        b=0ahzpOPSxJhYyf6Jb8FRSwvaiDXBfVd1RBRgJFCWwp3yFFns+hgBEIQiot0actfoXK
         Czvb1H5ITmSRYgvnZeAM0wNQRXp7yw3R12PTfSuzv4AkU79OHtq8/aoJbQU3QhAAvRWY
         m2WkEbpE+91ZgSdBQz5KsAes3dXmgm2IX2UR4xBc+K9A+TIHbCaPsZRAhGkT2QPP9mwC
         0CqXHDgbtCrYHNqnQjIaWj+oifJYnxuSg2BdqY6t/JsvHlpGxyqop+nvjsefpLri4Kh1
         8BRwyDU0s06gRffo9zQ3em4mB/FyCStBEH5T0nUkyPS1lGAvC5Tpw5qsSpY8y18CLUoR
         Hxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771685329; x=1772290129;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Du+384ZedRT+x/jKj8fIov0gzI7zT0YnlZm4cqc7XM=;
        b=ttX+HwVZs7JlOxFDGN5FJuea3T2W1CcW4QG2lMJvQ+QX1pWwPOdfSX4WrSz6yQqWqb
         uLujlKXKi+Ke5QEFp21BrmzFzoLQMnW98nynE5fUDrabytZqBdWDuPABl/SmRaXCj1jw
         8Waoxhmr3qvQgWk7GBsEJBeaaHDLeRUDsaBMQAY/4QtCUAePXq4jILm20PGtf6ppyL5d
         eFnfMUSgbS/+55nb9x4B1NhEKZFXHqPYkrRifANmegIztxZr1z04zwYZKuzxNFW2ynQt
         6sP/QQUoIoey3B0dzMcWo18SGI6gIhXMBll1W2mD/zqSIHeAPSQYT+/z8kHnapMNPZvs
         PS2w==
X-Gm-Message-State: AOJu0YyK3l9CeaCjxL19sdpRSU5N81QyCMp5/KRiX3afJ2HdGyYd9dUX
	eTVFBCmnYYS2ThrIWVQTtRlFNZmJLAAdg/UPct8dNMENY8GSmZdMgJj2C5WmiegueZHLni1JtYQ
	6n9vhcg==
X-Received: from pgbdm10.prod.google.com ([2002:a05:6a02:d8a:b0:c6e:1f73:d5b2])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d791:b0:393:2434:683a
 with SMTP id adf61e73a8af0-39545fb8023mr3024746637.67.1771685329348; Sat, 21
 Feb 2026 06:48:49 -0800 (PST)
Date: Sat, 21 Feb 2026 22:48:14 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK7FmWkC/22MywrCMBBFf6XM2kgebbCu/A/poh3HdKBNJJFgK
 fl3Y9dyV+fCOTskikwJrs0OkTInDr6CPjWA8+gdCX5UBi21lVq1YiE34iY8ruKCUirdd5NpDVT hFenJnyN2HyrPnN4hbkc7q9/7N5OVqDM9dhOitcbeXAhuoTOGFYZSyhdLIL+YpQAAAA==
X-Change-Id: 20260214-legacy-ncm-8c001295b343
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771685327; l=1841;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=pa1l00BGp2sFEpVEWaG6S/kk96F25r1m65GdPTUCQOo=; b=hfRItOOsT5hnqhCxCWFkrL5bCRgMJJgao02FY3Y7ZLvmN7SQCXO/X7Uzbw4bS5lbDpQFip+5Z
 ZS/4NbYI+EkBcC0OjUS2G8V9uNoZ7hFIQo/B4U3V15mUZyg+FN+I93n
X-Mailer: b4 0.14.2
Message-ID: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com>
Subject: [PATCH v2 0/2] usb: gadget: Fix g_ncm regression and atomic sleep in f_ncm
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org, 
	kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33537-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91A8C16D0D3
X-Rspamd-Action: no action

Commit 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle
with bind/unbind") addressed a lifetime mismatch where the network
interface outlived the parent gadget. However, this introduced two
regressions:

1. A NULL pointer dereference in the legacy g_ncm driver. The legacy
   driver attempts to access the net_device during its binding process
   before the NCM function driver is fully initialized.

2. A "sleeping function called from atomic context" error in f_ncm.
   The current implementation holds a mutex which might sleep within
   an atomic context.

To resolve these, store the configuration parameters (qmult, host_addr,
dev_addr) in opts_net until the network device is ready for g_ncm.
Additionally, remove the net_device pointer from the f_ncm_opts
structure. This eliminates the race condition with configfs and allows
dropping the mutex, preventing the atomic sleep issue.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Changes in v2:
- Remove the RFC tag.
- Fix NPE in gncm reported by the kernel test bot.
- Fix a "sleeping function called from atomic context" error.
- Link to v1: https://lore.kernel.org/r/20260214-legacy-ncm-v1-1-139c5bcc6636@google.com

---
Kuen-Han Tsai (2):
      usb: legacy: ncm: Fix NPE in gncm_bind
      usb: gadget: f_ncm: Fix atomic context locking issue

 drivers/usb/gadget/function/f_ncm.c            | 29 +++++++++++---------------
 drivers/usb/gadget/function/u_ether_configfs.h | 11 +---------
 drivers/usb/gadget/function/u_ncm.h            |  1 -
 drivers/usb/gadget/legacy/ncm.c                | 13 +++++++++---
 4 files changed, 23 insertions(+), 31 deletions(-)
---
base-commit: da87d45b195148d670ab995367d52aa9e8a9a1fa
change-id: 20260214-legacy-ncm-8c001295b343

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>


