Return-Path: <linux-usb+bounces-11058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51076901EE9
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 12:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A531F276A9
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 10:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE6D77F1B;
	Mon, 10 Jun 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNZaFYSa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C558768E7
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013994; cv=none; b=RPYwiXxYI7j937J/geOr7Z4N1C/H/nQOvCszTG92bz/1u4cNhJof32mpMAuY1ODuQgWb7Bw1WSz6ZKUjX++042F+DNBzbG1yCPuMgPnamUlPd8MNwjDJ2rua5HbZ8fl+MS5+T0RM686a/Oskj6aPg2LpxyyMOAYKfXn2D4XdT2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013994; c=relaxed/simple;
	bh=OrmDODFHGupzj69vVG3NL4Rw6mO/wJ8vGOq+y/vRIw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DX339ezp8Tscmw8M49HB2F3j9FBNiO9kCv7sJcuwzqd6Yj7hoIYl7vCZGilTrMKEl/jwnFjUfzWz2bZlkotRb+T6h8iJErLL2uTA12wcjX5dj3xSMIRDeusmIVKQbDdQjWNVJEoWhTpRmYXXAbxkz/MJ5nZMbvnqK1h8WGlYPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNZaFYSa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013993; x=1749549993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OrmDODFHGupzj69vVG3NL4Rw6mO/wJ8vGOq+y/vRIw0=;
  b=LNZaFYSaobAS4oPvCDY5t+mx6WGVwodPvMZQXDGlwO+F0WMyajRA4gU3
   prTxoPIF7GBxH71MQsmoRvKBpzJ/RPpm96zk5E7db00LmlRaDyHiD7N5M
   wtSL90VdRRX3HYheyM9EEh5r+mpx0a49Cx074JSHupkmCuMbjWTNXBWpV
   zCBkOsLaqZGLbOFBskJNmuRHtltbxb0Jasp5bZrzgnOL2yaVQXt9M/DIt
   DVgf9mB6qho5Iifxfrw9/3mfcn9jMwmi+h3jEUs13E30LPZzM7dpaVPEm
   CybVEQUgAyyvUZHYSqHJnwxlR1OYapCvNwKgdittNJO8ogpHBrdtlGson
   Q==;
X-CSE-ConnectionGUID: fu7p4GOORQCI0hLQE9SwCQ==
X-CSE-MsgGUID: BStYp0YdSjaIgSKnNxOv5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32200993"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32200993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:06:31 -0700
X-CSE-ConnectionGUID: 7hQRbCmgTcqg7II8xhFSzA==
X-CSE-MsgGUID: Jet0C1fjS9mWCbKUkOLtzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43590842"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2024 03:06:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DBEA386; Mon, 10 Jun 2024 13:06:27 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/6] thunderbolt: Move usb4_port_margining_caps() declaration into correct place
Date: Mon, 10 Jun 2024 13:06:22 +0300
Message-ID: <20240610100627.3521887-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610100627.3521887-1-mika.westerberg@linux.intel.com>
References: <20240610100627.3521887-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is supposed to be close with the other lane margining functions so
move it there. No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 18aae4ccaed5..ac9368c7a513 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1327,12 +1327,12 @@ int usb4_port_router_offline(struct tb_port *port);
 int usb4_port_router_online(struct tb_port *port);
 int usb4_port_enumerate_retimers(struct tb_port *port);
 bool usb4_port_clx_supported(struct tb_port *port);
-int usb4_port_margining_caps(struct tb_port *port, u32 *caps);
 
 bool usb4_port_asym_supported(struct tb_port *port);
 int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
 int usb4_port_asym_start(struct tb_port *port);
 
+int usb4_port_margining_caps(struct tb_port *port, u32 *caps);
 int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
 			unsigned int ber_level, bool timing, bool right_high,
 			u32 *results);
-- 
2.43.0


