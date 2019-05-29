Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4612E58F
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2019 21:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfE2TqY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 May 2019 15:46:24 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:36540 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfE2TqY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 May 2019 15:46:24 -0400
Received: by mail-it1-f196.google.com with SMTP id e184so5570633ite.1
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2019 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+eutwUzWw7yIEf2kITpPbDuWCOhlPFyyl9kfwZe7DzQ=;
        b=ZmJ08OpkIGvwOSk6cIloQd1jQuyQO5dTJyhas0jAo6u5UQvuA1piCpkwgE0PgkUcuA
         F7REJwjQomNqtqabhTX7VnUCd2qibyaFMsabu3qFRI6I2T/nLH2y7dIrl3raAAwRpjtY
         wfn0UKWaSb32oiL5yNFF6Hwa/Hc6Z3MYMo8wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+eutwUzWw7yIEf2kITpPbDuWCOhlPFyyl9kfwZe7DzQ=;
        b=nz+ov2mlysa4Z09YfoKUnTZfHF/mBpkE1xpcgkANzSTGzr6YNsKP1bqDwbVKI9p4Bc
         006Z3uaqcyYaon1yvJ5/gwgaxqP3l77EukZrcUJT7MU3axNalFPUDMsH6NMjyZu9JdOU
         +mJEBONQJ5UNungm32bLhnLQGM33dwQtpLOaNfDYiAEq8498SCOcvSKsXCYon0b9xQbH
         O+HYaXrtncNH/eYNZOOZOe1AnnvWTbnWgJc++gh0l3ZNbijw9LqKVK1HbdfAvEKCbnYc
         6p8qda628vPlFWy9Us49Q+jLFZu9kqLhEb0DwiYc5+zOkgV/Cc4Ey6puNYdneZwVz8x6
         bsxA==
X-Gm-Message-State: APjAAAWPIMe4OT8arWSKPlNYWsj968pXtjB/stgk0CQ8sIgewWaiAsrj
        SPZKGFAm23rm/fbUH+lqF+NJqQ==
X-Google-Smtp-Source: APXvYqxuVn+L94+vSLieuWGz5DDC+w1DLNr916cnmtQdZ6Yl1TiU64n5TfLD78gFxuOE2b/Iwm52rw==
X-Received: by 2002:a24:468e:: with SMTP id j136mr8428959itb.116.1559159178125;
        Wed, 29 May 2019 12:46:18 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 62sm135387itx.8.2019.05.29.12.46.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 12:46:17 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: usbip_host: fix stub_dev lock context imbalance regression
Date:   Wed, 29 May 2019 13:46:15 -0600
Message-Id: <20190529194615.18765-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following sparse context imbalance regression introduced in
a patch that fixed sleeping function called from invalid context bug.

kbuild test robot reported on:

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus

Regressions in current branch:

drivers/usb/usbip/stub_dev.c:399:9: sparse: sparse: context imbalance in 'stub_probe' - different lock contexts for basic block
drivers/usb/usbip/stub_dev.c:418:13: sparse: sparse: context imbalance in 'stub_disconnect' - different lock contexts for basic block
drivers/usb/usbip/stub_dev.c:464:1-10: second lock on line 476

Error ids grouped by kconfigs:

recent_errors
├── i386-allmodconfig
│   └── drivers-usb-usbip-stub_dev.c:second-lock-on-line
├── x86_64-allmodconfig
│   ├── drivers-usb-usbip-stub_dev.c:sparse:sparse:context-imbalance-in-stub_disconnect-different-lock-contexts-for-basic-block
│   └── drivers-usb-usbip-stub_dev.c:sparse:sparse:context-imbalance-in-stub_probe-different-lock-contexts-for-basic-block
└── x86_64-allyesconfig
    └── drivers-usb-usbip-stub_dev.c:second-lock-on-line

This is a real problem in an error leg where spin_lock() is called on an
already held lock.

Fix the imbalance in stub_probe() and stub_disconnect().

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/stub_dev.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index d094c96643d2..7931e6cecc70 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -326,14 +326,17 @@ static int stub_probe(struct usb_device *udev)
 		 * See driver_probe_device() in driver/base/dd.c
 		 */
 		rc = -ENODEV;
-		goto sdev_free;
+		if (!busid_priv)
+			goto sdev_free;
+
+		goto call_put_busid_priv;
 	}
 
 	if (udev->descriptor.bDeviceClass == USB_CLASS_HUB) {
 		dev_dbg(&udev->dev, "%s is a usb hub device... skip!\n",
 			 udev_busid);
 		rc = -ENODEV;
-		goto sdev_free;
+		goto call_put_busid_priv;
 	}
 
 	if (!strcmp(udev->bus->bus_name, "vhci_hcd")) {
@@ -342,7 +345,7 @@ static int stub_probe(struct usb_device *udev)
 			udev_busid);
 
 		rc = -ENODEV;
-		goto sdev_free;
+		goto call_put_busid_priv;
 	}
 
 
@@ -361,6 +364,9 @@ static int stub_probe(struct usb_device *udev)
 	save_status = busid_priv->status;
 	busid_priv->status = STUB_BUSID_ALLOC;
 
+	/* release the busid_lock */
+	put_busid_priv(busid_priv);
+
 	/*
 	 * Claim this hub port.
 	 * It doesn't matter what value we pass as owner
@@ -373,9 +379,6 @@ static int stub_probe(struct usb_device *udev)
 		goto err_port;
 	}
 
-	/* release the busid_lock */
-	put_busid_priv(busid_priv);
-
 	rc = stub_add_files(&udev->dev);
 	if (rc) {
 		dev_err(&udev->dev, "stub_add_files for %s\n", udev_busid);
@@ -395,11 +398,17 @@ static int stub_probe(struct usb_device *udev)
 	spin_lock(&busid_priv->busid_lock);
 	busid_priv->sdev = NULL;
 	busid_priv->status = save_status;
-sdev_free:
-	stub_device_free(sdev);
+	spin_unlock(&busid_priv->busid_lock);
+	/* lock is released - go to free */
+	goto sdev_free;
+
+call_put_busid_priv:
 	/* release the busid_lock */
 	put_busid_priv(busid_priv);
 
+sdev_free:
+	stub_device_free(sdev);
+
 	return rc;
 }
 
@@ -435,7 +444,9 @@ static void stub_disconnect(struct usb_device *udev)
 	/* get stub_device */
 	if (!sdev) {
 		dev_err(&udev->dev, "could not get device");
-		goto call_put_busid_priv;
+		/* release busid_lock */
+		put_busid_priv(busid_priv);
+		return;
 	}
 
 	dev_set_drvdata(&udev->dev, NULL);
@@ -465,7 +476,7 @@ static void stub_disconnect(struct usb_device *udev)
 	if (!busid_priv->shutdown_busid)
 		busid_priv->shutdown_busid = 1;
 	/* release busid_lock */
-	put_busid_priv(busid_priv);
+	spin_unlock(&busid_priv->busid_lock);
 
 	/* shutdown the current connection */
 	shutdown_busid(busid_priv);
@@ -480,10 +491,9 @@ static void stub_disconnect(struct usb_device *udev)
 
 	if (busid_priv->status == STUB_BUSID_ALLOC)
 		busid_priv->status = STUB_BUSID_ADDED;
-
-call_put_busid_priv:
 	/* release busid_lock */
-	put_busid_priv(busid_priv);
+	spin_unlock(&busid_priv->busid_lock);
+	return;
 }
 
 #ifdef CONFIG_PM
-- 
2.17.1

