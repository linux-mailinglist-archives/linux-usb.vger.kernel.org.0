Return-Path: <linux-usb+bounces-9825-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A08AA8B2D87
	for <lists+linux-usb@lfdr.de>; Fri, 26 Apr 2024 01:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40EA41F22CCB
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 23:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AC315665C;
	Thu, 25 Apr 2024 23:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/mVHu53"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516E155A39
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 23:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714087281; cv=none; b=rVCr75LOI+YCc1VM3FzQFdeErv8mBxp0OILvQJ3Lam/OlBh/5AznePZOI6rP3D47KkH9Yh5HBjuWfoOXW4VOfffF+tI2+pNaOYLhB96UKm/k39Ob5hoZ20APXoZlyT0z5ec64mix+eP91CEmqAKJCIce4glVkZzX5rIF/5us7OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714087281; c=relaxed/simple;
	bh=plBdQxWauJB5nvfeYEdktBF4kErm8NCxZwS3BpG64hw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z02jjYXozq/OCH1OBqrThz9Z0QQaXX+9OwfRUUUgPjd6kZ5qO4zDMIGEuT90AbO+CFNr9olu/jpwPY5i5XvuQHpDbFAK9tghoZ+IZDWPenSUXYNu3Kce111oSexYKg/rXtys3Asq6zA/3nodWhK0RBNxLObKjTRghG7b0/kAdpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/mVHu53; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714087280; x=1745623280;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=plBdQxWauJB5nvfeYEdktBF4kErm8NCxZwS3BpG64hw=;
  b=T/mVHu53O5/T7JdmqWaJkUrvdqTLPj7g6YUKhIXe6bnoxpBr3xfn2Z77
   3e6HUGg66GrqNyooPQN3gg17nOWi610YdJKGa3tfCoVJp4fSvV7P0surf
   a6uTQC6pQRd4MbvVXOxKMJyhFs5PKiGPzHr9/+Z/TZnAf6ptXYN7i17gR
   sgFpfI4n164xIUpSpmeIkYoecWvnAGh8OMTAUSUOVk/Gcaqh9z3igXn5t
   BoSaFOiQ8lXwYfdJE4avrnalyD/+bRDgpFxmjvPZzB7rqpO/djBzeCNP/
   5CQYc0NviNQgJzELRahjbqVHaZcdXsRI6yIO/QVya4x+IEbkytCDoBlTf
   Q==;
X-CSE-ConnectionGUID: EpcMuL0ZSFibzF0W/bxelA==
X-CSE-MsgGUID: lmC4CPOaQ4ukaxEzb5egEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="32307460"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="32307460"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 16:21:20 -0700
X-CSE-ConnectionGUID: siIjjif5Tsy10wO1oBKq8A==
X-CSE-MsgGUID: yWqKlxquTZuagsRpXZHXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25284334"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmviesa008.fm.intel.com with ESMTP; 25 Apr 2024 16:21:16 -0700
From: Gil Fine <gil.fine@linux.intel.com>
To: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: gil.fine@intel.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	Gil Fine <gil.fine@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] thunderbolt: Fix uninitialized variable in tb_tunnel_alloc_usb3()
Date: Fri, 26 Apr 2024 02:24:17 +0300
Message-Id: <20240425232417.3509833-1-gil.fine@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently in case of no bandwidth available for USB3 tunnel, we are left with
uninitialized variable that can lead to huge negative allocated bandwidth.

Fix this by initializing the variable to zero.
While there, fix the kernel-doc to describe more accurately the purpose of the
function tb_tunnel_alloc_usb3().

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-usb/6289898b-cd63-4fb8-906a-1b6977321af9@moroto.mountain/
Fixes: 7e227d09f80d ("thunderbolt: Allow USB3 bandwidth to be lower than maximum supported")
Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index fdc5e8e12ca8..1a3b197001da 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2048,10 +2048,10 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
  * @tb: Pointer to the domain structure
  * @up: USB3 upstream adapter port
  * @down: USB3 downstream adapter port
- * @max_up: Maximum available upstream bandwidth for the USB3 tunnel (%0
- *	    if not limited).
- * @max_down: Maximum available downstream bandwidth for the USB3 tunnel
- *	      (%0 if not limited).
+ * @max_up: Maximum available upstream bandwidth for the USB3 tunnel.
+ *	    %0 if no available bandwidth.
+ * @max_down: Maximum available downstream bandwidth for the USB3 tunnel.
+ *	      %0 if no available bandwidth.
  *
  * Allocate an USB3 tunnel. The ports must be of type @TB_TYPE_USB3_UP and
  * @TB_TYPE_USB3_DOWN.
@@ -2064,7 +2064,7 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path *path;
-	int max_rate;
+	int max_rate = 0;
 
 	if (!tb_route(down->sw) && (max_up > 0 || max_down > 0)) {
 		/*
-- 
2.25.1


