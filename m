Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B210E750A49
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 16:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbjGLOBF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 10:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjGLOBD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 10:01:03 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AFB210D
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 07:00:47 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A02AA2231D;
        Wed, 12 Jul 2023 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1689170445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TKv7LwxI+QfLXPjc3wvjxSSOBzt/8MWk7sPJBohXj9c=;
        b=QdGqRNHsDFHPPeteiYooI883Z/WQ257jyOsMXTIcP5iaTcpqtnhuqYgybOXk0DRjmUwYMU
        YqeSTez2QN6XiX2+fqLT28RWJT2X1dH1GfA6XL/o5CvjkELIL8Np+teLAInlrFVkUarDW1
        zN8wxjD+MfAvBXufbzdOnVTrlgQCt3w=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 557FF133DD;
        Wed, 12 Jul 2023 14:00:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id eTakEg2yrmTyfwAAMHmgww
        (envelope-from <oneukum@suse.com>); Wed, 12 Jul 2023 14:00:45 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-usb@vger.kernel.org, hovold@kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        Kaufmann Automotive GmbH <info@kaufmann-automotive.ch>
Subject: [PATCHv2] USB: serial-simple: adding Kaufmann RKS+CAN VCP
Date:   Wed, 12 Jul 2023 16:00:22 +0200
Message-ID: <20230712140042.2146-1-oneukum@suse.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding the device and product ID
The device is a is a CAN bus interface / license dongle
The device thus is usable either directly from user space
or can be attached to a kernel CAN interface with slcan_attach

v2: improve change log

Reported-by: Kaufmann Automotive GmbH <info@kaufmann-automotive.ch>
Tested-by: Kaufmann Automotive GmbH <info@kaufmann-automotive.ch>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/serial/usb-serial-simple.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
index 4c6747889a19..3612031030bb 100644
--- a/drivers/usb/serial/usb-serial-simple.c
+++ b/drivers/usb/serial/usb-serial-simple.c
@@ -117,6 +117,11 @@ DEVICE(suunto, SUUNTO_IDS);
 	{ USB_DEVICE(0x908, 0x0004) }
 DEVICE(siemens_mpi, SIEMENS_IDS);
 
+/* KAUFMANN RKS+CAN VCP */
+#define KAUFMANN_IDS()			\
+	{ USB_DEVICE(0x16d0, 0x0870) }
+DEVICE(kaufmann, KAUFMANN_IDS);
+
 /* All of the above structures mushed into two lists */
 static struct usb_serial_driver * const serial_drivers[] = {
 	&carelink_device,
@@ -133,6 +138,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
 	&hp4x_device,
 	&suunto_device,
 	&siemens_mpi_device,
+	&kaufmann_device,
 	NULL
 };
 
@@ -151,6 +157,7 @@ static const struct usb_device_id id_table[] = {
 	HP4X_IDS(),
 	SUUNTO_IDS(),
 	SIEMENS_IDS(),
+	KAUFMANN_IDS(),
 	{ },
 };
 MODULE_DEVICE_TABLE(usb, id_table);
-- 
2.41.0

