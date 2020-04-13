Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E3F1A682D
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2020 16:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbgDMObT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Apr 2020 10:31:19 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:39377 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728185AbgDMObS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Apr 2020 10:31:18 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4919z36CWxz1rlhx;
        Mon, 13 Apr 2020 16:31:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4919z35bkbz1r0cS;
        Mon, 13 Apr 2020 16:31:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id oEcky7ImiQoG; Mon, 13 Apr 2020 16:31:10 +0200 (CEST)
X-Auth-Info: 5var6Mt36EVjAvMUoJlYb30MclBSsKsuJqKWJWyMCRs=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 13 Apr 2020 16:31:10 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-usb@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Minas Harutyunyan <hminas@synopsys.com>
Subject: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Date:   Mon, 13 Apr 2020 16:31:07 +0200
Message-Id: <20200413143107.181669-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On STM32MP1 without the STUSB1600 USB-C chip (i.e. with plain USB-OTG
micro-B plug with ID and VBUS detection), the USB OTG port only works
if a micro-B device (e.g. a USB stick) is plugged in first. Once this
is done, both micro-B device and host (e.g. a PC via a USB A-to-microB
cable) are correctly detected and recognized. If a USB host is plugged
in first (e.g. a PC), then the PC does not detect the STM32MP1 at all.

By running the core connect code in dwc2_hcd_init(), both device and
host are detected and the USB works as expected. However, it is not
clear whether this is the correct solution.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>
To: linux-usb@vger.kernel.org
---
 drivers/usb/dwc2/hcd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index b90f858af960..ead605efeb24 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5237,6 +5237,11 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg)
 
 	dwc2_enable_global_interrupts(hsotg);
 
+	dwc2_hsotg_core_init_disconnected(hsotg, false);
+	/* Enable ACG feature in device mode,if supported */
+	dwc2_enable_acg(hsotg);
+	dwc2_hsotg_core_connect(hsotg);
+
 	return 0;
 
 error4:
-- 
2.25.1

