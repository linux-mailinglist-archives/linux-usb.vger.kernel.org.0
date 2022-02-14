Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EFD4B530D
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 15:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238041AbiBNOTm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 09:19:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235403AbiBNOTl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 09:19:41 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0696849FB8
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644848374; x=1676384374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/BRaULa/NfsNDOjtdKAKREswfeZrOQMtK3cQosALLC8=;
  b=D/y+A9zD0Pm/go9ug3qgeuYwLzX/5AJxaxZovVjPqS+H3MWw61L8eQeg
   Dt7HWBsV4SS59FYIivaRkE2jpA8EDzXTHTpoSNmViC2NIO5Zw8LiEXXd9
   OkIlq3TBjTb+/MPbnYZAe7/a/SlEt57Ek/EOdk8D1+NjpjZ9cqDc5kzyl
   coRCkqeZdO0XvkQrbNVtZYLqa0akElmFPr0eQO90Oib3nwLl1+IDVMdqK
   u7G0D+GuJ6RWng3Y5SP6sRIwSnRHBRh25ekq3msxmNYjl2ydySizGVp/O
   Fxlc2LNtcFf9IrcRjtXKArud7Dsx8Pl66lfOuhrJUzNwGfMZHbklyCWRn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="336524926"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="336524926"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 06:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="680518509"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2022 06:19:32 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: add support for the Intel Raptor Lake-S
Date:   Mon, 14 Feb 2022 17:19:48 +0300
Message-Id: <20220214141948.18637-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the necessary PCI ID for Intel Raptor Lake-S
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 7ff8fc8f79a9b..4e69a9d829f23 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -43,6 +43,7 @@
 #define PCI_DEVICE_ID_INTEL_ADLP		0x51ee
 #define PCI_DEVICE_ID_INTEL_ADLM		0x54ee
 #define PCI_DEVICE_ID_INTEL_ADLS		0x7ae1
+#define PCI_DEVICE_ID_INTEL_RPLS		0x7a61
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
 #define PCI_DEVICE_ID_AMD_MR			0x163a
 
@@ -409,6 +410,9 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADLS),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPLS),
+	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
+
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
-- 
2.34.1

