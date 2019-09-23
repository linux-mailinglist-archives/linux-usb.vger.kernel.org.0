Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF933BAC8F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 04:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404057AbfIWCZI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 22 Sep 2019 22:25:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33606 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404042AbfIWCZH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 22 Sep 2019 22:25:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so8205254pfl.0;
        Sun, 22 Sep 2019 19:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RtXh1F19FRrx1+dh9ZErv4CrcLDH1VpHTstJEgZnqvA=;
        b=oR7a+Arff/D/BXrTMogPjLPUoaBaJTjLaTypIqtrLhCvq06duqizyXI1wDN+agEUb0
         vJB6JL8gZmvNISBKlYRpVMU753MlvmBnvdiBfEFKfZPcZKWGYryW90O3PGQGLjEQyTh7
         LfZqkhrr+9Hk8C/Jynu+Tk2F5gHPXO9vUHoxEXNu2GA4y0tz5UR4MsUU+89gb30HNIBw
         taQzoInPBUMC83j9MuofAdoFfNZrejIIIM8ysGsnHG0ePid1zFS/uTcJDYt/9Qup92ox
         oVdG8dqt5QLpyGJXDQsX4kj1kNcDYOfRwcJgfh/OmBqbxtpnib2kY4BpB922cr0eEoW2
         qJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RtXh1F19FRrx1+dh9ZErv4CrcLDH1VpHTstJEgZnqvA=;
        b=tIvPeh+ig0hY1DcKUiJLPzwoart/RBfrKY43QOrBJj616seLBkhV1f1jyVRWOPYdSB
         4E7MeyrN5Zr3sdtcAPzFTVgRL6Tjuf+tvREXAwSLhiePFT/p6xuHNpnzwoc6qc9BkRJ+
         91eUJBRu5ktbMjfVV/JQOxvdrBKn+p1Razibf2nwJAWPlzEGXjWH/gqeO332GsD4KVjY
         pdU5jsI7wxXaU7THMJNfr3FO/NDO7Sa9yddhjHsb8TOtZF4R0xT+NMx5NR4nUhfHMPra
         YlDxmQHrdRuXe6iJyPeHOsoU9uL4qwhBzkenHD6l5LRFJnmZRYGJX1FzE/+7WMxJVcjk
         coWw==
X-Gm-Message-State: APjAAAVE3p6raEgbkd/ffeQXAWyQSI6lZ08eJsuzxgfTYpSRW6/yf7yy
        neonM0YOeNXfAE0ErgVtihQ=
X-Google-Smtp-Source: APXvYqxuaCMRhoaztt2AFxtv9Jjsw1wdZebHeK+oHlCcqae63+/OU7waV4DTZP9fTcGHyqAkW6EmfA==
X-Received: by 2002:a63:304:: with SMTP id 4mr27085028pgd.13.1569205506755;
        Sun, 22 Sep 2019 19:25:06 -0700 (PDT)
Received: from localhost (59-120-186-245.HINET-IP.hinet.net. [59.120.186.245])
        by smtp.gmail.com with ESMTPSA id a18sm8342106pgm.25.2019.09.22.19.25.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 19:25:05 -0700 (PDT)
From:   "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>
X-Google-Original-From: "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, peter_hong@fintek.com.tw,
        "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
Subject: [PATCH V2 5/7] USB: serial: f81232: Set F81534A serial port with RS232 mode
Date:   Mon, 23 Sep 2019 10:24:47 +0800
Message-Id: <20190923022449.10952-6-hpeter+linux_kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923022449.10952-1-hpeter+linux_kernel@gmail.com>
References: <20190923022449.10952-1-hpeter+linux_kernel@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Fintek F81532A/534A/535/536 is USB-to-2/4/8/12 serial ports device
and the serial ports are default disabled. Each port contains max 3 pins
GPIO and the 3 pins are default pull high with input mode.

When the serial port had activated (running probe()), we'll transform the
3 pins from GPIO function publicly to control Tranceiver privately use.
We'll default set to 0/0/1 for control transceiver to RS232 mode.

Otherwise, If the serial port is not active, the 3 pins is in GPIO mode
and controlled by global GPIO device with VID/PID: 2c42/16f8.

Signed-off-by: Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>
---
 drivers/usb/serial/f81232.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 36a17aedc2ae..01cb5a5ea1d2 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -96,6 +96,15 @@ MODULE_DEVICE_TABLE(usb, all_serial_id_table);
 #define F81534A_TRIGGER_MULTPILE_4X	BIT(3)
 #define F81534A_FIFO_128BYTE		(BIT(1) | BIT(0))
 
+/* Serial port self GPIO control, 2bytes [control&output data][input data] */
+#define F81534A_GPIO_REG		0x10e
+#define F81534A_GPIO_MODE2_DIR		BIT(6) /* 1: input, 0: output */
+#define F81534A_GPIO_MODE1_DIR		BIT(5)
+#define F81534A_GPIO_MODE0_DIR		BIT(4)
+#define F81534A_GPIO_MODE2_OUTPUT	BIT(2)
+#define F81534A_GPIO_MODE1_OUTPUT	BIT(1)
+#define F81534A_GPIO_MODE0_OUTPUT	BIT(0)
+
 struct f81232_private {
 	struct mutex lock;
 	u8 modem_control;
@@ -866,6 +875,14 @@ static int f81232_port_probe(struct usb_serial_port *port)
 
 static int f81534a_port_probe(struct usb_serial_port *port)
 {
+	int status;
+
+	/* tri-state with pull-high, default RS232 Mode */
+	status = f81232_set_register(port, F81534A_GPIO_REG,
+					F81534A_GPIO_MODE2_DIR);
+	if (status)
+		return status;
+
 	return f81232_port_probe(port);
 }
 
-- 
2.17.1

