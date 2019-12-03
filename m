Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 883C210FBFC
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 11:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfLCKrK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 05:47:10 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4759 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfLCKrJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 05:47:09 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5de63d300000>; Tue, 03 Dec 2019 02:47:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 03 Dec 2019 02:47:09 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 03 Dec 2019 02:47:09 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Dec
 2019 10:47:08 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 3 Dec 2019 10:47:08 +0000
Received: from ubuntu.nvidia.com (Not Verified[10.19.108.185]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5de63d2c0000>; Tue, 03 Dec 2019 02:47:08 -0800
From:   EJ Hsu <ejh@nvidia.com>
To:     <linux-usb@vger.kernel.org>
CC:     EJ Hsu <ejh@nvidia.com>
Subject: [PATCH] usb: gadget: fix wrong endpoint desc
Date:   Tue, 3 Dec 2019 02:46:48 -0800
Message-ID: <20191203104648.29291-1-ejh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575370032; bh=i+YoYJgZKpTHJVaCLv5Tc3M44v3VWcXzjHq/E5ZpnhU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=fQEDc9l0Cu5XjCeazJZ+ByJnMmjBHqZfBiwxijWg6xuKMOIHGPRPn/XhrVS+8yono
         csVecjGKux5VoTEe1Yd27j5/Ykn98kEhSfn+u5a/nITk7kcBVS7jwu95XKPVrkF3UU
         E3Qfbq0V2/JtwQrYiObvZ/+5xGmgaNT9oEdsnyTShgX0ZgxVy5f+ztKMgSAdoYnSPd
         3tzSEcykFQFscMYU5X/r+2AsW/DwTkwH6j3USSJwoQN9/9ivGAjLF0u8M4ucrpwEsW
         wuIs+G10mVegxCzQSRIwjVFzfanbLg4v9p38d3knGzS0VQFwrkLYHmoTFDhBFm/4g0
         aTS1ZCpmrupyg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Gadget driver should always use config_ep_by_speed() to initialize
usb_ep struct according to usb device's operating speed. Otherwise,
usb_ep struct may be wrong if usb devcie's operating speed is changed.

Signed-off-by: EJ Hsu <ejh@nvidia.com>
---
 drivers/usb/gadget/function/f_ecm.c   | 4 ++++
 drivers/usb/gadget/function/f_rndis.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 6ce044008cf6..494fe4e38a65 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -623,6 +623,10 @@ static void ecm_disable(struct usb_function *f)
 
 	if (ecm->port.in_ep->enabled)
 		gether_disconnect(&ecm->port);
+	else {
+		ecm->port.in_ep->desc = NULL;
+		ecm->port.out_ep->desc = NULL;
+	}
 
 	usb_ep_disable(ecm->notify);
 	ecm->notify->desc = NULL;
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index d48df36622b7..0d8e4a364ca6 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -618,6 +618,7 @@ static void rndis_disable(struct usb_function *f)
 	gether_disconnect(&rndis->port);
 
 	usb_ep_disable(rndis->notify);
+	rndis->notify->desc = NULL;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.17.1

