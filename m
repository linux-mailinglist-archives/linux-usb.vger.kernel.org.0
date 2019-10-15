Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63213D786E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 16:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732712AbfJOO1c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 10:27:32 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44941 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbfJOO1b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 10:27:31 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8B52740018;
        Tue, 15 Oct 2019 14:27:29 +0000 (UTC)
Message-ID: <16edde941e06216fa26477b9e1c121ffbb88a0b4.camel@hadess.net>
Subject: [PATCH v2 0/6] Add Apple MFi fastcharge USB device driver
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 15 Oct 2019 16:27:28 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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


