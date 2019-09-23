Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C33E7BAC93
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 04:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391830AbfIWCZD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 22 Sep 2019 22:25:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33599 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389942AbfIWCZD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 22 Sep 2019 22:25:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so8205125pfl.0;
        Sun, 22 Sep 2019 19:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kqam0JDuiFgCeWwjWzay5+sVPUI3XqH00sjmb3q+iqY=;
        b=njoTGX4wRr8W9acQvSFkFjiiqh4lATfQTbTVG5qz1WImyEgKJI5JX9gBIk6x6P1X5j
         TnyYZaVclQ7vZDAu3hvrWliBUNgjNvHBs4p990ePYxSDxloWF7yNFy590E9/uM9rhNe6
         MRA8+z8MSkJ+cNt4bEM4yDo3oEVXtEk/Vkjftd2PYWV8m1YMt4snY+8YQ5Tz/fN6aw/W
         XehvtL1JifbN9gnBEf3fD6bJVmNWHWYe7LW+kvbOH9jypLQpoV+ruZ3G3BnAUFr5++xX
         kdrqf70YArspXylYo5kTxL7AJWayU4NIrXgQh1Mwt8X/EH1C1UejhkkpB/jLrNdvnRFO
         LN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kqam0JDuiFgCeWwjWzay5+sVPUI3XqH00sjmb3q+iqY=;
        b=bjLgLgXxwsgNffPZjcSib5SWYTfHEIie0XaQiAbQ/uuutTlLF7mvGroRVejgEUylf9
         oeK2IMITQH+A/7MKt3PtSY0w9eRajowZR5g9vaPuETYaH+4GQ494EVvSPhaBsNGz0IMr
         FQJ24ABVjn9FinTYMPIMPPZRNwgrMvgltJZV+v7UQXvWjdP8Q6gjxJlVlOsGQV/lgUeT
         ZyxVrYt3TZcgB/LR0wBJDf84gUmXdHe2Rp4iENkxh7LpA9ob0UIQYnp8czbV/V9aEPrl
         kG9VrKT/weCKaJtV6zjT7kEvK8BqUErfeYomU0tyuBiRHG8nmF1g7ux4KtEbPyM4+QZc
         gHOQ==
X-Gm-Message-State: APjAAAU4kyLvHk7fs2kR0Q0iWtAN/PXqZPms77eHRsK6VFC3DGdJ+sgz
        aUS2nale2ksabqQ+G6qwv20=
X-Google-Smtp-Source: APXvYqy09O4Rz1jR1oouHUUvz88mjxntedSoXqnBH4c9NkdtZWqx2Fs6d4GRx1HK7Fqem+doaPxfjQ==
X-Received: by 2002:a63:2943:: with SMTP id p64mr25648966pgp.98.1569205502194;
        Sun, 22 Sep 2019 19:25:02 -0700 (PDT)
Received: from localhost (59-120-186-245.HINET-IP.hinet.net. [59.120.186.245])
        by smtp.gmail.com with ESMTPSA id s17sm10580628pgg.77.2019.09.22.19.25.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 19:25:01 -0700 (PDT)
From:   "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>
X-Google-Original-From: "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, peter_hong@fintek.com.tw,
        "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
Subject: [PATCH V2 3/7] USB: serial: f81232: Use devm_kzalloc
Date:   Mon, 23 Sep 2019 10:24:45 +0800
Message-Id: <20190923022449.10952-4-hpeter+linux_kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923022449.10952-1-hpeter+linux_kernel@gmail.com>
References: <20190923022449.10952-1-hpeter+linux_kernel@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use devm_kzalloc() to replace kzalloc().

Signed-off-by: Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>
---
 drivers/usb/serial/f81232.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index b42b3738a768..e4db0aec9af0 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -756,7 +756,7 @@ static int f81232_port_probe(struct usb_serial_port *port)
 {
 	struct f81232_private *priv;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(&port->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -772,16 +772,6 @@ static int f81232_port_probe(struct usb_serial_port *port)
 	return 0;
 }
 
-static int f81232_port_remove(struct usb_serial_port *port)
-{
-	struct f81232_private *priv;
-
-	priv = usb_get_serial_port_data(port);
-	kfree(priv);
-
-	return 0;
-}
-
 static int f81232_suspend(struct usb_serial *serial, pm_message_t message)
 {
 	struct usb_serial_port *port = serial->port[0];
@@ -841,7 +831,6 @@ static struct usb_serial_driver f81232_device = {
 	.process_read_urb =	f81232_process_read_urb,
 	.read_int_callback =	f81232_read_int_callback,
 	.port_probe =		f81232_port_probe,
-	.port_remove =		f81232_port_remove,
 	.suspend =		f81232_suspend,
 	.resume =		f81232_resume,
 };
-- 
2.17.1

