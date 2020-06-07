Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81AB71F0CC5
	for <lists+linux-usb@lfdr.de>; Sun,  7 Jun 2020 18:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgFGQIW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Jun 2020 12:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgFGQIV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Jun 2020 12:08:21 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572E7C08C5C3
        for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2020 09:08:21 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z64so7420150pfb.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2020 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2bJ/jafzlXxbpQ4adu25jiSkZHzT8KWz0iUgS00o+/Y=;
        b=yVEugceJ0LywIekyCrnEOJ2CT80crLCj8bWKb4xDTJSOZr7LamXxMhIonDt/gxXlB9
         ZLmsQ4xrVKiWl4Ztx7BjauUgFD/WnBosykQ8TXdeZJooJkc9xq5m7f3QyE69uUswD5TP
         y5Jk5UB/rlM2UyCMgvFLHcAjMj+Zt42TqYvzviz+7mWFYfyxm7yKzAMlN44MA2hiMDFT
         k5C0aRBKQtdstJpU+n2HIbbBwGDAjMZVGXPtL0Pp/7FrppnqgYmolHnwIvRyfoDdHyWp
         yIJnWaegIXvGVSZ1B4ixmTgWZua8o+mlWpd6jWaV+lYea3gM1jVTQ9y5ays1AT2slzNT
         a4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2bJ/jafzlXxbpQ4adu25jiSkZHzT8KWz0iUgS00o+/Y=;
        b=YqYvyrUc/ze1ma4zl3yAMw+Lb1hSv/SSQs7oZ5egQm9278+xDLf1Fr1TwGgsrbUftv
         c3MUYcFHAcx+lHsKH1MlkCHOL+d1/ZFGLa3JA34gLFfqrUU/mAy//iUyYb/nJBs3bOOb
         5NTnvdgluJ677Zrt0BuTjBKItDDHggZSZUOE3hBM4R2xZ24zBZeQhu5Wk8xQVcnGKf3Z
         pOLN6ShipwcJjWvJthVeu4lFbCCb8xGD7jDDz76BvNhN7vHQzhQtziv7ULlF3IP3zglI
         l5WZlyACIEC7aQPhzV+5DotKvyvhkWoAYgQ5SdBaEaieIyCZVIfwH06IdnX9AsxVCVkd
         32Kg==
X-Gm-Message-State: AOAM531H9iB79LRbEdgqQjhHK3UhLl0L9yqUXwlfOMDNlK7Xmm62IBbf
        YuIj5E9ih2CT0zi6SzoukfFs
X-Google-Smtp-Source: ABdhPJzJTon98OPy9QM/W2SvjeP8jdVRtoHCniKGkblVS9uvs9t320y2WUOdErX01WmfVl63SvtPCA==
X-Received: by 2002:a63:6345:: with SMTP id x66mr16656266pgb.156.1591546100682;
        Sun, 07 Jun 2020 09:08:20 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e9a:8b0a:3d5e:1902:f17d:d125])
        by smtp.gmail.com with ESMTPSA id r202sm4739449pfr.185.2020.06.07.09.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:08:19 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v4 0/3] Add support for MaxLinear/Exar USB to serial converters
Date:   Sun,  7 Jun 2020 21:38:06 +0530
Message-Id: <20200607160809.20192-1-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

This series adds support for MaxLinear/Exar USB to serial converters.
This driver only supports XR21V141X series but it can easily be extended
to other series in future.

This driver is inspired from the initial one submitted by Patong Yang:

https://patchwork.kernel.org/patch/10543261/

While the initial driver was a custom tty USB driver exposing whole
new serial interface ttyXRUSBn, this version is completely based on USB
serial core thus exposing the interfaces as ttyUSBn. This will avoid
the overhead of exposing a new USB serial interface which the userspace
tools are unaware of.

This series has been tested with Hikey970 board hosting XR21V141X chip.

Thanks,
Mani

Changes in v4:

* Multiple improvements based on Johan's review. Noticeable ones are:
  - Now the driver claims both control and data interfaces but only registers
    tty device for data interface.
  - GPIO pin status is now shared between the console and gpiolib
    implementations. This is done to avoid changing the lines spuriously.
  - A separate port_open flag is added to reject GPIO requests while the tty
    port is open.
  - Removed padding PID to gpio device.
* Added Greg and Mauro's review and tested tags.
* Included a patch from Mauro to avoid the CDC-ACM driver to claim this device
  when this driver is built.

Changes in v3:

* Dropped the check for PID and also the reg_width property.

Changes in v2:

* Dropped the code related to handling variable register size. It's all u8 now.
* Dropped the header file and moved the contents to driver itself.
* Added Linus's reviewed-by tag for gpiochip patch.
* Added PID to gpiochip label
* Dropped gpiochip for interface 0 

Manivannan Sadhasivam (2):
  usb: serial: Add MaxLinear/Exar USB to Serial driver
  usb: serial: xr_serial: Add gpiochip support

Mauro Carvalho Chehab (1):
  usb: cdc-acm: Ignore Exar XR21V141X when serial driver is built

 drivers/usb/class/cdc-acm.c    |   6 +
 drivers/usb/serial/Kconfig     |   9 +
 drivers/usb/serial/Makefile    |   1 +
 drivers/usb/serial/xr_serial.c | 857 +++++++++++++++++++++++++++++++++
 4 files changed, 873 insertions(+)
 create mode 100644 drivers/usb/serial/xr_serial.c

-- 
2.17.1

