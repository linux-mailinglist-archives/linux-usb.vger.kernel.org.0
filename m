Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0B1156EE3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 18:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfFZQfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 12:35:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55722 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFZQfW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jun 2019 12:35:22 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hgAtC-0000Zj-0h; Wed, 26 Jun 2019 16:35:18 +0000
From:   Colin King <colin.king@canonical.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: udc: renesas_usb3: remove redundant assignment to ret
Date:   Wed, 26 Jun 2019 17:35:17 +0100
Message-Id: <20190626163517.18530-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is being initialized with a value that is never read and
ret is being re-assigned immediately after the initialization in both
paths of an if statement. This is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 5a960fce31c5..87062d22134d 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1168,7 +1168,7 @@ static void usb3_set_status_stage(struct renesas_usb3_ep *usb3_ep,
 static void usb3_p0_xfer(struct renesas_usb3_ep *usb3_ep,
 			 struct renesas_usb3_request *usb3_req)
 {
-	int ret = -EAGAIN;
+	int ret;
 
 	if (usb3_ep->dir_in)
 		ret = usb3_write_pipe(usb3_ep, usb3_req, USB3_P0_WRITE);
-- 
2.20.1

