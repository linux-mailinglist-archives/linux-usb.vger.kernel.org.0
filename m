Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8655934876D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 04:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbhCYDQV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 23:16:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14890 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhCYDQO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 23:16:14 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F5VZg1V5VzkfWs;
        Thu, 25 Mar 2021 11:14:35 +0800 (CST)
Received: from localhost.localdomain (10.175.113.32) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 11:16:02 +0800
From:   'Qinglang Miao <miaoqinglang@huawei.com>
To:     <miaoqinglang@huawei.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Wei Yongjun <weiyongjun1@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: typec: tipd: Remove duplicated include from core.c
Date:   Thu, 25 Mar 2021 11:46:27 +0800
Message-ID: <20210325034627.353171-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Qinglang Miao <miaoqinglang@huawei.com>

Remove duplicated include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/usb/typec/tipd/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index d8212b15f6f9..938219bc1b4b 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -6,8 +6,6 @@
  * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
  */
 
-#include "tps6598x.h"
-
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/module.h>

