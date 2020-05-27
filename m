Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD931E3D34
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388510AbgE0JGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:06:40 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:3417 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388359AbgE0JGj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 05:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590570399; x=1622106399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ECRnde2nGDyoF30q+Dp+0Em2TFoYB54Q32T69glwsBc=;
  b=gd7PE5i0BA0HEyWAw2hgSNOpdIpHa5m1sQIiNcFhVGVZPuq3tD111i2K
   6Qe7Zc5aDi8kMstLAJ9wcZClJCqRt241hNOZSFhBK05VaIcyrMScGbWtc
   vGoc3KlOR/3WdoIFuOF5S5ZqfQAxZ7IVBpWAKThcxZDcEzWsD1u1i1U2t
   oynMpyFi5kPIoxYfwt8FoTh9cvoDOGaQ/1swpkOrQwOS/u4oq0cbNWaae
   QdZlgEAYFV0gbcfaEljI87FxosGNsqVebQnqigT2Qc5e9ck9KikVQ/ihg
   bYZS4d0LN3x9Orhl0BUkpY9n6kWHcrWKJ/WhbPVsUGN0l41KxRLglWt31
   w==;
IronPort-SDR: mtQHI88dzA2lmLkJL8wujurL9HgaWyXvXOPk0ZNSDo1cL9ut6l3hApizLO2FYbf6tgpqYbLbch
 6y++L7WeWglQU2L2MO5DpfROhjsaCIicMnuy4beIqBsFWd7aZgTuHwKri7I+2GUDcRyLKG4OeV
 BVekcrh/iXUlshR/ErP5tS5rGug7bCQVu74KUEPME33z5rWuQrPRzS9sqCMM7cqeNR3eHW9zET
 vmn7/aXmLLZWg8yPMloEp7BTczhRdQDMZpg3PNV6lGX/7QN5l/hQUPJP2CBWrgniGB9uuQOG+4
 lHE=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="77955214"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 02:06:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 02:06:38 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 27 May 2020 02:06:37 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 06/10] staging: most: usb: don't use error path to exit function on success
Date:   Wed, 27 May 2020 11:06:23 +0200
Message-ID: <1590570387-27069-7-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
References: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch makes it transparent whether the function is exiting
with an error or successful.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/most/usb/usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 534825f..03318de 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -519,13 +519,13 @@ static int hdm_enqueue(struct most_interface *iface, int channel,
 			"URB submit failed with error %d.\n", retval);
 		goto err_unanchor_urb;
 	}
-	goto unlock_io_mutex;
+	mutex_unlock(&mdev->io_mutex);
+	return 0;
 
 err_unanchor_urb:
 	usb_unanchor_urb(urb);
 err_free_urb:
 	usb_free_urb(urb);
-unlock_io_mutex:
 	mutex_unlock(&mdev->io_mutex);
 	return retval;
 }
-- 
2.7.4

