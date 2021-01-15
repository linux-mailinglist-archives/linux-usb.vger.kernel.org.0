Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5327C2F75EB
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 10:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbhAOJw1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 04:52:27 -0500
Received: from mga18.intel.com ([134.134.136.126]:51113 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbhAOJwZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 04:52:25 -0500
IronPort-SDR: A9k092C0vRj7qXZ5QF1TqL4n+ayXHxQdE/TXRdMfcD7ydlYTCb1Damrt5dzBBf1B445CCtGVhX
 mP4mz6rvcu6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166195734"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="166195734"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 01:49:25 -0800
IronPort-SDR: V79JTIO8NnWe8QVsQXb4bdQPw+qEO2PDZz5+t4tfvJzNcm9MZ9GR7vLl4Fk78n6UUMNqmUG8P6
 6GPraI8zQ2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="465538743"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2021 01:49:23 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <greg@kroah.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH v3 3/4] usb: dwc3: pci: ID for Tiger Lake CPU
Date:   Fri, 15 Jan 2021 12:49:13 +0300
Message-Id: <20210115094914.88401-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115094914.88401-1-heikki.krogerus@linux.intel.com>
References: <20210115094914.88401-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tiger Lake SOC (the versions of it that have integrated USB4
controller) may have two DWC3 controllers. One is part of
the PCH (Platform Controller Hub, i.e. the chipset) as
usual, and the other is inside the actual CPU block.

On all Intel platforms that have the two separate DWC3
controllers, the one inside the CPU handles USB3 and only
USB3 traffic, while the PCH version handles USB2 and USB2
alone. The reason for splitting the two busses like this is
to allow easy USB3 tunneling over USB4 connections. As USB2
is not tunneled over USB4, it has dedicated USB controllers
(both xHCI and DWC3).

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/dwc3-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 037bc21bffa66..51029cec119ed 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -41,6 +41,7 @@
 #define PCI_DEVICE_ID_INTEL_TGPH		0x43ee
 #define PCI_DEVICE_ID_INTEL_JSP			0x4dee
 #define PCI_DEVICE_ID_INTEL_ADLS		0x7ae1
+#define PCI_DEVICE_ID_INTEL_TGL			0x9a15
 
 #define PCI_INTEL_BXT_DSM_GUID		"732b85d5-b7a7-4a1b-9ba0-4bbd00ffd511"
 #define PCI_INTEL_BXT_FUNC_PMU_PWR	4
@@ -384,6 +385,9 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADLS),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL),
+	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
+
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_NL_USB),
 	  (kernel_ulong_t) &dwc3_pci_amd_swnode, },
 	{  }	/* Terminating Entry */
-- 
2.29.2

