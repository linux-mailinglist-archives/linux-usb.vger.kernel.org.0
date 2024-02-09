Return-Path: <linux-usb+bounces-6157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FC84F6F0
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B591F2256C
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FD66A337;
	Fri,  9 Feb 2024 14:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mARjmoDB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E656A019
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488023; cv=none; b=eIb0s0ACwrQWdmlMPcguFBz7I0HUXAWFhJUtBz4L0qyjSgu9Y4l0rHtIDXNNvk49FXXn2xRQDfxVXRkp+e0GLeIEUOnHbJmtoaHtgYlIQCIhh4bcWdMj+0y34a70RjG9zHguGQJ1n5HyHyaYlj91X4eB5q6bBHcOGyTUTTLtdEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488023; c=relaxed/simple;
	bh=bCFcj4DCd1TbIJtgdCpuPO9BQeigS+tJGh3AniGVmPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tn22/cEL7IJZHuOvNoRe/GaPmH5VLRkrnDMtoLnj6zT587JOoEpkY8FwJCnnl1yG15i9Bhf37waI/JruxRucJPBpsflkn5sT+wW6CTa22nvpfTnN3ZyAhHgt9DaxbVSuawGNHvjJluzxyxaJbzxBJPgVABgXACf+eMymGjcbEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mARjmoDB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488021; x=1739024021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bCFcj4DCd1TbIJtgdCpuPO9BQeigS+tJGh3AniGVmPk=;
  b=mARjmoDBrWuhYjbAR8pLHvnZR/bplQCYd3MPklffYuJw1/j2m9qjkkUG
   JMY69zdDLPKNYp6Bs3wk8Dy0SidHAlYzh/AoQsBKopCVzhyktj02iLCkr
   LDnTlr2AYNpi8OUt2XDuFYOYx1rsKfaBvYr7SPrMXKU3q761ctDbQq6Ph
   Yx4iG3iVN+SSOS/CN9kgJjrjYUUYKxyT/pqN/aOSfNAkMApyk38e0zthh
   7U6xHPr1qiLGXe/Ggh/oXGKVAVwDswpYimUeJVvRvv1tXnN7Q2rS7/Ed7
   T4hOWja4CjnVGjU1jNoIHf5yJdyl9C7XSSiGgvx15MIkqvfdiMx/icLn4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082115"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082115"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434414"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434414"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B49A2161; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/10] thunderbolt: Re-calculate estimated bandwidth when allocation mode is enabled
Date: Fri,  9 Feb 2024 16:13:27 +0200
Message-ID: <20240209141335.2286786-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
References: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we program the initial bandwidth estimation the DPTX (graphics
driver) has not yet read the capabilities of the monitor so the values
used are the highest possible of the involved DisplayPort IN and OUT
adapters, not the actual monitor capabilities. To allow the graphics
more accurate bandwidth estimation re-calculate it once we receive the
bandwidth allocation mode enabled notification.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 64dd22e1f5b2..5b0434c140f9 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2413,10 +2413,19 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 	ret = usb4_dp_port_requested_bandwidth(in);
 	if (ret < 0) {
-		if (ret == -ENODATA)
-			tb_port_dbg(in, "no bandwidth request active\n");
-		else
+		if (ret == -ENODATA) {
+			/*
+			 * There is no request active so this means the
+			 * BW allocation mode was enabled from graphics
+			 * side. At this point we know that the graphics
+			 * driver has read the DRPX capabilities so we
+			 * can offer an better bandwidth estimatation.
+			 */
+			tb_port_dbg(in, "DPTX enabled bandwidth allocation mode, updating estimated bandwidth\n");
+			tb_recalc_estimated_bandwidth(tb);
+		} else {
 			tb_port_warn(in, "failed to read requested bandwidth\n");
+		}
 		goto put_sw;
 	}
 	requested_bw = ret;
-- 
2.43.0


