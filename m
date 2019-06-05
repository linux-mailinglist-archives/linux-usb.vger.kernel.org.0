Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F72335D7E
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 15:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbfFENHq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 09:07:46 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42861 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbfFENHq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 09:07:46 -0400
Received: by mail-qt1-f194.google.com with SMTP id s15so17788205qtk.9
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yJqruNXTj/RXlvfvMUUy2LoN5AXllV25xYGXgQTAKRY=;
        b=qIDWI9RrRG5+clfEW5GXklyFrTVRNQzSezPSB5rmG7SYnYE8wulktu+NVxZOG8fOhj
         G/ltA/QSiY9X4rdi0lDjjk0OQ9ZqJRZdivO0EV6jFUm6IVytZIiiGG92NySctFGsGHCW
         1++/rtcHgFGfIF0P8thZuzUDbHNxrKWbvpSWh5U6WUaQIFEnnFPEJy2qxPKwBxIBezVe
         48pgSuaOPeRRQ5UEwBRqwBHt8xljVWQc8x/Q+yzlv3xDqhaTDoBSJ8h7qVaLz0J6SQHp
         TiHbsxh4hoRqdoe0OJAwsprgdQsRcVlW/QpB43r1ZZA/CiOoYcbc/lY9Iu1sV1IMzWv/
         QSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yJqruNXTj/RXlvfvMUUy2LoN5AXllV25xYGXgQTAKRY=;
        b=iPtCIs68nwej7hCELbmrh75UC/MS+Sd3NPkC2ijORXTg6DFJEj+X44/sae0yjCH3sf
         dbQRXK1mrbajYNY5aWLU8/jYpBLf226LOH5q7XHVoFdzO+KAe8EkHA1+SyWk0z/itG3M
         X+vf2+xTCKxCgjKO1vBvISNbHZidFLHLp15pqh6OHemRTzS65Mxe/oG8I6ALVgvgnOnR
         D8NwRbmvRxj9DuUzRyjLKa4pDcrYWC/CF4Ro+wiqV8QZ+u7KRLwM1I3+JhGdbtCXy/C6
         w5pZ84yok5qz7K179HTmFn2wAxgDEGUf3ZpBezdIuULPFXtk1HwZ7uBF08MWR48XEP4k
         zjqw==
X-Gm-Message-State: APjAAAWQng5TBq7wV/brInCWw7Dq11FHZLb6CL1FeTVP4W5hCXlnJFgb
        yTDQt4l1Uvghmx/NeZ8JCzw=
X-Google-Smtp-Source: APXvYqwb2KyTOSruRwvG1b4gL01qbbBG4K8TCrLvZubyhoDaxNDmXJjJP5Wx8lFiqnxDk5iutLgAPA==
X-Received: by 2002:ac8:4601:: with SMTP id p1mr34688662qtn.181.1559740064907;
        Wed, 05 Jun 2019 06:07:44 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id c9sm14170935qtc.39.2019.06.05.06.07.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 06:07:44 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] usb: chipidea: Use dev_err() instead of pr_err()
Date:   Wed,  5 Jun 2019 10:07:23 -0300
Message-Id: <20190605130723.9184-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dev_err() is more appropriate for printing error messages inside
drivers, so switch to dev_err().

While at it also add the missing newlines and remove 'device'
string as the ci_role(ci)->name string will tell if it is host
or gadget.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Add missing newlines (Johan)
- Remove 'device' string

 drivers/usb/chipidea/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 27749ace2d93..92132b35b7fd 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -523,8 +523,9 @@ int hw_device_reset(struct ci_hdrc *ci)
 	hw_write(ci, OP_USBMODE, USBMODE_SLOM, USBMODE_SLOM);
 
 	if (hw_read(ci, OP_USBMODE, USBMODE_CM) != USBMODE_CM_DC) {
-		pr_err("cannot enter in %s device mode", ci_role(ci)->name);
-		pr_err("lpm = %i", ci->hw_bank.lpm);
+		dev_err(ci->dev, "cannot enter in %s mode\n",
+			ci_role(ci)->name);
+		dev_err(ci->dev, "lpm = %i\n", ci->hw_bank.lpm);
 		return -ENODEV;
 	}
 
-- 
2.17.1

