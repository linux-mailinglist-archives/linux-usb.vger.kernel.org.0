Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C541D4950
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgEOJVV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:21:21 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:35489 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgEOJVU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589534480; x=1621070480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=a6Z7LMN67nPtLZ4WYyNxI9XFLMTeER1HZ/XZLuWEkJE=;
  b=CXmbAEot+kleRkFXVyGLOVeESEuo0PoBoqDI9M08lqmb79ngoRRpVB6/
   mVagAFDTwvw6ETq6pyiLyurzxkkpvD7WOcK7Iqu2r0dRUGXmBNrlnHn3t
   fQ3lNwlglw0vESyvJXB8ycBp6yHQCjfZOgJJYcRWn8WGUiDWzXc9uRlG0
   +adGfwBjM7ifWrAZL38QV8h8XAbVIK+XO0jDv+bZgJ72EMt7KlStNqt5G
   x1nAgODxKquDz98Aatx+hYSUnYxUPrYUdH+k+MbHrU4DsVinV8W+SMeCe
   w+QiVsbEZ/DqnLxSN473ZR+flLqfShKi478TNqOw8+rD9mQK1lKV3j4Kg
   w==;
IronPort-SDR: 6viEbcUuWD7KqWGpY7tBjOiHVaM1XLkEcHZzZA0xq37zEqUj9gTsyi8DVamSJ9THRmKmcODaoQ
 PEMOqp4Yg+wrIzkjObWm5z0wFo3isxCyhzWkAyCeAX1qdZNwF3YjJHHVJe8mMkLXVZw+SHqOmi
 v754o7x4YAchjOeu5MdxQvDx9Ibami8onv3W0zoa1HZUTsYnuIF3W2myGleIJxUbdTzSac/aeM
 geFgsuw+rIDQqOUNfpswsgJXIizAEM4VXNLI7TdqHhhupIOuIMMahRo8g7VH580v05UYEh7vXr
 KrQ=
X-IronPort-AV: E=Sophos;i="5.73,394,1583218800"; 
   d="scan'208";a="76781999"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 02:21:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 02:21:16 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 15 May 2020 02:21:15 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v3 6/7] staging: most: usb: use macro ATTRIBUTE_GROUPS
Date:   Fri, 15 May 2020 11:21:04 +0200
Message-ID: <1589534465-7423-7-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
References: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch makes use of the macro ATTRIBUTE_GROUPS to create the groups
instead of defining them manually.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
v3:

 drivers/staging/most/usb/usb.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 8995ed0..56b75e4 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -905,14 +905,7 @@ static struct attribute *dci_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group dci_attr_group = {
-	.attrs = dci_attrs,
-};
-
-static const struct attribute_group *dci_attr_groups[] = {
-	&dci_attr_group,
-	NULL,
-};
+ATTRIBUTE_GROUPS(dci);
 
 static void release_dci(struct device *dev)
 {
@@ -1065,7 +1058,7 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 
 		mdev->dci->dev.init_name = "dci";
 		mdev->dci->dev.parent = get_device(mdev->iface.dev);
-		mdev->dci->dev.groups = dci_attr_groups;
+		mdev->dci->dev.groups = dci_groups;
 		mdev->dci->dev.release = release_dci;
 		if (device_register(&mdev->dci->dev)) {
 			mutex_unlock(&mdev->io_mutex);
-- 
2.7.4

