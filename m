Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60A146413A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 23:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbhK3W1T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 17:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbhK3W1S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 17:27:18 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44282C061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:23:58 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b40so57591504lfv.10
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=YsPaNCVxi4FT0+jyNciYDykeuf9gbaBKvmSmSJzba+k=;
        b=Cw21BcfSNCcaRnK7ry5U74Tvajl7nIDpYhr2nir/FccC6uXaZwCysibwPv14FsBv08
         fqDg759M9a/b8d6IOMOemZVoIu6+8M8ZBW5KX5MwNAYGHzpn2yl9Q5N9t80A3jdHFWyF
         LB2upeBsF9hfg8XBS1tmBuvgJitHzJUC1qy6nUg3/OnMsnAylZ2hMVq2o8XqI0Es1iTv
         4v24w9Xpo0CZXefH6YSgucG/tUGVXShI6fD8efB8ZDwvEK1hmEV40sD264CwcQlS7+xv
         tOoOsNtZcnwF71IeaXOy6XCUx8/ENAY/MsAPnnx0rlVHuiP/RZNgRsdWT80wOtfVpkPi
         mosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=YsPaNCVxi4FT0+jyNciYDykeuf9gbaBKvmSmSJzba+k=;
        b=s03bGGqukdB4kL369B6GTy0iw9DCsrsZjd0lkkr7rPQj+2DWich/jhSU7z9dUYqdCn
         MAzc+FoJi7oRN8s+hCCLP1qFQox8aPLoUp2D65JdNV7Q6qUV8aFMeUkB5G6WAOu7by/b
         MNJNHZL2RSXXC0qg2MJ/A7lxf0Uhzv1iB3Cu6KmfAgmUvVDyooXSJ8AYOhuZ/BJdz56o
         2GIhxiL4cFSVuLYl501vsTHfYZl4nLA4HvLN+EhhHQxBW3cRvEwwYCaepl2xgS5iTVRH
         zPHbeMPKf+l5o0jsyJKSIPmi1QlvQgvOp0soN15TjJmFMcVe+H+tF1Pm/AGQZ6zYggmQ
         5cKA==
X-Gm-Message-State: AOAM533/ltvRcfxyLjD1BwXy94lAMdpKG0k/JfYJB5b32m1ZXcUbp3gr
        OVxu2LY0xqEtj3lBq1m1Ias=
X-Google-Smtp-Source: ABdhPJxrWcEv9us7y94+xQEow+cltiW80fnuwJpQnsahePzsPQM3Z1qFePK+xSKeBQM8czv3Q61Atw==
X-Received: by 2002:a05:6512:3d88:: with SMTP id k8mr1960912lfv.111.1638311036601;
        Tue, 30 Nov 2021 14:23:56 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id m11sm1775472ljc.108.2021.11.30.14.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:23:56 -0800 (PST)
Date:   Tue, 30 Nov 2021 23:23:54 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/5] tools/usbip: update manual pages
Message-ID: <20211130222354.GA16493@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch contains usbip manual page updates. It's needed to
reflect the implementation changes in following subsequent patches:
- tools/usbip: add usb event monitor into libusbip
- tools/usbip: export USB devices on a given bus persistently
- tools/usbip: import USB devices on a given bus persistently

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
v1: New patch added in series.
v2: Improve patch description

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

