Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB4D5FA84
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 17:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfGDPDo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 11:03:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45181 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbfGDPDo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 11:03:44 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hj3Gv-0007d4-SB; Thu, 04 Jul 2019 15:03:41 +0000
From:   Colin King <colin.king@canonical.com>
To:     Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: chipidea: udc: remove redundant assignment to variable retval
Date:   Thu,  4 Jul 2019 16:03:41 +0100
Message-Id: <20190704150341.759-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.  Also remove a blank
line.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/chipidea/udc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 6a5ee8e6da10..053432d79bf7 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1746,12 +1746,11 @@ static int ci_udc_start(struct usb_gadget *gadget,
 			 struct usb_gadget_driver *driver)
 {
 	struct ci_hdrc *ci = container_of(gadget, struct ci_hdrc, gadget);
-	int retval = -ENOMEM;
+	int retval;
 
 	if (driver->disconnect == NULL)
 		return -EINVAL;
 
-
 	ci->ep0out->ep.desc = &ctrl_endpt_out_desc;
 	retval = usb_ep_enable(&ci->ep0out->ep);
 	if (retval)
-- 
2.20.1

