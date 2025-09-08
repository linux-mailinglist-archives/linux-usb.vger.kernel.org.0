Return-Path: <linux-usb+bounces-27721-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E70B4958B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28019171C69
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110E230F959;
	Mon,  8 Sep 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjlN4C3h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AEE30F925
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349155; cv=none; b=EIQRcgF8CVLrc+ize/Wi2zMylxN6oK+GOB/kkapz5tc0Pd9rEdYY2ZlZS4/extW0kFRZuCZ2eQxRtr2PS7aZZyLL7tzQ5623RFme0/nDwzCese8KIb4s38gw4dXlldKOcIDtFayEZFdWWJx1hRPdS5ZU0Mk2fgAiecA3qNvsVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349155; c=relaxed/simple;
	bh=tg6+MFp2zYyUUzNuP0InWkh7XeTBg3CxBquBD/OErlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6xeYCI/EtnE8B1B9YED9TiyFJmTWKt6PnF4REbgsJUS1MoS49Z81zD3b4jy4RI/6N0pfeUU2cPOCDN0tfjMJs21TI1l7n/oC42eN9qZk62lLs6zIeyFiC1kC/l+zWrUUbNPbGHUV0KK4BjXvso1ZqVhMqxYjBOZ+yc0OMmZojM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjlN4C3h; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349155; x=1788885155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tg6+MFp2zYyUUzNuP0InWkh7XeTBg3CxBquBD/OErlI=;
  b=JjlN4C3htQh/gAt+jWU/3fxlBPu+8klbuikxwlZOm/99/ZdXfoJn23dD
   R6xrRrK2mRCPZY1Gb/2iGnkFNtVCkXWVJQfXvho1rTpY7V3AVAk8gMLQM
   ruDPZ4MGEzAi4hhzl+dbYPdY5sRq+7kiBwEMYHhGsC2EMWyDjnEQVMKjQ
   FWr50eF+NOhB1qWTT5S2a2U2SVq8jWqOfI0tjW1JpN0UHdx3FuOqQPYZZ
   pRExFaxJa6w4N3r44m885ui3NuyII6dYOup7OFSInJA182QH8ODy9IN3F
   p/tPxwzWA5EHcUTXiWr0nENa/K5qwscKv4zKGH9X63zbKrSZftU7uOKSh
   g==;
X-CSE-ConnectionGUID: qnCsAEv2Tpa6LZjnKF9Qxw==
X-CSE-MsgGUID: h4AR4SyVT1iaLhqryUPulg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252086"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:34 -0700
X-CSE-ConnectionGUID: xp1sjl0WSfOYvYy9JgbDiQ==
X-CSE-MsgGUID: m2QZGB3sRquz4iXLG9VlPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622635"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CD63897; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/26] thunderbolt: Update clx.c function documentation
Date: Mon,  8 Sep 2025 18:32:07 +0200
Message-ID: <20250908163230.2614397-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Make clx.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index 787dfd1550e5..1637e79d988a 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -167,7 +167,8 @@ static int tb_port_clx(struct tb_port *port)
  * @port: USB4 port to check
  * @clx: Mask of CL states to check
  *
- * Returns true if any of the given CL states is enabled for @port.
+ * Return: %true if any of the given CL states is enabled for @port,
+ * %false otherwise.
  */
 bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx)
 {
@@ -177,6 +178,8 @@ bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx)
 /**
  * tb_switch_clx_is_supported() - Is CLx supported on this type of router
  * @sw: The router to check CLx support for
+ *
+ * Return: %true if CLx is supported, %false otherwise.
  */
 static bool tb_switch_clx_is_supported(const struct tb_switch *sw)
 {
@@ -203,7 +206,7 @@ static bool tb_switch_clx_is_supported(const struct tb_switch *sw)
  * Can be called for any router. Initializes the current CL state by
  * reading it from the hardware.
  *
- * Returns %0 in case of success and negative errno in case of failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_clx_init(struct tb_switch *sw)
 {
@@ -313,7 +316,7 @@ static bool validate_mask(unsigned int clx)
  * is not inter-domain link. The complete set of conditions is described in CM
  * Guide 1.0 section 8.1.
  *
- * Returns %0 on success or an error code on failure.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 {
@@ -390,8 +393,7 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
  * Disables all CL states of the given router. Can be called on any
  * router and if the states were not enabled already does nothing.
  *
- * Returns the CL states that were disabled or negative errno in case of
- * failure.
+ * Return: CL states that were disabled or negative errno otherwise.
  */
 int tb_switch_clx_disable(struct tb_switch *sw)
 {
-- 
2.50.1


