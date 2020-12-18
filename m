Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3FD2DE1AE
	for <lists+linux-usb@lfdr.de>; Fri, 18 Dec 2020 12:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733213AbgLRK7W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Dec 2020 05:59:22 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37658 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgLRK7V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Dec 2020 05:59:21 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BIAvexf017453;
        Fri, 18 Dec 2020 04:57:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1608289060;
        bh=+7qYS0CHkKfduwzX3WlpJ3HdL712B33p+kG13vumqIQ=;
        h=From:To:CC:Subject:Date;
        b=wPrcWv4QDQ3ny7sMm5o238KPSittvbVYCkPp72BXyhHH5BgkwRLuzEBE80hBo50Ee
         shZukmzD4ApKiIDexoJy5P6xkqmke0wKe+e0+5RNTmeVGko0ye4WlOQgHsDLQXTN3g
         EDmiEwlK8aoUcFrzopqnwT3HHhD/Iq1c9C/3zB5I=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BIAveQc049989
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Dec 2020 04:57:40 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Dec 2020 04:57:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Dec 2020 04:57:40 -0600
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BIAvcRl130470;
        Fri, 18 Dec 2020 04:57:38 -0600
From:   Roger Quadros <rogerq@ti.com>
To:     <peter.chen@nxp.com>
CC:     <pawell@cadence.com>, <a-govindraju@ti.com>, <nsekhar@ti.com>,
        <linux-usb@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH] MAINTAINERS: Update address for Cadence USB3 driver
Date:   Fri, 18 Dec 2020 12:57:36 +0200
Message-ID: <20201218105736.17667-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Updates my email address for Cadence USB3 driver.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d7784a5cb88..3093217442d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3882,7 +3882,7 @@ F:	drivers/mtd/nand/raw/cadence-nand-controller.c
 CADENCE USB3 DRD IP DRIVER
 M:	Peter Chen <peter.chen@nxp.com>
 M:	Pawel Laszczak <pawell@cadence.com>
-M:	Roger Quadros <rogerq@ti.com>
+R:	Roger Quadros <rogerq@kernel.org>
 R:	Aswath Govindraju <a-govindraju@ti.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

