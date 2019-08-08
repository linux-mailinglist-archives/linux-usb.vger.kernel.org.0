Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A4686D21
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 00:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404699AbfHHWX7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 18:23:59 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35441 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404591AbfHHWX6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 18:23:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id u14so44901349pfn.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2019 15:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=KXMRKOkla55qnWsYXxlUnmTW+pbKayEwS/9LRWakDG8=;
        b=wTDmHl86ZcLAYBYZGgBI2vd8vuBJ+ORrjD+ulGSwml52Q2KhRYlTWrnPpWRtgdMiQA
         1lDyram8Y0qNvEw3u0OAkH6H/zcUpa955pTKZsibEg/8fxceaI38hDAfSLEYXQ5mwMGq
         Uwe8VP5+NK+PsCiIxepnR74Q2BCBLQPSXEomy6sLrH+hmSSUrE7Fb0Wqplf5t+MZBHDQ
         +2R6hpx4eOSqh7zmsnRro1xxOm5GHxGiq7m+lAIOIHEMN6rFUHx7AlqPjDVtaGfQuBbk
         +YyyWDJEB5U8jimuBdztq5CRVN0uLvvcVuCKKL6f3uA9KPlu9Nx5Ua8pzeBtrYahn3PH
         ulGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KXMRKOkla55qnWsYXxlUnmTW+pbKayEwS/9LRWakDG8=;
        b=h2nuyqKpGaCrlXyb5/4AVp7v4l0xyfXpt/Dz376jiVAl/w9n9FtHjqFjopauA/H5Vf
         9I+tUjL8kFv8lQHYsce7ZvL9WBlLOhtiNaTVe0fS3111qpBpZ/86noQaE+cV0HnhBMWg
         IjBVDbxhxd/WktSKLDkZjpE7bQugvry8MCNzYgBAqgEhx4CXt0X0CgpM+9R+MgtCxZQH
         zHbrwvgUKpSbGGGIETNeDEeGmX7tWVFV+35Uz0nbrO0BPv6XhuXvWyMQKMkY2c9NJBeI
         7v4fmoN80vHdFJo70uyMjJpCepKnPEG6q4FD1xZ74xH5D49BzAx82idsLqqIAs2J02if
         vRRg==
X-Gm-Message-State: APjAAAUoppjarhLMOF9oJAAyAXivMsGY/2ecmPv8kMkV83YWODBR1S4v
        ynSJmM5QzjzbkAgzb6KOvHkyqw==
X-Google-Smtp-Source: APXvYqz/Bux726oq0ULlXMowmGDltzYQb7FMXtB+TjNmXzd52pLdiBaIEgfiYwuTFCqB2WkLnABW0Q==
X-Received: by 2002:a62:38c6:: with SMTP id f189mr17886283pfa.157.1565303038267;
        Thu, 08 Aug 2019 15:23:58 -0700 (PDT)
Received: from e6f2834286fb.pdc.gateworks.com (68-189-91-139.static.snlo.ca.charter.com. [68.189.91.139])
        by smtp.gmail.com with ESMTPSA id bg3sm3257856pjb.9.2019.08.08.15.23.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 15:23:57 -0700 (PDT)
From:   Matthew Michilot <mmichilot@gateworks.com>
X-Google-Original-From: Matthew Michilot <matthew.michilot@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Michilot <matthew.michilot@gmail.com>
Subject: [PATCH] USB: serial: ftdi_sio: add support for FT232H CBUS gpios
Date:   Thu,  8 Aug 2019 22:23:48 +0000
Message-Id: <20190808222348.4428-1-matthew.michilot@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable support for cbus gpios on FT232H. The cbus configuration is
stored in one word in the EEPROM at byte-offset 0x1a with the mux
config for ACBUS5, ACBUS6, ACBUS8 and ACBUS9 (only pins that can be
configured as I/O mode).

Tested using FT232H by configuring one ACBUS pin at a time.

Review-by: Tim Harvey <tharvey@gateworks.com>
Signed-off-by: Matthew Michilot <matthew.michilot@gmail.com>
---
 drivers/usb/serial/ftdi_sio.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 4b3a049561f3..c8d35faa8f61 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2023,6 +2023,46 @@ static int ftdi_read_eeprom(struct usb_serial *serial, void *dst, u16 addr,
 	return 0;
 }
 
+static int ftdi_gpio_init_ft232h(struct usb_serial_port *port)
+{
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	u8 *buf;
+	u16 cbus_config;
+	int ret;
+	int i;
+
+	buf = kmalloc(2, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ftdi_read_eeprom(port->serial, buf, 0x1A, 4);
+	if (ret < 0)
+		goto out_free;
+
+	/*
+	 * FT232H CBUS Memory Map
+	 *
+	 * 0x1A: 8X (upper nibble -> AC5)
+	 * 0x1B: X8 (lower nibble -> AC6)
+	 * 0x1C: 88 (upper nibble -> AC8 | lower nibble -> AC9)
+	 */
+	cbus_config = (((buf[0] & 0xf0) | (buf[1] & 0xf)) << 8 | buf[2]);
+
+	priv->gc.ngpio = 4;
+	priv->gpio_altfunc = 0xff;
+
+	for (i = 0; i < priv->gc.ngpio; ++i) {
+		if ((cbus_config & 0xf) == FTDI_FTX_CBUS_MUX_GPIO)
+			priv->gpio_altfunc &= ~BIT(i);
+		cbus_config >>= 4;
+	}
+
+out_free:
+	kfree(buf);
+
+	return ret;
+}
+
 static int ftdi_gpio_init_ft232r(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
@@ -2104,6 +2144,9 @@ static int ftdi_gpio_init(struct usb_serial_port *port)
 	case FTX:
 		result = ftdi_gpio_init_ftx(port);
 		break;
+	case FT232H:
+		result = ftdi_gpio_init_ft232h(port);
+		break;
 	default:
 		return 0;
 	}
-- 
2.17.1

