Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C8AD8CAC
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 11:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392027AbfJPJjg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 05:39:36 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35531 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfJPJjg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 05:39:36 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BB6E22000C;
        Wed, 16 Oct 2019 09:39:33 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
Date:   Wed, 16 Oct 2019 11:39:27 +0200
Message-Id: <20191016093933.693-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is version 3 of the patch set.

Changes in v3:
- Add Alan's ack
- don't export usb_device_match_id()

Changes in v2:
- checkpatch.pl is now quiet
- fallback to the generic driver when driver ->probe() fails

Bastien Nocera (6):
  USB: Export generic USB device driver functions
  USB: Make it possible to "subclass" usb_device_driver
  USB: Implement usb_device_match_id()
  USB: Select better matching USB drivers when available
  USB: Fallback to generic driver when specific driver fails
  USB: Add driver to control USB fast charge for iOS devices

 MAINTAINERS                             |   6 +
 drivers/usb/core/driver.c               |  58 +++++-
 drivers/usb/core/generic.c              |  48 ++++-
 drivers/usb/core/usb.h                  |   8 +
 drivers/usb/misc/Kconfig                |  10 +
 drivers/usb/misc/Makefile               |   1 +
 drivers/usb/misc/apple-mfi-fastcharge.c | 237 ++++++++++++++++++++++++
 include/linux/usb.h                     |   7 +
 8 files changed, 360 insertions(+), 15 deletions(-)
 create mode 100644 drivers/usb/misc/apple-mfi-fastcharge.c

-- 
2.21.0

