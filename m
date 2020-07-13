Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BF921D410
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 12:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbgGMKza (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 06:55:30 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46625 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbgGMKz3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 06:55:29 -0400
Received: by mail-lj1-f193.google.com with SMTP id h19so17021059ljg.13
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 03:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fca4nwkeJS+tOliouYMIx2938BmfPBfN847VG1swYws=;
        b=L0t4jIuo2Zks1XJ9kQ4MaKm2XeRSFiBjS+jg9nu10yhfYoD3LWEGVBqCj5m296YYUs
         PUMk5Z63FSSAmGAH0rds0QhkEepP3VCngnAj4Ad50ibOxjOKU8kewsdDX45JJh40RjrL
         0w+OP8Cg6HyOdyv8OGXU7CKDUsF/tD1n2YUb5k1nOmDHeh1/1AZVMTXZAjggCacRAI+0
         JoDoPTgQUhPFkLfLndakmZZstrhNGVwPb3Izv/TKoTEhy3Rl2xif86LqnWVRYP8kYGRJ
         7XQ+gn9lHn6ixDZ79taYENaEeeInG9Cqs9AyG8JnF3C6LF7ThPOT/w0uW+NRCYEJW/Go
         uBgQ==
X-Gm-Message-State: AOAM533O7GHt5R5A131LYEdGF84HGcRMK1xsMxgDiCbHeejWS6xHkSZd
        dNrLO7RFqsTncxcjE9ruDaYNiVSGDeA=
X-Google-Smtp-Source: ABdhPJz9pLrtxpWy3uWGoDvGNsloNa0kCm61rtK0+J+0kds5n/ILiOTUSMI2CbSMW48osjWd34yF1g==
X-Received: by 2002:a05:651c:2046:: with SMTP id t6mr38364066ljo.217.1594637726658;
        Mon, 13 Jul 2020 03:55:26 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a16sm5553518ljj.108.2020.07.13.03.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:55:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1juw7S-0007FD-2y; Mon, 13 Jul 2020 12:55:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Jarom=C3=ADr=20=C5=A0korpil?= <Jerry@jrr.cz>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/5] USB: serial: cp210x: disable interface on errors in open
Date:   Mon, 13 Jul 2020 12:55:13 +0200
Message-Id: <20200713105517.27796-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713105517.27796-1-johan@kernel.org>
References: <20200713105517.27796-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Try to disable the serial interface in the unlikely event that generic
open() fails.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index a90801ef0055..c01c7863dd1a 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -824,7 +824,16 @@ static int cp210x_open(struct tty_struct *tty, struct usb_serial_port *port)
 	if (tty)
 		cp210x_change_speed(tty, port, NULL);
 
-	return usb_serial_generic_open(tty, port);
+	result = usb_serial_generic_open(tty, port);
+	if (result)
+		goto err_disable;
+
+	return 0;
+
+err_disable:
+	cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_DISABLE);
+
+	return result;
 }
 
 static void cp210x_close(struct usb_serial_port *port)
-- 
2.26.2

