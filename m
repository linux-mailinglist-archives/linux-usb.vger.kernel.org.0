Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D0E49CBF8
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241989AbiAZONy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:13:54 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:61266 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241986AbiAZONx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206433; x=1674742433;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h9uKGDEePqxhV+9k6NLmOvXh3L1uCZuZIqCxB0HU4MY=;
  b=E+qCKLypyZlBl2p5AW+j7plrYvWdPjB/FKJPIZZaMB3r3v5U8YGpaSIY
   /sQV4ccWg1Rh8nab1w2e5pRmeLoMBVanOd6ZsQ1UyKUpZzLmQPdlOeSaM
   IW1H/2gG3MJow865LNwMs6nPleTwgj+r9z7umhhx70ky728G7SqC9HTJp
   3EXFnZS3dSssFlLL7VPjtVJVV8BW0XjTPWNCHLpMZwQLxvW6d0Z2/gwq1
   RyV/t84y5KJM3eTtFOCVzW/tmqkN0cKrx8mj5QkC5u+J+jjbZhcS1d6Te
   bxa8sitHorC8BjGDoFVK+JDvk6Eo+ojkc1u3VXNMN66J9TKLZBZ4sEoPV
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725566"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 26 Jan 2022 15:13:51 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 26 Jan 2022 15:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206431; x=1674742431;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h9uKGDEePqxhV+9k6NLmOvXh3L1uCZuZIqCxB0HU4MY=;
  b=lKJBWu3Ea7SthjidFwWEuHgREBlAY28zqVSxQJFPlgFvMyt2Z4+xaQZL
   ltAlDSpOGfys3IpP8Xnrp9oq8LL86gJMaUs/xQfFVYMGEFXRIZpwb7Fy7
   C/xywlVBl8S8NoTBhpbm/c3ZoHkRO7O6t8KIyEMleSR/zPTWFZ9bX9lk+
   FxD7YRBEoOJAvdXr03+yQRHySj6jDjJBFKoOPm9PUScyCvgMTQfvBV1R8
   o+Pw8LOMaqnprvkJWuxjk/w1cvWwNOW4WAr6p3/dt52/wfcQCe1h2P109
   juhzmZqjtUJtuEfvbpd0jQpy3knmVARXqiqLW5NhysU66jGM8gZhmutGN
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725563"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BF2CD280075;
        Wed, 26 Jan 2022 15:13:50 +0100 (CET)
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
Subject: [PATCH v4 0/4] i.MX8MP: more USB3 glue layer feature support
Date:   Wed, 26 Jan 2022 15:13:36 +0100
Message-Id: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

Thanks for the feedback on v3 [1].

This patchset aims to support flags for e.g. over-current active low or port
permanantly attached which are provided in the USB3 glue layer.

In v4 the patchset depends on Lucas' i.MX8MP power-domains patchset [2].
Because of that the 'phy' clock usage can be dropped, as now power domains
take care of the clocks. Due to powering up/down the glue layer settings
will have to be reapplied during resume.

Changes in v4:
* Depends on Lucas' i.MX8MP power-domains patchset
* removed 'phy' clock usage from dwc3-imx8mp.c
* Reapply glue layer settings upon resume

Changes in v3:
* Rename existing member for clarity
* Moved feature implementation from phy-fsl-imx8mq-usb.c to dwc3-imx8mp.c

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20220118131626.926394-1-alexander.stein@ew.tq-group.com/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20220119134027.2931945-1-l.stach@pengutronix.de/

Alexander Stein (4):
  usb: dwc3: imx8mp: rename iomem base pointer
  dt-bindings: usb: dwc3-imx8mp: Add imx8mp specific flags
  usb: dwc3: imx8mp: Add support for setting SOC specific flags
  arm64: dts: imx8mp: Add memory for USB3 glue layer to usb3 nodes

 .../bindings/usb/fsl,imx8mp-dwc3.yaml         | 31 +++++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  6 +-
 drivers/usb/dwc3/dwc3-imx8mp.c                | 76 +++++++++++++++++--
 3 files changed, 100 insertions(+), 13 deletions(-)

-- 
2.25.1

