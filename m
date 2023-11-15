Return-Path: <linux-usb+bounces-2898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A717EC1FF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 13:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FA0828131A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 12:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F78518030;
	Wed, 15 Nov 2023 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnTVSTTU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E58179A5
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 12:14:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988A012A;
	Wed, 15 Nov 2023 04:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700050469; x=1731586469;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xXsNuZqeotzzaISlvHoKm0RPUf/hku/cbqM9xqPJtr0=;
  b=NnTVSTTU20Z/wn9Hsbx/80KU6sTjRwzhbsGI45br3htEcAuq+1YgqvS1
   IvsiuSjt9U0sVucO4Zg8DqpWNyF9weiZ9ARmKKEZraW2ML3kVd4Xuhydn
   54mL1VH75GOn3cYeo1wOa20YErKsB2tC5k0Xb9pTkJy7+SLZpoSNN/dtv
   EZ87nGPdLRB2jS8o08drrHtbtQ06cBhe0fd4vu8990zwuPUlWlabHxLTS
   q/BqJm9HiH7aReIQYDFOTUkX55VhgCrIefkn+yGBFyMkJ5l61W4pJDOQh
   4+ZhaZc7TSEbY4+Cq0LySI7uamduLnBAhCIOoxucckZNglbA4UVG+avCG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="388026042"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="388026042"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 04:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="794136847"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="794136847"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 15 Nov 2023 04:14:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id C3B3D2D6; Wed, 15 Nov 2023 14:14:24 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: config: fix iteration issue in 'usb_get_bos_descriptor()'
Date: Wed, 15 Nov 2023 14:13:25 +0200
Message-ID: <20231115121325.471454-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BOS descriptor defines a root descriptor and is the base descriptor for
accessing a family of related descriptors.

Function 'usb_get_bos_descriptor()' encounters an iteration issue when
skipping the 'USB_DT_DEVICE_CAPABILITY' descriptor type. This results in
the same descriptor being read repeatedly.

To address this issue, a 'goto' statement is introduced to ensure that the
pointer and the amount read is updated correctly. This ensures that the
function iterates to the next descriptor instead of reading the same
descriptor repeatedly.

Cc: stable@vger.kernel.org
Fixes: 3dd550a2d365 ("USB: usbcore: Fix slab-out-of-bounds bug during device reset")
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/core/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index b19e38d5fd10..7f8d33f92ddb 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -1047,7 +1047,7 @@ int usb_get_bos_descriptor(struct usb_device *dev)
 
 		if (cap->bDescriptorType != USB_DT_DEVICE_CAPABILITY) {
 			dev_notice(ddev, "descriptor type invalid, skip\n");
-			continue;
+			goto skip_to_next_descriptor;
 		}
 
 		switch (cap_type) {
@@ -1078,6 +1078,7 @@ int usb_get_bos_descriptor(struct usb_device *dev)
 			break;
 		}
 
+skip_to_next_descriptor:
 		total_len -= length;
 		buffer += length;
 	}
-- 
2.42.0


