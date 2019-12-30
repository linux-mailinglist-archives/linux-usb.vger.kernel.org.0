Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D32212D093
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfL3O0O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:14 -0500
Received: from mga06.intel.com ([134.134.136.31]:56429 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3O0O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:14 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233452"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:12 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 00/15] USB Type-C changes
Date:   Mon, 30 Dec 2019 17:25:56 +0300
Message-Id: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

This series adds a number of smaller improvements to the USB Type-C
Connector class code, including new helpers for cables, new
definitions for the latest standard versions, support for the Enter
Mode VDO, etc.

The series also includes patches that are meant to (partially) prepare
the subsystem for USB4 support, and for Thundebolt3 alternate mode.
Especially the new Enter_Mode Message that USB4 requires is considered
with the definitions for the "USB mode" (which can be usb2, usb3 or
usb4), which is one of the fields in that message. Later we will need
to allow the user to control the USB mode, but I'm not including the
patches that add the attributes for that in this series. I'll send
them separately as RFC following this series.

thanks,

Heikki Krogerus (15):
  usb: typec: Block mode entry if the port has the mode disabled
  usb: typec: Add parameter for the VDO to typec_altmode_enter()
  usb: typec: More API for cable handling
  usb: typec: Make the attributes read-only when writing is not possible
  usb: typec: Hide the port_type attribute when it's not supported
  usb: typec: Allow power role swapping even without USB PD
  usb: typec: Fix the description of struct typec_capability
  usb: pd: Add definitions for the Enter_USB message
  usb: pd: Add definition for DFP and UFP1 VDOs
  usb: typec: Add the Product Type VDOs to struct usb_pd_identity
  usb: typec: Add definitions for the latest specification releases
  usb: typec: Give the mux drivers all the details regarding the port
    state
  usb: typec: Provide definitions for the USB modes
  usb: typec: Add member for the supported USB modes to struct
    typec_capability
  usb: typec: ucsi: Store the supported USB modes

 Documentation/ABI/testing/sysfs-class-typec |  14 +-
 drivers/usb/typec/altmodes/displayport.c    |   5 +-
 drivers/usb/typec/bus.c                     |  40 +++--
 drivers/usb/typec/class.c                   | 174 +++++++++++++-------
 drivers/usb/typec/mux/pi3usb30532.c         |   5 +-
 drivers/usb/typec/tcpm/tcpm.c               |   6 +-
 drivers/usb/typec/ucsi/displayport.c        |   2 +-
 drivers/usb/typec/ucsi/ucsi.c               |   5 +
 include/linux/usb/pd.h                      |  33 +++-
 include/linux/usb/pd_vdo.h                  |  32 ++++
 include/linux/usb/typec.h                   |  17 +-
 include/linux/usb/typec_altmode.h           |  20 ++-
 include/linux/usb/typec_mux.h               |  10 +-
 13 files changed, 273 insertions(+), 90 deletions(-)

-- 
2.24.1

