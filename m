Return-Path: <linux-usb+bounces-37321-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOWwBG8eA2r10gEAu9opvQ
	(envelope-from <linux-usb+bounces-37321-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:34:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDC5203C7
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7447D3065C80
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFEA38D3EE;
	Tue, 12 May 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSUqIv+3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E66326D4F9
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589008; cv=none; b=QPGf4xNHcLvxBE9M+r+EK7um22hYrEd+9f+z8ukz2KVpeGdjk24+VuKSzv/28Dz0RG3+EBQKMADRlJBJ/+jxl/kDZYhXGl7T95sW+ukeQcvePcv/WKk95a/PPC3sDmjMxcGg6mBMYyc4xEk34SAdfbFbevZYeMKjFQx9CUAWQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589008; c=relaxed/simple;
	bh=8qj+Uvm0rjXQDyhM00C2bbQMUjHJkivIF3daT3WitqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e85xjkRnNFuGIC3BDMl7HvMMsEtUsmcLZ/GKY2OtmVqPGi7aFcm0iYAnrL3/vNKe5oMz+DE/DlmhHfCKtDPYvd3RHUNEfNGK91U5FbLEu6HpBv4CAe12C2ZzzWQQpJn9/H+dt8TwzvaQEyFZDPifz1yyit/gZ44dIwBjuqaCHBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSUqIv+3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589004; x=1810125004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8qj+Uvm0rjXQDyhM00C2bbQMUjHJkivIF3daT3WitqU=;
  b=jSUqIv+3NGCpVj7Kj7JfY8CxJPukh3Lm1KiF+VOFHhhpVCF0pN1Ov+pt
   Ktx8MIqeBiYCYVK+zBDTTdfOYQSRu333SYTVM02Ql4B6akbcIKKwj6gGy
   j4VIWDpPh7lX9gXD3apgPaiQYI6njtRgwjTcMs5+MGaCn3Ba7zFcavGdw
   OLoiX0VixHPddTZjGbz1LttPjITnYwqHQxy7Hq/4Vz6w6ChStUbAHxbzA
   Hnmm8t8Ylw1YAKv8DMicmRH1DXZhpdzZUFJRg8594is261CXPB6Euz3vz
   DlsIv9J+PeGs9AapBHfjR0vQHTEm+NyAi5mqf/PZhUctyzv6xUI2nFgZ7
   g==;
X-CSE-ConnectionGUID: KFwk7E24QaadzqnHFwu1WA==
X-CSE-MsgGUID: 2DW2qSNwRBSGX13Gmmeopw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79605502"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79605502"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:30:01 -0700
X-CSE-ConnectionGUID: 6mokevf8Slilo7mtW0Xx4A==
X-CSE-MsgGUID: MK2PZK4rQQOf423GeFf5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="261245533"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2026 05:29:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CA886A4; Tue, 12 May 2026 14:29:55 +0200 (CEST)
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
Subject: [PATCH 7/8] thunderbolt: Increase timeout for Configuration Ready bit
Date: Tue, 12 May 2026 14:29:54 +0200
Message-ID: <20260512122955.271688-8-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: 5DBDC5203C7
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
	TAGGED_FROM(0.00)[bounces-37321-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim,router_cs_6.cr:url]
X-Rspamd-Action: no action

From: Gil Fine <gil.fine@linux.intel.com>

After setting the Configuration Valid bit (ROUTER_CS_5.CV), the USB4
Connection Manager guide specifies a 500 ms timeout for the router to
set the Configuration Ready bit (ROUTER_CS_6.CR). The current timeout
is shorter than specified. While there, fix the kernel-doc typo.

Increase the timeout to match the CM guide recommendation.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 54f4f5fa3c5a..5fd4fe070f25 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -309,7 +309,7 @@ int usb4_switch_setup(struct tb_switch *sw)
  * Sets configuration valid bit for the router. Must be called before
  * any tunnels can be set through the router and after
  * usb4_switch_setup() has been called. Can be called to host and device
- * routers (does nothing for the latter).
+ * routers (does nothing for the former).
  *
  * Return: %0 on success, negative errno otherwise.
  */
@@ -332,7 +332,7 @@ int usb4_switch_configuration_valid(struct tb_switch *sw)
 		return ret;
 
 	return tb_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_CR,
-				      ROUTER_CS_6_CR, 50);
+				      ROUTER_CS_6_CR, 500);
 }
 
 /**
-- 
2.50.1


