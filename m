Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9378706320
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjEQIk5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjEQIkz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:40:55 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F2119B4
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684312854; x=1715848854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E3NmOV6wW4gSZDDCMIjNzD16+BH8EdPA+l3a+HEsdI0=;
  b=XnttgnTAHaUh4AFtcJtz7Lg8IF+0tKfk4RBSdnQQ/pVsMS8nCIZr1NDQ
   GcY9iTuD01yIgG1r59Nemvhil5DrcdnSdJdgyL3vnBebNJiAPZoFAqMGu
   wKZcIat7vUeDCkWXzHjWABqPXMqzo0xWDHnm+4Urxa0g/7DrOPBVXJsk1
   SGWhArvRW50ZNJYV5qzwFF9QYYqXcj+liOTDEon4XoChITb2cIqmYFiRX
   SB1ry9N1deD87TKBP5x0Qh0fDYxFFhDR5s9lj++o+B+Y3gDHcoE0aX4if
   zsmJVubg1A44cXCd1mrK2KMLUa4gn8bTkhjO/iP6a/ecBByJee60IwQPn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354871302"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="354871302"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 01:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="1031624536"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="1031624536"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2023 01:40:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 104ED454; Wed, 17 May 2023 11:41:04 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/7] thunderbolt: Log function name of the called quirk
Date:   Wed, 17 May 2023 11:40:58 +0300
Message-Id: <20230517084103.45213-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
References: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is useful when debugging whether a quirk has been matched or not.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 1157b8869bcc..928689b66126 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -105,6 +105,7 @@ void tb_check_quirks(struct tb_switch *sw)
 		if (q->device && q->device != sw->device)
 			continue;
 
+		tb_sw_dbg(sw, "running %ps\n", q->hook);
 		q->hook(sw);
 	}
 }
-- 
2.39.2

