Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E56C5BA789
	for <lists+linux-usb@lfdr.de>; Fri, 16 Sep 2022 09:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiIPHgR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Sep 2022 03:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiIPHgQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Sep 2022 03:36:16 -0400
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 052FA2CDC5
        for <linux-usb@vger.kernel.org>; Fri, 16 Sep 2022 00:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FhbIG
        Pq+PNgehqIfbGLgrlWr4gkAc3wMTaWsx4UrTn0=; b=nRSlOEICDaoctFkx7QId1
        8fKr3BALoA33RFoc+A4TdxlLbsBTCMNidLrnnoRcTuGR6In331kRQIl0zyEpxOVH
        mJvhKuUa6kFBnTGm0f1W7W04hW/OH9JZEa8RLxDyCYTlH1y6+6Qs6W9bnRKyKiu2
        /E68qpLDl3TmvSojf3bMJE=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp3 (Coremail) with SMTP id DcmowADn7aFYJyRjUaegBg--.14416S2;
        Fri, 16 Sep 2022 15:35:55 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     windhl@126.com
Subject: [PATCH] USB: serial: console: Fix potential use-after-free in usb_console_setup()
Date:   Fri, 16 Sep 2022 15:35:52 +0800
Message-Id: <20220916073552.4093048-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowADn7aFYJyRjUaegBg--.14416S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1ktF1DZw13CFy7Jw4rAFb_yoW8Wr1rpr
        4DKFW5Jr18JF43Xw4fAFWrZrn5W3W2kFy2kr12yw43uFnxt34S93Wxt34Ykay3Cr97Jr90
        yF4jvFW5ua4UKr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRoSotUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBx+F2JVlaNl9QAAsc
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In usb_console_setup(), if we goto error_get_interface and the
usb_serial_put() may finally call kfree(serial). However, the next
line will call 'mutex_unlock(&serial->disc_mutex)' which can cause
a potential UAF bug.

Fixes: 7bd032dc2793 ("USB serial: update the console driver")
Signed-off-by: Liang He <windhl@126.com>
---

 I don't know if the refcount can be zero here, so if it cannot be zero,
this code is safe and please ignore my patch.

 drivers/usb/serial/console.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
index b97aa40ca4d1..21ac2dd6baca 100644
--- a/drivers/usb/serial/console.c
+++ b/drivers/usb/serial/console.c
@@ -62,6 +62,7 @@ static int usb_console_setup(struct console *co, char *options)
 	int cflag = CREAD | HUPCL | CLOCAL;
 	char *s;
 	struct usb_serial *serial;
+	struct mutex *s_mutex;
 	struct usb_serial_port *port;
 	int retval;
 	struct tty_struct *tty = NULL;
@@ -116,7 +117,7 @@ static int usb_console_setup(struct console *co, char *options)
 		return -ENODEV;
 	}
 	serial = port->serial;
-
+	s_mutex = &serial->disc_mutex;
 	retval = usb_autopm_get_interface(serial->interface);
 	if (retval)
 		goto error_get_interface;
@@ -190,7 +191,7 @@ static int usb_console_setup(struct console *co, char *options)
 	usb_autopm_put_interface(serial->interface);
  error_get_interface:
 	usb_serial_put(serial);
-	mutex_unlock(&serial->disc_mutex);
+	mutex_unlock(s_mutex);
 	return retval;
 }
 
-- 
2.25.1

