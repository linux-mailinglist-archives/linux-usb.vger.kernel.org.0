Return-Path: <linux-usb+bounces-11326-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3E2908B63
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 14:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCD17B23796
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 12:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37BD196D99;
	Fri, 14 Jun 2024 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIu2syR3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313F195B2E
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367317; cv=none; b=aP4aVxFKnND2nx+Hsl4xDpatCsgiWMNCqb2dCws0X9CTlnifrhuUGRBm0Odz7sT3913jE1zasZRcjGSTBxAMtyxvm8mjMHhFkKMNDvLBCSjMOCtf1IOntm+aop99GTU+oQsFxO+u0fLc2k7dUE1m2kX+bR3l18K1MAPVLiSsZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367317; c=relaxed/simple;
	bh=OrmDODFHGupzj69vVG3NL4Rw6mO/wJ8vGOq+y/vRIw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cc1tbko5n6WXSbDHT6je0yUPfwdaxEYJAkSXNOCoKBjUKQfXU78gjzCHFpHB+8zBQY7Zgz09H5sUnBuJoCXchXavvemb/6TOmkde3OcuP+v5G5/mgavF4FHKDrWktmQW21DJfzehuLqEoUZOv/AAeQvNqrO3RktftzX0k6onIAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIu2syR3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718367316; x=1749903316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OrmDODFHGupzj69vVG3NL4Rw6mO/wJ8vGOq+y/vRIw0=;
  b=PIu2syR372C8B78VhFXitF/s1MsJOKZZ7njPjP1s7wBhmpyG1KGB8EZ1
   3NBXwfGoCR7ywuXgY7TT0JXlD+LTbZ2dNoTZOpQQZ49lWw0YEI9QF+k+w
   jx58/94shI9BSjLhD9CHTJAgjcyqW/+Nwsu83/1HhMlLAXhdCCF9tzAOV
   bLcxtApkbRodYt6RKNeIgKgUeSUd2p/XIP2B0G+dfejpI1EQh6B1uppuf
   H5YMhoiFSyKHgVHNDR2XSxn6uXWTcZDbLYMwQu9gCN1o4zrP75EkAmjH/
   d7Uo+WtBWnNF+FtkzYDAmGn3GO7d9k+PWNLMaRKM7xk5ftatW0WZxFsEu
   g==;
X-CSE-ConnectionGUID: 35d5wtWiRQSiZ0cISJm86w==
X-CSE-MsgGUID: 7ZxRY+aBTW2nyy41bZsPVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15409993"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15409993"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 05:15:15 -0700
X-CSE-ConnectionGUID: yQyf1oBLRxKMDX8dLSxtPA==
X-CSE-MsgGUID: T7C/395DRuiubY8AifcVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="45437707"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2024 05:15:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4C21D1A0; Fri, 14 Jun 2024 15:15:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/6] thunderbolt: Move usb4_port_margining_caps() declaration into correct place
Date: Fri, 14 Jun 2024 15:15:07 +0300
Message-ID: <20240614121512.1361184-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
References: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
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


