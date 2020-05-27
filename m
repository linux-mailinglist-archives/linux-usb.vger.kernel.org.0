Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12151E3D31
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388506AbgE0JGi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:06:38 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:1493 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388374AbgE0JGh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 05:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590570397; x=1622106397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=lsUcpKtRbtwIVfqJipCwSMyz8FtKI9qpl8FjLw2PMSo=;
  b=y2cDPEjCS101OJjnpNFo8cdaF/DYHLpKmtgJwMN36HfpLDwuJT/9acfD
   X+TWQqCJ24WFMOi6LLf9m/nPL6YoFa1T2SvRDerflwXrio3Gi1NDuYFKb
   evuSnq5vxN7tsSa/1r7nv7c7Yfl9Ljd2Va+AMTBMn25rmxt88zJmBgI9m
   J0beW2vYAoUU3leKDKIc/OhXzumao0rUs3CX43xB3RFfFj4jW4qMT9eR+
   2rkPlDZaIZISx5zooTlx0mHYJucax1yIyukSnde+e/hnT7L0vlAYXtqHW
   Y6QtJMOplrmnwXkfRj88mhmjaND/1no9oYRN6js3aAO94LK1NVYqxlJ1k
   w==;
IronPort-SDR: 1j0tLSS/i3BabXnffbGGi6SM6o6z71ACMDogRbKzxjDqWAtCuy3pq/HXFq6eCjcVpCwJTIF7Y/
 47w32dNCL4EcicfFuV5bQcSenV70Wj0LtwnifnVNxMbA5gbqgtN9X9xUsS9VviP94bZGpR5Z4k
 GJlLy4E7mAjXxN72YX0NG/K7oVPKD3n91KJdM/vtuT2r+7uw3wmGSaSzuTE2YZvtY70PCFKGTs
 V6ByKCBsRRI4QZI1oOwwGXjqrMQVdmeE6P1eAUbBa0qLeX0QWmaEiXaVH91yUcOtHm6xa/QKE5
 KpI=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="77204595"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 02:06:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 02:06:36 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 27 May 2020 02:06:35 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 04/10] staging: most: usb: return 0 instead of variable
Date:   Wed, 27 May 2020 11:06:21 +0200
Message-ID: <1590570387-27069-5-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
References: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch returns 0 instead of variable in case of invalid parameter
has been passed to function to increase readability.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/most/usb/usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 64005b6..a605e0f 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -192,12 +192,12 @@ static inline int start_sync_ep(struct usb_device *usb_dev, u16 ep)
 static unsigned int get_stream_frame_size(struct device *dev,
 					  struct most_channel_config *cfg)
 {
-	unsigned int frame_size = 0;
+	unsigned int frame_size;
 	unsigned int sub_size = cfg->subbuffer_size;
 
 	if (!sub_size) {
 		dev_warn(dev, "Misconfig: Subbuffer size zero.\n");
-		return frame_size;
+		return 0;
 	}
 	switch (cfg->data_type) {
 	case MOST_CH_ISOC:
-- 
2.7.4

