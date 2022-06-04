Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD2A53D4E8
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 04:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350207AbiFDCsI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 22:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbiFDCsH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 22:48:07 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E1E1E3CA;
        Fri,  3 Jun 2022 19:48:06 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EBF86C06ED;
        Sat,  4 Jun 2022 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654310885; bh=l2Dng8KaEPZccFcyqmFjgQbD27S2kaTiANhG3L7vXfQ=;
        h=Date:From:Subject:To:Cc:From;
        b=Xa57fy37XK3M4BzZFK0G6ddFh3/hOZb0bC4SW4/7umlKAK1XgGmMgsLm4k13yCgLw
         5RRgTnIY/wAv6666cWfhO43UYMQ9bBitPYgKjJj4E9kyHZ9ucxWSPfev/NzcplKigQ
         hJ6ltnA9FtQ8VzOT6JeEkw8hMVsJje1WZpKfCCFDMbSZAwf3VropLPQvPU3sb9KlUB
         Bt7NIB803yIbTl68AsU6b+iIuA3D26fLPIpN+Hfh+e7AWa8bJaMkgMDlTxjsj6IlMR
         X22KWYYivPzrfziUB5gNB7FobDttQnqLVqu1ix151hPXRHP+bVztRGZRPSlbSPZkV1
         A1oyG8ICRV2MQ==
Received: from te-lab15 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CB542A0085;
        Sat,  4 Jun 2022 02:48:00 +0000 (UTC)
Received: by te-lab15 (sSMTP sendmail emulation); Fri, 03 Jun 2022 19:48:00 -0700
Date:   Fri, 03 Jun 2022 19:48:00 -0700
Message-Id: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 0/4] usb: xhci: Introduce xhci-snps
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Juergen Gross <jgross@suse.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Synopsys DWC_usb3x IPs are used on many different platforms. Since they share
the same IP, often the quirks are common across different platforms and
versions. This drives the need to find a way to handle all the common (and
platform specific) quirks and separate its logic from dwc3 and xhci core logic.
Hopefully it can also reduce introducing new device properties while
maintaining abstraction.

So, let's create a xhci-snps glue extension that can apply to xhci-plat and
xhci-pci glue drivers and teach it to handle DWC_usb3x hosts. For this
particular change, we'll start with xhci-plat glue driver.

NOTE: This is a quick implementation of how I'd imagine to handle this. I
apologize if it may lack documentation. It doesn't have all the common quirks
added. I'd like to receive some feedbacks before moving forward.

Many thanks!
Thinh


Thinh Nguyen (4):
  dt-bindings: usb: usb-xhci: Add xhci-snps-quirks
  usb: dwc3: host: Always set xhci-snps-quirks
  usb: dwc3: core: Share global register access with xhci driver
  usb: xhci: Introduce Synopsys glue extension for DWC_usb3x

 .../devicetree/bindings/usb/usb-xhci.yaml     |   4 +
 drivers/usb/dwc3/core.c                       |   4 +-
 drivers/usb/dwc3/host.c                       |   4 +-
 drivers/usb/host/Kconfig                      |   8 +
 drivers/usb/host/Makefile                     |   3 +
 drivers/usb/host/xhci-plat.c                  |  40 ++++
 drivers/usb/host/xhci-plat.h                  |   3 +
 drivers/usb/host/xhci-snps.c                  | 185 ++++++++++++++++++
 drivers/usb/host/xhci-snps.h                  |  32 +++
 9 files changed, 280 insertions(+), 3 deletions(-)
 create mode 100644 drivers/usb/host/xhci-snps.c
 create mode 100644 drivers/usb/host/xhci-snps.h


base-commit: 97fa5887cf283bb75ffff5f6b2c0e71794c02400
-- 
2.28.0

