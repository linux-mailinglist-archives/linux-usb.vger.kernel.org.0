Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38111D2BD3
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 11:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgENJxG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 05:53:06 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:51742 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENJxF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 05:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589449984; x=1620985984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=XQTa58qUeJuhzxM/FNXFxnIbhZJuNUPuS+qW9gZgjBI=;
  b=hCe1GCstZYBF5NMXnZrHiE5bj2aNaG2+j7ZYcLvKY/zN37vdMugZAHjH
   cefa1WLP6heDZbwJTrf3wAVajzyfm0N31bwOd8NM/uzB0M/WtCQLDhBS7
   Vz13kYQ77Sd+F5kaB34M2pzoJz21fW46R1noGyAVKLBqJ5dFGF0RhpaIP
   FlLEiWmtKfE5oN/2+yKFiM6X/gTB1WPrdecZLxAi3JJHGEdILm/S84NZH
   gJl4lMhU1EnDdFdyJ8oiKB/ecspYNWcQya+W0JEpnhUrh5U9Km2fL3go0
   OQY351kZtjaXoge5axURrptpY1JENBvu7YsCxShPWThmAHFyGdQRCbVW+
   g==;
IronPort-SDR: gqJo9s9O/+ithtdDTS78AXTAjvJ8Cv0eJFpfPrb5N4PToXTmJkkCJNcwM88I4PCpkoX/P9+FAg
 NUEmcEOEor1YOuTA9rklfY2H/dwto4tn8HSX+VOkSUMP0D+saz9UoQ9Dl7tVtKkXOVU4C06OGl
 aLOzWvQkyXxLa2uddHmL7zqEuzO2gM1E79apkKB3sX7JPJjGDIb8zfLdTK40yaI93zpFj5wIxs
 6tjBcGzN5LmfjKXVg/8GrSMTAQtJNhu/VMcuWxTSPPRrvdYBjcV02JlMe1GTZGqEF2B1zyN9Hd
 Pi0=
X-IronPort-AV: E=Sophos;i="5.73,390,1583218800"; 
   d="scan'208";a="76630477"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 02:53:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 02:53:03 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 02:53:02 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 3/8] drivers: most: usb: remove reference to USB error codes
Date:   Thu, 14 May 2020 11:52:51 +0200
Message-ID: <1589449976-11378-4-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
References: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch removes the reference to the driver API file for USB error
codes.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:

 drivers/most/most_usb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index 0846b38..49d0b40 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -477,8 +477,6 @@ static void hdm_write_completion(struct urb *urb)
  * controller use to indicate a transfer has failed because of device
  * disconnect.  In the interval before the hub driver starts disconnect
  * processing, devices may receive such fault reports for every request.
- *
- * See <https://www.kernel.org/doc/Documentation/driver-api/usb/error-codes.rst>
  */
 static void hdm_read_completion(struct urb *urb)
 {
-- 
2.7.4

