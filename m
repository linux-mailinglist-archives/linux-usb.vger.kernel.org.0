Return-Path: <linux-usb+bounces-27727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27AB495B6
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F3B07B7EEA
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFE630FC08;
	Mon,  8 Sep 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuXC3XFY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5630FC16
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349158; cv=none; b=LwsIiJy7e+WWfH1Wf4PShVIDM6pXSk4XvGAEynf5tg+KUy1/7dHw8kMKL5Y56bu3Ri5cjSPQePbCRzY96DyxtSQ7RshkAWWN33Rw4G0mvTheZGRDGYh1v2nkL34y1o9YKQlRAkyIRCxImGwhBzLVP5gjQB140/PFyMszI8oM1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349158; c=relaxed/simple;
	bh=q0wLAR4MdfgL6Xv/Pc0Ucyf4Q196bfudtCjGV8aJr3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e94y0Y84zxak+JuSCdmTpfplMPTDlnSjnqcmpUtd2GI7gITl+Zx3dEvFKv4YQ+yI8Vu5To1eK68HhtYwBj640ovDsNsHSGx3M+NzZMf5HNkSlrc0mgFb+Bdq4bmkD03lzHXaclBOXa+EKzpQHvwf/hvR4wCm22eZN9viK/gVtLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuXC3XFY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349158; x=1788885158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q0wLAR4MdfgL6Xv/Pc0Ucyf4Q196bfudtCjGV8aJr3k=;
  b=DuXC3XFYFDbO6OOfxOVAS7blWq+udLG6eSKl3hqRdT+Yw1L+WMfNF/Vw
   VeylEF29EfAKxOW79nRloT0zls0ffXJ+UJbxERYADc9dJsN0RROOy5Mjy
   szsmndA37pCOF5tuaRlsfSnPtb4Yu1ELZdJmCtDs90N+8gP7dV1spkW3/
   CqNFVVO+x2RuS7smGvhF1k/sbc7j69Ev0Mn2LiWYOCtA2wwpDTihMtX0X
   Fe0aXINf04U77M1VdxQPLn4WMLojAcX0gnikpi2lamDl8ZVA7ZeNviBqG
   GErmA6dOA6UZP4AiWFgEKJubPByObWVXCR/4nNYwzJrkTzZKTbRfkmVXL
   w==;
X-CSE-ConnectionGUID: fUWnDR/fTNmeSJjlCD9J2A==
X-CSE-MsgGUID: EpJVfT2vRLmOxLOTjP0fIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252099"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252099"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: a1xnp5zKTY+qiVbxIqD60g==
X-CSE-MsgGUID: P2DrDemARWOP7nIl7AlWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622642"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D3DEA99; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/26] thunderbolt: Add missing documentation in ctl.h tb_cfg_request struct
Date: Mon,  8 Sep 2025 18:32:09 +0200
Message-ID: <20250908163230.2614397-6-mika.westerberg@linux.intel.com>
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

Add missing @request field description in tb_cfg_request struct
kernel-doc. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
index 7e08ca8f0895..db1646eb4fd0 100644
--- a/drivers/thunderbolt/ctl.h
+++ b/drivers/thunderbolt/ctl.h
@@ -54,6 +54,7 @@ struct ctl_pkg {
  * @kref: Reference count
  * @ctl: Pointer to the control channel structure. Only set when the
  *	 request is queued.
+ * @request: Request is stored here
  * @request_size: Size of the request packet (in bytes)
  * @request_type: Type of the request packet
  * @response: Response is stored here
-- 
2.50.1


