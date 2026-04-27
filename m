Return-Path: <linux-usb+bounces-36509-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCYLBiwa72mB6QAAu9opvQ
	(envelope-from <linux-usb+bounces-36509-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC346ED79
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5929D30115BC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDB639A04F;
	Mon, 27 Apr 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3xgmFOj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F13537E0
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277474; cv=none; b=l/aKg5+A2IMyEInyCUTEN7IjWLYdib7ZcCtLhG4JotpLy1gnRkk7CFH6CIzuhv/fohb4gOlRkd/kxXH/HBOKwvRwEHb68qkGqnXoyZD4Lk3gS/mec7VG1GnPj1dqxiN+lok4+q5C/MujKRFIzE/mqzo93pXO4MddklDxZrXEpXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277474; c=relaxed/simple;
	bh=OV6cXHsKhht9PRauGZoERydqDgxANolu7NVs0q+CPHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e3R8rDYqSxdkXTldv/+fEQH0XXX+GVlwt6wLmBYTtR7SH0f2zNk9bo2ucfeLPeJZ2wzvskcQTEj+Bl+i7Xpx8n5DePdFgbsJkoqHKjTPbHtZVOUrqS640UqFodT503y5gMakB5cRZP16qIQN+10RAz9YKBu5m8YrBZmP40BXENw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3xgmFOj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277472; x=1808813472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OV6cXHsKhht9PRauGZoERydqDgxANolu7NVs0q+CPHM=;
  b=Y3xgmFOjUP0M8h9sI7y815miGZkzoyQ0Iss+Wohy32KYhlsKNJRY0Sfr
   ybCQqxb+XDLaw8tNrzHZ17Kuc9yy6EfKh0m0dT+v8UTFA1BhM7mH4YegI
   l9yF4LHBCnPIAcWK/ZH/ZfsdwbTENxtOO5Wamuz453yemzTu6bSPeEk/Y
   cM4zWBa4kqS1JRAdw3RU4WJlvcVggyRXZ32jE+CCd6p55o6Lq8jE8moMS
   Q+bNSISMHeM2nI5MyL67r6fgjHhZy2l/W6Xh87LSXPePEOjutrpayp/jL
   qm4A//oqqgY/hsqqIrxJr3+fzS76gVBbHVasijSU6CvndFyvqxYYl6KLb
   g==;
X-CSE-ConnectionGUID: FKyv1Dd1TbyUojADjsJxQQ==
X-CSE-MsgGUID: vLnryVp3SE6F3hpxdc8q3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77863243"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77863243"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:12 -0700
X-CSE-ConnectionGUID: J9IGOfEYRJisr555R10Wag==
X-CSE-MsgGUID: vp4TdiJuRbq5yJphfmyC6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229008928"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 01:11:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 741679D; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/12] thunderbolt: Keep the domain reference while processing hotplug
Date: Mon, 27 Apr 2026 10:11:01 +0200
Message-ID: <20260427081109.2337731-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
References: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4BEC346ED79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36509-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

We process hotplug events in a workqueue that may run after the domain
has been removed by tb_domain_remove(). For example if user unloads the
driver while at the same time plugging  a device router we may have
scheduled tb_handle_hotplug() to run. Avoid possible UAF in this case by
taking the domain reference before scheduling the hotplug handler in
tb_queue_hotplug().

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952..34b7d18cce56 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -98,7 +98,7 @@ static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
 	if (!ev)
 		return;
 
-	ev->tb = tb;
+	ev->tb = tb_domain_get(tb);
 	ev->route = route;
 	ev->port = port;
 	ev->unplug = unplug;
@@ -2527,6 +2527,9 @@ static void tb_handle_hotplug(struct work_struct *work)
 	pm_runtime_mark_last_busy(&tb->dev);
 	pm_runtime_put_autosuspend(&tb->dev);
 
+	/* Undo the refcount increased in tb_queue_hotplug() */
+	tb_domain_put(tb);
+
 	kfree(ev);
 }
 
-- 
2.50.1


