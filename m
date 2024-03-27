Return-Path: <linux-usb+bounces-8463-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370F88D92E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 09:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D01D1F2C0A1
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 08:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0609133993;
	Wed, 27 Mar 2024 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7ymIaRJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB632575A
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711528239; cv=none; b=vFSMIt/GtENkPUW2H4/Kt1LsvMTkY1e4yQ7C/z6Mo9KVm27nr/X8h45/vrVaeqnvj2TO3I3w2GW+5kS035hiOy9JnkUItTnS5hEkIRipbPxsBWYDe9x8ilhlBjMidwNOoCN/HYAjfzgQoMpSmgvdt2ikt9d+KX0WG9/KdZPiKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711528239; c=relaxed/simple;
	bh=VNxmY0Y3VuKguQWrw7ik33lgHAGHNQcmO+VGt0bZ7Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XkNhGD0F/BSTtE0zNsFwRdmD57tk0zSp0LM85d27S/eLMYbgMjIZrUSrpZ3pnhKDjEMLKOIYrR87O/fLEuyLIfVyFSbo7un7lIQ0KBEYjupZY6YHghl0NzNv8Oj1Ld8eB3o3+HQdygtTIwKcz7CU/+C5LdtXBZ5yQrcOoYLVtUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7ymIaRJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711528237; x=1743064237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VNxmY0Y3VuKguQWrw7ik33lgHAGHNQcmO+VGt0bZ7Ps=;
  b=h7ymIaRJv46XAzDLVQNtOJm5pVIhjQprj+JSCpYI8bdQ0plnI75cAyQU
   6BDeix0yoyFibzOEmz3OjERiCW6bxNH5n3v8yhKdwkGfhjQkpyhaZZ1Ja
   gMPA1aK1sJyeJIhq8tKE5TRXpw2IvoBD+nuhcIrZVvM37sNDuFSAg6Rqr
   2kQyG+MNdg5xkUM+7w59EqyJUSVo+qleC/RxVoE3j67qIrvEBwZBh9QVf
   Z89N+cqE+KYjoKJ/7PpodqtDaCAdXKWrCkUQSTELLFfqorV2zusokf7uI
   X6ZCy+IPocKiv6boGIS3gywSdv5DSTQMtTJzURnwef2jtpW58q+o3LGnR
   g==;
X-CSE-ConnectionGUID: LnfAXgYpQnmvEgD0QEdLVw==
X-CSE-MsgGUID: ib+II55uTMKEqdlhMbD8Mg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="10394434"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="10394434"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 01:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="937074046"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="937074046"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2024 01:30:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B8F9F152; Wed, 27 Mar 2024 10:30:32 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Do not create DisplayPort tunnels on adapters of the same router
Date: Wed, 27 Mar 2024 10:30:32 +0200
Message-ID: <20240327083032.1611284-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probably due to a firmware bug Dell TB16 dock announces that one of its
DisplayPort adapters is actually DP IN. Now this is possible and used
with some external GPUs but not likely in this case as we are dealing
with a dock. Anyways the problem is that the driver tries to create a
DisplayPort tunnel between adapters of the same router which then shows
to user that there is no picture on the display (because there are no
available DP OUT adapters on the dock anymore).

Fix this by not creating DisplayPort tunnels between adapters that are
on the same router.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10265
Fixes: 274baf695b08 ("thunderbolt: Add DP IN added last in the head of the list of DP resources")
Cc: Gil Fine <gil.fine@linux.intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c5ce7a694b27..360cb95f39aa 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1801,6 +1801,12 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 			continue;
 		}
 
+		/* Needs to be on different routers */
+		if (in->sw == port->sw) {
+			tb_port_dbg(port, "skipping DP OUT on same router\n");
+			continue;
+		}
+
 		tb_port_dbg(port, "DP OUT available\n");
 
 		/*
-- 
2.43.0


