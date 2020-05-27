Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2321E3D39
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388516AbgE0JGp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:06:45 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:1514 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388513AbgE0JGo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 05:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590570404; x=1622106404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=YT1p2jkhQjEOh+Toh8EnfM+hDVS9WGd+MEUj6fk8RGk=;
  b=fjPcjxOxYx1FUsfWj/Gp1g//FTt6Y1w9F7Xhr5zaN1CnXPzAqkkOYbJx
   QHmcaskLYWcmJAGO3EZnD2e5fB+fOlSmiQnT5lEFRXhyX7cooeDh77zes
   c6HlvOdbx6egLaMWetH4aOlVERwKK7tX7CXTgoqIZKojZ7dx1FxRqDYcA
   HNq3tPtIAzpJIEjtdR18CrVnWjxxa91KXbCnE+CfbYk/UAMLn45frqHTJ
   kYQum0jrHoR0MW43+CSLOFWtri95u0J4/egvud2r4KSgaPQNEHoapyeLs
   beQJnlx+11wtp75p72uf7MDiu32kcAm+V9gKWefoQSsbH03Wx2FFnv+3x
   A==;
IronPort-SDR: 1GoF4Q1UpYguWjtUqN+Lvi3TYgQf7dU2/KSUKFlEKneT6u6gclI+2jdMS4N7h4nVSjFdF1Vuje
 mO5el0pc51INc/7y+5WLGyXkfZtGFOQg3o0RPZKXiKHElRuD+l5OK0fJXf5T+2/6GD2gEGbFB6
 4ccrlF0uPzgJOXtCpJNINwY4BihGikXeg73ChEcC6n4DpyDfCCjt+2ZbX56Kr7K27Y1SeMxIQh
 AiVCQHcaRH/Mug4yiXSN7VZ4VKaQ1qd27VLH66XeiXrrs+dZBeYVpXmiSfjNyDjIj1Lrp+iA+L
 tg0=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="77204630"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 02:06:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 02:06:43 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 27 May 2020 02:06:42 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 10/10] staging: most: usb: use function sysfs_streq
Date:   Wed, 27 May 2020 11:06:27 +0200
Message-ID: <1590570387-27069-11-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
References: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch replaces function strcmp() with sysfs_streq() to compare
strings provided via sysfs.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/most/usb/usb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 1c4bdb8..df5876c 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -808,7 +808,7 @@ static int get_stat_reg_addr(const struct regs *regs, int size,
 	int i;
 
 	for (i = 0; i < size; i++) {
-		if (!strcmp(name, regs[i].name)) {
+		if (sysfs_streq(name, regs[i].name)) {
 			*reg_addr = regs[i].reg;
 			return 0;
 		}
@@ -828,10 +828,10 @@ static ssize_t value_show(struct device *dev, struct device_attribute *attr,
 	u16 reg_addr;
 	int err;
 
-	if (!strcmp(name, "arb_address"))
+	if (sysfs_streq(name, "arb_address"))
 		return snprintf(buf, PAGE_SIZE, "%04x\n", dci_obj->reg_addr);
 
-	if (!strcmp(name, "arb_value"))
+	if (sysfs_streq(name, "arb_value"))
 		reg_addr = dci_obj->reg_addr;
 	else if (get_static_reg_addr(ro_regs, name, &reg_addr) &&
 		 get_static_reg_addr(rw_regs, name, &reg_addr))
@@ -858,14 +858,14 @@ static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
-	if (!strcmp(name, "arb_address")) {
+	if (sysfs_streq(name, "arb_address")) {
 		dci_obj->reg_addr = val;
 		return count;
 	}
 
-	if (!strcmp(name, "arb_value"))
+	if (sysfs_streq(name, "arb_value"))
 		err = drci_wr_reg(usb_dev, dci_obj->reg_addr, val);
-	else if (!strcmp(name, "sync_ep"))
+	else if (sysfs_streq(name, "sync_ep"))
 		err = start_sync_ep(usb_dev, val);
 	else if (!get_static_reg_addr(rw_regs, name, &reg_addr))
 		err = drci_wr_reg(usb_dev, reg_addr, val);
-- 
2.7.4

