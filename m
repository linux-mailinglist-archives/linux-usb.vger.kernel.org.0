Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9987C595A10
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 13:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbiHPL0W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 07:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbiHPLZt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 07:25:49 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305C63DBD8
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660646449; x=1692182449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=quHjxeEytV85JkCY9Ooohw8ukzLZgiWMuGKF3jXsWck=;
  b=c/zWRrdYsVyjijeWaScxGSPH/+s8wXQTQoMZ6MOFJ+qdUmColhkuxcLi
   Tp6L33vvlQlYV23i6qbBhPQu/4YCu/QiDgg1BENgMpwhUY+0BH/MZofnq
   mDugUY8GcuaxQK/sSD3fubveEmN5s8pKCDWMpJkieyO1+82mcoJTBk8P7
   bftHxTFwqMdRgKL0P5sN/FPeJKXUlLWIU2sSBNfl/xRqZRn4xrxBhIC6g
   c2EuOfbGla92rJ96GuSNyzAZ95lcMwR61RzxRUt6WDO+YiEsPopy7BttN
   rpuZeEHviAdKIT+cgn/IKBQXxNMvnNE0IaLNrF1ih0RSN0TLIXwhgoIXw
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="275238690"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="275238690"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 03:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="610219060"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 16 Aug 2022 03:40:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9B1BF2F6; Tue, 16 Aug 2022 13:40:59 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Use the actual buffer in tb_async_error()
Date:   Tue, 16 Aug 2022 13:40:58 +0300
Message-Id: <20220816104059.71844-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The received notification packet is held in pkg->buffer and not in pkg
itself. Fix this by using the correct buffer.

Fixes: 81a54b5e1986 ("thunderbolt: Let the connection manager handle all notifications")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index e5ede5debfb0..0c661a706160 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -407,7 +407,7 @@ static void tb_ctl_rx_submit(struct ctl_pkg *pkg)
 
 static int tb_async_error(const struct ctl_pkg *pkg)
 {
-	const struct cfg_error_pkg *error = (const struct cfg_error_pkg *)pkg;
+	const struct cfg_error_pkg *error = pkg->buffer;
 
 	if (pkg->frame.eof != TB_CFG_PKG_ERROR)
 		return false;
-- 
2.35.1

