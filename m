Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2A115657B
	for <lists+linux-usb@lfdr.de>; Sat,  8 Feb 2020 17:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgBHQbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Feb 2020 11:31:35 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:46557 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgBHQbf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Feb 2020 11:31:35 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1j0T12-0004WC-RC; Sat, 08 Feb 2020 16:31:32 +0000
From:   Colin King <colin.king@canonical.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: remove redundant assignment to variable status
Date:   Sat,  8 Feb 2020 16:31:32 +0000
Message-Id: <20200208163132.29592-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable status is being assigned with a value that is never read, it is
assigned a new value immediately afterwards. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 6677ae932de0..349deae7cabd 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -752,8 +752,6 @@ f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	audio->out_ep = ep;
 	audio->out_ep->desc = &as_out_ep_desc;
 
-	status = -ENOMEM;
-
 	/* copy descriptors, and track endpoint copies */
 	status = usb_assign_descriptors(f, f_audio_desc, f_audio_desc, NULL,
 					NULL);
-- 
2.25.0

