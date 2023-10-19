Return-Path: <linux-usb+bounces-1898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945947CF52D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F288282095
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BBD19459;
	Thu, 19 Oct 2023 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDvKCMu/"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F0818C0E
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F395611F
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711286; x=1729247286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BBNeESsLy6O1gxqjsd4WRAh7535MotGXUwEeJ7PfTp8=;
  b=mDvKCMu/kuKiixqa/0Bxfp1w8zYabN4rkKT+oRWn2ZZ72Xi4+gJYCMVX
   5hsUywh0XmxgFtR9wjcLrKatJLkSXDQGy6iLQUMODQH09EehqTa50/8+z
   IhJhdiiU9QaUwvR/aTglQMi0pdbxxfx8HW9tekxccU6MoRZ320wJlvrOl
   /j9XEuO5QBAS5ha/DhF05KgqCfRQTcfN79ebgmWApGE4yXJL2+nWbn5p6
   mZSNMjeY2btxcVDTAHQBgL51bC+qARkHMhKuHm4z2G4biufE60L5WLaQX
   X9G2+b0FeEpu4VqviFC3W5AmS4Lj7Ib8GkmOTTLkbRLTcMuO/CY/EZfRQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075791"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557523"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557523"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:04 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/19] xhci: expand next_trb() helper to support more ring types
Date: Thu, 19 Oct 2023 13:29:08 +0300
Message-Id: <20231019102924.2797346-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next_trb() helper relies on a link TRB at the end of a ring segment
to know a segment ends. This works well with transfer rings that use
link trbs, but not with event rings.

Event rings segments are always filled by host to segment size
before moving to next segment. It does not use link TRBs

Check for both link trb and full segment in next_trb() helper to
support event rings.

Useful if several interrupters with several event rings are supported.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 48daeb4b4a46..17e37c2a14aa 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -144,7 +144,7 @@ static void next_trb(struct xhci_hcd *xhci,
 		struct xhci_segment **seg,
 		union xhci_trb **trb)
 {
-	if (trb_is_link(*trb)) {
+	if (trb_is_link(*trb) || last_trb_on_seg(*seg, *trb)) {
 		*seg = (*seg)->next;
 		*trb = ((*seg)->trbs);
 	} else {
-- 
2.25.1


