Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59EF1F0CEA
	for <lists+linux-usb@lfdr.de>; Sun,  7 Jun 2020 18:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgFGQYH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Jun 2020 12:24:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgFGQYG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Jun 2020 12:24:06 -0400
Received: from localhost.localdomain (unknown [157.51.228.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 652162067B;
        Sun,  7 Jun 2020 16:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591547046;
        bh=KJ9kLBpb3xCN0JwgAo6sUdY3K2paSsW+KdYIQ5honpE=;
        h=From:To:Cc:Subject:Date:From;
        b=hQQT4kvmj50G3pgIrVf+1cu8EZsuIRHN7fIhOT4fIuRWZ5NklN1wc0CJkJZygWPhw
         pFogYuNWleyaut7uAO8hyExq/aGsbGkNJwJGhjWwdkU+M7nWDHNQujw8ECa4O8kbM9
         9ylg6h9rq4qpVEurrhyn9hl5//y06A79KScMO69E=
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: [RESEND PATCH v4 0/3] Add support for MaxLinear/Exar USB to serial converters
Date:   Sun,  7 Jun 2020 21:53:47 +0530
Message-Id: <20200607162350.21297-1-mani@kernel.org>
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

