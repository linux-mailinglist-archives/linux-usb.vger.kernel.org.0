Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB3848342C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733019AbfHFOpK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730289AbfHFOpK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED0F120C01;
        Tue,  6 Aug 2019 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102709;
        bh=i6y02VMu3tdt6JZ2e7L3mtO3l3Vum3txUp0F4IEweAY=;
        h=From:To:Cc:Subject:Date:From;
        b=sTmRPEMYacFeQOfBxNCduxT5U8KIq8EaVZgO3MSfb7EyMEC7MfvRZAh3PoGAT3ZsE
         eIkkq8/VIiX56ChYbHkpG3QrjSO1+chE+WDKMSHqB9W9YzQTZBv1WtFKspbwPI4Ikz
         9547whydNaM63xrJkaoL/TDc2AzIs+3QPCJcP8O4=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/12] USB: dev_groups support for usb drivers
Date:   Tue,  6 Aug 2019 16:44:50 +0200
Message-Id: <20190806144502.17792-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that the driver core supports the ability for individual drivers to
have attribute groups added/removed when a device is bound/unbound to a
driver automatically, we should take advantage of that in the USB
subsystem.

This patch series adds dev_groups support to struct usb_driver and
struct usb_device_driver (needed for the usbip driver), and then
converts a number of individual USB drivers over to use this api.

Greg Kroah-Hartman (12):
  USB: add support for dev_groups to struct usb_driver
  USB: add support for dev_groups to struct usb_device_driver
  USB: atm: cxacru: convert to use dev_groups
  USB: ueagle-atm: convert to use dev_groups
  USB: usblp: convert to use dev_groups
  USB: usbtmc: convert to use dev_groups
  USB: cypress_cy7c63: convert to use dev_groups
  USB: cytherm: convert to use dev_groups
  USB: lvstest: convert to use dev_groups
  USB: trancevibrator: convert to use dev_groups
  USB: usbsevseg: convert to use dev_groups
  USB: usbip: convert to use dev_groups

 drivers/usb/atm/cxacru.c          | 58 ++++++++++++++++------------
 drivers/usb/atm/ueagle-atm.c      | 16 ++------
 drivers/usb/class/usblp.c         | 13 ++++---
 drivers/usb/class/usbtmc.c        | 13 ++-----
 drivers/usb/core/driver.c         |  2 +
 drivers/usb/misc/cypress_cy7c63.c | 29 ++++----------
 drivers/usb/misc/cytherm.c        | 64 +++++++++----------------------
 drivers/usb/misc/lvstest.c        | 19 ++-------
 drivers/usb/misc/trancevibrator.c | 15 ++++----
 drivers/usb/misc/usbsevseg.c      | 17 ++------
 drivers/usb/usbip/stub_dev.c      | 50 ++++--------------------
 include/linux/usb.h               |  6 +++
 12 files changed, 104 insertions(+), 198 deletions(-)

-- 
2.22.0

