Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB609C308C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 11:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfJAJtB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 05:49:01 -0400
Received: from mga02.intel.com ([134.134.136.20]:29589 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbfJAJtB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 05:49:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 02:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; 
   d="scan'208";a="205033797"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2019 02:48:59 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/7] usb: typec: Small API improvement
Date:   Tue,  1 Oct 2019 12:48:51 +0300
Message-Id: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi guys,

This series moves the callback members from struct typec_capabilities
to a new struct typec_operations. That removes the need for the
drivers to keep a copy of the struct typec_capabilites if they don't
need it, and struct typec_operations can probable always be
constified.

The change is small, however I think the code ends up being a bit more
cleaner looking this way. Let me know if it's OK.

thanks,

Heikki Krogerus (7):
  usb: typec: Copy everything from struct typec_capability during
    registration
  usb: typec: Introduce typec_get_drvdata()
  usb: typec: Separate the operations vector
  usb: typec: tcpm: Start using struct typec_operations
  usb: typec: tps6598x: Start using struct typec_operations
  usb: typec: ucsi: Start using struct typec_operations
  usb: typec: Remove the callback members from struct typec_capability

 drivers/usb/typec/class.c     | 125 +++++++++++++++++++++-------------
 drivers/usb/typec/tcpm/tcpm.c |  47 ++++++-------
 drivers/usb/typec/tps6598x.c  |  49 ++++++-------
 drivers/usb/typec/ucsi/ucsi.c |  22 +++---
 include/linux/usb/typec.h     |  38 ++++++-----
 5 files changed, 157 insertions(+), 124 deletions(-)

-- 
2.23.0

