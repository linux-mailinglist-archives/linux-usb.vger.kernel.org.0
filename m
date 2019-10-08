Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4EACF7E6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 13:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbfJHLNx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 07:13:53 -0400
Received: from mga02.intel.com ([134.134.136.20]:26010 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729790AbfJHLNx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 07:13:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 04:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; 
   d="scan'208";a="206618901"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Oct 2019 04:13:50 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 0/9] usb: typec: Small API improvement
Date:   Tue,  8 Oct 2019 14:13:41 +0300
Message-Id: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The broken conditions in the *_store() functions should now be fixed.

Cover letter from v2:

In this version there should be no more semantic changes.

The original cover letter:

This series moves the callback members from struct typec_capabilities
to a new struct typec_operations. That removes the need for the
drivers to keep a copy of the struct typec_capabilites if they don't
need it, and struct typec_operations can probable always be
constified.

The change is small, however I think the code ends up being a bit more
cleaner looking this way. Let me know if it's OK.

thanks,

Heikki Krogerus (9):
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

 drivers/usb/typec/class.c     | 37 ++++++++++++++++++--------
 drivers/usb/typec/hd3ss3220.c | 24 +++++++++--------
 drivers/usb/typec/tcpm/tcpm.c | 45 ++++++++++++++------------------
 drivers/usb/typec/tps6598x.c  | 49 +++++++++++++++++++----------------
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++--------
 include/linux/usb/typec.h     | 41 ++++++++++++++++-------------
 6 files changed, 119 insertions(+), 99 deletions(-)

-- 
2.23.0

