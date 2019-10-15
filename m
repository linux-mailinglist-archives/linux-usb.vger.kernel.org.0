Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA17D7736
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 15:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbfJONOp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 09:14:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46798 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729551AbfJONOp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 09:14:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id q24so9568064plr.13
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xKhilnM4WXOXsTSTKbfwf8PB9C6k6WKitlQebcNsfcU=;
        b=uaPjuoVep5Lk9G4tZU5a0aA5fgEVSsWGHZXIksSICpW/SKLECz77FLkvttMfttDg2F
         3st93BJRQo4+7+NmJVwLs7yLjbjLZjXKiqwWLHnv8xkTlbGhS3ejZV7bXJthvVUnjftK
         09pFjrjPZ9EMagl8wR6ZYVp9D8YipZCLROnpCtT4Lkoz1aB7BLPX81ulcdl7Uewj8Qg+
         T9Nq1TWAp1lcuCpQBhR+ScRImWx6Oiyd6/X+/dUNDrLVtqXgAQ7r6eeInKVQEB0sj8pR
         qHT7d2Es1FS7WerNVtamYORe3xA0r3p+k96WLCAxBrQMh6gAiic0BVGwrXImFCFm+FQT
         jPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xKhilnM4WXOXsTSTKbfwf8PB9C6k6WKitlQebcNsfcU=;
        b=fk7Rfk3ra583KfCgel+k5K+aNj7OJ1wNjKDpkTCOgVIhSyKR8oqHJTlkgQMvQ3/vt4
         SWZyna8chwHQkTc5Xz/2n04szTHTBsfTHc4pOlosE74Vdpp76NgBEsTdoqnYTx2KGzqX
         XgP4H0yLSe+6kFnRzv1j/cVQK+a3/wVvb4DbIhQc7z7+ECkS1DuvXdVEnvuJyM2oKQ3D
         1zHsaksl07tXZmFjTBsbHPnvagH/Jw9F7/i2t9jCc1jEDrPtsea74agy0fHWu3w5unFz
         5MQh4yHp/JxDVS/Wxp/2VQ/FWJ7VrBRZJAau55q6sGs9WzvpddJk52jTjmy/6EYbxRRC
         rJKQ==
X-Gm-Message-State: APjAAAULp0/A5nU/tDIoTK+qBXfZvPMxyv9BEOwys9v4k0YQowgiXJKr
        BujPmOzk0AhyaMpp/tIvG9k=
X-Google-Smtp-Source: APXvYqw/LK0jjZ9Z1xWkDNTvBf1+j8DqlGFWtCx4N1rizL5R1gOee+4VL88CoRGQsunf8nfGs/YrPA==
X-Received: by 2002:a17:902:be07:: with SMTP id r7mr34959577pls.313.1571145284548;
        Tue, 15 Oct 2019 06:14:44 -0700 (PDT)
Received: from goorm.ap-northeast-2.compute.internal (ec2-15-164-218-113.ap-northeast-2.compute.amazonaws.com. [15.164.218.113])
        by smtp.gmail.com with ESMTPSA id c1sm32318848pfb.135.2019.10.15.06.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 06:14:43 -0700 (PDT)
From:   GwanYeong Kim <gy741.kim@gmail.com>
To:     valentina.manea.m@gmail.com
Cc:     shuah@kernel.org, gregkh@linuxfoundation.org, allison@lohutok.net,
        opensource@jilayne.com, changcheng.liu@intel.com,
        tglx@linutronix.de, linux-usb@vger.kernel.org,
        GwanYeong Kim <gy741.kim@gmail.com>
Subject: [PATCH] usbip: tools: Fix read_usb_vudc_device() error path handling
Date:   Tue, 15 Oct 2019 13:14:37 +0000
Message-Id: <20191015131437.525-1-gy741.kim@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cannot be less than 0 - fread() returns 0 on error.

Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
---
 tools/usb/usbip/libsrc/usbip_device_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
index 051d7d3f443b..49760b98aabc 100644
--- a/tools/usb/usbip/libsrc/usbip_device_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
@@ -79,7 +79,7 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
 	if (!fd)
 		return -1;
 	ret = fread((char *) &descr, sizeof(descr), 1, fd);
-	if (ret < 0)
+	if (ret != sizeof(descr))
 		goto err;
 	fclose(fd);
 
-- 
2.17.1

