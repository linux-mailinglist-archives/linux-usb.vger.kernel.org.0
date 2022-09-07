Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C13CA5B050D
	for <lists+linux-usb@lfdr.de>; Wed,  7 Sep 2022 15:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiIGNUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 09:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIGNUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 09:20:52 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F758E0C8
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 06:20:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 42F3F339F5;
        Wed,  7 Sep 2022 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1662556843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=mU6rdOnXwBTtttdULfSjDlRW9n5ZgjOKJZSIH48B2vQ=;
        b=eeYQebXRteXDDYuFk0U+1g7mwmw95udgM1iADZyQOjLQr/Mmi7SxfLh4axBYdlpOzrrsC5
        mp67FEFLK5eVQci9Tht32F8TFjRHnjKdA3IyuS/3lIW8i5XSFuoAuf2RPkCQaxz7kb7i8t
        FaRimZpdDri0fLbsXk9S/juJxvyBPG4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06D2A13486;
        Wed,  7 Sep 2022 13:20:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4ItWO6qaGGO3GQAAMHmgww
        (envelope-from <oneukum@suse.com>); Wed, 07 Sep 2022 13:20:42 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     johan@kernel.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: serial: ch341: GFP_KERNEL in reset_resume()
Date:   Wed,  7 Sep 2022 15:20:40 +0200
Message-Id: <20220907132040.7747-1-oneukum@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

All instances of reset_resume() are potential
parts of the block IO path. Use GFP_NOIO.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/serial/ch341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index af01a462cc43..3d4f68d58513 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -137,7 +137,7 @@ static int ch341_control_in(struct usb_device *dev,
 	r = usb_control_msg_recv(dev, 0, request,
 				 USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 				 value, index, buf, bufsize, DEFAULT_TIMEOUT,
-				 GFP_KERNEL);
+				 GFP_NOIO);
 	if (r) {
 		dev_err(&dev->dev, "failed to receive control message: %d\n",
 			r);
-- 
2.35.3

