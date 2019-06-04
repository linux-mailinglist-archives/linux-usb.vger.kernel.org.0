Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCEEC33D01
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 04:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfFDCJN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 22:09:13 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38346 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfFDCJN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 22:09:13 -0400
Received: by mail-qt1-f195.google.com with SMTP id l3so11984328qtj.5
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2019 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=A8Vzg318xmH58Z9a+fveMVNEFPv+xhZ4diThI/PeSOU=;
        b=buvZBmdESQg2EGcwE9JW2BpWcJd2ZGCF9TR3Nl0JaADp8nCwpIUjD2n+4w4g4Tc8NM
         GtQtIcwVYro54a64ui3Ruhl3c4DlWUi9tby7KYDl0BuFU4428iLus5Ml7WL3f6MB1sfs
         NGFbOyboJX4OYYeZdOycQjy046leQXEztkikHlpcDRWmwyx4OpZgGMNwWwNDFXo7XFMz
         9WJRB7cVJvH7p7SXBDDDk2wlnjm/h4GzO9Z1TTaqQuNKrVVJAyBdk66iD4QilUCwAqmZ
         OfCznTKkspJ9K2+KGozpQqrNngGYN0ftP5aIw6a15MV4+HQvaYpQrLjrmqCBHN8RwcKT
         jB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=A8Vzg318xmH58Z9a+fveMVNEFPv+xhZ4diThI/PeSOU=;
        b=AhOUJ30UqtgYymjSXMKVhFzc3H+JldLOv6/T7QDzoAt6ZF3DYKts9d2MBNMO6AaOvW
         4SIO8UQ1lPL4YVUP+/QLbfwbrDDyqNP9AO+z9grvigQ5aM7p26RsEteOErm1kSEoHJad
         FOFr1BcJoSslslXIu5caJjcOkjKcTjScRRkDKPcsjv7Ha2FXsjnT+yaMCgXvCRxOMb2u
         Glkzo4MytnCZH8wOVTJ8jf5HASDB06D6tUofVBDGy6QFOV+aFdrsGnqNdvA9SgV2LXOS
         y0PrTWivMXxyT7g6TqIE2yYSM5pdx4GKaINEcNQcYv9E8oItrRl338BEzr0Qzlf7j9rr
         ygXQ==
X-Gm-Message-State: APjAAAWODhiU7HZ+o6ScxO55SiuhSdkT8CioBSnSKv6N1KGAdRJ3lxt2
        sZBUcRwYTLyCMzjhsQcCqaD/rnac
X-Google-Smtp-Source: APXvYqwLENJw30qpVSOq+34Wri0oVx/5zygUppGbYbkxdZiqZNcqoHp0qE9v+e1a7aYTPgIHHu4lHg==
X-Received: by 2002:aed:2bc1:: with SMTP id e59mr5936211qtd.7.1559614152130;
        Mon, 03 Jun 2019 19:09:12 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 45sm12102276qtn.82.2019.06.03.19.09.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 19:09:11 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] usb: chipidea: Use dev_err() instead of pr_err()
Date:   Mon,  3 Jun 2019 23:09:01 -0300
Message-Id: <20190604020901.15197-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dev_err() is more appropriate for printing error messages inside
drivers, so switch to dev_err().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/chipidea/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 27749ace2d93..1b6495829265 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -523,8 +523,9 @@ int hw_device_reset(struct ci_hdrc *ci)
 	hw_write(ci, OP_USBMODE, USBMODE_SLOM, USBMODE_SLOM);
 
 	if (hw_read(ci, OP_USBMODE, USBMODE_CM) != USBMODE_CM_DC) {
-		pr_err("cannot enter in %s device mode", ci_role(ci)->name);
-		pr_err("lpm = %i", ci->hw_bank.lpm);
+		dev_err(ci->dev, "cannot enter in %s device mode",
+			ci_role(ci)->name);
+		dev_err(ci->dev, "lpm = %i", ci->hw_bank.lpm);
 		return -ENODEV;
 	}
 
-- 
2.17.1

