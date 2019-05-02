Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6B1122B6
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 21:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfEBTrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 15:47:22 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40010 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfEBTrW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 15:47:22 -0400
Received: by mail-io1-f67.google.com with SMTP id m9so3284760iok.7
        for <linux-usb@vger.kernel.org>; Thu, 02 May 2019 12:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kN2LIb+QfrL8sIiIPydwyFeqIMx0USBkBKWhvSqCdeo=;
        b=JwM5v2d9KH7VGzJ73U1rGQ4UATz/oHxS5kXnZhwrTaLmE1qGi4HM6fQMJFl6+fg8+f
         92982zb09pcP8df/GXCtdec5nuHNPGqEAK8S4U8/BfmmRKHEZvFfQETtmzsm3u2i+bu/
         nOsJYsbqOmEaNGQE3nLIjiSsecQB6aq7Ra65g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kN2LIb+QfrL8sIiIPydwyFeqIMx0USBkBKWhvSqCdeo=;
        b=Jt6J5VKSXKS0/d9iflRDtHJjNnyb102peoFPmSPADPr4FfzJRdqcIsxkO+/AbSRA02
         PZvsE6ZqYgJA8ZTTvKUk/UAV5XbqI8YtwfbLIIur/c4mOAYFjiIGcPmN/uDPB5k/wpyw
         MYtwf+zrOdE8SQW3JHHf5f+jdv1QtCuwb7Sm20DykMLyn53fxmIM1YgWEAFj2jER46gs
         abFYDcdD2YRIxn78dI7ES580ykXJXuakjYPe4peE2LPlgiv5vnwTR9od5KTcHek4ApFs
         uNJsBUO5z90jyf81puGScpjRO0JxstKHBNS8wvzg3ytvVWQkmavFsHSnUGqiiRGs3DFc
         b2ug==
X-Gm-Message-State: APjAAAWI09dJfdQmYrDwHFh03LXEs56FQZ+4Of18EIixF0zahLbIdk3O
        EbuohZHOhHdRAv8EqbTHfuMvewlYoE4=
X-Google-Smtp-Source: APXvYqxctf1vnpMemVTqvGRy5BaSsYuC0FjClI7ZmiBti3yUwRd5i+u7uLmhR6kGGiZYdqPHbA71iA==
X-Received: by 2002:a6b:5a0e:: with SMTP id o14mr3747821iob.213.1556826441504;
        Thu, 02 May 2019 12:47:21 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id a124sm50177itc.18.2019.05.02.12.47.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 12:47:20 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: usbip_host: cleanup do_rebind() return path
Date:   Thu,  2 May 2019 13:47:18 -0600
Message-Id: <20190502194718.15256-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Cleanup do_rebind() return path and use common return path.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/stub_main.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
index bf8a5feb0ee9..2e4bfccd4bfc 100644
--- a/drivers/usb/usbip/stub_main.c
+++ b/drivers/usb/usbip/stub_main.c
@@ -201,7 +201,7 @@ static DRIVER_ATTR_RW(match_busid);
 
 static int do_rebind(char *busid, struct bus_id_priv *busid_priv)
 {
-	int ret;
+	int ret = 0;
 
 	/* device_attach() callers should hold parent lock for USB */
 	if (busid_priv->udev->dev.parent)
@@ -209,11 +209,9 @@ static int do_rebind(char *busid, struct bus_id_priv *busid_priv)
 	ret = device_attach(&busid_priv->udev->dev);
 	if (busid_priv->udev->dev.parent)
 		device_unlock(busid_priv->udev->dev.parent);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(&busid_priv->udev->dev, "rebind failed\n");
-		return ret;
-	}
-	return 0;
+	return ret;
 }
 
 static void stub_device_rebind(void)
-- 
2.17.1

