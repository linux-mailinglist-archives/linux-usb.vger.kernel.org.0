Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A001E3D35
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388421AbgE0JGl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:06:41 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:2344 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388508AbgE0JGk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 05:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590570400; x=1622106400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Ubu5DjfeMwuoDfB7rELb/kow3WmwDtRNqlTYJOZEPRo=;
  b=yopHUqx45jlkPzQp4aCC/9CM5JITyXoa5/xukd7uTGIUX1X2NHUSltXk
   XjgkBUczyv3Yx758clSnD27AbN779+A8jxk5R9+KHK8NlpdIcmaiOOPff
   5z6Th0tyRnZnB0Ir/P3CPtUqaMcZeVP1E21z1OqPnGx6BNw/FPHzl5vxK
   Ls+CmMwkrpmPcUtgPbmFQTlY0EsguS3o6SQlsoErEn5A95/ppMQWbxxzs
   CofKpXwajbn8uNrthtVawpyL8UvDkpiOU8lShdWD1hsbnErs2JXqMgXFq
   vHg97Ene4/J8ONl9nO5lRpi4l4Kr0TGCh2PzhyuqD1lfAPo2XQWF951w5
   g==;
IronPort-SDR: 4sKuQhn51/IgvXLOji8+H0LK7IdpJXbTWXQtLD5a4dR6FVsPXy+jcVbgnC2zz4Z0+QPyorwzT/
 bs4tSMtDrXYrbvnigLY8fagOIrrjD2QOdXteTWr/zhb7kLXDw8MErCNW1zp39vDUmEq/+0xmVj
 PMN0EGVZmAIf2z87PuHhYhkw831AAkyD85Q2Ivin32AdcMxfMYFDP1P5FDrTmg8VNc3dFX++Jj
 8fnCLYW44zwAteYwTbvORlVeZr7soX0XiTx8YSUNF7HKV6qQ3fcLQ96RyqrruJ9gHMszZACabp
 fYA=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="74590227"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 02:06:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 02:06:33 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 27 May 2020 02:06:38 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 07/10] staging: most: usb: replace code to calculate array index
Date:   Wed, 27 May 2020 11:06:24 +0200
Message-ID: <1590570387-27069-8-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
References: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch removes the expression that makes use of a priori knowledge
about channel numbers to calculate an array index.
The expression 'peer = 1 - channel' utilizes the fact that an USB interface
that operates on the asynchronous data of the Network only has two
endpoints. Hence, channel being 0 or 1. The replacement is more simple and
less confusing when reading the code.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/most/usb/usb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 03318de..468aabf 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -729,6 +729,8 @@ static void wq_clear_halt(struct work_struct *wq_obj)
 	struct most_dev *mdev = clear_work->mdev;
 	unsigned int channel = clear_work->channel;
 	int pipe = clear_work->pipe;
+	int snd_pipe;
+	int peer;
 
 	mutex_lock(&mdev->io_mutex);
 	most_stop_enqueue(&mdev->iface, channel);
@@ -746,9 +748,12 @@ static void wq_clear_halt(struct work_struct *wq_obj)
 	 */
 	if (mdev->conf[channel].data_type == MOST_CH_ASYNC &&
 	    mdev->conf[channel].direction == MOST_CH_RX) {
-		int peer = 1 - channel;
-		int snd_pipe = usb_sndbulkpipe(mdev->usb_device,
-					       mdev->ep_address[peer]);
+		if (channel == 0)
+			peer = 1;
+		else
+			peer = 0;
+		snd_pipe = usb_sndbulkpipe(mdev->usb_device,
+					   mdev->ep_address[peer]);
 		usb_clear_halt(mdev->usb_device, snd_pipe);
 	}
 	mdev->is_channel_healthy[channel] = true;
-- 
2.7.4

