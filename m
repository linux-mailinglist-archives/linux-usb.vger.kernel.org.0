Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0065C460A37
	for <lists+linux-usb@lfdr.de>; Sun, 28 Nov 2021 22:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359441AbhK1VRw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Nov 2021 16:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbhK1VPv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Nov 2021 16:15:51 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BF5C061757
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:12:35 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id l7so30593674lja.2
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=SP4+73f4U5p0vNxoAI4HQ32XoBU8ATAXlVDc0Guv/x0=;
        b=ZdDxzuQ7KgZU8CTczKCK4IYeQra3/14Gi8UDbMnJ/A9BAxoFCg+TFtz+9sjsafXJiz
         Klgxyo7JDVTva3q22hFbQPuD0l9WtiZZGdpaMzvZV92zLW1l2BUi22xu9WR/1t4VFgvB
         LC4wAnuWBCV6kMlE/7x/eVtjjiFS5DddvWNU16A0VFfARVFdBWUj20h116exNNrqUO6k
         UbEH1P0DVv35ZL+RVlHqZXOPoSOnIFuKsDxrF3nTjdKko49Kc+CeN3x5QdYC0ziJIzqa
         alWjphexKJSavobMdQ+Pv5+irLsKAr8xFtrpVwaOwb6Uee2wUU3OZ26d7Mnf3pUOPK0V
         ObUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=SP4+73f4U5p0vNxoAI4HQ32XoBU8ATAXlVDc0Guv/x0=;
        b=hS1HISbwQdhfpnZGMfDjo/VfadKSS+se/C2hO/HdyjbsGOML8wXESHNqECzfMNE8vq
         Hzx21NjUdQRpG0eBP7K3VEKHfzQTDkOAbezjAHpWibYbOY458+0N99grQnInvn96Ji2/
         PKxjm0iutTFWMIGP2j4k2bPZ6/arl1WUo+oaZIHzUuURYYDV+2RJEN0ju1yph9FAq5Dy
         Q/3WCOPmLWh2qDonZhTStJeSSyuWEbzG/FuPHF6+l11ueqAGjxopjW3o1CWKlEATthj0
         13cFTJPsWy4Y8h59aj/F5HIqU+oN01Q1X83oQ6sa8QcaDXkI1hq9GR9yPBejf01c6h6s
         +Vbw==
X-Gm-Message-State: AOAM5330Zn3h0fruMTPYhXCy2QwxXPywOQGmVKHLBcr3HW/YlqwbE7qP
        oZOSkn7xB+EWAmaNNZf0VQPKUY9KrPI=
X-Google-Smtp-Source: ABdhPJzAmukKEkixpYqn4CZdyu+8H99ndE95OJSKlBDW6LigF1HVh5oHahIqEX6wALnX4yil0SRHWw==
X-Received: by 2002:a05:651c:1687:: with SMTP id bd7mr45919134ljb.305.1638133953503;
        Sun, 28 Nov 2021 13:12:33 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id l5sm1132136ljh.66.2021.11.28.13.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:12:33 -0800 (PST)
Date:   Sun, 28 Nov 2021 22:12:31 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v1 2/5] tools/usbip: update manual pages
Message-ID: <20211128211231.GA37314@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch contains manual page updates for the implementation changes in
subsequent patches.

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
v1: New patch added in series.

 tools/usb/usbip/doc/usbip.8  | 16 ++++++++++++----
 tools/usb/usbip/doc/usbipd.8 | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/tools/usb/usbip/doc/usbip.8 b/tools/usb/usbip/doc/usbip.8
index 1f26e4a00638..6f2294cd5e5d 100644
--- a/tools/usb/usbip/doc/usbip.8
+++ b/tools/usb/usbip/doc/usbip.8
@@ -44,9 +44,13 @@ then exit.
 .PP

 .HP
-\fBattach\fR \-\-remote=<\fIhost\fR> \-\-busid=<\fIbus_id\fR>
+\fBattach\fR \-\-remote=<\fIhost\fR> \-\-busid=<\fIbus_id\fR> [\-\-persistent]
 .IP
-Attach a remote USB device.
+Attach a remote USB device. When flag --persistent is used, the commmand will
+remain in the foreground to monitor the remote bus for a device to become
+exported. When the remote usb device is unexported, it will start over and
+monitor the bus again. Press Ctrl + C to exit. The device must then be manually
+detached.
 .PP

 .HP
@@ -63,9 +67,13 @@ Detach an imported USB device/gadget.
 .PP

 .HP
-\fBbind\fR \-\-busid=<\fIbusid\fR>
+\fBbind\fR \-\-busid=<\fIbusid\fR> [\-\-persistent]
 .IP
-Make a device exportable.
+Make a device exportable. When flag --persistent is used, the commmand will
+remain in the foreground to monitor the bus for a device to become plugged in.
+When the usb device is unplugged, it will start over and monitor the bus
+again. Press Ctrl + C to exit. The device must then be manually unexported with
+unbind.
 .PP

 .HP
diff --git a/tools/usb/usbip/doc/usbipd.8 b/tools/usb/usbip/doc/usbipd.8
index d974394f86a1..021df6573aae 100644
--- a/tools/usb/usbip/doc/usbipd.8
+++ b/tools/usb/usbip/doc/usbipd.8
@@ -92,6 +92,27 @@ USB/IP client can connect and use exported devices.
         - A usb device 1-2 is now exportable to other hosts!
         - Use 'usbip unbind --busid=1-2' when you want to shutdown exporting and use the device locally.

+The following example shows the usage of importing and exporting a device persistently.
+
+    server:# modprobe usbip-host
+
+    server:# usbipd -D
+        - Start usbip daemon.
+
+    server:# usbip bind --busid=1-2 --persistent
+        - Bind usbip-host.ko to the device of busid 1-2, or wait until a device is plugged in.
+        - Usb device 1-2 is now exportable to other hosts!
+        - If device is unplugged, wait until device is plugged in and bind usbip-host.ko to the device.
+        - Usb device 1-2 is now exportable to other hosts again!
+        - Exit with Ctrl + C and use 'usbip unbind --busid=1-2' when you want to shutdown exporting and use the device locally.
+
+    client:# modprobe vhci-hcd
+
+    client:# usbip attach --remote=server --busid=1-2 --persistent
+        - Attach the remote usb device, or wait until it becomes exported on the remote end.
+        - If the remote device becomes unexported, wait until it becomes exported and attach the remote usb device again.
+        - Exit with Ctrl + C. The device must be manually detached.
+
 The following example shows the usage of device mode

     server:# modprobe usbip-vudc
--
2.25.1

