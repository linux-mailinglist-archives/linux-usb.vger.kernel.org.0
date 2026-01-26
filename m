Return-Path: <linux-usb+bounces-32744-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKRrI4Hkd2k9mQEAu9opvQ
	(envelope-from <linux-usb+bounces-32744-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:02:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB31E8DCAA
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA1CB3008C9D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 22:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283722FFFBE;
	Mon, 26 Jan 2026 22:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aphbd4dM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1F3009ED
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 22:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464952; cv=none; b=jnfFdareJZtoE5nou+JPVOacuEriyviVH2Xprj8kONzLE7ANJNPuv1ZymDqudA7ZOkP4YYLBbNM6H+2P9lHonGqg1VjPAM1z8vnUAojqgIyAydzqlubxULubrVWxWNNwv+4YhPeOrW6Xxi/3oagFJd5F4ahUN/jghhi+GKcCjTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464952; c=relaxed/simple;
	bh=VDXdXsiMbClk6bJew3RIzx27bs5tmLuTMhOYK65aPlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paUyzTrYSbkd4lnI/qlXdxKuRndb4YXwqCHW40fUfp98Oj8L1QgiRA/gdv7FNa+bHZtmZqLkJ5//z80bQmn7yv1dS3M19C5Vg1EYKaxeT3nt9et/ZOY5wtQvjtZ0zKfcxIz9WdYYajIB/CzCZc973YFBTWWBxzrSRNImV+MNz4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aphbd4dM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769464949; x=1801000949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VDXdXsiMbClk6bJew3RIzx27bs5tmLuTMhOYK65aPlg=;
  b=aphbd4dMx58OwVx9LeOtorK3yPKKJeT6nc+xLMu9DmlC7WJt5LhgQP/5
   wNmpYxvkp+vzxIb96opPNyyW2SbAaaSs0Uvc01jAcD5BK1T+RbCU99tqH
   aHlxGutnUtENz/sQZhRejcuJac17uFL18d4PK01MBo9VPv1h6x+tAXcvX
   3+XcU0PLWCHz75atEHcd89/fvJY7kPq9dErndX5G/Q3/5k6bNnCcOH2T/
   bqTczS+mg9iG6H10s6SeBsNdsIZpubbwsqfUwyDvSOOo2E3QGAak9ExFq
   XjzkToN5gNHdcXEtNIal+oqHiq9k8wBFnkBDkEYNsgQtR9BxEpJRdxDiM
   A==;
X-CSE-ConnectionGUID: /nYDryAkRW6hFf85SCwyzA==
X-CSE-MsgGUID: /0GE5qb9Th+3Qzw7heaoSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82019749"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82019749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:02:27 -0800
X-CSE-ConnectionGUID: qQL+zPJdSV+ZHVuBLVEecg==
X-CSE-MsgGUID: qgDCnQReT5uPHgoAOq+1Eg==
X-ExtLoop1: 1
Received: from cdjpc409-it.jer.intel.com ([10.12.50.120])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2026 14:02:25 -0800
From: Gil Fine <gil.fine@linux.intel.com>
To: andreas.noever@gmail.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: gil.fine@intel.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	Gil Fine <gil.fine@linux.intel.com>
Subject: [PATCH 1/5] thunderbolt: Fix lane bonding log message when bonding not possible
Date: Tue, 27 Jan 2026 00:06:02 +0200
Message-ID: <20260126220606.3476657-2-gil.fine@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126220606.3476657-1-gil.fine@linux.intel.com>
References: <20260126220606.3476657-1-gil.fine@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-32744-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gil.fine@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB31E8DCAA
X-Rspamd-Action: no action

Currently, if lane bonding is not possible or not supported, we continue
and read the updated number of Total Buffers from lane adapters without need,
and incorrectly log the bonding flow as succeeded even if it didn't.

Fix lane bonding log message when bonding not possible and bail out early.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index dda30e1d75e9..e7faa203b782 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2953,14 +2953,14 @@ static int tb_switch_lane_bonding_enable(struct tb_switch *sw)
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
2.43.0


