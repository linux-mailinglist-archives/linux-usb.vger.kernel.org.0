Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4592513C2AE
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgAON0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:01 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49156 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729043AbgAONZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:51 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPoMV069010;
        Wed, 15 Jan 2020 07:25:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094750;
        bh=NX89JyTqM0Ew/3+SlzixLvNRWB+83BZWYx652TjD2r8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=r37yccfg+abZeZ+6gmlTfi5d1dwJtnePT7BJrt0VGsLk3ehXc1qrWIX5ysygnHD7P
         EQkkNN9mtVvx35R7W1CoO9i1d46hV/fQ0QgDt2d1AXTVpvqfqia0RB7laNDtFogkB9
         if5kuE+bB4kSP6n2Bst4IF1hCkBLZbTFzf71tSvk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPn0q110429
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:50 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3G066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 18/25] usb: musb/ux500: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Wed, 15 Jan 2020 07:25:40 -0600
Message-ID: <20200115132547.364-19-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Ujfalusi <peter.ujfalusi@ti.com>

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/ux500_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/ux500_dma.c b/drivers/usb/musb/ux500_dma.c
index d19bb3e89da6..d5cf5e8bb1ca 100644
--- a/drivers/usb/musb/ux500_dma.c
+++ b/drivers/usb/musb/ux500_dma.c
@@ -310,9 +310,9 @@ static int ux500_dma_controller_start(struct ux500_dma_controller *controller)
 			dma_channel->max_len = SZ_16M;
 
 			ux500_channel->dma_chan =
-				dma_request_slave_channel(dev, chan_names[ch_num]);
+				dma_request_chan(dev, chan_names[ch_num]);
 
-			if (!ux500_channel->dma_chan)
+			if (IS_ERR(ux500_channel->dma_chan))
 				ux500_channel->dma_chan =
 					dma_request_channel(mask,
 							    data ?
-- 
2.17.1

