Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1A7308898
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jan 2021 12:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhA2LuX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jan 2021 06:50:23 -0500
Received: from mga02.intel.com ([134.134.136.20]:38578 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232157AbhA2K0S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Jan 2021 05:26:18 -0500
IronPort-SDR: 3XcvTSNvQge+gsYirSDdZBcX0yfgkelViP91pVPdj/d4s0CsoFSfvmFDwc7LblPT/ut50NfY/F
 qQDkeYFMnuLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="167487519"
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="167487519"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 00:32:45 -0800
IronPort-SDR: MP5165eMSq14eTclMl9OilF+HPa/qiU+din218ejiKxs5MQEocQ7fnNflzh8V2yd8jGOmtZXAm
 fkOnFsTS203w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="364317646"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2021 00:32:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C857C2621; Fri, 29 Jan 2021 10:32:41 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Christian Kellner <christian@kellner.me>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org
Subject: [PATCH v2 4/5] ACPI: Add support for native USB4 control _OSC
Date:   Fri, 29 Jan 2021 11:32:40 +0300
Message-Id: <20210129083241.72497-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129083241.72497-1-mika.westerberg@linux.intel.com>
References: <20210129083241.72497-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ACPI 6.4 introduced a new _OSC capability that is used negotiate native
connection manager support. Connection manager is the entity that is
responsible for tunneling over the USB4 fabric. If the platform rejects
the native access then firmware based connection manager is used.

The new _OSC also includes a set of bits that can be used to disable
certain tunnel types such as PCIe for security reasons for instance.

This implements the new USB4 _OSC so that we try to negotiate native
USB4 support if the Thunderbolt/USB4 (CONFIG_USB4) driver is enabled.
Drivers can determine what was negotiated by checking two new variables
exposed in this patch.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/bus.c   | 76 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h | 10 ++++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index a52cb28c40d8..9c3fe08e8f18 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -281,6 +281,12 @@ bool osc_sb_apei_support_acked;
 bool osc_pc_lpi_support_confirmed;
 EXPORT_SYMBOL_GPL(osc_pc_lpi_support_confirmed);
 
+/*
+ * ACPI 6.4 Operating System Capabilities for USB.
+ */
+bool osc_sb_native_usb4_support_confirmed;
+EXPORT_SYMBOL_GPL(osc_sb_native_usb4_support_confirmed);
+
 static u8 sb_uuid_str[] = "0811B06E-4A27-44F9-8D60-3CBBC22E7B48";
 static void acpi_bus_osc_negotiate_platform_control(void)
 {
@@ -317,6 +323,9 @@ static void acpi_bus_osc_negotiate_platform_control(void)
 	if (IS_ENABLED(CONFIG_SCHED_MC_PRIO))
 		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_CPC_DIVERSE_HIGH_SUPPORT;
 
+	if (IS_ENABLED(CONFIG_USB4))
+		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_NATIVE_USB4_SUPPORT;
+
 	if (!ghes_disable)
 		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_APEI_SUPPORT;
 	if (ACPI_FAILURE(acpi_get_handle(NULL, "\\_SB", &handle)))
@@ -348,8 +357,74 @@ static void acpi_bus_osc_negotiate_platform_control(void)
 			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_APEI_SUPPORT;
 		osc_pc_lpi_support_confirmed =
 			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_PCLPI_SUPPORT;
+		osc_sb_native_usb4_support_confirmed =
+			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_NATIVE_USB4_SUPPORT;
+	}
+
+	kfree(context.ret.pointer);
+}
+
+/*
+ * Native control of USB4 capabilities. If any of the tunneling bits is
+ * set it means OS is in control and we use software based connection
+ * manager.
+ */
+u32 osc_sb_native_usb4_control;
+EXPORT_SYMBOL_GPL(osc_sb_native_usb4_control);
+
+static void acpi_bus_decode_usb_osc(const char *msg, u32 bits)
+{
+	printk(KERN_INFO PREFIX "%s USB3%c DisplayPort%c PCIe%c XDomain%c\n", msg,
+	       (bits & OSC_USB_USB3_TUNNELING) ? '+' : '-',
+	       (bits & OSC_USB_DP_TUNNELING) ? '+' : '-',
+	       (bits & OSC_USB_PCIE_TUNNELING) ? '+' : '-',
+	       (bits & OSC_USB_XDOMAIN) ? '+' : '-');
+}
+
+static u8 sb_usb_uuid_str[] = "23A0D13A-26AB-486C-9C5F-0FFA525A575A";
+static void acpi_bus_osc_negotiate_usb_control(void)
+{
+	u32 capbuf[3];
+	struct acpi_osc_context context = {
+		.uuid_str = sb_usb_uuid_str,
+		.rev = 1,
+		.cap.length = sizeof(capbuf),
+		.cap.pointer = capbuf,
+	};
+	acpi_handle handle;
+	acpi_status status;
+	u32 control;
+
+	if (!osc_sb_native_usb4_support_confirmed)
+		return;
+
+	if (ACPI_FAILURE(acpi_get_handle(NULL, "\\_SB", &handle)))
+		return;
+
+	control = OSC_USB_USB3_TUNNELING | OSC_USB_DP_TUNNELING |
+		  OSC_USB_PCIE_TUNNELING | OSC_USB_XDOMAIN;
+
+	capbuf[OSC_QUERY_DWORD] = 0;
+	capbuf[OSC_SUPPORT_DWORD] = 0;
+	capbuf[OSC_CONTROL_DWORD] = control;
+
+	status = acpi_run_osc(handle, &context);
+	if (ACPI_FAILURE(status))
+		return;
+
+	if (context.ret.length != sizeof(capbuf)) {
+		printk(KERN_INFO PREFIX "USB4 _OSC: returned invalid length buffer\n");
+		goto out_free;
 	}
 
+	osc_sb_native_usb4_control =
+		control & ((u32 *)context.ret.pointer)[OSC_CONTROL_DWORD];
+
+	acpi_bus_decode_usb_osc("USB4 _OSC: OS supports", control);
+	acpi_bus_decode_usb_osc("USB4 _OSC: OS controls",
+				osc_sb_native_usb4_control);
+
+out_free:
 	kfree(context.ret.pointer);
 }
 
@@ -1188,6 +1263,7 @@ static int __init acpi_bus_init(void)
 	 * so it must be run after ACPI_FULL_INITIALIZATION
 	 */
 	acpi_bus_osc_negotiate_platform_control();
+	acpi_bus_osc_negotiate_usb_control();
 
 	/*
 	 * _PDC control method may load dynamic SSDT tables,
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 2630c2e953f7..ac68c2d4e393 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -546,9 +546,19 @@ acpi_status acpi_run_osc(acpi_handle handle, struct acpi_osc_context *context);
 #define OSC_SB_OSLPI_SUPPORT			0x00000100
 #define OSC_SB_CPC_DIVERSE_HIGH_SUPPORT		0x00001000
 #define OSC_SB_GENERIC_INITIATOR_SUPPORT	0x00002000
+#define OSC_SB_NATIVE_USB4_SUPPORT		0x00040000
 
 extern bool osc_sb_apei_support_acked;
 extern bool osc_pc_lpi_support_confirmed;
+extern bool osc_sb_native_usb4_support_confirmed;
+
+/* USB4 Capabilities */
+#define OSC_USB_USB3_TUNNELING			0x00000001
+#define OSC_USB_DP_TUNNELING			0x00000002
+#define OSC_USB_PCIE_TUNNELING			0x00000004
+#define OSC_USB_XDOMAIN				0x00000008
+
+extern u32 osc_sb_native_usb4_control;
 
 /* PCI Host Bridge _OSC: Capabilities DWORD 2: Support Field */
 #define OSC_PCI_EXT_CONFIG_SUPPORT		0x00000001
-- 
2.29.2

