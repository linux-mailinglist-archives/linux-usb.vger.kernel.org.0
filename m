Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5B64348EA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 12:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhJTKa0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 06:30:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:6891 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229959AbhJTKa0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Oct 2021 06:30:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228621976"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="228621976"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 03:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="575280545"
Received: from saranya-nuc10i7fnh.iind.intel.com ([10.223.216.64])
  by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2021 03:27:58 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        hdegoede@redhat.com
Cc:     heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        rajaram.regupathy@intel.com,
        Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH 2/2] Revert "platform/x86: i2c-multi-instantiate: Don't create platform device for INT3515 ACPI nodes"
Date:   Wed, 20 Oct 2021 07:56:20 +0530
Message-Id: <20211020022620.21012-3-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211020022620.21012-1-saranya.gopal@intel.com>
References: <20211020022620.21012-1-saranya.gopal@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 9bba96275576da0cf78ede62aeb2fc975ed8a32d.

The above commit was added to prevent the tipd driver from loading
in devices which have INT3515 ACPI nodes since high CPU load was
reported in these devices due to interrupt flood. Now that the issue
of interrupt flood in the tipd driver is fixed, re-enable the creation
of platform device for INT3515 ACPI nodes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 31 +++++---------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index a50153ecd560..4956a1df5b90 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -139,29 +139,13 @@ static const struct i2c_inst_data bsg2150_data[]  = {
 	{}
 };
 
-/*
- * Device with _HID INT3515 (TI PD controllers) has some unresolved interrupt
- * issues. The most common problem seen is interrupt flood.
- *
- * There are at least two known causes. Firstly, on some boards, the
- * I2CSerialBus resource index does not match the Interrupt resource, i.e. they
- * are not one-to-one mapped like in the array below. Secondly, on some boards
- * the IRQ line from the PD controller is not actually connected at all. But the
- * interrupt flood is also seen on some boards where those are not a problem, so
- * there are some other problems as well.
- *
- * Because of the issues with the interrupt, the device is disabled for now. If
- * you wish to debug the issues, uncomment the below, and add an entry for the
- * INT3515 device to the i2c_multi_instance_ids table.
- *
- * static const struct i2c_inst_data int3515_data[]  = {
- *	{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
- *	{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
- *	{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
- *	{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
- *	{ }
- * };
- */
+static const struct i2c_inst_data int3515_data[]  = {
+	{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
+	{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
+	{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
+	{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
+	{}
+};
 
 /*
  * Note new device-ids must also be added to i2c_multi_instantiate_ids in
@@ -170,6 +154,7 @@ static const struct i2c_inst_data bsg2150_data[]  = {
 static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
 	{ "BSG1160", (unsigned long)bsg1160_data },
 	{ "BSG2150", (unsigned long)bsg2150_data },
+	{ "INT3515", (unsigned long)int3515_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
-- 
2.17.1

