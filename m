Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464ACD7891
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 16:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732818AbfJOObh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 10:31:37 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:35159 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732599AbfJOObg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 10:31:36 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E1C64240019;
        Tue, 15 Oct 2019 14:31:33 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 0/6] Add Apple MFi fastcharge USB device driver
Date:   Tue, 15 Oct 2019 16:31:26 +0200
Message-Id: <20191015143132.8099-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is version 2 of the patch set.

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
 drivers/usb/core/driver.c               |  59 +++++-
 drivers/usb/core/generic.c              |  48 ++++-
 drivers/usb/core/usb.h                  |   6 +
 drivers/usb/misc/Kconfig                |  10 +
 drivers/usb/misc/Makefile               |   1 +
 drivers/usb/misc/apple-mfi-fastcharge.c | 237 ++++++++++++++++++++++++
 include/linux/usb.h                     |   9 +
 8 files changed, 361 insertions(+), 15 deletions(-)
 create mode 100644 drivers/usb/misc/apple-mfi-fastcharge.c

-- 
2.21.0

