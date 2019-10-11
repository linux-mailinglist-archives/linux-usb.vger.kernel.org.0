Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D73AED445B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 17:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbfJKPcf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 11:32:35 -0400
Received: from mga09.intel.com ([134.134.136.24]:33457 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbfJKPce (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 11:32:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 08:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; 
   d="scan'208";a="207450437"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2019 08:32:20 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v4 0/9] usb: typec: Small API improvement
Date:   Fri, 11 Oct 2019 18:32:10 +0300
Message-Id: <20191011153219.35701-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm sending one more version of these patches to you before sending
them to Greg. There are still some fixes coming that will conflict
with patches in this series. Since I'm not in any hurry with these,
I'll wait for those fixes in this case.

The only change in this version is that I'm now checking that kmemdup
did not fail in the first patch.

Cover letter from v3:

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

 drivers/usb/typec/class.c     | 42 ++++++++++++++++++++++--------
 drivers/usb/typec/hd3ss3220.c | 24 +++++++++--------
 drivers/usb/typec/tcpm/tcpm.c | 45 ++++++++++++++------------------
 drivers/usb/typec/tps6598x.c  | 49 +++++++++++++++++++----------------
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++--------
 include/linux/usb/typec.h     | 41 ++++++++++++++++-------------
 6 files changed, 124 insertions(+), 99 deletions(-)

-- 
2.23.0

