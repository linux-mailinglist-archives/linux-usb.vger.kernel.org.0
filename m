Return-Path: <linux-usb+bounces-37326-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLBuG4EeA2r10gEAu9opvQ
	(envelope-from <linux-usb+bounces-37326-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:35:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C78575203E5
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81504307B65B
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C51037205A;
	Tue, 12 May 2026 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Izl+UpS0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFBD4C0438
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589021; cv=none; b=o8dsUxFtcmDflfTaCekd/be2bBTYKBUSIMEqFGe0pqEv9j28YtpaeeEtdkxeQIh0RuGi5mqlHqeVAoW3SceYUJhMwvG4JmG1tKNsabQd2ioxop0ZPSr5tSwvvozR5UXqv47/xuGfyfy7/OYdJVtgkxeSq8OLgJmsgiuF5asi4oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589021; c=relaxed/simple;
	bh=ClcMDxy1MI7W6AfYsBU5vss4O1m8p+ot08e9klWHpbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Avlc9mxOv/kdBly6cX5kjWcp9bZu+JBY5i3d912mJ0Q31ZO8K+8YmWqzSGO1vmXAUyRawZmYxbZJC6EfIc4LVTwgAt+G7203gPEI6L/jYxYAQp8vgNvzaeYftNYec6BFDu0HRdmLARqmaWYDnEHiVFjo+SNdjgtZtNkpbuLy8jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Izl+UpS0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589015; x=1810125015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ClcMDxy1MI7W6AfYsBU5vss4O1m8p+ot08e9klWHpbQ=;
  b=Izl+UpS0rSyJndyoEpNDjKv3aFHVAjjYGurxpPUqxPqyu6SkPYjLkkVp
   Osn90A9+U55X3NkJsNoQS49uwj8bAjZuUrJ1rcG4kLDXBshUdf3Wgycq/
   zPOpxpo2lOuuHI1ZzKeFFVHitmx9F9KkQcWLLtr1G+L2FOh3lo/RXp2GJ
   BhtDHGn6pMd3L7RNWJ4YNZIWslvYefoUpTvKn8Mh2Z/OtRLnjqC+DSVfq
   bcTB5XyADvw1kMUgm0OQ2qvIRWnjA0ikXUe+uaGrXGRw1tvJLIH6G53FE
   Ekw9KNsG9fzRyq2kx1jgK8Tt9cXWl4a4EVyEWvI0D8s77LNlwGPPD+opU
   Q==;
X-CSE-ConnectionGUID: I4fGEYBGR4OqYvcMqTRuxA==
X-CSE-MsgGUID: 43u6hoOARYKh1zxjCm+kjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950600"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950600"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:29:59 -0700
X-CSE-ConnectionGUID: VZ/9U0xxTLqqaGa27r8EAw==
X-CSE-MsgGUID: 7vfXGvxuQim0f2B8ajmsuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692675"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BDE419D; Tue, 12 May 2026 14:29:55 +0200 (CEST)
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
Subject: [PATCH 3/8] thunderbolt: Fix lane bonding log when bonding not possible
Date: Tue, 12 May 2026 14:29:50 +0200
Message-ID: <20260512122955.271688-4-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: C78575203E5
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
	TAGGED_FROM(0.00)[bounces-37326-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

From: Gil Fine <gil.fine@linux.intel.com>

Currently if lane bonding is not possible or not supported, we continue
and read the updated number of Total Buffers from lane adapters unnecessarily
and incorrectly log the bonding as successful.

Fix this by bailing out early when bonding is not possible, avoiding
the unnecessary read and the misleading log message.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ad0ec8f8ee28..f421997c298d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2977,14 +2977,14 @@ static int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 	int ret;
 
 	if (!tb_switch_lane_bonding_possible(sw))
-		return 0;
+		return -EOPNOTSUPP;
 
 	up = tb_upstream_port(sw);
 	down = tb_switch_downstream_port(sw);
 
 	if (!tb_port_width_supported(up, TB_LINK_WIDTH_DUAL) ||
 	    !tb_port_width_supported(down, TB_LINK_WIDTH_DUAL))
-		return 0;
+		return -EOPNOTSUPP;
 
 	/*
 	 * Both lanes need to be in CL0. Here we assume lane 0 already be in
-- 
2.50.1


