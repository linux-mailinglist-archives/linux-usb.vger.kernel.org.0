Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE2475BD43
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jul 2023 06:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjGUEaa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 00:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGUEa3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 00:30:29 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665F4268E;
        Thu, 20 Jul 2023 21:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689913828; x=1721449828;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0kdz5Oe70+YdNsPWzo2Sz8QtW5Ttnk6agXGLdnHFyxk=;
  b=g2tCFnb0B+Xb80osZXYulA+PLLtxqD8UgCZFoX6o7ME7v6fqroLnBx8u
   Sl0cfL5YqZ7k8+xN8YUzaGIVe5p+4L/vdgUJihocdLAC26kLWVAJzElbl
   823QEbQjuZ0Def9D6xfnsaxpTa9+l8Y6CN4k8ZfXiCA9LE7cxgxLJNF6l
   Z+aqZIWrEtQoRZi+jzhDGyAj+reyoM0FpY+OQeXrZVfjVQ1gVLg9GCgh5
   ni87MeHyXecFHP1GsEM2cKxFPYW8tR5x5KJj45AGDmbAkYJhqULRJZBU+
   kWw6Kqd/mbrWL3QS9QLT+aWjxZyaUz1GY0d4L9zNwlNuVwPpn36wzqXyN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433159867"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="433159867"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 21:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="718691089"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="718691089"
Received: from pgli4316.png.intel.com ([172.30.235.139])
  by orsmga007.jf.intel.com with ESMTP; 20 Jul 2023 21:30:24 -0700
From:   adrian.ho.yin.ng@intel.com
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de
Cc:     adrian.ho.yin.ng@intel.com
Subject: [PATCH 0/2] Add support for Intel SocFPGA DWC3 USB controller
Date:   Fri, 21 Jul 2023 12:30:18 +0800
Message-Id: <cover.1689913114.git.adrian.ho.yin.ng@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>

This patch set adds binding for Intel SoCFPGA DWC3 controller.
The new binding differs from the existing binding intel,keembay-dwc3.yaml
as the required properties are different.
This patch also adds compatible string for Intel Agilex5 in DWC3 simple
glue driver.

Adrian Ng Ho Yin (2):
  dt-bindings: usb: Add Intel SoCFPGA USB controller bindings
  usb: dwc3: of-simple: Add compatible string for Intel Agilex5 platform

 .../bindings/usb/intel,socfpga-dwc3.yaml      | 78 +++++++++++++++++++
 drivers/usb/dwc3/dwc3-of-simple.c             |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml

-- 
2.26.2

