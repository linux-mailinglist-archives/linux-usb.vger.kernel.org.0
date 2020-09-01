Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BCB2584FE
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 03:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgIABDx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 21:03:53 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41996 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725954AbgIABDx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 21:03:53 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1B1814812E1CDF2C698C;
        Tue,  1 Sep 2020 09:03:51 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Sep 2020 09:03:43 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <andreas.noever@gmail.com>, <michael.jamet@intel.com>,
        <mika.westerberg@linux.intel.com>, <YehezkelShB@gmail.com>,
        <linux-usb@vger.kernel.org>
CC:     <linuxarm@huawei.com>
Subject: [PATCH] thunderbolt: Use kobj_to_dev() instead of container_of()
Date:   Tue, 1 Sep 2020 09:01:30 +0800
Message-ID: <1598922090-39482-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use kobj_to_dev() instead of container_of()

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/thunderbolt/domain.c | 2 +-
 drivers/thunderbolt/switch.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index bba4cbf..7a192b7 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -275,7 +275,7 @@ static struct attribute *domain_attrs[] = {
 static umode_t domain_attr_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct tb *tb = container_of(dev, struct tb, dev);
 
 	if (attr == &dev_attr_boot_acl.attr) {
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a921de9..173ce3b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1649,7 +1649,7 @@ static struct attribute *switch_attrs[] = {
 static umode_t switch_attr_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct tb_switch *sw = tb_to_switch(dev);
 
 	if (attr == &dev_attr_device.attr) {
-- 
2.7.4

