Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C01875AD40
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 13:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjGTLoO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 07:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjGTLoN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 07:44:13 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C911EC
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 04:44:12 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E2E0822C62;
        Thu, 20 Jul 2023 11:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1689853450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=RkxV1IGyap+mQaumT3qW1wgBVIXV4JLg/0E8maTPMYg=;
        b=dSmFCMFWmd85ROjhC2VBycYxkzGAbwWfA8W1QHgeH5sEJUITLGJs8GfMMPpJwDXO4q9+jd
        jxRPv62g0Kg0XOu+XfHgXFZvApn5/rmxNeHOtNBJDbkH2HT6P27eHJGTyT2DingfNd0pgR
        la1dCTJySjL8HqGiVivT9CQOq8Q6UVs=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0AF3133DD;
        Thu, 20 Jul 2023 11:44:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id J08TKAoeuWRMEgAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 20 Jul 2023 11:44:10 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     johan@kernel.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: serial: simple-serial: spell out the ordering
Date:   Thu, 20 Jul 2023 13:44:06 +0200
Message-ID: <20230720114406.14587-1-oneukum@suse.com>
X-Mailer: git-send-email 2.41.0
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

keeping a list ordered alphabetically instead
nummerically be vendor/product ID is unusual.
This is so odd that examples do not help.
It needs to be clearly stated with strong words.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/serial/usb-serial-simple.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
index 24b8772a345e..954b3be7403d 100644
--- a/drivers/usb/serial/usb-serial-simple.c
+++ b/drivers/usb/serial/usb-serial-simple.c
@@ -33,6 +33,16 @@ static struct usb_serial_driver vendor##_device = {		\
 
 #define DEVICE(vendor, IDS)	DEVICE_N(vendor, IDS, 1)
 
+/*
+ * These tables are NOT in order of device id by intention
+ *
+ * Keep them and add new entries sorted by
+ *
+ * 1. Alphabetical order of the vendor name
+ * 2. Alphabetical order of the product name
+ *
+ */
+
 /* Medtronic CareLink USB driver */
 #define CARELINK_IDS()			\
 	{ USB_DEVICE(0x0a21, 0x8001) }	/* MMT-7305WW */
-- 
2.41.0

