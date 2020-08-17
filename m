Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C016D2472C6
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391632AbgHQSrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:47:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:34836 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391618AbgHQSrG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:47:06 -0400
IronPort-SDR: YL9R4L/LIPW1pQGB+IJ5zLwlGPDU+StvLSYClm+XghAkMZvCVaYCi4xRrOwmZJntgV2gLp/i/8
 +xa6bNOO1cLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142602246"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="142602246"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:47:03 -0700
IronPort-SDR: D/RGaahK3xJecEL8vann8F2/bK2yyMCSusXS+36fmSbhlnro7ReRxBzEnWaAYKixfsyFipjAf5
 K/EY5VyERF4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="400283129"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2020 11:47:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 619B111E; Mon, 17 Aug 2020 21:47:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 2/8] media: solo6x10: Make use of cpu_to_le16_array()
Date:   Mon, 17 Aug 2020 21:46:53 +0300
Message-Id: <20200817184659.58419-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we have a new helper, let's replace open coded variant by it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anton Sviridenko <anton@corp.bluecherry.net>
Cc: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
v2: new patch
 drivers/media/pci/solo6x10/solo6x10-disp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-disp.c b/drivers/media/pci/solo6x10/solo6x10-disp.c
index ad98ca7fb98b..09c0cf8a5fcb 100644
--- a/drivers/media/pci/solo6x10/solo6x10-disp.c
+++ b/drivers/media/pci/solo6x10/solo6x10-disp.c
@@ -202,16 +202,15 @@ int solo_set_motion_block(struct solo_dev *solo_dev, u8 ch,
 {
 	const unsigned size = sizeof(u16) * 64;
 	u32 off = SOLO_MOT_FLAG_AREA + ch * SOLO_MOT_THRESH_SIZE * 2;
+	unsigned int y;
 	__le16 *buf;
-	int x, y;
 	int ret = 0;
 
 	buf = kzalloc(size, GFP_KERNEL);
 	if (buf == NULL)
 		return -ENOMEM;
 	for (y = 0; y < SOLO_MOTION_SZ; y++) {
-		for (x = 0; x < SOLO_MOTION_SZ; x++)
-			buf[x] = cpu_to_le16(thresholds[y * SOLO_MOTION_SZ + x]);
+		cpu_to_le16_array(buf, &thresholds[y * SOLO_MOTION_SZ], SOLO_MOTION_SZ);
 		ret |= solo_p2m_dma(solo_dev, 1, buf,
 			SOLO_MOTION_EXT_ADDR(solo_dev) + off + y * size,
 			size, 0, 0);
-- 
2.28.0

