Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4192513C2B0
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729093AbgAON0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:03 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51332 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnpU099989;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=g9McmvHlwW3mj2yAcDaVFA3nqtYkS4Mh1U3vQqnU0ss=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hTqLAOwmaSgE1MQOz4l9pAR1wgIiB1ZV9WCcWFtFPJbZZtt4ztwufFD3YCGF2VkXa
         6249a1mm/udg8hdH1mmaI3vQMpKmBNCzc1SnEImmNr2qmjfgt+JFMJsPntXZ6kQEp9
         iiLkFHR92/VJaZjPodzZQsnB1noGYNJRt+SIX05Y=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPmRS110410
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:48 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:48 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm30066537;
        Wed, 15 Jan 2020 07:25:48 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 02/25] usb: musb: sunxi: propagate devicetree node to glue pdev
Date:   Wed, 15 Jan 2020 07:25:24 -0600
Message-ID: <20200115132547.364-3-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mans Rullgard <mans@mansr.com>

In order for devicetree nodes to be correctly associated with attached
devices, the controller node needs to be propagated to the glue device.

Signed-off-by: Mans Rullgard <mans@mansr.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/sunxi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index 832a41f9ee7d..a72665fbf111 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -781,6 +781,8 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	pinfo.name	 = "musb-hdrc";
 	pinfo.id	= PLATFORM_DEVID_AUTO;
 	pinfo.parent	= &pdev->dev;
+	pinfo.fwnode	= of_fwnode_handle(pdev->dev.of_node);
+	pinfo.of_node_reused = true;
 	pinfo.res	= pdev->resource;
 	pinfo.num_res	= pdev->num_resources;
 	pinfo.data	= &pdata;
-- 
2.17.1

