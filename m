Return-Path: <linux-usb+bounces-21678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D116A5D953
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 10:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB80176C46
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F8F23A99C;
	Wed, 12 Mar 2025 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/5twKxR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28451D79A6
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771569; cv=none; b=nAj/4q9Ln5tSWWbVEGDbziO6eddR6Nc+jBRKhmGeG7hwpRdP0UV+I5qRG4SXPppWi9vjtlqeBc9FKmyeR50IuvjQa8HklxWTg78RvSyYKbAk/7SvU93QLHTCPrscA0Nr/H4pFt+RXPAhvMlTA/oQc1Pt3tDwckRe4LIh2BhTGi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771569; c=relaxed/simple;
	bh=nEjw70xSQVfSc7IMzaVNv1H0eBYtnnXOdn3NBMGCyLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tfJYapfW0tu8zTz29YUO/Du+R0KebI/u46VDOGpFlNq5yhCGJqS7DCmMCWixM3gD+3AdQ7SCtlLLycmSxnvEMRtREUzOwZgrzJsbiYONqy/2jW9Qz+b1PzeVvzpmLZiSelE21XkwIThX26uqX846eI/TqSPYgMuLfWu++SFPMkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/5twKxR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741771568; x=1773307568;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nEjw70xSQVfSc7IMzaVNv1H0eBYtnnXOdn3NBMGCyLU=;
  b=H/5twKxRv6DQ4EpgP1+7UPdpTQlPEf2C69R8zFKmxsRJQWXM0GXThPcw
   2wX0A/0uUcb1PuXGnYsTbZLNW1ZkQ/XKqR1sgvcAGQvtRXTThTAU6dx1E
   d9wXYyUBrfRJzz2QHWSrSBUStuZa9Bs5Gh+ihXt5/XdDYJYIHGFKsDg/a
   7rWfinqS5cXJfuVmbBAWh5a+mhjdg3IgiWPIWbaigEDmwQpdqnnd0vg46
   JjmJ+n7Si7I/KADSdQVpTpbzV+nzR+zUxIMZ7PsYfYGFoOl/yPiZxyftO
   hhPdJT5UhS3RVXm4udT1VwsOa8mquxEqCM5RypoD+LvX/rpFVLQwLdvAe
   Q==;
X-CSE-ConnectionGUID: bo94gVW8S3OMY+uNNupr3w==
X-CSE-MsgGUID: p+aCPksSSeiMBJ9A9N/G1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="43044502"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="43044502"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:26:07 -0700
X-CSE-ConnectionGUID: i2ElMH4qSMyiUoBoriyprA==
X-CSE-MsgGUID: EXdnSFeFSJCZf3bMoNbwHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="121287813"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2025 02:26:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EB3EA1F2; Wed, 12 Mar 2025 11:26:03 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Thomas Lynema <lyz27@yahoo.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Scan retimers after device router has been enumerated
Date: Wed, 12 Mar 2025 11:26:02 +0200
Message-ID: <20250312092603.3666723-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thomas reported connection issues on AMD system with Pluggable UD-4VPD
dock. After some experiments it looks like the device has some sort of
internal timeout that triggers reconnect. This is completely against the
USB4 spec, as there is no requirement for the host to enumerate the
device right away or even at all.

In Linux case the delay is caused by scanning of retimers on the link so
we can work this around by doing the scanning after the device router
has been enumerated.

Reported-by: Thomas Lynema <lyz27@yahoo.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219748
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 390abcfe7188..8c527af98927 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1305,11 +1305,15 @@ static void tb_scan_port(struct tb_port *port)
 		goto out_rpm_put;
 	}
 
-	tb_retimer_scan(port, true);
-
 	sw = tb_switch_alloc(port->sw->tb, &port->sw->dev,
 			     tb_downstream_route(port));
 	if (IS_ERR(sw)) {
+		/*
+		 * Make the downstream retimers available even if there
+		 * is no router connected.
+		 */
+		tb_retimer_scan(port, true);
+
 		/*
 		 * If there is an error accessing the connected switch
 		 * it may be connected to another domain. Also we allow
@@ -1359,6 +1363,14 @@ static void tb_scan_port(struct tb_port *port)
 	upstream_port = tb_upstream_port(sw);
 	tb_configure_link(port, upstream_port, sw);
 
+	/*
+	 * Scan for downstream retimers. We only scan them after the
+	 * router has been enumerated to avoid issues with certain
+	 * Pluggable devices that expect the host to enumerate them
+	 * within certain timeout.
+	 */
+	tb_retimer_scan(port, true);
+
 	/*
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
-- 
2.47.2


