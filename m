Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7FB1D31B0
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 15:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgENNqo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 09:46:44 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:45731 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgENNqn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 09:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589464003; x=1621000003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=cPkJ3klY44IvPSuqB9e4DTMxpg8N94GY9+FBzes9a9s=;
  b=WjHdCtmI96yxrFvclqwOVC2Nhpi+b/NKgx4ZuW5f+nYx/esPu79AVe21
   EA+rEB34ALjhZHd1tLQh/jxPx41tQEy5fVOGKhcYP6oIa4qx+LO5X+HRR
   nEKGuBugwKqCDC+VPYp36X35WDuPwkgzM986qy0lRyYOVO1AMCjDma/Yc
   1kZBY6A3O62cD25yk6Yk/GUWmI7vT0JEZN3ymU/NbqOEItIN9bd/8hEg4
   tqfhOkmT0hK2dV5vZmBr6Zsn+JmBkhQ1kV3eMDQehGI7LNBpIJ10saaNw
   t4f0H5SNDvncsa5q2Hr935l7h3EA8JmUnC2ZzOx5B26Pi/1MCzwsjcHzL
   g==;
IronPort-SDR: rIzHc0U7/tkuyZY2pSjQ0eIZA0lqlbb36BUDikt5xnzjohAVFzMxhcVkvmGFAn4hlTeYbCdqoR
 1OfFTP+eqT9V44Ynt8hUANCIiB7nGZCimuskGBe3TSjYgowbCevBN/CvgOxntlBBVxnqqf13SS
 D8wkSRhas8jkLESwPoALtXrjQ8VRjHiLoR3VWZlzK3qqy3tX/jbaucoiEYTgdYb9ZMqJLDDn6n
 xIs+39SZX5ewtP9RCNXpw3XxyVJlH2tmezPadCdCRh8qgmGPoNLDPYNSoNlVby4e7KreHM2AbF
 GrQ=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75267250"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 06:46:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 06:46:40 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 06:46:42 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 6/7] staging: most: usb: use macro ATTRIBUTE_GROUPS
Date:   Thu, 14 May 2020 15:46:28 +0200
Message-ID: <1589463989-30029-7-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
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
 drivers/staging/most/usb/usb.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 882f59e..a26e9b1 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -1000,14 +1000,7 @@ static struct attribute *dci_attrs[] = {
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
@@ -1160,7 +1153,7 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 
 		mdev->dci->dev.init_name = "dci";
 		mdev->dci->dev.parent = get_device(mdev->iface.dev);
-		mdev->dci->dev.groups = dci_attr_groups;
+		mdev->dci->dev.groups = dci_groups;
 		mdev->dci->dev.release = release_dci;
 		if (device_register(&mdev->dci->dev)) {
 			mutex_unlock(&mdev->io_mutex);
-- 
2.7.4

