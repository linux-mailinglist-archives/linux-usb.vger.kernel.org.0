Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3953BA169
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jul 2021 15:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhGBNpa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jul 2021 09:45:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232723AbhGBNp2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Jul 2021 09:45:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9794761443;
        Fri,  2 Jul 2021 13:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625233376;
        bh=CH6s8PzijkWxFhtgRqiYVjHFlLYMZClTLpnnouDO70I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A40mA9tZ9LMr7PeOYwW46qsBy/YkFXTvdeGm+aRhHcmdvxoK2GZDSOc4s6ork6biV
         uODKOjvBknp6sBNN9Ki9xGQHNKSD5Z+9TrEY3TzcgVoHS/Zwjxn1Mc3MdhzMaTGiK3
         ISMtLwo2CZcwxkQuElGlgC6FbEYN6zkgeYbDjwGvAq1ARVFyPm1eKMjISXBeAvAp6V
         0aw6g1vfKsjXh7+WvNeYM4YGicSYuCCBhDZ+3dI3o7fk9CAOw57i4Q8i44RBd6FRc7
         eoPOJtOtgZXWPnXNiKOC8NHu6vU2sM4c2rWpWLWSqIHpj25xEIyiKfRJLnGPdgnGZo
         9/+D8kTWSdjLg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lzJRT-0006QE-A2; Fri, 02 Jul 2021 15:42:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] USB: serial: cp210x: clean up type detection
Date:   Fri,  2 Jul 2021 15:42:26 +0200
Message-Id: <20210702134227.24621-6-johan@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702134227.24621-1-johan@kernel.org>
References: <20210702134227.24621-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Clean up attach somewhat by moving type detection into the quirk helper
and giving it a more generic name.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 4c51381cf9aa..0f4cdba160d9 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -2087,11 +2087,21 @@ static int cp210x_get_fw_version(struct usb_serial *serial, u16 value)
 	return 0;
 }
 
-static void cp210x_determine_quirks(struct usb_serial *serial)
+static void cp210x_determine_type(struct usb_serial *serial)
 {
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
 	int ret;
 
+	ret = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
+			CP210X_GET_PARTNUM, &priv->partnum,
+			sizeof(priv->partnum));
+	if (ret < 0) {
+		dev_warn(&serial->interface->dev,
+				"querying part number failed\n");
+		priv->partnum = CP210X_PARTNUM_UNKNOWN;
+		return;
+	}
+
 	switch (priv->partnum) {
 	case CP210X_PARTNUM_CP2102N_QFN28:
 	case CP210X_PARTNUM_CP2102N_QFN24:
@@ -2116,18 +2126,9 @@ static int cp210x_attach(struct usb_serial *serial)
 	if (!priv)
 		return -ENOMEM;
 
-	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
-					  CP210X_GET_PARTNUM, &priv->partnum,
-					  sizeof(priv->partnum));
-	if (result < 0) {
-		dev_warn(&serial->interface->dev,
-			 "querying part number failed\n");
-		priv->partnum = CP210X_PARTNUM_UNKNOWN;
-	}
-
 	usb_set_serial_data(serial, priv);
 
-	cp210x_determine_quirks(serial);
+	cp210x_determine_type(serial);
 	cp210x_init_max_speed(serial);
 
 	result = cp210x_gpio_init(serial);
-- 
2.31.1

