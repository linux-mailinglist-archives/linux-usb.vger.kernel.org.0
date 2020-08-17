Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E13E2472BA
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391614AbgHQSrL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:47:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:6211 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391615AbgHQSrF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:47:05 -0400
IronPort-SDR: S0CYcS3uaZ6aSXTEez6C1XDP02BFjqij+zbINeS1ohN9U30jZLWhVDr/u0RVAjiWf77CEDeo6n
 q7/QLNlWZKng==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="134834836"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="134834836"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:47:02 -0700
IronPort-SDR: Oue4+mnNytP8+qxUku0BpW47W75srMVS2ZoPRHaRaaDMgLS8u0BI3jVyRNZCmVhob2QAmMgHiE
 /wObX+J0/s4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="279195010"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2020 11:47:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6BD8F1C5; Mon, 17 Aug 2020 21:47:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Sylwia Wnuczko <sylwia.wnuczko@intel.com>
Subject: [PATCH v2 4/8] i40e: Make use of le16_to_cpu_array()
Date:   Mon, 17 Aug 2020 21:46:55 +0300
Message-Id: <20200817184659.58419-4-andriy.shevchenko@linux.intel.com>
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
Cc: Sylwia Wnuczko <sylwia.wnuczko@intel.com>
---
v2: new patch
 drivers/net/ethernet/intel/i40e/i40e_nvm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_nvm.c b/drivers/net/ethernet/intel/i40e/i40e_nvm.c
index 7164f4ad8120..154505f352bc 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_nvm.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_nvm.c
@@ -444,7 +444,6 @@ static i40e_status i40e_read_nvm_buffer_aq(struct i40e_hw *hw, u16 offset,
 	u16 read_size;
 	bool last_cmd = false;
 	u16 words_read = 0;
-	u16 i = 0;
 
 	do {
 		/* Calculate number of bytes we should read in this step.
@@ -475,8 +474,7 @@ static i40e_status i40e_read_nvm_buffer_aq(struct i40e_hw *hw, u16 offset,
 		offset += read_size;
 	} while (words_read < *words);
 
-	for (i = 0; i < *words; i++)
-		data[i] = le16_to_cpu(((__le16 *)data)[i]);
+	le16_to_cpu_array(data, data, *words);
 
 read_nvm_buffer_aq_exit:
 	*words = words_read;
-- 
2.28.0

