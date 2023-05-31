Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8629717B40
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235365AbjEaJHt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235405AbjEaJHa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:30 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E8EE5A
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524042; x=1717060042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mdpNIpe3M7LORulbwwf0paeY7CFPssSM7JAbZWYPNts=;
  b=FdZQN39HlDRNyApN1lLnGTERCM6qVx2ZDY4cCIV9fjAx6R7Tp55C0LJW
   kenO4TIK27b4E+aBmnIua+2du2DYqeJLm8tuhv1w6AbJQMSkdbgnl7rev
   c0rBD7NzXkvj8p6rgLKRdL13xJjjuQ1s2gnJ/h3RC//t7ii/LVwt+FdBN
   96VnMj414FirAZxDHnIMDszQNjU0G0b8JRtNKf7WYvTyYNU2dkwQ33Y7C
   etYHX4ZJjAZsY+0epjejzPygZd5kUQl16TXNipQoe/uJ42y0F39O6ZNGF
   HnsvLbvlff5bIhh8tUKLFWZlaoGKgMCsAWEvIEQ4XQUkYKgQmXih7GUvU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027658"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247249"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247249"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5E607C51; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 12/20] thunderbolt: Add Intel Barlow Ridge PCI ID
Date:   Wed, 31 May 2023 12:06:37 +0300
Message-Id: <20230531090645.5573-13-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
References: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Barlow Ridge is the first USB4 v2 controller from Intel. The
controller exposes standard USB4 PCI class ID in typical configurations,
however there is a way to configure it so that it uses a special class
ID to allow using s different driver than the Windows inbox one. For
this reason add the Barlow Ridge PCI ID to the Linux driver too so that
the driver can attach regardless of the class ID.

Tested-by: Pengfei Xu <pengfei.xu@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 2 ++
 drivers/thunderbolt/nhi.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 116016695a6a..4b7bec74e89f 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1517,6 +1517,8 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI) },
 
 	/* Any USB4 compliant host */
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index b0718020c6f5..c15a0c46c9cf 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -75,6 +75,8 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE	0x15ef
 #define PCI_DEVICE_ID_INTEL_ADL_NHI0			0x463e
 #define PCI_DEVICE_ID_INTEL_ADL_NHI1			0x466d
+#define PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI	0x5781
+#define PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI	0x5784
 #define PCI_DEVICE_ID_INTEL_MTL_M_NHI0			0x7eb2
 #define PCI_DEVICE_ID_INTEL_MTL_P_NHI0			0x7ec2
 #define PCI_DEVICE_ID_INTEL_MTL_P_NHI1			0x7ec3
-- 
2.39.2

