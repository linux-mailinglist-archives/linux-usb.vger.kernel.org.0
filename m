Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D5313C2B4
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbgAON0E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:04 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49140 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728912AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnKK068997;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=3ecZVXteFczQjcsbE9Fkmapr+Bt7ZYBisGtOJAwU94Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=w0gzRCIQBjmhEM73+6/8E78WRzztCmDAfNZEAlyVo5GOVetUigek8UZeVKfH9IorK
         7enSoKFjgAyQjqLyJQXIPLy/EiIghyLwnOdfDwL+YNhBZiAx0jV56SF9IAFjlvgVFZ
         kKuwHmbtTPk1uWnEmOEYlAHtBWJFrrVDdPCWlSZQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPnHE110413
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:48 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm32066537;
        Wed, 15 Jan 2020 07:25:48 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 04/25] usb: musb: omap2430: Get rid of musb .set_vbus for omap2430 glue
Date:   Wed, 15 Jan 2020 07:25:26 -0600
Message-ID: <20200115132547.364-5-b-liu@ti.com>
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

From: Tony Lindgren <tony@atomide.com>

We currently have musb_set_vbus() called from two different paths. Mostly
it gets called from the USB PHY via omap_musb_set_mailbox(), but in some
cases it can get also called from musb_stage0_irq() rather via .set_vbus:

(musb_set_host [musb_hdrc])
(omap2430_musb_set_vbus [omap2430])
(musb_stage0_irq [musb_hdrc])
(musb_interrupt [musb_hdrc])
(omap2430_musb_interrupt [omap2430])

This is racy and will not work with introducing generic helper functions
for musb_set_host() and musb_set_peripheral(). We want to get rid of the
busy loops in favor of usleep_range().

Let's just get rid of .set_vbus for omap2430 glue layer and let the PHY
code handle VBUS with musb_set_vbus(). Note that in the follow-up patch
we can completely remove omap2430_musb_set_vbus(), but let's do it in a
separate patch as this change may actually turn out to be needed as a
fix.

Reported-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/omap2430.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index a3d2fef67746..5c93226e0e20 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -361,8 +361,6 @@ static const struct musb_platform_ops omap2430_ops = {
 	.init		= omap2430_musb_init,
 	.exit		= omap2430_musb_exit,
 
-	.set_vbus	= omap2430_musb_set_vbus,
-
 	.enable		= omap2430_musb_enable,
 	.disable	= omap2430_musb_disable,
 
-- 
2.17.1

