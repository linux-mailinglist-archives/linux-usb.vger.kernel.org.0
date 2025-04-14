Return-Path: <linux-usb+bounces-23039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3136A88A74
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 19:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06F5E17CB5B
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 17:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3231289341;
	Mon, 14 Apr 2025 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRTfHIR5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746A279904
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653363; cv=none; b=YofuVNdzE3Rg/5P4rVMSGBOfYS24gJjs+7IYDE5W3cwPdQMKWZk70Fia//GE8ocjda4l0SKUwXA0g3XoFLyKlljQsIpFaM7mWYXsOjj3vSrJz/3gI39J74dQ9sPWYN1E7S3ctwaJ42TejL/j4LLOSNly++APg2rurjTUe/x8wJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653363; c=relaxed/simple;
	bh=wJ3elilRYOc6+xhdYKSs5OIn3ZBbby5ciqRd1eFfrNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6aMGpEJsr0OQScKVKlo5p+VYNe5+QnXo1OLLE8S3J6mv8pMVv+s8pkew5UI+bnaz5xIXJUY3I625eGhlD9oNHWLhlGSdug6+A7RAYLvS18X/1MDPi8p70lmekxDq+eTPUjv01RVcoYc4b8e+07vCAU2dEtnTdzVUZIUpfVDYUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRTfHIR5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744653362; x=1776189362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJ3elilRYOc6+xhdYKSs5OIn3ZBbby5ciqRd1eFfrNA=;
  b=VRTfHIR5qZ80SF+V1Ka+JoAfCiWIRfcgMAWMmZwUnhbe2Ay0r0iiVtSa
   L4UqGERhVFhNpoBcE9tj8wFZnOCFJPeoTf5scb7vtcHp9Zn11zWX8ndct
   zEli+hNDegnOJCz4uO6LqFMgaMPdZyjuYKR68NEHudO1bWVj73ApHyv3+
   nA0AXCgR/Io4kVJ07qjoRIkiFrUYrVmjfnrSwhj6lB9d9eYBd3uRsjGVq
   DxbEObbhhUCNnljxMD4tr83DZruBr3cgICIHoiD3G4fmFlhm6A724IEf6
   xBv7l2w2c/TWtGQUSvx1DOiFrE9dnX0h4GFimVyVG2WtwhYSwZ7kbO7RS
   g==;
X-CSE-ConnectionGUID: bb8uDPXHQWyLBK12pS1Ewg==
X-CSE-MsgGUID: hUFCioXVQCu8XXKh+6hKuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56779851"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56779851"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:56:01 -0700
X-CSE-ConnectionGUID: 89NWNIiUR0KLvLTIVXrNpw==
X-CSE-MsgGUID: aYBI5zN7SP2kuLnEyw/jRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134866365"
Received: from vpanait-mobl.ger.corp.intel.com (HELO aborzesz-desk.lan) ([10.245.246.215])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:55:59 -0700
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 1/3] thunderbolt: Expose usb4_port_index() to other modules
Date: Mon, 14 Apr 2025 19:55:52 +0200
Message-ID: <20250414175554.107228-2-alan.borzeszkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make usb4_port_index() available to other files in the driver, rename
and add function documentation.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/thunderbolt/tb.h   |  1 +
 drivers/thunderbolt/usb4.c | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index da2d7c1f165b..82d39eb68cd0 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1481,6 +1481,7 @@ static inline struct usb4_port *tb_to_usb4_port_device(struct device *dev)
 struct usb4_port *usb4_port_device_add(struct tb_port *port);
 void usb4_port_device_remove(struct usb4_port *usb4);
 int usb4_port_device_resume(struct usb4_port *usb4);
+int usb4_port_index(const struct tb_switch *sw, const struct tb_port *port);
 
 static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
 {
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 1b740d7fc7da..901ff57ad596 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -935,7 +935,15 @@ int usb4_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
 	return status ? -EIO : 0;
 }
 
-static int usb4_port_idx(const struct tb_switch *sw, const struct tb_port *port)
+/**
+ * usb4_port_index() - Finds matching USB4 port index
+ * @sw: USB4 router
+ * @port: USB4 protocol or lane adapter
+ *
+ * Finds matching USB4 port index (starting from %0) that given @port goes
+ * through.
+ */
+int usb4_port_index(const struct tb_switch *sw, const struct tb_port *port)
 {
 	struct tb_port *p;
 	int usb4_idx = 0;
@@ -969,7 +977,7 @@ static int usb4_port_idx(const struct tb_switch *sw, const struct tb_port *port)
 struct tb_port *usb4_switch_map_pcie_down(struct tb_switch *sw,
 					  const struct tb_port *port)
 {
-	int usb4_idx = usb4_port_idx(sw, port);
+	int usb4_idx = usb4_port_index(sw, port);
 	struct tb_port *p;
 	int pcie_idx = 0;
 
@@ -1000,7 +1008,7 @@ struct tb_port *usb4_switch_map_pcie_down(struct tb_switch *sw,
 struct tb_port *usb4_switch_map_usb3_down(struct tb_switch *sw,
 					  const struct tb_port *port)
 {
-	int usb4_idx = usb4_port_idx(sw, port);
+	int usb4_idx = usb4_port_index(sw, port);
 	struct tb_port *p;
 	int usb_idx = 0;
 
-- 
2.43.0


