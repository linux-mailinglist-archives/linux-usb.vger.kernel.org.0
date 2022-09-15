Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97895B946C
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 08:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiIOG3q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 02:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiIOG3e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 02:29:34 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977AD95ADF;
        Wed, 14 Sep 2022 23:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663223347; x=1694759347;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yenovilFRNpCqkpDtpDC2f1lhfdhpbwLD7Xa2hXAFhQ=;
  b=REDLWnC1QPKeAX1ijcEl/q33DoCeXytCTEC46YNUN0590sR3ZkLnKFWb
   M1XzOux+Ng2jLOZcPjt9lWVgAapvOmV7cyj5UqkTlLpf0WO0jEiHoNLft
   5gTjPqrgbh6qFqsTgpvWHdwLiOIwmHzan29X0fs8TrklZkgxTE5/dQixY
   WTkaVtaEkyXxiLcrWmpiZw0Dg1/cduGlHSVh9AWzyc/Urm762jFULTJN3
   rmXP34gblfy5lCaEpwP8OSF5r50Wfqg9aFpal5YRTjCdzFvkGu8pnLD0n
   fdDCwFk4gTsg/rfDDP2WQ+Ppiu7zZ/A4Jb34kZ7NjYOIvDCsyWfz4uqab
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654552800"; 
   d="scan'208";a="26189606"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Sep 2022 08:29:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 15 Sep 2022 08:29:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 15 Sep 2022 08:29:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663223344; x=1694759344;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yenovilFRNpCqkpDtpDC2f1lhfdhpbwLD7Xa2hXAFhQ=;
  b=Y3G8eh989lOcarD1QrBhrBg2IX+Fs2Pf3L3QluLkBmsb9ay8bxY1Y9T/
   MRBKR24jLBfbQt7RAAcYyYZyytoPlcFkzZnZbhHgdwpD6Ajbl3vjKslp2
   XEqCTW572cTqDqzBGTPUfi+Q4/tH/hoJjX5uQcouutSQhLSB2f8Hbl0Sm
   iRX2RoPFMYP8uZqJeCWe9IEOeZyXhL7IogqJa6hfVManwpwu30b2hFuQp
   pwKDOdBH/dIKAqcR3JBGl0vgEKYR0aY+8hGMAPonItdSuWUSRDFKXktGd
   9dLCw3We8qRBu/E2J9PFyO81+KDaHd7oUgiIqC6ORpeBh+Y2tTYxd2gHt
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654552800"; 
   d="scan'208";a="26189604"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Sep 2022 08:29:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D467C280056;
        Thu, 15 Sep 2022 08:29:03 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] USB host support for TQMa8MPxL + MBa8MPxL
Date:   Thu, 15 Sep 2022 08:28:51 +0200
Message-Id: <20220915062855.751881-1-alexander.stein@ew.tq-group.com>
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

Hi everybody,

this is the next version of this series for USB host support on TQMa8MPxL +
MBa8MPxL. Thanks everybody for their feedback on v1.

The DT configuration itself (patch 4) is rather straight forward, but leads to
the following dmesg errors regarding superspeed ports:
> [    8.549243] hub 2-1:1.0: hub_ext_port_status failed (err = -110)
> [   22.885263] usb 2-1: Failed to suspend device, error -110

This hardware works fine using the downstream kernel, because for imx8mp this
ITP sync feature is enabled conditionally [1] & [2].
Hacking this into mainline resulted in a working superspeed setup as well. I
also noticed that on some android kernel [3] depending in IP core version either
GCTL.SOFTITPSYNC or GFLADJ.GFLADJ_REFCLK_LPM_SEL is enabled unconditionally.
So I opted for the latter one using some quirk (patch 1-3).

Changes in v3:
* Added Krzysztof's A-b to Patch 1
* Added Li Jun's R-b to Patch 2
* Remove 'snps,dis-u2-freeclk-exists-quirk' in Patch 3
  snps,gfladj-refclk-lpm-sel-quirk is a superset of the old one
* Removed 'snps,dis_u3_susphy_quirk' in Patch 4
  This is addressed by patch series [4] & [5] separately

Thanks and best regards,
Alexander

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/dwc3-imx8mp.c?h=lf-5.10.y#n134
[2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n333
[3] https://android.googlesource.com/kernel/msm/+/87a6b154766907020cc74c7726e8a68aaa9d7f6b%5E%21/#F0
[4] https://lore.kernel.org/all/1662547028-22279-1-git-send-email-jun.li@nxp.com/
[5] https://lore.kernel.org/all/1663067426-29534-1-git-send-email-jun.li@nxp.com/

Alexander Stein (4):
  dt-bindings: usb: dwc3: Add gfladj-refclk-lpm-sel-quirk
  usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
  arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
  arm64: dts: tqma8mpql: add support for 2nd USB (host) interface

Alexander Stein (4):
  dt-bindings: usb: dwc3: Add gfladj-refclk-lpm-sel-quirk
  usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
  arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
  arm64: dts: tqma8mpql: add support for 2nd USB (host) interface

 .../devicetree/bindings/usb/snps,dwc3.yaml    |  5 +++
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 41 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  4 +-
 drivers/usb/dwc3/core.c                       |  8 +++-
 drivers/usb/dwc3/core.h                       |  2 +
 5 files changed, 57 insertions(+), 3 deletions(-)

-- 
2.25.1

