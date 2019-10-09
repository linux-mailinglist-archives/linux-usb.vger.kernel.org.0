Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75F31D1072
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 15:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbfJINnp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 09:43:45 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37751 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731037AbfJINnp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 09:43:45 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 90DFF1BF20D;
        Wed,  9 Oct 2019 13:43:43 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 0/5] Add Apple MFi fastcharge USB device driver
Date:   Wed,  9 Oct 2019 15:43:37 +0200
Message-Id: <20191009134342.6476-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As discussed in the thread "Driver for something that's neither a
device nor an interface driver?", here's a patchset that makes it
possible for device drivers to extend the generic device driver.

An example usage is provided in the shape of a driver that allows
changing the charge type of an Apple MFi device to be fast.

Bastien Nocera (5):
  USB: Export generic USB device driver functions
  USB: Make it possible to "subclass" usb_device_driver
  USB: Implement usb_device_match_id()
  USB: Select better matching USB drivers when available
  USB: Add driver to control USB fast charge for iOS devices

 drivers/usb/core/driver.c               |  66 +++-
 drivers/usb/core/generic.c              |  49 ++-
 drivers/usb/core/usb.h                  |   4 +
 drivers/usb/misc/Kconfig                |  10 +
 drivers/usb/misc/Makefile               |   1 +
 drivers/usb/misc/apple-mfi-fastcharge.c | 500 ++++++++++++++++++++++++
 include/linux/usb.h                     |   5 +
 7 files changed, 619 insertions(+), 16 deletions(-)
 create mode 100644 drivers/usb/misc/apple-mfi-fastcharge.c

-- 
2.21.0

