Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995FE23AC30
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 20:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgHCSNY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 14:13:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:52749 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgHCSNY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Aug 2020 14:13:24 -0400
IronPort-SDR: Bo7Qgd0HNNV6BuLOypYG6LYyOpauG1QJPLcKPqxgB7b1RPMS8h/nfv54XeBCOjt930dQdt7+fK
 hWgHvkbXimuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="213714916"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="213714916"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 11:13:24 -0700
IronPort-SDR: JeJjwkN6RKW4GC2YW2gEwQZafJxcgVnumPIVgR/3OQA5kSio99rQrXC0ux1zEDha5c91fOoJ4X
 gmmVhRQ4nv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="324226604"
Received: from swbkc-rack4.png.intel.com ([172.30.249.178])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2020 11:13:22 -0700
From:   Raymond Tan <raymond.tan@intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Raymond Tan <raymond.tan@intel.com>
Subject: [PATCH 2/2] usb: dwc3: pci: Allow Elkhart Lake to utilize DSM method for PM functionality
Date:   Tue,  4 Aug 2020 02:11:24 +0800
Message-Id: <1596478284-69661-3-git-send-email-raymond.tan@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478284-69661-1-git-send-email-raymond.tan@intel.com>
References: <1596478284-69661-1-git-send-email-raymond.tan@intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Similar to some other IA platforms, Elkhart Lake too depends on the PMU
register write to request transition of Dx power state.

Thus, we add the PCI_DEVICE_ID_INTEL_EHL to the list of devices that shall
execute the ACPI _DSM method during D0/D3 sequence.

Signed-off-by: Raymond Tan <raymond.tan@intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 4f436b3..4d50187 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -149,7 +149,8 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc)
 
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
 		if (pdev->device == PCI_DEVICE_ID_INTEL_BXT ||
-				pdev->device == PCI_DEVICE_ID_INTEL_BXT_M) {
+		    pdev->device == PCI_DEVICE_ID_INTEL_BXT_M ||
+		    pdev->device == PCI_DEVICE_ID_INTEL_EHL) {
 			guid_parse(PCI_INTEL_BXT_DSM_GUID, &dwc->guid);
 			dwc->has_dsm_for_pm = true;
 		}
-- 
2.7.4

