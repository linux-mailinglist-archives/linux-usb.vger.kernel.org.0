Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCBC3F3A61
	for <lists+linux-usb@lfdr.de>; Sat, 21 Aug 2021 13:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbhHULSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Aug 2021 07:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhHULSZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Aug 2021 07:18:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF82C061575
        for <linux-usb@vger.kernel.org>; Sat, 21 Aug 2021 04:17:45 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i28so26324948lfl.2
        for <linux-usb@vger.kernel.org>; Sat, 21 Aug 2021 04:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9MXmrLD2O65FfyDuYkPSVWUuJRIAX4pwnHA0LopmFEQ=;
        b=gEdGdhiYcO1/mMo1y/aqlufpJ5BE5B0eHYpVI970JNBYHhKpbfayGseKCPeT+Sb44w
         pzzlr1cI3DGOpE3gio2mHKbCU2ljK7iKciIoGpdpet59ZDIEFHKHpDejOGC0KKT3oAge
         6bv4OuPv2pcZ9FJKGsj23By3TZYk7NjdQoDx+OsXgflJYn0RbOK3z7G+YjmaMihhYui/
         Fg2bnBYHJKmYjFET0sbIoaKaCNIV89Y3FEC74u+QE6w14m77J+kIi5LzIWRfpl1OebQ0
         Yhq43uoczDNsj/UXxZytKGQ001+ey7b5gjDsZD3GXuIfipA3EXPu6duXBs1Y1V27GyJz
         Lubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9MXmrLD2O65FfyDuYkPSVWUuJRIAX4pwnHA0LopmFEQ=;
        b=l0QSk9Q765fQHcr4uo8K4kfugMvexxypKzNykP9oJ8WmPU42KWsEsfWykn18IB8Qko
         EADJBSnvzZpe78u3DCfC84L1ZZw4qLGapeQH5SJg3aALBIxLdM+Tq0c2bqcTmSR57CGd
         Qic8U1lDqKWIqofceyAfGd+aTZmE0KU721hVrr8DfBRrmSYmwbj8+27GJtCpuM7fY6w8
         F+2yk5Tet+h7JMEyBdi/mmwdZIpCO0wxgjraYS6Z7cuXKZfI+Axjl9bqxpegjzCWBPy8
         Ziw+BbSONGuNF/ajWh2MVac7hIZihw+q68Vd3DsSMk1f/H1qp7Nb39uhZi/KLMRw5X2c
         npMA==
X-Gm-Message-State: AOAM5320qFEENwIpbs4qs4IGKF8kYxlR70iX3+vQ7sUZiTtmGxhbMHHH
        xERl/+xejgHva/hJhHn0QhM=
X-Google-Smtp-Source: ABdhPJz/yQCvNr/pNu8KTM6063PylbuO1A92aaYdpx2Ylm1JWcYd//9SmYKk+IByRw9NinH9FrADHw==
X-Received: by 2002:ac2:4294:: with SMTP id m20mr18449505lfh.6.1629544663994;
        Sat, 21 Aug 2021 04:17:43 -0700 (PDT)
Received: from localhost.localdomain (h-62-63-208-27.A230.priv.bahnhof.se. [62.63.208.27])
        by smtp.googlemail.com with ESMTPSA id f36sm884607lfv.186.2021.08.21.04.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 04:17:43 -0700 (PDT)
From:   Niklas Lantau <niklaslantau@gmail.com>
To:     stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        Niklas Lantau <niklaslantau@gmail.com>
Subject: [PATCH] Usb: Storage: usb: Changed function parameter name and removed braces
Date:   Sat, 21 Aug 2021 13:16:05 +0200
Message-Id: <20210821111605.8236-1-niklaslantau@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changed parameter name from __us to much more typical data
after suggestion by Joe Perches. Fixed minor coding style issue as well.

Signed-off-by: Niklas Lantau <niklaslantau@gmail.com>
---
 drivers/usb/storage/usb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 90aa9c12ffac..075c4531b96d 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -295,9 +295,9 @@ void fill_inquiry_response(struct us_data *us, unsigned char *data,
 }
 EXPORT_SYMBOL_GPL(fill_inquiry_response);
 
-static int usb_stor_control_thread(void * __us)
+static int usb_stor_control_thread(void *data)
 {
-	struct us_data *us = (struct us_data *)__us;
+	struct us_data *us = data;
 	struct Scsi_Host *host = us_to_host(us);
 	struct scsi_cmnd *srb;
 
@@ -926,9 +926,8 @@ static unsigned int usb_stor_sg_tablesize(struct usb_interface *intf)
 {
 	struct usb_device *usb_dev = interface_to_usbdev(intf);
 
-	if (usb_dev->bus->sg_tablesize) {
+	if (usb_dev->bus->sg_tablesize)
 		return usb_dev->bus->sg_tablesize;
-	}
 	return SG_ALL;
 }
 
-- 
2.33.0

