Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32812500DA1
	for <lists+linux-usb@lfdr.de>; Thu, 14 Apr 2022 14:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240752AbiDNMed (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Apr 2022 08:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243430AbiDNMeY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Apr 2022 08:34:24 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3B790FC3
        for <linux-usb@vger.kernel.org>; Thu, 14 Apr 2022 05:31:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1795B21613;
        Thu, 14 Apr 2022 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1649939515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=lFoLdT8UuJFJXOsjHAzXFlZir4IjaP72zl5H6bEeOw4=;
        b=mcmuyEyNgfStZTtIk4IxohIs7UGwmcdOLOHZvk2Y8EGZyTKD64HarPCTy5S7HbPbJVIbn9
        rlq8OsUW/hynWC59Jf1KG9469fxTQalUDNitjCnZcZDuxfOGcVGOI0eJ/VhIWJw9HbsavL
        ff/LWuN9DVbWkXqsUZRPjiwoqXH3SOU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D960113A86;
        Thu, 14 Apr 2022 12:31:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id H2hZMzoUWGJELwAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 14 Apr 2022 12:31:54 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-usb@vger.kernel.org, gregKH@linuxfoundation.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] add STRING quirk for VCOM device
Date:   Thu, 14 Apr 2022 14:31:52 +0200
Message-Id: <20220414123152.1700-1-oneukum@suse.com>
X-Mailer: git-send-email 2.34.1
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

This has been reported to stall if queried

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 8ce8c0d06c66..97b44a68668a 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -510,6 +510,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* DJI CineSSD */
 	{ USB_DEVICE(0x2ca3, 0x0031), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* VCOM device */
+	{ USB_DEVICE(0x4296, 0x7570), .driver_info = USB_QUIRK_CONFIG_INTF_STRINGS },
+
 	/* INTEL VALUE SSD */
 	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
 
-- 
2.34.1

