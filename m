Return-Path: <linux-usb+bounces-37328-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO5CGvwdA2r10gEAu9opvQ
	(envelope-from <linux-usb+bounces-37328-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:33:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0438520329
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 596BF3024875
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47794BCAB3;
	Tue, 12 May 2026 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtT5fnsg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9654837207B
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589029; cv=none; b=Lx96ftb0DNLM7skRMfG/inxzSzBtTTMisCNYdzdx8WO+x6nvPMAcuxoiMjOn0JWKvCz938NonbjqPZnLRI54Wq0WPNldZireQO6P7YAf5YUFEDdpduzF9QsOi1Ru9f9FFoh0RDZg0XgII58bcoeNAPyFrSJsLUuknYT+xgow3m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589029; c=relaxed/simple;
	bh=VdSyNq/MsXKBg9FQCw4YrHSnyEZFhxZlZ40ngaGOGsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCvDVYo3rogBxvZ+yYMy8MbSgamt+kaLs4I2oOl5Ut4QEySQ7iHAF4X2KTZOsavfErRuPiB3S1yt9QqoXfFMwHpvalBMdsQFKW0rCLOUojNJx+BTMUrzQtjZL9sUwMCwe7n146taCtRAA+mpGrRYk48DmF3anx0lro+oCE8u9ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtT5fnsg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589021; x=1810125021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VdSyNq/MsXKBg9FQCw4YrHSnyEZFhxZlZ40ngaGOGsI=;
  b=BtT5fnsgAzk5zNTFKbAjoE/X7LnyLMRcDpwMUwQmUug8sYDx3IJO8Thp
   Xp9FT8uYev4AqXM20q1vjXQvvr+TNug0vTZtHFHuSo7dDJwtr41xI9lCH
   fLgdI7R7/Mt5nmB5bAUafJgIRAldPW66wrunXs69Kag+IhA89YkwmcDle
   bHSP2t8W6JeH5a+7SXAcA9BiN9cQklbhS5ACtjkD2lUdfNiLrFl40Lm4Q
   bVWg2znXlhR8gu4Pvf7mDEYAGlk3Ca555xOOdpZvn32+H4rQe7IzkEAYS
   V176p4co+GlW6p0fAFnW00I9vVmgV+N5bs4KsQHkpEG1o2zvFac49IJfB
   w==;
X-CSE-ConnectionGUID: ALqyRvAjSbmXMr7kvYi59A==
X-CSE-MsgGUID: BUvQZVePSbycM8mE9r5aEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950605"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950605"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:30:01 -0700
X-CSE-ConnectionGUID: Sb4c2L7vQS+xRn4cSysRFw==
X-CSE-MsgGUID: qCvbpRBrT4u0ewIHqPYEIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692691"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C7A24A2; Tue, 12 May 2026 14:29:55 +0200 (CEST)
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
Subject: [PATCH 6/8] thunderbolt: Verify Router Ready bit is set after router enumeration
Date: Tue, 12 May 2026 14:29:53 +0200
Message-ID: <20260512122955.271688-7-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: B0438520329
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37328-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Gil Fine <gil.fine@linux.intel.com>

The USB4 Connection Manager guide specifies that after enumerating a
router, the Connection Manager shall verify that the Router Ready bit
(ROUTER_CS_6.RR) has been set to ensure hardware configuration has completed.
Currently, this step is missing from the enumeration sequence.

Add this check to follow the Connection Manager guide more closely.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb_regs.h | 1 +
 drivers/thunderbolt/usb4.c    | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 75131fcfe044..69ca4c379cc9 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -216,6 +216,7 @@ struct tb_regs_switch_header {
 #define ROUTER_CS_6_WOPS			BIT(2)
 #define ROUTER_CS_6_WOUS			BIT(3)
 #define ROUTER_CS_6_HCI				BIT(18)
+#define ROUTER_CS_6_RR				BIT(24)
 #define ROUTER_CS_6_CR				BIT(25)
 #define ROUTER_CS_7				0x07
 #define ROUTER_CS_9				0x09
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 6f76bcaefa49..54f4f5fa3c5a 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -294,7 +294,12 @@ int usb4_switch_setup(struct tb_switch *sw)
 	/* TBT3 supported by the CM */
 	val &= ~ROUTER_CS_5_CNS;
 
-	return tb_sw_write(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
+	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
+	if (ret)
+		return ret;
+
+	return tb_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_RR,
+				      ROUTER_CS_6_RR, 500);
 }
 
 /**
-- 
2.50.1


