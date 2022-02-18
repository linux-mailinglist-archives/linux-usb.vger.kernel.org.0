Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0DD4BBC21
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 16:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236996AbiBRP1e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 10:27:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbiBRP1d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 10:27:33 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C35D1C9184;
        Fri, 18 Feb 2022 07:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645198036; x=1676734036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xNvgASNarDT9ed14HXz7RJ5hb5rKEVJQcOKfD5ZmM7w=;
  b=OTbC9dJ8lt8Gd5wMPq6JXjY0wmI2YO2yc+d+/+PHzoiFSNQTtqD0NJf/
   k6CHcAB3y1RHMhbONxO+1VbxgZujjYZ3wzviBvJvSO7KiaCEh67WW/I8g
   e01NfORmZ2GNmIQpKY6LqQnL8eMzeVlTlUi8fR20eFxmR/+vpdBrBPnd2
   JSdJsoEF04QdouY+C/qly3HUBVKViF4r68SMPzxZpDvpxsm4p3Px5lXRJ
   LvHIhp6JX6z30OgZyZZV80hfBftGERqG2TyKAzuv8/kS3T67gi9WdYgOF
   KY406FQKjQt+y2KBqygxEcyQYL/pWzJosBnCx88s5QyP0C4QqEXqxMT9r
   w==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635199200"; 
   d="scan'208";a="22181137"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Feb 2022 16:27:14 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 18 Feb 2022 16:27:14 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 18 Feb 2022 16:27:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645198034; x=1676734034;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xNvgASNarDT9ed14HXz7RJ5hb5rKEVJQcOKfD5ZmM7w=;
  b=a89efCNpHrGO7oFt7MkCsCSKsoatWKFiD+xJ74NHKyA+lJUsNOHj2y1T
   4E/sh8vK3s9EP9fvvO4MFHva/SVdJaknCjFpbTmPIQyUf39DOkgBVp97P
   oh9x3bpHAnT4bfa4h824WSYTXSGpzpicd75yHpglpfLaXM80tmjMFtEYX
   8X5MSofpbnQaffR+ukYPVEh/2ubObydK2dOiFDquiXy1mxFf08xBcUeac
   nHWGCsokrwqerdC2HF2yIQFXBXnwZ7v9q00V+mrhvmf+WUQQHtSHmClO9
   8bFDSIDfXuGyc5ed1O9zFJxBRuJzMI+LsI6/RaS8pDcD7dUqjw71h31Z8
   g==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635199200"; 
   d="scan'208";a="22181136"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Feb 2022 16:27:14 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1B988280065;
        Fri, 18 Feb 2022 16:27:14 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v5 0/4] i.MX8MP: more USB3 glue layer feature support
Date:   Fri, 18 Feb 2022 16:27:03 +0100
Message-Id: <20220218152707.2198357-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

Thanks for the feedback on v4 [1].

This patchset aims to support flags for e.g. over-current active low or port
permanantly attached which are provided in the USB3 glue layer.

In v4 the patchset depends on Lucas' i.MX8MP power-domains patchset [2].
Because of that the 'phy' clock usage can be dropped, as now power domains
take care of the clocks. Due to powering up/down the glue layer settings
will have to be reapplied during resume.

Changes in v5:
* Added Reviewed-by: Li Jun to PATCH 1 & 4
* Added Reviewed-by: Rob Herring to PATCH 2
* Added comment in PATCH 3 why reprogramming is necessary in resume

Changes in v4:
* Depends on Lucas' i.MX8MP power-domains patchset
* removed 'phy' clock usage from dwc3-imx8mp.c
* Reapply glue layer settings upon resume

Changes in v3:
* Rename existing member for clarity
* Moved feature implementation from phy-fsl-imx8mq-usb.c to dwc3-imx8mp.c

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20220126141340.234125-1-alexander.stein@ew.tq-group.com/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20220119134027.2931945-1-l.stach@pengutronix.de/

Alexander Stein (4):
  usb: dwc3: imx8mp: rename iomem base pointer
  dt-bindings: usb: dwc3-imx8mp: Add imx8mp specific flags
  usb: dwc3: imx8mp: Add support for setting SOC specific flags
  arm64: dts: imx8mp: Add memory for USB3 glue layer to usb3 nodes

 .../bindings/usb/fsl,imx8mp-dwc3.yaml         | 31 +++++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  6 +-
 drivers/usb/dwc3/dwc3-imx8mp.c                | 77 +++++++++++++++++--
 3 files changed, 101 insertions(+), 13 deletions(-)

-- 
2.25.1

