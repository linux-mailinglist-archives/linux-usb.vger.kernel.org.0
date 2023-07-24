Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7672B75F681
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 14:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbjGXMlH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 08:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjGXMlD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 08:41:03 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8053910D5
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 05:41:01 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id C8AC520438;
        Mon, 24 Jul 2023 12:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1690202459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=QGG6yARk8oD9OpOPL20nYB14tUUNPvr6doBPFl+MbNg=;
        b=T8Wt6D7NyC1QJGtBCepOa5nAphS3RifRW6PbPLiOd6AUBkc84wSB5NlQXyt21pfGMf7bA4
        NRSr3Csuutk+nQFsM/pUpfFxAE90JyS/KvuIEAkGJb8pzipM68hcH9VE+d+sOO9W3pQ5Ju
        kV/sFPGxGphFpS3qv4EUnyFJRZS2IVI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 869AC138E8;
        Mon, 24 Jul 2023 12:40:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id xVDhHltxvmR8HQAAMHmgww
        (envelope-from <oneukum@suse.com>); Mon, 24 Jul 2023 12:40:59 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        liulongfang@huawei.com, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: hub: make sure stale buffers are not enumerated
Date:   Mon, 24 Jul 2023 14:40:57 +0200
Message-ID: <20230724124057.12975-1-oneukum@suse.com>
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

Quoting Alan Stern on why we cannot just check errors:

The operation carried out here is deliberately unsafe (for full-speed
devices).  It is made before we know the actual maxpacket size for ep0,
and as a result it might return an error code even when it works okay.
This shouldn't happen, but a lot of USB hardware is unreliable.

Therefore we must not ignore the result merely because r < 0.  If we do
that, the kernel might stop working with some devices.

He is absolutely right. However, we must make sure that in case
we read nothing or a short answer, the buffer contains nothing
that can be misinterpreted as a valid answer.
So we have to zero it before we use it for IO.

Reported-by: liulongfang <liulongfang@huawei.com>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/hub.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a739403a9e45..9772716925c3 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4873,7 +4873,8 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 			}
 
 #define GET_DESCRIPTOR_BUFSIZE	64
-			buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
+			/* zeroed so we don't operate on a stale buffer on errors */
+			buf = kzalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
 			if (!buf) {
 				retval = -ENOMEM;
 				continue;
-- 
2.41.0

