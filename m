Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 142B612733E
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 02:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbfLTB4H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Dec 2019 20:56:07 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36908 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfLTB4G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Dec 2019 20:56:06 -0500
Received: by mail-lj1-f193.google.com with SMTP id u17so8328322lja.4;
        Thu, 19 Dec 2019 17:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pgbIh7lwkHLw4khG+LwRKJ/ws2LpD6VUw2/IbO5+/Nw=;
        b=eTeJGLrAr1ByGFabRprnOr3BIfZS1AYj8GJCY9Z05mLTFImfdJjzTlHQJJoaaaJzAH
         PQAIjpRChbWiEtzG5T/idStyw9nJR4lUQPNYWnuSKCXBTLIKegqWLNdCGYsLUFSEfoVZ
         KL2/aNeZMXItnUlD/VeQxj+HP6eZTrG9uZrrz7pKdiM1Yy5kmYm2b/rejGrA/r5SUY/z
         3GdUl/FBTbdhoj6WU5bABD2VuRbjPj06LhP2ohxtxST8rBY4srfv+YrJjeMSB0kh+j67
         UAyRrlMJJh593NRp24qnOv/SDJPMB6EsJ2P7OIx5FEUotDSt7h5mrOljMhlcAdqHqQHC
         sn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pgbIh7lwkHLw4khG+LwRKJ/ws2LpD6VUw2/IbO5+/Nw=;
        b=rJhzyq2WVonkr9SqJpIDuFOhtl/klVVmz7u/PbKWBEyTbgsY7Am28/2/9Mn5QNtaH8
         hVJyLIXOnm17J6u5eIf/KQ9oKxoT255UEW5htwUaIG4RRwJbtX4LBgLltmZ/H5cJkOle
         26rToRmQm21lxZXIbYnqocCnxKRPAnKalhVDVL3dMwoJHLiFwJCwJX8T3f6e/H/1duSZ
         T6Sja1wNbZtZICv7TYcYrco4O5hp5kCrodiwvmFkjOEAMk88fspQMZe21OBdu1nYKHR3
         qWEq42RfvSh5zaQF3qmyre42e9rs4QEMaLiMFgQDuLse7pqc9qE9/g0mxsVBjVvPePWI
         oNig==
X-Gm-Message-State: APjAAAWqyvaiEn2XmRKrAiUGJ+xkZepi/P1M8DP8oXYhJkCm2lK5uKnn
        v5r/R8vXbiH7GXILW4FxFatsjPFK
X-Google-Smtp-Source: APXvYqwWTkpFmeIGUjzzd8xlzlOFxOcislXsgF6WPCEnSGZTXe5uFTFdCPTctS2ohimP3L9TKZAeWw==
X-Received: by 2002:a2e:8699:: with SMTP id l25mr8316092lji.159.1576806964456;
        Thu, 19 Dec 2019 17:56:04 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m13sm3270901lfo.40.2019.12.19.17.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 17:56:03 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] NVIDIA Tegra USB2 drivers clean up
Date:   Fri, 20 Dec 2019 04:52:28 +0300
Message-Id: <20191220015238.9228-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

This patch series brings the NVIDIA Tegra USB2 PHY driver into a better
shape by refactoring code to match upstream standards, the ChipIdea/Tegra UDC
driver also gets a minor update. Please review and apply, thanks in advance!

Changelog:

v2: - The "usb: phy: tegra: Hook up init/shutdown callbacks" patch was
      updated and now it does a better job in regards to checking whether
      PHY is initialized before it is started to be used and whether there
      is a double init/shutdown. This allows to factor out the ChipIdea's
      driver change into a separate patch, which was requested by Peter Chen
      in a review comment to v1. In a result there is this new patch:

        usb: chipidea: tegra: Stop managing PHY's power

    - Added few more new patches:

        usb: phy: tegra: Use generic stub for a missing VBUS regulator

      I noticed that VBUS regulator usage could be cleaned up a tad as well.

        usb: ulpi: Add resource-managed variant of otg_ulpi_create()
        usb: phy: tegra: Use devm_otg_ulpi_create()
        usb: phy: tegra: Use u32 for hardware register variables

      These patches are made in response to review comments that were made
      by Thierry Reding to v1.

      I also noticed that phy_tegra_usb isn't getting auto-loaded while it
      should be. This is fixed in this new patch:

        usb: chipidea: tegra: Add USB_TEGRA_PHY module to driver's dependencies

Dmitry Osipenko (10):
  dt-binding: usb: ci-hdrc-usb2: Document NVIDIA Tegra support
  usb: phy: tegra: Hook up init/shutdown callbacks
  usb: phy: tegra: Perform general clean up of the code
  usb: phy: tegra: Use relaxed versions of readl/writel
  usb: phy: tegra: Use generic stub for a missing VBUS regulator
  usb: ulpi: Add resource-managed variant of otg_ulpi_create()
  usb: phy: tegra: Use devm_otg_ulpi_create()
  usb: phy: tegra: Use u32 for hardware register variables
  usb: chipidea: tegra: Stop managing PHY's power
  usb: chipidea: tegra: Add USB_TEGRA_PHY module to driver's
    dependencies

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt  |   4 +
 drivers/usb/chipidea/Kconfig                  |   1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c          |  15 +-
 drivers/usb/phy/phy-tegra-usb.c               | 740 ++++++++++--------
 drivers/usb/phy/phy-ulpi.c                    |  48 +-
 include/linux/usb/ulpi.h                      |  11 +
 6 files changed, 462 insertions(+), 357 deletions(-)

-- 
2.24.0

