Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D890A12D16F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 16:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfL3P27 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 10:28:59 -0500
Received: from mga01.intel.com ([192.55.52.88]:49571 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3P27 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 10:28:59 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 07:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224240064"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 07:28:58 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [RFC PATCH 0/3] usb: typec: New attribute files for USB mode
Date:   Mon, 30 Dec 2019 18:28:54 +0300
Message-Id: <20191230152857.43917-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Guenter,

These patches introduce the new sysfs attribute files that allow the
user to see and also control the USB mode. The last patch just adds
driver for the TBT3 alt mode. The series is made on top of:
https://lore.kernel.org/linux-usb/20191230142611.24921-1-heikki.krogerus@linux.intel.com/

What I'm proposing is that we introduce a new sysfs attribute file
named "usb_mode" for both the port and partner devices. The file
displays the supported USB modes (usb2, usb3, usb4) when read in with
both types of devices.

If the user writes to the port attribute file a mode, that mode will
be used as the value for the "USB mode" field in the Enter_USB message
next time there is a connection. Changing the active mode of the port
does not affect the current connection. However, if the user writes to
the partner attribute file a mode, Data Reset message is expected to
be send to the partner, and the new mode is to be used with the
Enter_USB message that follows (as defined in the latest USB Power
Delivery spec.).

So the attribute file is the same for both port and partner, but
writing to it has different behaviour.

The new attribute files should work, but I want to make sure that the
approach is acceptable?

thanks,

Heikki Krogerus (3):
  usb: typec: Add attribute file showing the USB mode of the port
  usb: typec: Add attribute file showing the USB mode of the partner
  usb: typec: Add driver for Thunderbolt 3 Alternate Mode

 Documentation/ABI/testing/sysfs-class-typec |  34 +++
 drivers/usb/typec/altmodes/Kconfig          |   9 +
 drivers/usb/typec/altmodes/Makefile         |   2 +
 drivers/usb/typec/altmodes/thunderbolt.c    | 309 ++++++++++++++++++++
 drivers/usb/typec/class.c                   | 133 ++++++++-
 include/linux/usb/typec.h                   |  11 +
 6 files changed, 497 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c

-- 
2.24.1

