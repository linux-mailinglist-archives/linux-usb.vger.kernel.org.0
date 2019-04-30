Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38FA6FC0C
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfD3O75 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:59:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41826 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfD3O7o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:59:44 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UExhl8115325;
        Tue, 30 Apr 2019 09:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556636383;
        bh=Csc3XJYNGiQsPbSGWqKjkQ4XMQ7gfjP+pEmSkLDDBsA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=l63usmv4ncspyYSB1Xvvd05edSbLqAxMENZhEgnD+s6gXvtfHv0M3TwUpgSR+RdgU
         5brdy60mjjBdK3llh6pxenm9ve9bJIAE4ko9gFK52N2FIT3KkpvM9aXfszl6PEARZA
         1rOnlQU+sa8C1v9mOy+QU+Z8Px+xaLIk0+4f40BM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UExha4045790
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 09:59:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 09:59:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 09:59:42 -0500
Received: from uda0271908.am.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UExgrI071248;
        Tue, 30 Apr 2019 09:59:42 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 0/6] musb patches for v5.2-rc1
Date:   Tue, 30 Apr 2019 09:59:42 -0500
Message-ID: <20190430145942.1128-9-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430145942.1128-1-b-liu@ti.com>
References: <20190430145942.1128-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are the musb patches for v5.2 rc1. There are all small fixes or
improvements. Please let me know if any change is needed.

There is one of the patches marked for stable. I will send it to stable
tree later after they get into v5.2 rc.

Thanks,
-Bin.
---

Kefeng Wang (1):
  usb: musb: dsps: Use dev_get_drvdata()

Paul Cercueil (3):
  dt-bindings: usb: Add usb-phy property to the jz4740-musb node
  usb: musb: jz4740: Let the platform probe the PHY
  usb: musb: jz4740: obtain USB PHY from devicetree

Samuel Holland (1):
  soc: sunxi: Fix missing dependency on REGMAP_MMIO

Tony Lindgren (1):
  usb: musb: omap2430: Add support for idling phy when musb is idle

 .../bindings/usb/ingenic,jz4740-musb.txt      |  8 ++++++++
 drivers/soc/sunxi/Kconfig                     |  1 +
 drivers/usb/musb/Kconfig                      |  2 +-
 drivers/usb/musb/jz4740.c                     | 19 +++++++------------
 drivers/usb/musb/musb_dsps.c                  |  6 ++----
 drivers/usb/musb/omap2430.c                   |  6 ++++++
 6 files changed, 25 insertions(+), 17 deletions(-)

-- 
2.17.1

