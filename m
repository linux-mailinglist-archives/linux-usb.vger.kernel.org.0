Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E39A24ACF87
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 04:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346076AbiBHDR1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Feb 2022 22:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344818AbiBHDR0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Feb 2022 22:17:26 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98ADDC043188
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 19:17:25 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso16117402oon.5
        for <linux-usb@vger.kernel.org>; Mon, 07 Feb 2022 19:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzxO3HcmPa0lMosAwo+8/h9UfVKa+wQzmEj2wnHSziM=;
        b=ShbdY2mbI1d4/3jPV8kyfnQaqrRnf7w8sMMGMnPKKSfhl7XeZDCV8PZsSLkbfN0yA/
         2e7I8B5Mm6/VLL6Zb4zQCctE/JRQAXkKJxPga5ArXu+Gj4Ef+8C6HWr3XPviQhXu1SRD
         wnMC3X/BZ40oFcSu3qWFj/P9oFNwBCLiEwBFlGVaX8jEYQbLrZUr6MN3fJDjwCd97LvT
         tEblTdZiDr5JmdL1rsFNC8Ex+U4g8m7i71BV1o4+1XfpXJDyi+uRn7Dn4vaIonYrpMlh
         cQHV13m6ut9R7CHQDaH6qXcWL/cDw7VchzM0M2FYxncmLTnnXoWoxuwgjdDqvIsNn3D1
         w5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzxO3HcmPa0lMosAwo+8/h9UfVKa+wQzmEj2wnHSziM=;
        b=QSizGErv2DuJjfSyYykv8CUM3ItnWdyV2GqFRaL/Tv55cvWhofVX6gD0BL3bBSHFSG
         NzGifN69PhlSrgDuUVckrqEqVTNiPVekdBjo4p7ODtBEPH7qi5PtZLXdBMOdNlc4UzGW
         D1oX8/359BkJSfInL4HBxkcmAVblmlU9VMp4iOR85dtIFYko5EHnzebtiRYkXkjLPLsq
         eknsTyP+sB6NEC7fS80NyZs28X+T9Kv45xvMkugmPAgmtAKSVhlYqvHNArEQakxY2p+u
         v5/VklF5KjiMjbCJxksxcaUwp2KD0iFvfMhh0LnyDpG4GDQXlx3pNDxBaPaJPEsVWkUQ
         HmFQ==
X-Gm-Message-State: AOAM532fJ694zqEYNssktvuKdU7WSx4TeD9rgQCJM1JGRz3bnM6OFkyG
        Aw5YY2pdMu32qQLZr+jYwB0jsQ==
X-Google-Smtp-Source: ABdhPJzLouZK+YvjCdY7PEwoHNqPNAf/lzh08xIFonIR59w/9SPltab4lT9JQAc1tvUJ1fu1RmQyxg==
X-Received: by 2002:a05:6870:1043:: with SMTP id 3mr705760oaj.239.1644290244935;
        Mon, 07 Feb 2022 19:17:24 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k3sm4763873otl.41.2022.02.07.19.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 19:17:24 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] typec: mux: Introduce support for multiple TypeC muxes
Date:   Mon,  7 Feb 2022 19:19:38 -0800
Message-Id: <20220208031944.3444-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series introduces a level of indirection between the controller's view of
a typec_mux/switch and the implementation and then expands that to support
multiple drivers.

This is needed in order to support devices such as the Qualcomm Snapdragon 888
HDK, which does muxing and orientation handling in the QMP (USB+DP) PHY and SBU
muxing in the external FSA4480 chip.

Included in the series is a the new FSA4480 driver. This is done to deal with
the renaming of the driver-side typec_mux -> typec_mux_dev.

Changes since v1:
- Omitted QMP changes from this series, as the muxing implementation needs a
  little bit more debugging.

Bjorn Andersson (6):
  device property: Helper to match multiple connections
  device property: Use multi-connection matchers for single case
  typec: mux: Introduce indirection
  typec: mux: Allow multiple mux_devs per mux
  dt-bindings: usb: Add binding for fcs,fsa4480
  usb: typec: mux: Add On Semi fsa4480 driver

 .../devicetree/bindings/usb/fcs,fsa4480.yaml  |  72 +++++
 drivers/base/property.c                       |  85 ++++--
 drivers/usb/typec/bus.c                       |   2 +-
 drivers/usb/typec/mux.c                       | 261 +++++++++++++-----
 drivers/usb/typec/mux.h                       |  12 +-
 drivers/usb/typec/mux/Kconfig                 |   9 +
 drivers/usb/typec/mux/Makefile                |   1 +
 drivers/usb/typec/mux/fsa4480.c               | 220 +++++++++++++++
 drivers/usb/typec/mux/intel_pmc_mux.c         |   8 +-
 drivers/usb/typec/mux/pi3usb30532.c           |   8 +-
 include/linux/property.h                      |   5 +
 include/linux/usb/typec_mux.h                 |  22 +-
 12 files changed, 595 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
 create mode 100644 drivers/usb/typec/mux/fsa4480.c

-- 
2.33.1

