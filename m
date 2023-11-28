Return-Path: <linux-usb+bounces-3404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C157FBA15
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 13:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FC8DB219AF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 12:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D225D54F99;
	Tue, 28 Nov 2023 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVg8MY4B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8A6BF
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 04:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701174555; x=1732710555;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CAkUxqBk4nL5mEb9MSTgrfH39sxptziHXuUle2pkZ8I=;
  b=AVg8MY4BajzVkHJqOzl5YofsPm2SpBVO0Btv8cnFwVZ5uZCOeOJ4ZQVO
   EWl5BVakBOsjxgRtDIh4Wprsx4d+CqO7xvicYi374lRYydqKElEnS9cT0
   1WrLJtqJITf65mrmbw7P+EbkvzZLI/+D65Jcxqe4VRTnYobR++8gryvZA
   nLSC8TZ6U6udBr0eJ0xNg0UI35r5uXTmdDy+FKfCVxv9WDfPQq96y6h62
   5v6pL9WBNhaRe1UFlF2ChDl09BwhwRxeTBCFlBlyDXEV/SHEF8hV9NzpX
   VuNKWQA9ddyE742aW4s8TpVOOnVF3LqGbONf6fW+1tASFkbQt5uo12wf6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="392662828"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="392662828"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 04:29:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="761913345"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="761913345"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 28 Nov 2023 04:29:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 31E6124C; Tue, 28 Nov 2023 14:29:12 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	chunfeng.yun@mediatek.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/3] xhci rework real & fake ports
Date: Tue, 28 Nov 2023 14:25:21 +0200
Message-ID: <20231128122524.286302-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit aims to remove the confusing real & fake port variables
and improve how slot ID is found using fake port.

Clarification on real and fake ports:
  - 'real port' refers to a unique hardware port number.
  - 'fake_port' refers to the port number within a port hub. Its only
    function is to facilitate the identification of the slot ID,
    this process is very inefficient.

Niklas Neronin (3):
  xhci: rework how real & fake ports are found
  xhci: replace real & fake port with pointer to root hub port
  xhci: save slot ID in struct 'xhci_port'

 drivers/usb/host/xhci-hub.c     | 69 ++++++---------------------------
 drivers/usb/host/xhci-mem.c     | 56 +++++++++++++-------------
 drivers/usb/host/xhci-mtk-sch.c | 14 +++----
 drivers/usb/host/xhci-pci.c     | 10 ++---
 drivers/usb/host/xhci-ring.c    | 11 ++----
 drivers/usb/host/xhci-trace.h   | 12 +++---
 drivers/usb/host/xhci.c         | 12 +++---
 drivers/usb/host/xhci.h         |  7 ++--
 8 files changed, 64 insertions(+), 127 deletions(-)

-- 
2.42.0


