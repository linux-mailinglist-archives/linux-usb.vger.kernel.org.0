Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E665C5B1A07
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 12:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiIHKcd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 06:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiIHKcc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 06:32:32 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AECBC11D
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662633151; x=1694169151;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wMLllKt2bRrelWV0McIkD2DDcrWW0zuWncCe+VrV2Xs=;
  b=TaXu8YL0cysK3dJSwkOAjS/EnpR7LIX6orrlnHqUWVeKPJz+VpQ1s2iI
   gSbsC5T2EZBRJ/HG5AEOUJUDYsv5H7U1bOZgjRbk+roHc/NW8kJxXjR5o
   l0Bws/vmGnF8pNa7Y66dwKqvan7WKl0y0BSzwKV+EMiWpWO0leUTFahe5
   0fsQDHm/UF64bH1qtWgj4iAObYepsYN20PFA9nC5A11A2gJn2NmVhqU31
   2NSdqQChYbPKr77bNe7Tv810EgnLepG2L9kUcxOOhKQMiPxHYldbZAdEP
   BRM9JaR2BiVF7Fnlf8JFVueceKhJ5ngJ6PKKel2BV1Aq5YfiO9IYD7uI+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="294716516"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="294716516"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 03:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="610650837"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga007.jf.intel.com with ESMTP; 08 Sep 2022 03:32:29 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH] thunderbolt: Add support for Intel Maple Ridge single port controller
Date:   Thu,  8 Sep 2022 13:43:20 +0300
Message-Id: <20220908104320.3409720-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for Maple Ridge discrete USB4 host controller from Intel
which has a single USB4 port (versus the already supported dual port
Maple Ridge USB4 host controller).

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/icm.c | 1 +
 drivers/thunderbolt/nhi.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index c7279fcd1d10..e0ff90918d27 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2534,6 +2534,7 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 		tb->cm_ops = &icm_icl_ops;
 		break;
 
+	case PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_4C_NHI:
 		icm->is_supported = icm_tgl_is_supported;
 		icm->get_mode = icm_ar_get_mode;
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 62d5a49b37a0..5e18ee65ebd4 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -55,6 +55,7 @@ extern const struct tb_nhi_ops icl_nhi_ops;
  * need for the PCI quirk anymore as we will use ICM also on Apple
  * hardware.
  */
+#define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_2C_NHI		0x1134
 #define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_4C_NHI		0x1137
 #define PCI_DEVICE_ID_INTEL_WIN_RIDGE_2C_NHI            0x157d
 #define PCI_DEVICE_ID_INTEL_WIN_RIDGE_2C_BRIDGE         0x157e
-- 
2.25.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

