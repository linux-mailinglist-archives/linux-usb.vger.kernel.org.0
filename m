Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57081D2133
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 23:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgEMVgs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 17:36:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43566 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729411AbgEMVgr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 17:36:47 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04DLalkI034590
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 16:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589405807;
        bh=yrzh4mURP5pIjaibmW9WWMOpSSXVx3gJFnSCL5mSUD0=;
        h=From:To:CC:Subject:Date;
        b=XvTIeH4TgzrnFMewDGsuYXG6UvQOm+wYNafpgSkKuWH+YP/4ITMR59At4QFjeNPA1
         MYcQypJvEAEkn7sSRTl40cKkcBwJmgKOdvgliRzKeURw1Q2XTV21lB1sQa7PC19jEJ
         eSMpSms6qCKpIpYjPLgCek4OOLMHOhCNmG3OYKu0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04DLalCG076708
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 16:36:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 13
 May 2020 16:36:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 13 May 2020 16:36:47 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DLal3n066635;
        Wed, 13 May 2020 16:36:47 -0500
From:   Bin Liu <b-liu@ti.com>
To:     <linux-usb@vger.kernel.org>
CC:     Bin Liu <b-liu@ti.com>
Subject: [PATCH] usb: usb_wwan: do not resubmit rx urb on fatal errors in rx callback
Date:   Wed, 13 May 2020 16:36:46 -0500
Message-ID: <20200513213646.21649-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_wwan_indat_callback() shouldn't resubmit rx urb if the previous urb
status is a fatal error. Or the usb controller would keep processing the
new urbs then run into interrupt storm, and has no chance to recover.

Fixes: 6c1ee66a0b2b ("USB-Serial: Fix error handling of usb_wwan")

Cc: stable@vger.kernel.org
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/serial/usb_wwan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index 13be21aad2f4..4b9845807bee 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -270,6 +270,10 @@ static void usb_wwan_indat_callback(struct urb *urb)
 	if (status) {
 		dev_dbg(dev, "%s: nonzero status: %d on endpoint %02x.\n",
 			__func__, status, endpoint);
+
+		/* don't resubmit on fatal errors */
+		if (status == -ESHUTDOWN || status == -ENOENT)
+			return;
 	} else {
 		if (urb->actual_length) {
 			tty_insert_flip_string(&port->port, data,
-- 
2.17.1

