Return-Path: <linux-usb+bounces-30272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF76C469D0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0178B3BBD75
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B7C30DD1A;
	Mon, 10 Nov 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8cpkz8k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15DE30DEAD
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777857; cv=none; b=XeUYZxqk/vdO3JBPZkR/OzqGQ3oxpML/hbv+0PobYPshuOhOdpwa61vlGsynmJVovHRK0oeX+s1Sun8Yk96qJyuPY6eFOqJGwe6eXSzVpTWZHTlURBBbG8ViQhXWGNSqa6xbsQLQ8Tj5+CfDvg6UxPeRvbPQ2puSbJqMOmBOcnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777857; c=relaxed/simple;
	bh=DYMqJEBegiphm3UEdG8mOUc9HXJ7Vnnk+Q+4tYd2ZBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUlDjuoDklF+ZoDsrekVrdO8p1G85lYyHVvfHM0tfC3cx00UuOKHwtfUwwKDfYhxxMeB+go31fc9W+4wf1GF5B0h9xbS/3hItLTFgo16FGbYmD8IFNXzTC2PO/viIdEX01Bu+L2DurrHerLhf3ao47kz6miGjbKYAvXMyLZazPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8cpkz8k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DYMqJEBegiphm3UEdG8mOUc9HXJ7Vnnk+Q+4tYd2ZBA=;
  b=m8cpkz8k1G4QSPLWUCQgaBevEoyca2CAyx1MUQmrhxS9GQtvWg2QjA9E
   9B+9s5uiCimLg1ZT4656MYkU/LFlK2KmeynQLR+HIiTMsnatgziVi+qK0
   FBMn20FzouqW3hT1k//1oPQXIghPn4oQGK7AW363NY9Ghh2AMlkwqtkgw
   K2NIqKpCOiF2S2iTxXlr8EESwaCzffRj1PeVhlO4x/uRO850LW0ok+zBN
   zyknspCznzCzy+bwRJdXFyoQSRa2MfT5sigSOlA7FrdRJOkch8K0zbWA+
   YVWxStcQKz0he8KqaNvthXjnL1GjHqozFhyYsMdHPZof5cQ7PIoTSIVKR
   w==;
X-CSE-ConnectionGUID: wS8+CrbUSx6N/PUp8KW/iQ==
X-CSE-MsgGUID: GsIgclw9QBiFdrPJrotGgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68684384"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="68684384"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:55 -0800
X-CSE-ConnectionGUID: 9YlVwYZ4TPGqTygWMacfdA==
X-CSE-MsgGUID: bdjIacnTT7+kSsefmgUS+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188617560"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 10 Nov 2025 04:30:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 979479E; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/16] thunderbolt: Fix typos in switch.c
Date: Mon, 10 Nov 2025 13:30:43 +0100
Message-ID: <20251110123050.3959188-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in switch.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 0e07904aa73b..b3948aad0b95 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -736,9 +736,9 @@ static int tb_init_port(struct tb_port *port)
 			port->cap_usb4 = cap;
 
 		/*
-		 * USB4 ports the buffers allocated for the control path
+		 * USB4 port buffers allocated for the control path
 		 * can be read from the path config space. Legacy
-		 * devices we use hard-coded value.
+		 * devices use hard-coded value.
 		 */
 		if (port->cap_usb4) {
 			struct tb_regs_hop hop;
@@ -3221,7 +3221,7 @@ int tb_switch_configure_link(struct tb_switch *sw)
  * @sw: Switch whose link is unconfigured
  *
  * Sets the link unconfigured so the @sw will be disconnected if the
- * domain exists sleep.
+ * domain exits sleep.
  */
 void tb_switch_unconfigure_link(struct tb_switch *sw)
 {
-- 
2.50.1


