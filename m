Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D459145254
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 11:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbgAVKP5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 05:15:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41506 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729281AbgAVKPz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 05:15:55 -0500
Received: by mail-lj1-f196.google.com with SMTP id h23so6136395ljc.8
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 02:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zn1emOAVflAfF5vEbElXusgVmExLsTwagOS9rshaUA4=;
        b=YBRYL7Qa8x2+M/w6yKz1LruUhBeu4eWaSQnkSsQHgDnnJZJ8hKLH4w2TsEE0JVVTwh
         aB+VItnKJqZ2b9s9dc6NhgTdmbZG70Oq2lc4Waz0FzUr+J4yZWoC0o2LHRXPHMdy1X7G
         qj/8z/y81BpsB0kx9AJV9z5uPwUBmIFdg3Ovx281BlajmJX2q34yen1FpQryq72KeEbf
         zZR70I+lCBe42688gLt3re1e7onXtBGFCHg1oEQGB7qe8ys3V2kbfNkinzIR4Jx913Of
         PCdq1tBn8SACsO6o47UfXs+PXO+9l+jVqIpRtnHGN7MRX1uP0DuNAgOh8aw2DUkpXeFG
         mQ3w==
X-Gm-Message-State: APjAAAX/ijlRhXRsB3PEzZ9UphhN2h+rs+QT+waMnhU/+suGf5pAdkE7
        qxY6IkfUUUgr7T9zf8JCPkfya2lk
X-Google-Smtp-Source: APXvYqzMnNbWIXIefAZTc9OdV6AIr+ALaAImCOZDINFAMuERhuDXLIrVIkhta8WtjE8YeunGzbxdbQ==
X-Received: by 2002:a2e:b044:: with SMTP id d4mr17766198ljl.158.1579688153345;
        Wed, 22 Jan 2020 02:15:53 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id n3sm20628886lfk.61.2020.01.22.02.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 02:15:51 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iuD34-0007bo-J4; Wed, 22 Jan 2020 11:15:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 5/5] USB: serial: ir-usb: simplify endpoint check
Date:   Wed, 22 Jan 2020 11:15:30 +0100
Message-Id: <20200122101530.29176-6-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200122101530.29176-1-johan@kernel.org>
References: <20200122101530.29176-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Simplify the endpoint sanity check by letting core verify that the
required endpoints are present.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ir-usb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ir-usb.c b/drivers/usb/serial/ir-usb.c
index 3cd70392e2a2..79d0586e2b33 100644
--- a/drivers/usb/serial/ir-usb.c
+++ b/drivers/usb/serial/ir-usb.c
@@ -76,6 +76,8 @@ static struct usb_serial_driver ir_device = {
 	.description		= "IR Dongle",
 	.id_table		= ir_id_table,
 	.num_ports		= 1,
+	.num_bulk_in		= 1,
+	.num_bulk_out		= 1,
 	.set_termios		= ir_set_termios,
 	.attach			= ir_startup,
 	.write			= ir_write,
@@ -197,9 +199,6 @@ static int ir_startup(struct usb_serial *serial)
 	struct usb_irda_cs_descriptor *irda_desc;
 	int rates;
 
-	if (serial->num_bulk_in < 1 || serial->num_bulk_out < 1)
-		return -ENODEV;
-
 	irda_desc = irda_usb_find_class_desc(serial, 0);
 	if (!irda_desc) {
 		dev_err(&serial->dev->dev,
-- 
2.24.1

