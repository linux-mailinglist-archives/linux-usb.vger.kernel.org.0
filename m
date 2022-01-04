Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A066F483A8B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 03:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbiADCW4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jan 2022 21:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiADCW4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jan 2022 21:22:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAE6C061761
        for <linux-usb@vger.kernel.org>; Mon,  3 Jan 2022 18:22:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A0902B81097
        for <linux-usb@vger.kernel.org>; Tue,  4 Jan 2022 02:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2BDC36AED;
        Tue,  4 Jan 2022 02:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641262973;
        bh=7dd2Gm06LeNwlUcUhsMJJj48YLgXXFbHJmhcKiSXN1g=;
        h=From:To:Cc:Subject:Date:From;
        b=auuCCM/PcLc5IDErXWwEmx0r63V2/eYxVvlECrzobXezZzxi8YtqxBq5cRrIZt93S
         2iWfO/CN9aQId7+30xP3dTCMyahTPz+7wlhBlxNQrUK3fZr/2Tg1r2Jqp6e1SA/UTX
         1I2kGNHsYBYhmG5pbHWXiXA96XAgSIo8h4KV7B1N8EoF0zlJN5s1aNFezq9Gjts/au
         avALMwoIi7p5cWHkNc65t/HnHFomFgDCiZQ7Lh0MPaMsb85Q+Qo29yWgiUeFPArhEj
         ovypGU92/JxorOuqZRQwDlU34hdbMn2sifOmyNFATDAV9d49hfUnrOtFe8LMhfe+Yq
         UMZXZBuTNMz4Q==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     Minas.Harutyunyan@synopsys.com
Cc:     dinguyen@kernel.org, Arthur.Petrosyan@synopsys.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc2: do not gate off the hardware if it does not support clock gating
Date:   Mon,  3 Jan 2022 20:22:38 -0600
Message-Id: <20220104022238.725195-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We should not be clearing the HCD_FLAG_HW_ACCESSIBLE bit if the hardware
does not support clock gating.

Fixes: 50fb0c128b6e ("usb: dwc2: Add clock gating entering flow by
system suspend")
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
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

