Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8C2E4584
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 10:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408268AbfJYIXd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Oct 2019 04:23:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:36083 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405562AbfJYIXd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 25 Oct 2019 04:23:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 01:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="210332062"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 01:23:25 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 00/18] usb: typec: API improvements
Date:   Fri, 25 Oct 2019 11:23:06 +0300
Message-Id: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I modified ucsi_acpi.c so that the behavior matches exactly the
behaviour of the Connector Change Event handling before these patches.

The cover letter from v2:

There is now a check in ucsi_exec_command() that makes sure we do not
call ucsi_read_error() with UCSI_GET_ERROR_STATUS command. That should
prevent endless recursion from happening.

The original cover letter:

The first patches in this series (patches 1-8) introduce a small
change to the USB Type-C Connector Class API. Guenter was kind enough
to go over those already.

Patches 10-15 improve the ucsi driver API by introducing more
traditional read and write routines, and the rest is more generic
optimisations and improvements to the ucsi drivers.

Let me know if there is anything you want to be changed.

thanks,

Heikki Krogerus (18):
  usb: typec: Copy everything from struct typec_capability during
    registration
  usb: typec: Introduce typec_get_drvdata()
  usb: typec: Separate the operations vector
  usb: typec: tcpm: Start using struct typec_operations
  usb: typec: tps6598x: Start using struct typec_operations
  usb: typec: ucsi: Start using struct typec_operations
  usb: typec: hd3ss3220: Start using struct typec_operations
  usb: typec: Remove the callback members from struct typec_capability
  usb: typec: Remove unused members from struct typec_capability
  usb: typec: hd3ss3220: Give the connector fwnode to the port device
  usb: typec: ucsi: Simplified registration and I/O API
  usb: typec: ucsi: acpi: Move to the new API
  usb: typec: ucsi: ccg: Move to the new API
  usb: typec: ucsi: Remove the old API
  usb: typec: ucsi: Remove struct ucsi_control
  usb: typec: ucsi: Remove all bit-fields
  usb: typec: ucsi: New error codes
  usb: typec: ucsi: Optimise ucsi_unregister()

 drivers/usb/typec/class.c            |  42 +-
 drivers/usb/typec/hd3ss3220.c        |  36 +-
 drivers/usb/typec/tcpm/tcpm.c        |  45 +-
 drivers/usb/typec/tps6598x.c         |  49 ++-
 drivers/usb/typec/ucsi/displayport.c |  40 +-
 drivers/usb/typec/ucsi/trace.c       |  11 -
 drivers/usb/typec/ucsi/trace.h       |  79 +---
 drivers/usb/typec/ucsi/ucsi.c        | 609 ++++++++++++++-------------
 drivers/usb/typec/ucsi/ucsi.h        | 417 +++++++-----------
 drivers/usb/typec/ucsi/ucsi_acpi.c   |  93 +++-
 drivers/usb/typec/ucsi/ucsi_ccg.c    | 170 ++++----
 include/linux/usb/typec.h            |  41 +-
 12 files changed, 776 insertions(+), 856 deletions(-)

-- 
2.23.0

