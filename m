Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7A075BD47
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jul 2023 06:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjGUEat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 00:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjGUEas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 00:30:48 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105C52729;
        Thu, 20 Jul 2023 21:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689913847; x=1721449847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PDgSdWiSS8r/fjBvP7uqjDJKYFldUHLxk6UxZ4dtspo=;
  b=iIkKq8XkQ+Wm+Kbc1wsRT+nK+3issMT1hBLFebfg8uLLlnjyV7u7jwdJ
   bu6Hio49zfiod4x/2lF3AAe0/5ToixLHkKjjhwL4i2sP/d3n/FmPCP0Gk
   H8EQzNEEdRfJgH/QTB/qHtkFSezSHRtKSBmx4JQXvABXaquiYEDaAtnZV
   FfA8BExsgCB36CvkuDI7PZhdVggcPSRGWLZVvM34AYTH9r1FTZSqZge+Q
   SUDKKPJ2/XDjryWPz8ipOtRaoTtpUYtxafZuNZaPZ+SZCzc9/3/TjVxo0
   XKCjsmb3Uq0RCNMLUMnPsTiI1N2LmFiArdBTWzPqs403da2z5Bi+f4ZxK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364399771"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="364399771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 21:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848702401"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="848702401"
Received: from pgli4316.png.intel.com ([172.30.235.139])
  by orsmga004.jf.intel.com with ESMTP; 20 Jul 2023 21:30:44 -0700
From:   adrian.ho.yin.ng@intel.com
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de
Cc:     adrian.ho.yin.ng@intel.com
Subject: [PATCH 2/2] usb: dwc3: of-simple: Add compatible string for Intel Agilex5 platform
Date:   Fri, 21 Jul 2023 12:30:38 +0800
Message-Id: <7771b6c31fba610f5c3f86619daa2504d34c9639.1689913114.git.adrian.ho.yin.ng@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1689913114.git.adrian.ho.yin.ng@intel.com>
References: <cover.1689913114.git.adrian.ho.yin.ng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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

