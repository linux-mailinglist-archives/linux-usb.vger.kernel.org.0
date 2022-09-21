Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5BC5BFDFE
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 14:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiIUMdz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 08:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiIUMdm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 08:33:42 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2077C6FA2B
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 05:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663763622; x=1695299622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rUgUhtASnaiK6eATLGtu+qD1PmTbCuly6GRZunE4fcU=;
  b=RwMfpQZQ0ljJzpzpQNf1E/hkaON69QckssVDiRCK5Sznc0YU2XeIgl6y
   Lw3eNB9luo0wbRAVe452yy5H+4tYuAPAiHvAN9cuib3U38dpfbJtxUg4w
   lil8R8gXUiSqYcktfUw02kHUrv+DZhqivXvOa42zDGHNgQYxXCYF1pbXR
   U/9tiJiq3ZYW7KsNp/Ru+dp8kWE0RPhsU125RLJjqIlYZw4eCm1ZubyUI
   ZMVpMW5lT06xshVhyJnmkf1ak0MAJiPThefiNKI9863vOpQNu9dRgNLwa
   dQp1tCz9X1N3z8sglxykM5GZiYoZ8dzcNZD0V2ZtN2bk2oufxBQ6U2x3O
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="363965119"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="363965119"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 05:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="708429483"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2022 05:33:40 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 6/6] xhci: remove unused lpm_failed_dev member from struct xhci_hcd
Date:   Wed, 21 Sep 2022 15:34:50 +0300
Message-Id: <20220921123450.671459-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
References: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci used to test if link power management (LPM) capable USB2 devices
really could enter and exit L1 state link state.
Failed devices were added to a lpm_failed_dev list.

This feature was removed 9 years ago in
commit de68bab4fa96 ("usb: Don't enable USB 2.0 Link PM by default.")
but lpm_failed_dev member was still left.

Remove it now.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index fa352fb24867..807fc4e47959 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1807,8 +1807,6 @@ struct xhci_hcd {
 	struct xhci_erst	erst;
 	/* Scratchpad */
 	struct xhci_scratchpad  *scratchpad;
-	/* Store LPM test failed devices' information */
-	struct list_head	lpm_failed_devs;
 
 	/* slot enabling and address device helpers */
 	/* these are not thread safe so use mutex */
-- 
2.25.1

