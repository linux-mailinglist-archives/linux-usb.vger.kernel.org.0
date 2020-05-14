Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24641D34E1
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgENPTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:19:04 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:3694 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgENPTD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589469543; x=1621005543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=W6BQ6mxoNRUm2J3Dfm7jT8zQ6cFnZYAQRLmbegyRkTA=;
  b=OqznM+AgK4fF1giE9atpda2sAR7PfEf/0nxzhzTrmZ9KxrdEC1Z1nAZT
   hKykZGCZGeLoEZyA796hcZbbGWkLiAQcjAPnZ0MNNfF3oLKJW7jg/wtmt
   qNfW37hjHTJfdbEXzipWXp4/WvyCeeHQdTcljvh+BTqJnC++8YcN89Kh4
   OAVIj0jY5xEU9B+T3Cm1fz28N7DHuJBSw+jceA8ho9naa8/UYBydCwpjN
   in6YyqfAzFLKdrGrwmT53Fsva/4HkhDlu8bZzy+v4iO96BC4xOfyVYhh5
   k2rZMTx6yOtRApExn8KtxuSAyq2dsO8N+f1VFkY+kxtgsEtxFnrCRyV97
   A==;
IronPort-SDR: Fk+0sB9yuk1N8IuygQd/bDxSuq/YoMwFPFC5/6BCZ6GIzBhDg4poK9xuchJ8WZ+Nu7CYf1CIfm
 wNymDxOlRnhOeY6JlKPPriIT6dEnpO5H3gMyfranDLp33GTmgDK0y9R3qwDbLs/sbAmsF7/hKG
 oNad/vNmaOvaE0luPASTibB6vBZLJP/Ojyis3ZCO6dRSgz6clBJOFkfwAj3XK5CTA7x4S7Ctiu
 4FN0A17IvspISZunQWDbStjT6qmmsp98urYcCHxpe5n1SynMNhnzGh670wpoMlQkMIG3z8WRS4
 mTk=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="76658391"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 08:19:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 08:19:02 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 08:19:05 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 6/7] staging: most: usb: use macro ATTRIBUTE_GROUPS
Date:   Thu, 14 May 2020 17:18:51 +0200
Message-ID: <1589469532-21488-7-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
References: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
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

 drivers/staging/most/usb/usb.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index c3a7e71..43f535f 100644
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

