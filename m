Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F48B4842E4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 14:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbiADN7f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 08:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiADN7e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jan 2022 08:59:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B26C061784
        for <linux-usb@vger.kernel.org>; Tue,  4 Jan 2022 05:59:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 13908B81151
        for <linux-usb@vger.kernel.org>; Tue,  4 Jan 2022 13:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4490BC36AED;
        Tue,  4 Jan 2022 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641304771;
        bh=Rus34svJFfRhGLv+lCfD9GPr0xm8/2A68sBMjlIGVbw=;
        h=From:To:Cc:Subject:Date:From;
        b=dO68dKg+wQPJmuHhrilAutF5OPcOwil9Ma44/Op6oUIrCDRQiDOGNndU/XMjlj4Nj
         yZ3fCC7BPP0l2Dm3SbxcU8hOxEBrk7MEUPKtNvRz8poLsBFAt72GfzZRPtFv+GZ8+1
         MNlUCuMB717jUp6nwqEon64kggoUkq5+z7cZWZF72T7MMF5mPa42/3HyyxjhG/Wlzg
         ddnYoNv56KdhJz37S4sUbO28MZFikbJ6P2gw4ohb0n5k+GYVYj1FkFpV9I7h4vVc13
         si5OGLl7Zt+QX1UDrHZqXsbIt/22s5S3VScy87TlsQgXuff04X4obpQNrfTWFyJdUA
         JCpoLk6frQNDQ==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     Minas.Harutyunyan@synopsys.com
Cc:     dinguyen@kernel.org, Arthur.Petrosyan@synopsys.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCHv2] usb: dwc2: do not gate off the hardware if it does not support clock gating
Date:   Tue,  4 Jan 2022 07:59:22 -0600
Message-Id: <20220104135922.734776-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We should not be clearing the HCD_FLAG_HW_ACCESSIBLE bit if the hardware
does not support clock gating.

Fixes: 50fb0c128b6e ("usb: dwc2: Add clock gating entering flow by system suspend")
Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: Add Acked-by, and fix "Fixes" line
---
 drivers/usb/dwc2/hcd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 13c779a28e94..f63a27d11fac 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4399,11 +4399,12 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 		 * If not hibernation nor partial power down are supported,
 		 * clock gating is used to save power.
 		 */
-		if (!hsotg->params.no_clock_gating)
+		if (!hsotg->params.no_clock_gating) {
 			dwc2_host_enter_clock_gating(hsotg);
 
-		/* After entering suspend, hardware is not accessible */
-		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+			/* After entering suspend, hardware is not accessible */
+			clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+		}
 		break;
 	default:
 		goto skip_power_saving;
-- 
2.25.1

