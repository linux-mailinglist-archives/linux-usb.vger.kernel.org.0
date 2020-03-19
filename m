Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8535B18B0C9
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 11:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgCSKC1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 06:02:27 -0400
Received: from comms.puri.sm ([159.203.221.185]:37248 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbgCSKC0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Mar 2020 06:02:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 4D3CBDF787;
        Thu, 19 Mar 2020 03:02:26 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hkicrNzMPrA9; Thu, 19 Mar 2020 03:02:25 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, sergei.shtylyov@cogentembedded.com,
        rogerq@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v3] usb: dwc3: support continuous runtime PM with dual role
Date:   Thu, 19 Mar 2020 11:02:07 +0100
Message-Id: <20200319100207.19957-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The DRD module calls dwc3_set_mode() on role switches, i.e. when a device is
being plugged in. In order to support continuous runtime power management when
plugging in / unplugging a cable, we need to call pm_runtime_get_sync() in
this path.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---


revision history
----------------
v3: call pm_runtime_get_sync() and fix commit message typo (thanks Sergei)
v2: move pm_rumtime calls into workqueue (thanks Roger)
    remove unrelated documentation patch
    https://lore.kernel.org/linux-usb/7a085229-68a7-d700-1781-14225863a228@cogentembedded.com/T/
v1: https://lore.kernel.org/linux-usb/ef22f8de-9bfd-c1d5-111c-696f1336dbda@puri.sm/T/


 drivers/usb/dwc3/core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 1d85c42b9c67..da93faef74a6 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -121,17 +121,19 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (dwc->dr_mode != USB_DR_MODE_OTG)
 		return;
 
+	pm_runtime_get_sync(dwc->dev);
+
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_OTG)
 		dwc3_otg_update(dwc, 0);
 
 	if (!dwc->desired_dr_role)
-		return;
+		goto out;
 
 	if (dwc->desired_dr_role == dwc->current_dr_role)
-		return;
+		goto out;
 
 	if (dwc->desired_dr_role == DWC3_GCTL_PRTCAP_OTG && dwc->edev)
-		return;
+		goto out;
 
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_HOST:
@@ -190,6 +192,9 @@ static void __dwc3_set_mode(struct work_struct *work)
 		break;
 	}
 
+out:
+	pm_runtime_mark_last_busy(dwc->dev);
+	pm_runtime_put_autosuspend(dwc->dev);
 }
 
 void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
-- 
2.20.1

