Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23B326C032
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 11:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgIPJLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 05:11:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:39051 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbgIPJLG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 05:11:06 -0400
IronPort-SDR: qS6thsjieS+zjNrg/0uXMmPqzHgcZdHguLhPqaRpi/MzZmHpHltX/VPifKH7vAPQXRhrz+WsW0
 fp1nMqjtBbqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="159480576"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="159480576"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 02:11:06 -0700
IronPort-SDR: ZBgV511JeX9NWbVETHM/VxW0GN8xHKjt8huK9ozZJxraP6RN3ambesIurPR8B+heBxhqQ6OoK6
 4vAc4QeibZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409490850"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2020 02:11:04 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/3] usb: typec: intel_pmc_mux: Add dependency on ACPI
Date:   Wed, 16 Sep 2020 12:11:00 +0300
Message-Id: <20200916091102.27118-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916091102.27118-1-heikki.krogerus@linux.intel.com>
References: <20200916091102.27118-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the driver now needs to find the IOM ACPI node, the
driver depends on ACPI. Without the dependency set, the
driver will only fail to compile when ACPI is not enabled.

Fixes: 43d596e32276 ("usb: typec: intel_pmc_mux: Check the port status before connect")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index a4dbd11f8ee26..edead555835e2 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -11,6 +11,7 @@ config TYPEC_MUX_PI3USB30532
 
 config TYPEC_MUX_INTEL_PMC
 	tristate "Intel PMC mux control"
+	depends on ACPI
 	depends on INTEL_SCU_IPC
 	select USB_ROLE_SWITCH
 	help
-- 
2.28.0

