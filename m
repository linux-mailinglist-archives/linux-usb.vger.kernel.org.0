Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC2027C291
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 12:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgI2Kmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 06:42:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44222 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI2Kmy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 06:42:54 -0400
Received: by mail-lj1-f193.google.com with SMTP id b19so3583597lji.11
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 03:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZ7rk4VezO4t8SMhI50aq1Jtu6SepOpAz4rBtAI+WdM=;
        b=iCJI8U4ILJvbcuMOxkxBZdoC+SDDRJBRbkYSy8QQfwjEsL8fxb09VFqfo9JeT4ujOE
         GL6rMPfsBfrFctG5DhEo8boSXJx1E1s834vwiUGPFUyLIQ4g2TEoQkwRja6Wqhbe6zeY
         r86UG0GBNt2gT/JqvS52gS1ulV4iHa1PY8uvfhBxRdGAXoptSmDgJU5YebKwGAu+gckr
         YEF8aVAnQu4bbgduPCgtcWIawkjANstyfHzY4KMKIHALhaMFqRETnj5sW9jq2GxkkhdY
         t7mm4zR0+tmVJvKftwSBmKEfg+uKZfRi4cHpf4aSIudCQ14cbhiywd4vWCN7Ti++gDE0
         a9Rg==
X-Gm-Message-State: AOAM5320+050SBVxfOt2cK6MrCg51+7N2jL5yV+z2JPaxWnbUY1+W1Jv
        OB29oK3C4NBvoPPLcyw6bVhr4aaND2U=
X-Google-Smtp-Source: ABdhPJyuT/FMtJHcaFpM5C28WlT0cdal398f3AaL5QA7zMclXIEhGae+OVIJwMRxpXTwVxt0I/7tUQ==
X-Received: by 2002:a2e:9d83:: with SMTP id c3mr1019108ljj.385.1601376171388;
        Tue, 29 Sep 2020 03:42:51 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o128sm3189003lfa.110.2020.09.29.03.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:42:50 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kND5p-0001tA-FT; Tue, 29 Sep 2020 12:42:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: qcserial: fix altsetting probing
Date:   Tue, 29 Sep 2020 12:42:39 +0200
Message-Id: <20200929104239.7214-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drivers should not assume that interface descriptors have been parsed in
any particular order so use the interface number to look up the second
alternate setting. That number is also what the driver later use to
switch setting.

Note that although the driver could end up verifying the existence of
the expected endpoints on the wrong interface, a later sanity check in
usb_wwan_port_probe() would have caught this before it could cause any
real damage.

Fixes: a78b42824dd7 ("USB: serial: add qualcomm wireless modem driver")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/qcserial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index c8d1ea0e6e6f..83da8236e3c8 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -243,11 +243,11 @@ static int qcprobe(struct usb_serial *serial, const struct usb_device_id *id)
 		/* QDL mode */
 		/* Gobi 2000 has a single altsetting, older ones have two */
 		if (serial->interface->num_altsetting == 2)
-			intf = &serial->interface->altsetting[1];
+			intf = usb_altnum_to_altsetting(serial->interface, 1);
 		else if (serial->interface->num_altsetting > 2)
 			goto done;
 
-		if (intf->desc.bNumEndpoints == 2 &&
+		if (intf && intf->desc.bNumEndpoints == 2 &&
 		    usb_endpoint_is_bulk_in(&intf->endpoint[0].desc) &&
 		    usb_endpoint_is_bulk_out(&intf->endpoint[1].desc)) {
 			dev_dbg(dev, "QDL port found\n");
-- 
2.26.2

