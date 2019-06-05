Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E538135D66
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 15:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfFENAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 09:00:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:47644 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727601AbfFENAC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 09:00:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B21EAAEBD;
        Wed,  5 Jun 2019 13:00:01 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: hso: correct debug message
Date:   Wed,  5 Jun 2019 14:59:42 +0200
Message-Id: <20190605125942.26696-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If you do not find the OUT endpoint, you should say so,
rather than copy the error message for the IN endpoint.
Presumably a copy and paste error.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/hso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index d6916f787fce..6a0ecddff310 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -2663,7 +2663,7 @@ static struct hso_device *hso_create_bulk_serial_device(
 	if (!
 	    (serial->out_endp =
 	     hso_get_ep(interface, USB_ENDPOINT_XFER_BULK, USB_DIR_OUT))) {
-		dev_err(&interface->dev, "Failed to find BULK IN ep\n");
+		dev_err(&interface->dev, "Failed to find BULK OUT ep\n");
 		goto exit2;
 	}
 
-- 
2.16.4

