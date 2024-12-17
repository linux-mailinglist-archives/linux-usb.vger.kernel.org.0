Return-Path: <linux-usb+bounces-18569-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6979F45FA
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 100031627DD
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233281DBB32;
	Tue, 17 Dec 2024 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5d4UqZ+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FCE1DB377
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423765; cv=none; b=tYKxvRhPe8jmWLt/Wl0SxiHAsBwt7b0mFlFx53I8BczoUDgg5N9SdSMkIn7CByUS0+ebICjtqVMFnesV1wpxO8zzuYpRFYBGwOi1OjTIrX4TmQCqSCbfDVPX4SVMaMlEe483HK1YV/3kKK4V9R8W437dGBrHZZKbQsM/Z7FNahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423765; c=relaxed/simple;
	bh=kMjB35+F5oAxOIdNTc7ZiKso2QeKr+3q9AQLhrjld4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHLfGlkwIfw4kpaGA5x/Ujli6qCeunKtmQmvpl7On0P8TMmcLataJArUoQPXSJ2sIU4BxECJsdSDXNOO0EP6/UshXe22g90R7RwK3Cl/ebo54vHvdMxVoxkM5y5geGx4oM1+wRJMJkC5zchzeZHWiXtqRwf5ScyqJiIWeffnD8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5d4UqZ+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423764; x=1765959764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kMjB35+F5oAxOIdNTc7ZiKso2QeKr+3q9AQLhrjld4o=;
  b=E5d4UqZ+V6VqBPcW77Wkkr4whcD5h/0TImmtY/AVK1exhXs0OHWqZJZV
   9Yu9dub/hHW9x4Lk5HXdgghaI/X1YzRoB4Z/oOwicNOJ5THd8aV4pjetC
   aQMARm9IVzoRG3mRglD/xMnS0/Wr5OtmvcE5uzGaYLPPC8I59G0orQoEZ
   V579bxDr5g41iqlUOUmVmk3Ef9JfTFHsiZNT3MYu3xYAWk5yb+yoC42nO
   X38kWHfFbPfu4BDuSX+a1T3pspLeno+g8RlESWRLbFNJuPZvGci0hN48N
   TeZ4Y7W/xVS2X17fhdz5C1U26JogTXvIpd0a1LiKO21VRGdJ80/Dm3OHz
   g==;
X-CSE-ConnectionGUID: Ahvp3XPPRY+5CUr3FbfONQ==
X-CSE-MsgGUID: xKzszB4tTNG67RHJo8zkOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34992608"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34992608"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:37 -0800
X-CSE-ConnectionGUID: /g4cm6rtSfKZVszxuG2stg==
X-CSE-MsgGUID: w00r6r6rSF27qWmFFcqt8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="98037683"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 00:22:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1B90A703; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/12] thunderbolt: Make tb_tunnel_one_dp() return void
Date: Tue, 17 Dec 2024 10:22:15 +0200
Message-ID: <20241217082222.528602-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The boolean return value is never used so we can make this return void
instead.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a7c6919fbf97..7595ca00b6b8 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1864,7 +1864,7 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 	return NULL;
 }
 
-static bool tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
+static void tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 			     struct tb_port *out)
 {
 	int available_up, available_down, ret, link_nr;
@@ -1954,7 +1954,7 @@ static bool tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 	 * TMU mode to HiFi for CL0s to work.
 	 */
 	tb_increase_tmu_accuracy(tunnel);
-	return true;
+	return;
 
 err_deactivate:
 	tb_tunnel_deactivate(tunnel);
@@ -1971,8 +1971,6 @@ static bool tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 	pm_runtime_put_autosuspend(&out->sw->dev);
 	pm_runtime_mark_last_busy(&in->sw->dev);
 	pm_runtime_put_autosuspend(&in->sw->dev);
-
-	return false;
 }
 
 static void tb_tunnel_dp(struct tb *tb)
-- 
2.45.2


