Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0A975EBB3
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 08:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbjGXGiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 02:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjGXGiX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 02:38:23 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A88A1712;
        Sun, 23 Jul 2023 23:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690180679; x=1721716679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PDgSdWiSS8r/fjBvP7uqjDJKYFldUHLxk6UxZ4dtspo=;
  b=bKl5j/U76fEVuvJQlP2lM1OEJLISkfMZ1g4c49/5NFGEw7XdiCcepqgh
   bxzMCnY1zJSvfbFWeKu6OZ3VtXNVghjJ90YVAdLos+kJJ+tglTpR8TR1e
   tNdL+toGhyqDkdRxi+mMfpPDqU0kPSGaaLKUudkdzB+u3Dt2KS9zLfGBN
   n6TMlXw191mxNomYGND+HsNJeRlMjgoRxrgkT84kQ+oA1mrfqNP1Si5My
   5o3f9AP94281x5HGnKk9N/naJ5JwugcVARyLBByUR8O390wolqlwNMHVp
   zwridof58clIFvK88nJ8qb2Mr2U2eDhW/In1oxsNQEy8pqpFO8o8f083A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="357363142"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="357363142"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 23:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="849507500"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849507500"
Received: from pgli4316.png.intel.com ([172.30.235.139])
  by orsmga004.jf.intel.com with ESMTP; 23 Jul 2023 23:37:11 -0700
From:   adrian.ho.yin.ng@intel.com
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de
Cc:     adrian.ho.yin.ng@intel.com
Subject: [PATCH v2 2/2] usb: dwc3: of-simple: Add compatible string for Intel Agilex5 platform
Date:   Mon, 24 Jul 2023 14:37:09 +0800
Message-Id: <42ae4193a9f1383fae49ae84917c7cf1d1d1bbd9.1690179693.git.adrian.ho.yin.ng@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>

Add compatible string to use this generic glue layer to support
Intel Agilex5 dwc3 controller.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 7e6ad8fe61a5..3c4640a7e663 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -175,6 +175,7 @@ static const struct of_device_id of_dwc3_simple_match[] = {
 	{ .compatible = "allwinner,sun50i-h6-dwc3" },
 	{ .compatible = "hisilicon,hi3670-dwc3" },
 	{ .compatible = "intel,keembay-dwc3" },
+	{ .compatible = "intel,agilex5-dwc3" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
-- 
2.26.2

