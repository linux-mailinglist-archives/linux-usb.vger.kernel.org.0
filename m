Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E8E336ADC
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhCKDnH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:43:07 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38266 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230451AbhCKDnC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:43:02 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BABA8407E6;
        Thu, 11 Mar 2021 03:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434182; bh=AnYxqRBW3yh7N3uGB644ZLQ1PvDZ/j9WHN2HJQD242s=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=jzFK7ePQ6tYDlJCQEUmfCZHh0Luh5gDHgeB/RNBprwcvM4O9IsW44F8ndSI7j6ccO
         2O3T3L4Lr8zL0sHe0+O8M7uKc2l5NvT3SSMW5Bo8gnhyp54btzB1UOUiU+V7/cSQNQ
         9jyWwcmd4WmqcmVabi/geI9QnLLg+K/CAIPH9lLuKo7e4nOjof+6C4S93RSDK+IrHB
         gHqkp69U9vBoLG0XZcSsB4bwS6SyYNUf52XduEnB+BRAu/vfGE9PbgngAfs34UFGp3
         CWsoRWUiEPOp2zFyvPaAGXIr6m9MUyRXEhWT+Sjdxer8yaQm+buW/pxjrK6dzNdI0Z
         UjXL86L3KS1Tg==
Received: from lab-vbox (unknown [10.205.137.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8AF30A005E;
        Thu, 11 Mar 2021 03:43:01 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 10 Mar 2021 19:43:01 -0800
Date:   Wed, 10 Mar 2021 19:43:01 -0800
Message-Id: <df0986bbe92251c104dd92e3c796df7c4f2674ce.1615432770.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 3/8] usb: core: hub: Print speed name based on ssp rate
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Check for usb_device->ssp_rate to print the SuperSpeed Plus signaling
rate generation and lane count.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v3:
- Print Gen XxY instead of genXxY to the match the USB spec
Changes in v2:
- None

 drivers/usb/core/hub.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 823470607d58..9a83390072da 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4830,9 +4830,13 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 						"%s SuperSpeed%s%s USB device number %d using %s\n",
 						(udev->config) ? "reset" : "new",
 					 (udev->speed == USB_SPEED_SUPER_PLUS) ?
-							"Plus Gen 2" : " Gen 1",
-					 (udev->rx_lanes == 2 && udev->tx_lanes == 2) ?
-							"x2" : "",
+							" Plus" : "",
+					 (udev->ssp_rate == USB_SSP_GEN_2x2) ?
+							" Gen 2x2" :
+					 (udev->ssp_rate == USB_SSP_GEN_2x1) ?
+							" Gen 2x1" :
+					 (udev->ssp_rate == USB_SSP_GEN_1x2) ?
+							" Gen 1x2" : "",
 					 devnum, driver_name);
 			}
 
-- 
2.28.0

