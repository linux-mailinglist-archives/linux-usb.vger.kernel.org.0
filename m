Return-Path: <linux-usb+bounces-38218-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LFUaKlYqHWo4WAkAu9opvQ
	(envelope-from <linux-usb+bounces-38218-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:44:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239C61A4F1
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1D553012CC3
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 06:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EA6377EA2;
	Mon,  1 Jun 2026 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtIpGRbO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8836AB54;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296266; cv=none; b=cQzPxhktoYPEO5N2rs+4zu/hGwrvTjP8H/tg5azZdaKMiizjR/0+/RHDLKHvz6bwhFwLv10eX2V9G+QOklFicALRtX6k0h+0PJOHv99aF7U+sxPkk6+pa+T8L1JqPN7UC9h79e7DJFv8XctFry1+/EGWjnj1Pv2dLED6jlYDLvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296266; c=relaxed/simple;
	bh=xHxB2pOSyyZowRo09CbcvppCJJkUZGCEt2dPo1xU3bY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i3iPHlxMpPWGRABT1gWn2dfvT5I94MJHTXHCPyjmD0kH9r0PnjS9Qf/MP+UhS/Jn8mHo6S+RY6qlhGKjT9HOFely1H/ljD/FTMDkAzIYqfws3+36IrJvuwwvPgAKeBE/titLJLQ/73gUGx6zWqkHmmTWKdq8A+bIk7KKuFN5T54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtIpGRbO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95E86C2BCC7;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780296265;
	bh=xHxB2pOSyyZowRo09CbcvppCJJkUZGCEt2dPo1xU3bY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YtIpGRbOZBublqs07WJyDoPgqCshO8xsvsth/yEuCLF5wpUSgQVk5gGJStN7J3VSH
	 /yd5LQYEB77iEbmd7UvwDPoQVYaCbtiNfgew4HNyOQU6cypaWm+udQOEz5/oPNfVeU
	 tAKKDl5vCxO9ftPl0PBNThe6rYKo3jPWAEapEQ93YjUeaY8GIMDsumiUiReBmczrlf
	 wIrSn0c6CiqUhvpYlaQBoNk5u54goh2LvKHun2ZcutN1pgdoonqLDNrGF6GB8zJtkv
	 6jX4OLikJ4a0X1zY/NUDlswqQBAhdXlHB4rCqeigucXAnSpyuuP6yn5ZjSA/+0WdCY
	 9nD+QKxYO2E2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD56CD6E56;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
From: Gabriel Prostitis via B4 Relay <devnull+prostitisgabriel.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] USB: gadget: fix mm lifetime use-after-free in
 async read paths
Date: Mon, 01 Jun 2026 08:44:09 +0200
Message-Id: <20260601-mm-uaf-fix-v2-0-3c942a707bce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADkqHWoC/22NwQ6CMBBEf4Xs2Rpapaae/A/DoS4LrLFAWiAa0
 n+3xavHN5l5s0EgzxTgWmzgaeXA45BAHQrA3g4dCW4SgyqVLquTFM6Jxbai5bcwsjGNRYvaKEi
 DyVOKd9m9/nFYHk/CORtyo+cwj/6zv60y9/6KVynKZK8uElGjPetb5yy/jjg6qGOMX+btw1y2A
 AAA
X-Change-ID: 20260531-mm-uaf-fix-91d9dacac692
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alan Stern <stern@rowland.harvard.edu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780296264; l=2076;
 i=prostitisgabriel@gmail.com; s=20260530; h=from:subject:message-id;
 bh=xHxB2pOSyyZowRo09CbcvppCJJkUZGCEt2dPo1xU3bY=;
 b=mgTzuF/rBl+4M9iB+1XIy28i/YyzgWvgjl/QTqb3d0ERehpAlLOpmAu3Qa94CZmoawG29aMEF
 fORc8iZZ8ocB4zR65g2ozfbNbdHnVYC7mmQwYw75ad3RMw8tBfliU0a
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38218-lists,linux-usb=lfdr.de,prostitisgabriel.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_SPAM(0.00)[0.725];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[prostitisgabriel@gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 2239C61A4F1
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

Signed-off-by: Gabriel Prostitis <prostitisgabriel@gmail.com>
---
Changes in v2:
- Fix swapped lines in drivers/usb/gadget/legacy/inode.c
- Link to v1: https://patch.msgid.link/20260531-mm-uaf-fix-v1-0-91571cc6ca46@gmail.com

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

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



