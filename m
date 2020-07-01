Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C3021114E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 18:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732739AbgGAQyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 12:54:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33673 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732803AbgGAQyQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 12:54:16 -0400
Received: by mail-lj1-f195.google.com with SMTP id s1so28013926ljo.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 09:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nkm6LZ46gPfDGxsbcgHclCM2WSwIjjjQo9Gbehs+LuA=;
        b=QaCLauIZqY6qHxV6nB1BrtGbTGpDx5jPvSmiaTC7VMnVHWbrjFU6b8Dc3yCMWAWi4L
         IeVl9yXamUk9giz0h/Fwu061CVRdZsGx51KPy2i0enePWKW+Ss9BI9cycRfGtxg00MK6
         9+DBrknz6f4Hj2SpbppeHmzRsOjnBxxD0/oFVy7NtHM5teQJSOt1Vd5aNiLq6BBBTZIA
         p+KFsevFPGRY75AWa5pTn/Am7qm099eswx4gVW+rYgHW6jVcX7c3tiX08gExmC+CyRWM
         xg7rN2QGvObxxkr6AFOjE+uJ6ZQwof/gLbOLiIDtKweE2ncF96tuB9VIaQk+vGNhO+z8
         X2sw==
X-Gm-Message-State: AOAM532kBnk4eWMlxIxRIuJM0kLz0dMsQiTCf3LfgxpxG6vOWWF6Io1K
        fdtzF7S6Pc8TNHRxWasn4K0Pm92V1Bg=
X-Google-Smtp-Source: ABdhPJxryHcu5UWcJxcKoAmShyWNLcEZDL8v5Fdw2etXzoWOEp2vdOsErdGD2KBdRelDglkT9agDrA==
X-Received: by 2002:a2e:390a:: with SMTP id g10mr13057565lja.373.1593622453582;
        Wed, 01 Jul 2020 09:54:13 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id t15sm2002402lji.49.2020.07.01.09.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 09:54:12 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jqfzq-00042K-Le; Wed, 01 Jul 2020 18:54:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 4/5] USB: serial: kobil_sct: log failure to update line settings
Date:   Wed,  1 Jul 2020 18:53:41 +0200
Message-Id: <20200701165342.15448-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701165342.15448-1-johan@kernel.org>
References: <20200701165342.15448-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Log failure to update the line settings in set_termios().

This also avoids a W=1 (-Wunused-but-set-variable) warning.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/kobil_sct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/kobil_sct.c b/drivers/usb/serial/kobil_sct.c
index e9882ba20933..79ce0219fdde 100644
--- a/drivers/usb/serial/kobil_sct.c
+++ b/drivers/usb/serial/kobil_sct.c
@@ -526,6 +526,10 @@ static void kobil_set_termios(struct tty_struct *tty,
 		  0,
 		  KOBIL_TIMEOUT
 		);
+	if (result) {
+		dev_err(&port->dev, "failed to update line settings: %d\n",
+				result);
+	}
 }
 
 static int kobil_ioctl(struct tty_struct *tty,
-- 
2.26.2

