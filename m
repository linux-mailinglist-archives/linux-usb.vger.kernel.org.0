Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F852C017A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 10:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfI0Iue (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 04:50:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60111 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfI0Iue (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 04:50:34 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iDlxP-0004Dx-T9; Fri, 27 Sep 2019 08:50:31 +0000
From:   Colin King <colin.king@canonical.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: gadget: udc: clean up an indentation issue
Date:   Fri, 27 Sep 2019 09:50:31 +0100
Message-Id: <20190927085031.14739-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented too deeply, remove
the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/bdc/bdc_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_udc.c b/drivers/usb/gadget/udc/bdc/bdc_udc.c
index 7bfd58c846f7..248426a3e88a 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_udc.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_udc.c
@@ -195,7 +195,7 @@ static void handle_link_state_change(struct bdc *bdc, u32 uspc)
 		break;
 	case BDC_LINK_STATE_U0:
 		if (bdc->devstatus & REMOTE_WAKEUP_ISSUED) {
-					bdc->devstatus &= ~REMOTE_WAKEUP_ISSUED;
+			bdc->devstatus &= ~REMOTE_WAKEUP_ISSUED;
 			if (bdc->gadget.speed == USB_SPEED_SUPER) {
 				bdc_function_wake_fh(bdc, 0);
 				bdc->devstatus |= FUNC_WAKE_ISSUED;
-- 
2.20.1

