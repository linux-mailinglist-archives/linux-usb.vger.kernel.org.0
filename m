Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA275BCA05
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 12:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbiISKyI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 06:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiISKxf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 06:53:35 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C4C9C2AC43
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 03:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=EEv6J
        xpYciu0cV1fMKK2M66+KJdreMzM3q7y9C6UEaU=; b=mP8d+z3GM/URtyvTjVWj7
        E1mh2b5A7RgO3dHZnp4MdyIYfgf5qrn0VqJNAUquOhHX2bxycA1hyIIck0b7I+0u
        DxURQU2tb4rLKQ6hlI4QPZN841JpmBt7I0kB6pF4mNpetMUv355GN/VW/Ikahfgc
        2poFEXNgfEgKfKTNH5UQHE=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp10 (Coremail) with SMTP id NuRpCgAHvaH5SChjIbFzCA--.64778S2;
        Mon, 19 Sep 2022 18:48:26 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     windhl@126.com
Subject: [PATCH v2] USB: serial: console: Move mutex_unlock() before usb_serial_put()
Date:   Mon, 19 Sep 2022 18:48:24 +0800
Message-Id: <20220919104824.4104898-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgAHvaH5SChjIbFzCA--.64778S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr15Cw4DXw47GF17Kw1xZrb_yoWfZwc_Gw
        1kWrW7ZryUuFy5Kry7CrW3ZrWSyFnrZrn3X3Z2gFyfZa4q9FZ3tF1qvr9293WxWa1UXr9r
        CwnrCryS9r1kWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMeHDDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBqBF2JVlcN3RwAAsl
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While in current version there is no use-after-free as USB serial
core holds another reference when the console is registered, we
should better unlock before dropping the reference in
usb_console_setup().

Fixes: 7bd032dc2793 ("USB serial: update the console driver")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/usb/serial/console.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
index b97aa40ca4d1..da19a5fa414f 100644
--- a/drivers/usb/serial/console.c
+++ b/drivers/usb/serial/console.c
@@ -189,8 +189,8 @@ static int usb_console_setup(struct console *co, char *options)
 	info->port = NULL;
 	usb_autopm_put_interface(serial->interface);
  error_get_interface:
-	usb_serial_put(serial);
 	mutex_unlock(&serial->disc_mutex);
+	usb_serial_put(serial);
 	return retval;
 }
 
-- 
2.25.1

