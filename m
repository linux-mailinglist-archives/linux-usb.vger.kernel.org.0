Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC4755C95E
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbiF0NRs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 09:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235671AbiF0NRc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 09:17:32 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16499262E
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 06:16:31 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BC5751FD89;
        Mon, 27 Jun 2022 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1656335789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=7ChVf6Dv9ptgzwXkaFLLlowuJhtLXJGEaf1j4jVXWvs=;
        b=nOrdqoju0LC3wARDfzPcfNXbyxy2pG7taGgbwQcfFAGS6XR98rhQoco4luqnnzUsZX3Evt
        DPInQcDdHkKODfKRqto6aKR1WMDACsFa12xFWUNam/HBZ9yib/f8Cuxps0yDdc0y9+TLkt
        Sbef1ovd1SAeQjn6eKizY/643SR9TCc=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 838F713AB2;
        Mon, 27 Jun 2022 13:16:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 3j5xHq2tuWLuGAAAMHmgww
        (envelope-from <oneukum@suse.com>); Mon, 27 Jun 2022 13:16:29 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     davem@davemloft.net, netdev@vger.kernel.or, kuba@kernel.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usbnet: fix memory leak in error case
Date:   Mon, 27 Jun 2022 15:16:26 +0200
Message-Id: <20220627131626.31376-1-oneukum@suse.com>
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

usbnet_write_cmd_async() mixed up which buffers
need to be freed in which error case.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/usbnet.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 1cb6dab3e2d0..c66d2a097b0c 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -2137,10 +2137,10 @@ static void usbnet_async_cmd_cb(struct urb *urb)
 int usbnet_write_cmd_async(struct usbnet *dev, u8 cmd, u8 reqtype,
 			   u16 value, u16 index, const void *data, u16 size)
 {
-	struct usb_ctrlrequest *req = NULL;
+	struct usb_ctrlrequest *req;
 	struct urb *urb;
 	int err = -ENOMEM;
-	void *buf = NULL;
+	void *buf;
 
 	netdev_dbg(dev->net, "usbnet_write_cmd cmd=0x%02x reqtype=%02x"
 		   " value=0x%04x index=0x%04x size=%d\n",
@@ -2155,7 +2155,7 @@ int usbnet_write_cmd_async(struct usbnet *dev, u8 cmd, u8 reqtype,
 		if (!buf) {
 			netdev_err(dev->net, "Error allocating buffer"
 				   " in %s!\n", __func__);
-			goto fail_free;
+			goto fail_free_urb;
 		}
 	}
 
@@ -2179,14 +2179,21 @@ int usbnet_write_cmd_async(struct usbnet *dev, u8 cmd, u8 reqtype,
 	if (err < 0) {
 		netdev_err(dev->net, "Error submitting the control"
 			   " message: status=%d\n", err);
-		goto fail_free;
+		goto fail_free_all;
 	}
 	return 0;
 
+fail_free_all:
+	kfree(req);
 fail_free_buf:
 	kfree(buf);
-fail_free:
-	kfree(req);
+	/*
+	 * avoid a double free
+	 * needed because the flag can be set only
+	 * after filling the URB
+	 */
+	urb->transfer_flags = 0;
+fail_free_urb:
 	usb_free_urb(urb);
 fail:
 	return err;
-- 
2.35.3

