Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36EC4362D3
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 19:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfFERht (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 13:37:49 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40421 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbfFERht (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 13:37:49 -0400
Received: by mail-qt1-f194.google.com with SMTP id a15so4456293qtn.7
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 10:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3cTAGjEEyvSEOKis+JGJ9E3Hpl0tuFQ0pG5JvNLtgH4=;
        b=OSdVDV2JAIDLq3bo4Fw+iHKe0AN62VKi3LQenR9+D7C6zzAD34bhSVh1WtluVzYK4A
         3Q742xlzlHApJ3k0R4+SCnAWshNR2RL0YJeA9PSh6VclRCKaiGwotsC4aZl9RVbGwyWz
         uDAsRdAGXI122phxyvklGcoY/Doa6iE1V154SqLw9shsaHEkVHUBjPznDD8964xLreGm
         lRXCXFF2txfsbeYRzH9Epk6N32Fk5NbYO+uHSVThNDDaMdcFWOP/cY4K2R/J/TKh/inh
         o+V2FYZnRGfp/yzhLunEF4yKRtHKTW843ncM08tNdP1Slj7Q/XSFnifsYuMvZPMZNP6l
         /7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3cTAGjEEyvSEOKis+JGJ9E3Hpl0tuFQ0pG5JvNLtgH4=;
        b=a4ipYWpMOReHwci5l/BKgL8ptIDI7d5LgbAe2sYdUHCRyVNvcH3F5beD+1dQ69ea4K
         KX0dIK3fAJU+XXahr9CNbiQnU7fT0MRJZekr1uffyoI3u05wr0QyiahabcuD5Lyc9/ZL
         Q67J3ArxZe4e1RW8Gs1KX9izQlXtebXQQ9OwnlFIu3+xqf3pawChZCgMGlyMmLoG6Azx
         wh+v4GirpzYgcBHweB7b8WNqs07aYUHDmgtnQCZUscwc7Gg0dx46YGQaclxj+TLvgbIC
         9CkPobKdJdOzGOk/cKyt80FqQ3BC3n8uFLe6YxrW8GDXj+lLHm3aFg5UeoM6rbanf8dw
         PzZQ==
X-Gm-Message-State: APjAAAVItGf4dKurq/LpW+C7xlmtge8+sCfyYzQkZP/L90rMt8ZsU7gP
        c2IYVSDR13GqKHyXOF2pVXA=
X-Google-Smtp-Source: APXvYqzoQsjtAWz7MEenC+22P59dqMeQLLucvnV8zDLOSEZRgzIrfCR+qJXtAhsQELiiOoKI0H/Vbw==
X-Received: by 2002:ac8:1a1c:: with SMTP id v28mr34242409qtj.270.1559756268152;
        Wed, 05 Jun 2019 10:37:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id m66sm12378225qkb.12.2019.06.05.10.37.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 10:37:47 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] usb: chipidea: imx: Use devm_platform_ioremap_resource()
Date:   Wed,  5 Jun 2019 14:37:37 -0300
Message-Id: <20190605173738.5380-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index d8b67e150b12..b0b3ba65c8d7 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -769,7 +769,6 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
 
 static int usbmisc_imx_probe(struct platform_device *pdev)
 {
-	struct resource	*res;
 	struct imx_usbmisc *data;
 	const struct of_device_id *of_id;
 
@@ -783,8 +782,7 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 
 	spin_lock_init(&data->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->base = devm_ioremap_resource(&pdev->dev, res);
+	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
-- 
2.17.1

