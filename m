Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF232F59AF
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbhAND4b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 22:56:31 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43868 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726541AbhAND4b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 22:56:31 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1EF0E4016B;
        Thu, 14 Jan 2021 03:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610596531; bh=//BAjnYuJzQJfjPWbN9V1mJUv2lfy258VLX4HWVHgws=;
        h=Date:From:Subject:To:Cc:From;
        b=KT9tjgTYV1mXl4AbYq37PKqZfjR7HCHrz6RBafj2E4qMMwz5RAbzYas4z8TpbGMmS
         eBdI+L/a7ltUvQy2CuMqyjIUe2aqLIvKrnvdncUhpokgQyiv68GQtA3eBQ2g7Jso3l
         VigjKje4Q27UxBeOx/kvAwg3t/m27nqNnQ3j4sTfaOmwCNHSf4ANOvJ6aQIl4hiJpf
         xOUjNWlwi8Klng3R0UBwEVXk07xo39wVXayPEYWmEij/Y2gWF/urzhFQA3u7UpXFYg
         +xQX62W4Ew386FaKwie5hBiuSenj0USqrVPZqtQpg3CSswQhikTrDiuJIc96DpK9Bk
         2zRvWSpeT32gw==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 03C28A0096;
        Thu, 14 Jan 2021 03:55:30 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 19:55:29 -0800
Date:   Wed, 13 Jan 2021 19:55:29 -0800
Message-Id: <4e785ba5d5e95801b6fcf96116f6090216e70760.1610596478.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Disable Vendor Test LMP Received event
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some users questioned why Vendor Test LMP Received event was enabled.
The driver currently doesn't handle this event. Let's disable it to
avoid confusion.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ff14e5bbd152..86f257f12d45 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2232,8 +2232,7 @@ static void dwc3_gadget_enable_irq(struct dwc3 *dwc)
 	u32			reg;
 
 	/* Enable all but Start and End of Frame IRQs */
-	reg = (DWC3_DEVTEN_VNDRDEVTSTRCVEDEN |
-			DWC3_DEVTEN_EVNTOVERFLOWEN |
+	reg = (DWC3_DEVTEN_EVNTOVERFLOWEN |
 			DWC3_DEVTEN_CMDCMPLTEN |
 			DWC3_DEVTEN_ERRTICERREN |
 			DWC3_DEVTEN_WKUPEVTEN |

base-commit: 67004e130aafad4c9e0ad3fff9cf67227b6347be
-- 
2.28.0

