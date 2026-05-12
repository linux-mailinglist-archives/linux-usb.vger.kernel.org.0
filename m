Return-Path: <linux-usb+bounces-37323-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED8eJHYeA2r10gEAu9opvQ
	(envelope-from <linux-usb+bounces-37323-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:35:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4145203D6
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10499306C7C3
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C206338E8CF;
	Tue, 12 May 2026 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZFKFMQz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5F360EEA
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589011; cv=none; b=iTm8Fo6GwUZWyOWPF8HuDrJkQ5LDjRwYoOUF4HesT3GOFv5pNuJSkEtP2esopOQ4VXsppo/Tk6W+sRRtq/orD1QEcF+tCQhkX+Nzp+d5OG7I8lDO+p/aDZUGsMzrZ43eAtFQ9FcxT33k87RcPG2aZLkePxGFuWuWXMrYn7jcGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589011; c=relaxed/simple;
	bh=a6OCs22o7mAGrwuBXxOtFDJHnMUqfpCJ8roTLDHCm+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyK/2PC5BPZ9BNm2LQGVoxWDIG/7H9oMNL6Un6qzZmpGBbDN/do3a1Lfrma960EhxFJhsVeKmvD2dyzhEhHwikjaA/dx8KbF2YtSMlz35k9/QnPS1C0erp+lhvnzAMlSDyLG7lVpL45QvPboQaH41nzWau4pC/7DNI2EijYHmh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZFKFMQz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589006; x=1810125006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a6OCs22o7mAGrwuBXxOtFDJHnMUqfpCJ8roTLDHCm+c=;
  b=bZFKFMQzh8I3HHmd7kWoyNX3V/+OQR9wPmveLLgrUEDL283PTs0Y+hVM
   fQvna/H94WvigL2MBoF0q2lnbzPHbMorprcjBfD4w+0ee0XeT3USOcvln
   R3Q5u2p7cp4rzvPZEsBne8EltZ8OjMwI64iBiMhBegHJkvP0e/oU52kMr
   mtOAnRWODEw5wgrIhdm5KGsra9ZdWSMMUd6SI464ZHXR1r23VqufpbJud
   ccYJWPfv42g562bLWYMi48elSN4b4yUpSmQajcnFWzuPKP8Cf4+bWHuSd
   q2FJoEOU0c8vCzkVWdOk+nUsq9NrGUYkkAPSIjxsrZG/Mj+uS0nGxC8oG
   Q==;
X-CSE-ConnectionGUID: 0fv2CIhtS0KHb2cYcTMsrg==
X-CSE-MsgGUID: SftBt5FsRjiluhroNvcKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950589"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950589"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:29:59 -0700
X-CSE-ConnectionGUID: wsEg9BQaQtm9RlluOkkEtQ==
X-CSE-MsgGUID: H+Te4GgVRSq9W9Hjjy8Pxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692666"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C152B9E; Tue, 12 May 2026 14:29:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/8] thunderbolt: Activate path hops from source to destination
Date: Tue, 12 May 2026 14:29:51 +0200
Message-ID: <20260512122955.271688-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
References: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DA4145203D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37323-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Gil Fine <gil.fine@linux.intel.com>

Currently, path activation starts from the last hop (destination adapter)
and iterates backwards to the first hop (source adapter). This does not
follow the order suggested in the USB4 Connection Manager guide and could
potentially cause issues with tunnelled protocols.

Reverse the activation order to start from the first hop (source adapter)
and end at the last hop (destination adapter), as suggested in the
Connection Manager guide.
Adjust the rollback in the failure path to deactivate from the first
hop, since hops are now activated starting at the source.

Fix kernel-doc accordingly.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 0092b2ec7873..b2c322e76b8a 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -484,7 +484,7 @@ void tb_path_deactivate(struct tb_path *path)
  * tb_path_activate() - activate a path
  * @path: Path to activate
  *
- * Activate a path starting with the last hop and iterating backwards. The
+ * Activate a path starting with the first hop and ending on the last hop. The
  * caller must fill path->hops before calling tb_path_activate().
  *
  * Return: %0 on success, negative errno otherwise.
@@ -526,7 +526,7 @@ int tb_path_activate(struct tb_path *path)
 	}
 
 	/* Activate hops. */
-	for (i = path->path_length - 1; i >= 0; i--) {
+	for (i = 0; i < path->path_length; i++) {
 		struct tb_regs_hop hop = { 0 };
 
 		/* If it is left active deactivate it first */
@@ -576,7 +576,7 @@ int tb_path_activate(struct tb_path *path)
 		res = tb_port_write(path->hops[i].in_port, &hop, TB_CFG_HOPS,
 				    2 * path->hops[i].in_hop_index, 2);
 		if (res) {
-			__tb_path_deactivate_hops(path, i);
+			__tb_path_deactivate_hops(path, 0);
 			__tb_path_deallocate_nfc(path, 0);
 			goto err;
 		}
-- 
2.50.1


