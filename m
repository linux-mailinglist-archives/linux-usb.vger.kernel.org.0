Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 029F775EBAF
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 08:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjGXGiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 02:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjGXGiQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 02:38:16 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23ECC10E4;
        Sun, 23 Jul 2023 23:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690180673; x=1721716673;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4TU3korAb9g8yvR3yJp/2nxQppG3M7M8oYXN/cI8CVI=;
  b=cngYJm/MoQynXb/6htw8EpQyrwedZF1Cxfb0BpzIjbeM2xvES3L49oFN
   LJpXYNOhjSy+9w792lALjIWpDvLl169WZBJHwyPcA9MxH4emiXmayxgWD
   G0Kn1Xgbv8Eg/0nKy9i/LXZrNrhWRnGlGi157k1FvIs0wAc+l3QulPOco
   4HADTU2qfDqUz5EMYH8yceKROnckLm3NY8zAPrIcZ55Q0rRkKYN1OKMWk
   3FkxMiYjd8g4OxdkrQCTD/nAEOZAz53vbHx0H4EonXJhLWJwLj3G8xvZU
   r0aV+bgv4LJjDzB/0+G0N1lFVUNjdFmKn4YU1om574sXCjNa5OkoQON70
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="357363094"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="357363094"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 23:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="849507467"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849507467"
Received: from pgli4316.png.intel.com ([172.30.235.139])
  by orsmga004.jf.intel.com with ESMTP; 23 Jul 2023 23:36:51 -0700
From:   adrian.ho.yin.ng@intel.com
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de
Cc:     adrian.ho.yin.ng@intel.com
Subject: [PATCH v2 0/2] Add support for Intel SocFPGA DWC3 USB controller
Date:   Mon, 24 Jul 2023 14:36:48 +0800
Message-Id: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
X-Mailer: git-send-email 2.26.2
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

This patch set adds binding for Intel SoCFPGA DWC3 controller.
The new binding differs from the existing binding intel,keembay-dwc3.yaml
as the required properties are different.
This patch also adds compatible string for Intel Agilex5 in DWC3 simple glue driver.

---

V1-> V2:
- update commit title.
- update compatible string to match file name.
- update item description for clocks, reg and resets.
- removed defines for macro and update to use numbers.
- update node name to be generic.

Adrian Ng Ho Yin (2):
  dt-bindings: usb: Add Intel SoCFPGA USB controller
  usb: dwc3: of-simple: Add compatible string for Intel Agilex5 platform

 .../bindings/usb/intel,socfpga-dwc3.yaml      | 84 +++++++++++++++++++
 drivers/usb/dwc3/dwc3-of-simple.c             |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml

-- 
2.26.2

