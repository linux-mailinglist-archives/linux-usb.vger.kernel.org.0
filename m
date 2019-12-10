Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5247E118E43
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 17:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfLJQza (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 11:55:30 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45890 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727535AbfLJQz3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 11:55:29 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBAGtSRd106939;
        Tue, 10 Dec 2019 10:55:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575996928;
        bh=u5UAvfjh0PLFujv2s960GAVcGZghF86VQDi782BiUfY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gv/lCbGhfFQhlgrLsAts1e7h9CnqhCtL3XjIGVcWmISVC5KYNYZE0ODUM4Ri9K1fL
         U2ckHRNTp1A+WByX967NqZS7+EwJSrKpeFW9xZWNS4ZkRvq2YNhbzSRX8GSsebJp3P
         f9uo0oSyTOGA21Wnvu+J2BOjRZ9NuAeUOSE+rASc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBAGtSc1115891
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Dec 2019 10:55:28 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Dec 2019 10:55:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Dec 2019 10:55:28 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBAGtSPG006664;
        Tue, 10 Dec 2019 10:55:28 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH 2/2] usb: musb: Fix a possible null-pointer dereference in musb_handle_intr_connect()
Date:   Tue, 10 Dec 2019 10:54:54 -0600
Message-ID: <20191210165454.13772-3-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210165454.13772-1-b-liu@ti.com>
References: <20191210165454.13772-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jia-Ju Bai <baijiaju1990@gmail.com>

In musb_handle_intr_connect(), there is an if statement on line 783 to
check whether musb->hcd is NULL:
    if (musb->hcd)

When musb->hcd is NULL, it is used on line 797:
    musb_host_poke_root_hub(musb);
        if (musb->hcd->status_urb)

Thus, a possible null-pointer dereference may occur.

To fix this bug, musb->hcd is checked before calling
musb_host_poke_root_hub().

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 15cca912c53e..5080fc6a0808 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -794,7 +794,8 @@ static void musb_handle_intr_connect(struct musb *musb, u8 devctl, u8 int_usb)
 		break;
 	}
 
-	musb_host_poke_root_hub(musb);
+	if (musb->hcd)
+		musb_host_poke_root_hub(musb);
 
 	musb_dbg(musb, "CONNECT (%s) devctl %02x",
 			usb_otg_state_string(musb->xceiv->otg->state), devctl);
-- 
2.17.1

