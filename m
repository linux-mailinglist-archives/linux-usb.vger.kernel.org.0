Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C1034DDA1
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 03:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhC3BhC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 21:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhC3Bgz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 21:36:55 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7D7C061765
        for <linux-usb@vger.kernel.org>; Mon, 29 Mar 2021 18:36:55 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id n21so14753373ioa.7
        for <linux-usb@vger.kernel.org>; Mon, 29 Mar 2021 18:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KvfVRFZqhqRjK1byKojqnEiozyDbnINCucwz0rhiopU=;
        b=GhVEA0BHqUJZv87fb+mXjFKpgyyOeXVxFwW41z2SLhwnJoiKt/A4g6kMbb+pn7pmwF
         U3LZC0LgMIpELOvkQrYpGYyNebBdZzbbgCT1U8Ix2BYzTx8dfaw0x3fe4JFaLziGHZka
         nkgIFnGrusgAxn8qBku9wEXi/+8klvmMfI5J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KvfVRFZqhqRjK1byKojqnEiozyDbnINCucwz0rhiopU=;
        b=tvEXKIyPqyfT/aKfdZlpQoVjSc5xC7SYToX2bK1u3kWAGnvoXVzisY77cDXLfBKD3i
         YutxH8lZoT2YLA/Rs4X5ly14xT9/OuB9+QIrTyH+aFTQtlrtQAVvtjBOlwdHPgrVaito
         DJRUR8OeZRa3XJCzUYx/q5r4AHY5MEo+Hpj+VJk2lzRyhtNokv96rRo/5n20avLPwtLo
         JIt7StkL1eWZGEcVM7x8WrL4v/XKo5+ypzB4tZzaWsWpWZSWuwryJRdeJmei5qldXrjJ
         PNkGgpMcKpiwF3kZBLxZ7N8bckGLulhNvJOUC4vgwRhZ7FMHJdNNdOzXudNuaDfXlY6b
         mvjw==
X-Gm-Message-State: AOAM533vGk/mhiD125LH2hlDeynEu8WqVXik/URF/zZbN/OUGA08iYeQ
        yT7Rp9eikawYqJvymG45+/Q5Xw==
X-Google-Smtp-Source: ABdhPJxw2A/AiRI6DjntWVPnXutaqISvIZx29YN/MbjZABzciBBR3rMv1y9Rrs9XxYhctjLK5z7lfQ==
X-Received: by 2002:a05:6638:2726:: with SMTP id m38mr8181636jav.6.1617068214284;
        Mon, 29 Mar 2021 18:36:54 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i13sm10551696ilm.86.2021.03.29.18.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 18:36:53 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com,
        stable@vger.kernel.org
Subject: [PATCH 2/4] usbip: stub-dev synchronize sysfs code paths
Date:   Mon, 29 Mar 2021 19:36:49 -0600
Message-Id: <2b182f3561b4a065bf3bf6dce3b0e9944ba17b3f.1616807117.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1616807117.git.skhan@linuxfoundation.org>
References: <cover.1616807117.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fuzzing uncovered race condition between sysfs code paths in usbip
drivers. Device connect/disconnect code paths initiated through
sysfs interface are prone to races if disconnect happens during
connect and vice versa.

Use sysfs_lock to protect sysfs paths in stub-dev.

Reported-and-tested-by: syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/stub_dev.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index 8f1de1fbbeed..d8d3892e5a69 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -63,6 +63,7 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 
 		dev_info(dev, "stub up\n");
 
+		mutex_lock(&sdev->ud.sysfs_lock);
 		spin_lock_irq(&sdev->ud.lock);
 
 		if (sdev->ud.status != SDEV_ST_AVAILABLE) {
@@ -87,13 +88,13 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 		tcp_rx = kthread_create(stub_rx_loop, &sdev->ud, "stub_rx");
 		if (IS_ERR(tcp_rx)) {
 			sockfd_put(socket);
-			return -EINVAL;
+			goto unlock_mutex;
 		}
 		tcp_tx = kthread_create(stub_tx_loop, &sdev->ud, "stub_tx");
 		if (IS_ERR(tcp_tx)) {
 			kthread_stop(tcp_rx);
 			sockfd_put(socket);
-			return -EINVAL;
+			goto unlock_mutex;
 		}
 
 		/* get task structs now */
@@ -112,6 +113,8 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 		wake_up_process(sdev->ud.tcp_rx);
 		wake_up_process(sdev->ud.tcp_tx);
 
+		mutex_unlock(&sdev->ud.sysfs_lock);
+
 	} else {
 		dev_info(dev, "stub down\n");
 
@@ -122,6 +125,7 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 		spin_unlock_irq(&sdev->ud.lock);
 
 		usbip_event_add(&sdev->ud, SDEV_EVENT_DOWN);
+		mutex_unlock(&sdev->ud.sysfs_lock);
 	}
 
 	return count;
@@ -130,6 +134,8 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 	sockfd_put(socket);
 err:
 	spin_unlock_irq(&sdev->ud.lock);
+unlock_mutex:
+	mutex_unlock(&sdev->ud.sysfs_lock);
 	return -EINVAL;
 }
 static DEVICE_ATTR_WO(usbip_sockfd);
@@ -270,6 +276,7 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev)
 	sdev->ud.side		= USBIP_STUB;
 	sdev->ud.status		= SDEV_ST_AVAILABLE;
 	spin_lock_init(&sdev->ud.lock);
+	mutex_init(&sdev->ud.sysfs_lock);
 	sdev->ud.tcp_socket	= NULL;
 	sdev->ud.sockfd		= -1;
 
-- 
2.27.0

