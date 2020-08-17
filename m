Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF7D2472C2
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391628AbgHQSrU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:47:20 -0400
Received: from mga12.intel.com ([192.55.52.136]:13890 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391617AbgHQSrH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:47:07 -0400
IronPort-SDR: 1Wyq+2FLJnBK2sb9veiYx8tk30Bt2BsI+ZMGBB5I7F14ghqtdEttT2mpxYg0n5jOISNZVG/Wsn
 tFItISb6kmag==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="134293874"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="134293874"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:47:03 -0700
IronPort-SDR: mHZjw8jse/XqMjn0OgkmVZFEniFjZucScjZsFB/Cm4h/VEMsMhM49PDNAZYXOwVXeM8GRfAWrm
 uuk2A5AKXBFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="334157251"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2020 11:47:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 76FDB3D7; Mon, 17 Aug 2020 21:47:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: [PATCH v2 5/8] ice: Make use of le16_to_cpu_array()
Date:   Mon, 17 Aug 2020 21:46:56 +0300
Message-Id: <20200817184659.58419-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we have a new helper, let's replace open coded variant by it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>
---
v2: new patch
 drivers/net/ethernet/intel/ice/ice_nvm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_nvm.c b/drivers/net/ethernet/intel/ice/ice_nvm.c
index 5903a36763de..3c376cb49e61 100644
--- a/drivers/net/ethernet/intel/ice/ice_nvm.c
+++ b/drivers/net/ethernet/intel/ice/ice_nvm.c
@@ -448,8 +448,8 @@ static enum ice_status ice_get_netlist_ver_info(struct ice_hw *hw)
 	enum ice_status ret;
 	u32 id_blk_start;
 	__le16 raw_data;
-	u16 data, i;
 	u16 *buff;
+	u16 data;
 
 	ret = ice_acquire_nvm(hw, ICE_RES_READ);
 	if (ret)
@@ -494,8 +494,7 @@ static enum ice_status ice_get_netlist_ver_info(struct ice_hw *hw)
 	if (ret)
 		goto exit_error;
 
-	for (i = 0; i < ICE_AQC_NVM_NETLIST_ID_BLK_LEN; i++)
-		buff[i] = le16_to_cpu(((__force __le16 *)buff)[i]);
+	le16_to_cpu_array(buff, buff, ICE_AQC_NVM_NETLIST_ID_BLK_LEN);
 
 	ver->major = (buff[ICE_AQC_NVM_NETLIST_ID_BLK_MAJOR_VER_HIGH] << 16) |
 		buff[ICE_AQC_NVM_NETLIST_ID_BLK_MAJOR_VER_LOW];
-- 
2.28.0

