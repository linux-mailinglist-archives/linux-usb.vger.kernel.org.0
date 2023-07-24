Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1D875EF1D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 11:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbjGXJ25 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 05:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbjGXJ2u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 05:28:50 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D1112B
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 02:28:48 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 5F9BE228C0;
        Mon, 24 Jul 2023 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1690190927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=3xAkkR+y43KCjl53caQKnXghs9L0DGj3XwHZ+1daf/w=;
        b=lqJPKbv20xYfOwlv29R5MKUPuqcbBZZt8T+YYSnyHbvkdJvrpZZmj4jVm8m/CcuITVk3BK
        b2ft22UIZSABGJIjP1AFMBVlYJuxIMbO3fmMqU9c3uq984cP2Kv5Cl0e+4achPLew+JTTc
        KB00Ie6j6gwRQ+JaWLTTX69P28CcAbI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 080B213476;
        Mon, 24 Jul 2023 09:28:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kv5iO05EvmRuKAAAMHmgww
        (envelope-from <oneukum@suse.com>); Mon, 24 Jul 2023 09:28:46 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: document ioctl USBDEVFS_GET_SPEED
Date:   Mon, 24 Jul 2023 11:28:43 +0200
Message-ID: <20230724092843.18410-1-oneukum@suse.com>
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

Documenting this ioctl along with the other
ioctls

Fixes: c01b244ad848a ("USB: add usbfs ioctl to retrieve the connection speed")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 Documentation/driver-api/usb/usb.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 2c94ff2f4385..0fcd75ee5897 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -420,6 +420,12 @@ USBDEVFS_CONNECTINFO
     know the devnum value already, it's the DDD value of the device file
     name.
 
+USBDEVFS_GET_SPEED
+    Returns the speed of the device. The speed is returned as a
+    nummerical value in accordance with enum usb_device_speed
+
+    File modification time is not updated by this request.
+
 USBDEVFS_GETDRIVER
     Returns the name of the kernel driver bound to a given interface (a
     string). Parameter is a pointer to this structure, which is
-- 
2.41.0

