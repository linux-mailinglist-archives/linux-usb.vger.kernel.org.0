Return-Path: <linux-usb+bounces-30280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DEAC469C3
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B39BC1887796
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB433112C9;
	Mon, 10 Nov 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJbHhiMp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23030F7F1
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777859; cv=none; b=T1I+W4EfpN06So13RowE4D2j4kmCOeL6X0cRG81cDU8GaKl+UhNvZ2ES6n7ztzEFIwLhZBI8puzZ9zh83hbJcA2BAyf+9bJpxvvkVh0fp0BJ4inRY/GAWdrh4oIjvPVu0MzhsvYvPzKc6zTrZA5ytkqx+/3bhkyg8n+r1cSYdn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777859; c=relaxed/simple;
	bh=BenaOJVHHUsqChkBCvreB1v3RpuReLpBXiwV8wnULn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFB1dzDLZbUkzATwCiU2QEDjZyoIXyUC/Wwy7tT9Q8SLvF3al5Lszjl1DWZjbth6Dobl6d4NFd4hO04NN5afvFMstv4sAwXKfay9mXCnruy1j18+Z6f5pGgTFPw1XWmME0VWfB8UVsGysbTujA0+wcxjbBEsZcSGrekMBfUuV5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJbHhiMp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777858; x=1794313858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BenaOJVHHUsqChkBCvreB1v3RpuReLpBXiwV8wnULn8=;
  b=EJbHhiMpPRg/4R8zjqcxs5ZF7bsJ7H77S1NF8pPwCuZuy0aUXxDEVHow
   oG5pwAI4iFiBkvNqMlJSotNu89Mb2J7HJWccZqud+Rf77VtjM9xVc7u7o
   f/X6/f0aGe2VhzXGR19VtTEQJGdzGK8LqWvm24luwY9IGA3Xw9tqbtRj9
   JaxFGlsl2OodjLJ1+dsPdvonZpsiijaYZrhlzUWC8UPbipGIYjeoV+PYI
   BaxE6rQW1t9hzDcj5JX4kqhLlNzTvXIYlt8RukLHye4HD/O71TQmm7ANp
   UqNFeNd4Qv0LzfbwOwqU9+DgdEF76nvR8kvJ6hLXZU0FmbdYdsRd4NfFm
   Q==;
X-CSE-ConnectionGUID: /OuTDgkBQz2X057Nt54z4Q==
X-CSE-MsgGUID: 2P2mQxJJRjW1VRIpNL39OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75931565"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75931565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:56 -0800
X-CSE-ConnectionGUID: w5F96kf7T420xYY3/dVRBQ==
X-CSE-MsgGUID: VWfh7w9GRp24dIbHn4qVbQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 04:30:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 914F09C; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/16] thunderbolt: Fix typos in nhi.c
Date: Mon, 10 Nov 2025 13:30:41 +0100
Message-ID: <20251110123050.3959188-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in nhi.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index addb4a20d5ea..6d0c9d37c55d 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -712,7 +712,7 @@ void tb_ring_start(struct tb_ring *ring)
 	ring_iowrite64desc(ring, ring->descriptors_dma, 0);
 	if (ring->is_tx) {
 		ring_iowrite32desc(ring, ring->size, 12);
-		ring_iowrite32options(ring, 0, 4); /* time releated ? */
+		ring_iowrite32options(ring, 0, 4);
 		ring_iowrite32options(ring, flags, 0);
 	} else {
 		u32 sof_eof_mask = ring->sof_mask << 16 | ring->eof_mask;
-- 
2.50.1


