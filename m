Return-Path: <linux-usb+bounces-38204-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI6/OLmiHGrjQwkAu9opvQ
	(envelope-from <linux-usb+bounces-38204-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 23:06:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413C7617F58
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 23:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06C2A301AD15
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 21:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB28368D7A;
	Sun, 31 May 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crx0ncgT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091CB2DCF6C;
	Sun, 31 May 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780261553; cv=none; b=X0gg+xW9afUIDe0PDGQzLQPTj0KcO60dqRtzsUzzu1VcA1ulLWMgC+2W0nB90pkBEyAmPgb8Z5hZ2QlbMc9oxrBAjPuRL9RB1YVp89SeWDZOZ174kDkTevxQPq7fyWB/yIn3HMC4DZIbNAOu8ZKXC1SfCySIdATR+3KGRHyglT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780261553; c=relaxed/simple;
	bh=9xHmw36KDmoY3u+JBaKiwE1xkfzVDG8gdznwLgAwKC4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GMf+aMiEYRT4z3LbLd/iVPt6nDl97idx0LhJpEiXmS9gVdLB8fAiZti00DW+xM3Ha9jgjVBHPLHzKgXcasjLp4TLgP5/ovqV+xgww7aHGLdFaNBruPgluND/fd7PZV0AuyqYK6kMNvfgZQk/enWqF05OLQfZxgyf7ZMAlOwmoI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crx0ncgT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8282C2BCB4;
	Sun, 31 May 2026 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780261552;
	bh=9xHmw36KDmoY3u+JBaKiwE1xkfzVDG8gdznwLgAwKC4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=crx0ncgTpxfXevAb2frzCNwLmZDlNSC++E1s/x3yHdWMdFcy5C+XW/wYj04ciCnHJ
	 Al3kkmEv5fc6KjNo+2WlcPt9Mm4ATevuk3LosRIUNtv88rHNQrWLQYXD/UT+RGODsn
	 jPFIcBnA16cYwRfYuIhLDTWPdVsNYb4TTG0Rh2UQPkS7MlBiSAdg4IOiBhmt3gw901
	 YXYP/m5Ow29rZbFJ6UWs/PRFgZ2vTavrelieifMdPnNyLaj5G23McdhoPrwlKlcQSb
	 Me+80FrmTVl73xbugvo2ARGorUthIQaig2pNfzCRqQ2Do0IMH54hRZltDzVybq2PrL
	 r8QO1pNkpCeyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04E2CD6E55;
	Sun, 31 May 2026 21:05:52 +0000 (UTC)
From: Gabriel Prostitis via B4 Relay <devnull+prostitisgabriel.gmail.com@kernel.org>
Subject: [PATCH 0/2] USB: gadget: fix mm lifetime use-after-free in async
 read paths
Date: Sun, 31 May 2026 23:04:39 +0200
Message-Id: <20260531-mm-uaf-fix-v1-0-91571cc6ca46@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeiHGoC/yXM0QpAMBTG8VfRuXZqm6h5FbmY7eCooQ0peXfD5
 e+r739BpMAUoc4uCHRw5GVOkHkGdjTzQMguGZRQlSgLid7jbnrs+UQtnXbGGltpBemwBkrzF2v
 a33HvJrLbW4D7fgCpR8VlbgAAAA==
X-Change-ID: 20260531-mm-uaf-fix-91d9dacac692
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabriel Prostitis <prostitisgabriel@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780261550; l=1813;
 i=prostitisgabriel@gmail.com; s=20260530; h=from:subject:message-id;
 bh=9xHmw36KDmoY3u+JBaKiwE1xkfzVDG8gdznwLgAwKC4=;
 b=RzkI0hNCePrSRxMfjkqz0VDak9y0kh1TjLp01zBROSZG5GOmfu5kQ/UY3ABwLLlrRPqZwbJyo
 TM/g2fRVhpyDkNQwz6n2H2yNaqyZJUf9fTOqf5X+TT3bHew4gu8F1wY
X-Developer-Key: i=prostitisgabriel@gmail.com; a=ed25519;
 pk=FwuU+O6ZnvvnFVA45nfqkGlhSmC1P64HLtxRgBebOuY=
X-Endpoint-Received: by B4 Relay for prostitisgabriel@gmail.com/20260530
 with auth_id=800
X-Original-From: Gabriel Prostitis <prostitisgabriel@gmail.com>
Reply-To: prostitisgabriel@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38204-lists,linux-usb=lfdr.de,prostitisgabriel.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[prostitisgabriel@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.641];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 413C7617F58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a use-after-free in the USB gadget FunctionFS and legacy
GadgetFS asynchronous read paths. Both implementations store
current->mm in per-request state without taking a reference, and
later use it in a workqueue context via kthread_use_mm().

If the submitting task exits before the USB request completes,
the stored mm_struct may be freed while a pending request still
references it, leading to a use-after-free.

The issue affects:

- FunctionFS: drivers/usb/gadget/function/f_fs.c
- GadgetFS legacy: drivers/usb/gadget/legacy/inode.c

Fix this by taking a reference to mm_struct with mmgrab() when
queueing the request and releasing it with mmdrop() after
completion. Before using the saved mm_struct, acquire a temporary 
reference with mmget_not_zero() to ensure it is still alive.

The issue can be triggered by submitting asynchronous reads on
OUT endpoints (e.g. via io_uring for FunctionFS) and exiting the
submitting task before completion. This may result in memory
corruption in the address space of another process if the freed
mm_struct is reclaimed during the race window.

KASAN reports confirm use-after-free in the workqueue completion
path when accessing the stale mm_struct.

Best regards,
Gabriel

Signed-off-by: Gabriel Prostitis <prostitisgabriel@gmail.com>
---
Gabriel Prostitis (2):
      USB: gadget: ffs: fix mm lifetime handling
      USB: gadget: inode: fix mm lifetime handling

 drivers/usb/gadget/function/f_fs.c | 27 ++++++++++++++++++++-------
 drivers/usb/gadget/legacy/inode.c  | 17 +++++++++++++----
 2 files changed, 33 insertions(+), 11 deletions(-)
---
base-commit: 22d91cef94b5b86cff0d68ebfce7741740672704
change-id: 20260531-mm-uaf-fix-91d9dacac692

Best regards,
--  
Gabriel Prostitis <prostitisgabriel@gmail.com>



