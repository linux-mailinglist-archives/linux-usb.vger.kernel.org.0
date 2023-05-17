Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15564706321
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjEQIk6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjEQIk4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:40:56 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A42B1
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684312855; x=1715848855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FLiqIojWJJMiKYsTVOWsnWQ0vBLXFDjUr6CZ6F1z/B8=;
  b=EXgXZp/KxfN9uNfgNC/DBkTUo1Oq4Sy1mjyt5LR4pGDv4WPBUs+/jrTr
   qBBFHbwhittCOYAeHd9RDTgf6zS8Onx7rYbcsmWrOW6Afb56auqeC/DTr
   KiSjrEk+ij0dkyQQxfnWQIfQANx5Mue04aPpJFhXaIwHYAX4i/25xpRpR
   XkBP2jKGpQaxJvmDzOL8QTnMWmUmifG7c9es0J+kRvbr9k7YgrTAnuIiq
   64dHB/2i4nZy6Yufk7lMizmzNC1Xpn6D7jc4bmtE6GTOw5H0ukSOUdOWb
   +8q1t4xfqjJAY4SNQcVSy4NoKN8sbM5+b1FBB4pCvuAJQsNljezOceV9q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415113329"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="415113329"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 01:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="813779597"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="813779597"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2023 01:40:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3532B664; Wed, 17 May 2023 11:41:04 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/7] thunderbolt: Add MODULE_DESCRIPTION
Date:   Wed, 17 May 2023 11:41:01 +0300
Message-Id: <20230517084103.45213-5-mika.westerberg@linux.intel.com>
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

Add description about the driver to the module. No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index d76e923fbc6a..e5a8f9861f9b 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1464,6 +1464,7 @@ static struct pci_device_id nhi_ids[] = {
 };
 
 MODULE_DEVICE_TABLE(pci, nhi_ids);
+MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
 MODULE_LICENSE("GPL");
 
 static struct pci_driver nhi_driver = {
-- 
2.39.2

